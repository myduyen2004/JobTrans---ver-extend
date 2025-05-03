package jobtrans.controller.admin;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import jdk.jfr.Category;
import jobtrans.dal.*;
import jobtrans.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@WebServlet(name = "TransactionManagement", urlPatterns = {"/trans-manage"})
public class TransactionManagement extends HttpServlet {
    private static final int TRANSACTIONS_PER_PAGE = 5; // Số giao dịch trên một trang
    TransactionDAO transDAO = new TransactionDAO();
JobCategoryDAO jobCategoryDAO = new JobCategoryDAO();
JobDAO jobDAO = new JobDAO();
AccountDAO accountDAO = new AccountDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) {
            action = "trans-management";
        }
        try {
            switch (action) {
                case "trans-management":
                    transManage(req, resp);
                    break;
                case "edit":
                    // Gọi hàm xử lý sửa giao dịch
                    editTransaction(req, resp);
                    break;
                case"search":
                    handleTransactionManagement(req, resp);
                    break;

                case"filterTransaction":
                    filterTransaction(req,resp);

                default:
                    transManage(req, resp);
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void filterTransaction(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        String statusParam = req.getParameter("status");
        String transactionTypeParam = req.getParameter("transactionType");
        // thu và chi
        List<String> transactionTypes = new ArrayList<>();
        if (transactionTypeParam != null && !transactionTypeParam.isEmpty()) {
            if (transactionTypeParam.equals("income")) {
                transactionTypes.add("Thêm tiền");
            } else if (transactionTypeParam.equals("expense")) {
                transactionTypes.add("Trừ tiền");
                transactionTypes.add("Rút tiền");
            }
        } else {
            transactionTypes.add("Trừ tiền");
            transactionTypes.add("Rút tiền");
            transactionTypes.add("Thêm tiền");
        }
        // 0 và 1
        List<Boolean> status = new ArrayList<>();
        if (statusParam != null && !statusParam.isEmpty()) {
            if (statusParam.equals("true")) {
                status.add(true);
            } else {
                if (statusParam.equals("false")) {
                    status.add(false);
                }
            }
        } else {
            status.add(true);
            status.add(false);
        }
        List<Transaction> transactions = transDAO.getFilterTransaction(startDate, endDate, status, transactionTypes);

        // Phân trang
        int currentPage = 1;
        String pageParam = req.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }
        List<Transaction> transactionsToDisplay = getTransactionsForPage(transactions, currentPage, TRANSACTIONS_PER_PAGE);
        req.setAttribute("transactions", transactionsToDisplay);  // Corrected line
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("totalPages", (int) Math.ceil((double) transactions.size() / TRANSACTIONS_PER_PAGE));

        //req.setAttribute("transactions", transactions); //remove this line
        req.getRequestDispatcher("admin-transaction-list-manage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action = req.getParameter("action");
            if ("edit".equals(action)) {
                editTransaction(req, resp);
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void transManage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TransactionDAO transDAO = new TransactionDAO();
        List<Transaction> allTransactions = transDAO.getAllTransaction(); // Get ALL transactions
        JobDAO jobDAO = new JobDAO();
        JobCategoryDAO jobCategoryDAO = new JobCategoryDAO();
        AccountDAO accountDAO = new AccountDAO();

        BigDecimal totalIncome = BigDecimal.ZERO;
        BigDecimal totalExpense = BigDecimal.ZERO;
        BigDecimal balance = BigDecimal.ZERO;

        for (Transaction transaction : allTransactions) { // Use allTransactions here
            BigDecimal amount = transaction.getAmount();
            String transactionType = transaction.getTransactionType();

            if (transactionType.equals("Thêm tiền")) {
                totalIncome = totalIncome.add(amount);
            } else if (transactionType.equals("Trừ tiền")) {
                totalExpense = totalExpense.add(amount);
            }
        }
        for (Transaction trans : allTransactions) {  //and here
            if (trans.getJob() == null) {
                Job job = jobDAO.getJobById(trans.getJobId());
                trans.setJob(job);
                if (trans.getCategory() == null) {
                    JobCategory jobCategory = jobCategoryDAO.getJobCategoryByCategortyJobId(job.getCategoryId());
                    trans.setCategory(jobCategory);
                }
            }
            if (trans.getReceiver() == null) {
                Account acc = accountDAO.getAccountById(trans.getReceiverId());
                trans.setReceiver(acc);
            }
            if (trans.getSender() == null) {
                Account acc = accountDAO.getAccountById(trans.getSenderId());
                trans.setSender(acc);
            }
        }


        // Phân trang
        int currentPage = 1;
        String pageParam = req.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }
        List<Transaction> transactionsToDisplay = getTransactionsForPage(allTransactions, currentPage, TRANSACTIONS_PER_PAGE); // Pass allTransactions
        req.setAttribute("transactions", transactionsToDisplay);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("totalPages", (int) Math.ceil((double) allTransactions.size() / TRANSACTIONS_PER_PAGE));


        balance = totalIncome.subtract(totalExpense);

        req.setAttribute("totalIncome", totalIncome);
        req.setAttribute("totalExpense", totalExpense);
        req.setAttribute("balance", balance);
        req.setAttribute("allTransactions", allTransactions.size());  // Remove this line:  We are sending transactionsToDisplay
        req.getRequestDispatcher("admin-transaction-list-manage.jsp").forward(req, resp);
    }

    private void handleTransactionManagement(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String searchTerm = request.getParameter("search");
        System.out.println("Search term: " + searchTerm);
        List<Transaction> transactions = transDAO.getTransactionsByKeyword(searchTerm);



        // Phân trang
        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }
        List<Transaction> transactionsToDisplay = getTransactionsForPage(transactions, currentPage, TRANSACTIONS_PER_PAGE); // Pass allTransactions
        request.setAttribute("transactions", transactionsToDisplay);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", (int) Math.ceil((double) transactions.size() / TRANSACTIONS_PER_PAGE));
        // Chuyển hướng đến trang JSP
        request.getRequestDispatcher("admin-transaction-list-manage.jsp").forward(request, response);
    }

    private void editTransaction(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        try {
            // Đọc dữ liệu JSON từ body của request
            BufferedReader reader = req.getReader();
            String requestBody = reader.lines().collect(Collectors.joining(System.lineSeparator()));

            // In ra để debug
            System.out.println("Received JSON data: " + requestBody);

            // Sử dụng thư viện Gson để phân tích cú pháp JSON
            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(requestBody, JsonObject.class);

            // Lấy các giá trị từ đối tượng JSON
            if (!jsonObject.has("id")) {
                throw new IllegalArgumentException("Transaction ID is missing.");
            }
            int id = jsonObject.get("id").getAsInt();

            if (!jsonObject.has("transactionType")) {
                throw new IllegalArgumentException("Transaction type is missing.");
            }
            String transactionType = jsonObject.get("transactionType").getAsString();

            if (!jsonObject.has("amount")) {
                throw new IllegalArgumentException("Transaction amount is missing.");
            }
            BigDecimal amount = jsonObject.get("amount").getAsBigDecimal();

            if (!jsonObject.has("description")) {
                throw new IllegalArgumentException("Transaction description is missing.");
            }
            String description = jsonObject.get("description").getAsString();

            if (!jsonObject.has("createdDate")) {
                throw new IllegalArgumentException("Transaction date is missing.");
            }
            String dateString = jsonObject.get("createdDate").getAsString();
            Date createdDate = null;
            try {
                createdDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
            } catch (ParseException e) {
                String errorJson = "{\"error\": \"Invalid date format. Please use yyyy-MM-dd.\"}";
                out.print(errorJson);
                out.flush();
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }

            if (!jsonObject.has("status")) {
                throw new IllegalArgumentException("Transaction status is missing.");
            }
            boolean status = jsonObject.get("status").getAsBoolean();

            // 2. Tạo đối tượng Transaction với ID
            Transaction updatedTransaction = new Transaction();
            updatedTransaction.setTransactionId(id);
            updatedTransaction.setTransactionType(transactionType);
            updatedTransaction.setAmount(amount);
            updatedTransaction.setDescription(description);
            updatedTransaction.setCreatedDate(createdDate);
            updatedTransaction.setStatus(status);

            // 3. Gọi DAO để cập nhật giao dịch trong database
            TransactionDAO transactionDAO = new TransactionDAO();
            transactionDAO.updateTransaction(updatedTransaction);

            // 4. Tạo JSON response
            String successJson = "{\"message\": \"Transaction updated successfully.\"}";
            out.print(successJson);
            out.flush();

        } catch (IllegalArgumentException | JsonParseException e) {
            // Handle JSON parsing errors or missing fields
            String errorJson = "{\"error\": \"" + e.getMessage() + "\"}";
            out.print(errorJson);
            out.flush();
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        } catch (Exception e) {
            // Handle other errors
            String errorJson = "{\"error\": \"An unexpected error occurred: " + e.getMessage() + "\"}";
            out.print(errorJson);
            out.flush();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    private List<Transaction> getTransactionsForPage(List<Transaction> allTransactions, int currentPage, int transactionsPerPage) {
        final int TRANSACTIONS_PER_PAGE = transactionsPerPage;
        int totalTransactions = allTransactions.size();
        int totalPages = (int) Math.ceil((double) totalTransactions / TRANSACTIONS_PER_PAGE);
        if (currentPage > totalPages && totalPages > 0) {
            currentPage = totalPages;
        }
        int start = (currentPage - 1) * TRANSACTIONS_PER_PAGE;
        int end = Math.min(start + TRANSACTIONS_PER_PAGE, totalTransactions);
        return allTransactions.subList(start, end);
    }

}