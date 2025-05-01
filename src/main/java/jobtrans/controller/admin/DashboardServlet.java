package jobtrans.controller.admin;

import com.google.gson.Gson;
import jobtrans.dal.DashboardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DashboardServlet", urlPatterns = {"/WeeklyRevenue", "/MonthlyRevenue","/JobsByYears","/JobByDays","/JobByMonths","/TransactionsByDays","/Transactions"})
public class DashboardServlet extends HttpServlet {
    private DashboardDAO dashboardDAO = new DashboardDAO();
    private Gson gson =new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String period = request.getParameter("period"); // Lấy tham số lọc (nếu có)
        String page = request.getParameter("page");   // Lấy tham số trang (nếu có)
        String sortBy = request.getParameter("sortBy"); // Lấy tham số sắp xếp (nếu có)
        String sortOrder = request.getParameter("sortOrder"); // Lấy thứ tự sắp xếp (nếu có)
        System.out.println("period" + period);
        System.out.println("page" + page);

        String path = request.getServletPath();

        if ("/WeeklyRevenue".equals(path)) {
            List<Map<String, Object>> weeklyRevenueData = dashboardDAO.getDailyRevenue();
            String jsonData = gson.toJson(weeklyRevenueData);
            response.getWriter().write(jsonData);
        } else if ("/MonthlyRevenue".equals(path)) {
            List<Map<String, Object>> monthlyRevenueData = dashboardDAO.getMonthlyRevenue();
            String jsonData = gson.toJson(monthlyRevenueData);
            response.getWriter().write(jsonData);
        } else if ("/JobsByYears".equals(path)) {
            List<Map<String, Object>> jobStatisticsList = dashboardDAO.getJobStatisticsByYear();
            String jsonData = gson.toJson(jobStatisticsList);
            response.getWriter().write(jsonData);
        } else if ("/JobByDays".equals(path)) {
            List<Map<String, Object>> jobStatisticsList = dashboardDAO.getJobStatisticsByDay();
            String jsonData = gson.toJson(jobStatisticsList);
            response.getWriter().write(jsonData);
        } else if ("/JobByMonths".equals(path)) {
            List<Map<String, Object>> jobStatisticsList = dashboardDAO.getJobStatisticsByMonth();
            String jsonData = gson.toJson(jobStatisticsList);
            response.getWriter().write(jsonData);
        } else if ("/TransactionsByDays".equals(path)) {
            List<Map<String, Object>> transactionsByDays = dashboardDAO.getTransactionsByDays();
            String jsonData = gson.toJson(transactionsByDays);
            response.getWriter().write(jsonData);
        } else if ("/Transactions".equals(path)) {
            System.out.println("Servlet /JobTrans/JobsBy đã được gọi!");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            Map<String, Object> responseData = new HashMap<>();
            List<Map<String, Object>> filteredTransactions = null;
            long totalRecords = 0;
            int pageNumber = (page != null && !page.isEmpty()) ? Integer.parseInt(page) : 1;

            if ("today".equals(period)) {
                Map<String, Object> result = dashboardDAO.getTransactionsTodayWithTotal(pageNumber, 5);
                filteredTransactions = (List<Map<String, Object>>) result.get("transactions");
                totalRecords = (long) result.get("totalRecords");
            } else if ("yesterday".equals(period)) {
                Map<String, Object> result = dashboardDAO.getTransactionsYesterdayWithTotal(pageNumber, 5);
                filteredTransactions = (List<Map<String, Object>>) result.get("transactions");
                totalRecords = (long) result.get("totalRecords");
            } else if ("week".equals(period)) {
                Map<String, Object> result = dashboardDAO.getTransactionsWeekWithTotal(pageNumber, 5);
                filteredTransactions = (List<Map<String, Object>>) result.get("transactions");
                totalRecords = (long) result.get("totalRecords");
            } else if ("all".equals(period)) {
                Map<String, Object> result = dashboardDAO.getTransactionsWithPagination(pageNumber, 5);
                filteredTransactions = (List<Map<String, Object>>) result.get("transactions");
                totalRecords = (long) result.get("totalRecords");
            } else {
                // Trường hợp không có bộ lọc cụ thể, vẫn thực hiện phân trang trên toàn bộ dữ liệu
                Map<String, Object> paginationResult = (Map<String, Object>) dashboardDAO.getTransactionsWithPagination(pageNumber, 5);
                filteredTransactions = (List<Map<String, Object>>) paginationResult.get("transactions");
                totalRecords = (long) paginationResult.get("totalRecords");
            }

            responseData.put("transactions", filteredTransactions);
            responseData.put("totalRecords", totalRecords);

            String jsonData = gson.toJson(responseData);
            response.getWriter().write(jsonData);
        }
    }
}