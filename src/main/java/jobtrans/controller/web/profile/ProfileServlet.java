
package jobtrans.controller.web.profile;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

//import jobtrans.dal.GroupMemberDAO;
//import jobtrans.model.GroupMember;
//import org.mindrot.jbcrypt.BCrypt;
import jobtrans.dal.AccountDAO;
import jobtrans.dal.NotificationDAO;
import jobtrans.dal.ReportDAO;
import jobtrans.dal.TransactionDAO;
import jobtrans.model.Account;
import jobtrans.model.GroupMember;

import jobtrans.model.Notification;

import jobtrans.model.Report;

import jobtrans.model.Transaction;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
@MultipartConfig

public class ProfileServlet extends HttpServlet {
    private AccountDAO accountDAO = new AccountDAO();
    private ReportDAO reportDAO = new ReportDAO();
    private JobDAO jobDAO = new JobDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view":
                try {
                    viewProfile(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "changePassword":
//                changePassword(request, response);
                break;
            case "wallet":
                loadWallet(request, response);
                break;
            case "addWallet":
                addWallet(request, response);
                break;
            case "showUpdateForm":
                showUpdateForm(request, response);
                break;
            case "updateProfile":
//                updateProfile(request, response);
                break;

            case "notification":
                viewNotification(request,response);

            case "viewAccountReport":
                showAccountReport(request, response);
                break;
            case "viewReport":
                int id = Integer.parseInt(request.getParameter("reportId"));
                showReportDetail(request,response,id);
                break;
            case "job-manage-page":
                showJobManage(request, response);
                break;
            default:
                response.sendRedirect("infor-account.jsp"); // Trang lỗi nếu action không hợp lệ
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");

            int accountId = Integer.parseInt(request.getParameter("accountId"));
            Account account = accountDAO.getAccountById(accountId);

            // Xử lý thông tin cơ bản
            String accountName = request.getParameter("name");
            String dobParam = request.getParameter("dob");
            LocalDate localDate = null;
            if (dobParam != null && !dobParam.isEmpty()) {
                localDate = LocalDate.parse(dobParam); // dobParam định dạng yyyy-MM-dd
            }

            String gender = request.getParameter("gender");
            String speciality = request.getParameter("speciality");
            String phone = request.getParameter("phone");
            String bio = request.getParameter("bio");
            String skills = request.getParameter("skills");
            String address = request.getParameter("address");
            int experienceYears =  Integer.parseInt(request.getParameter("experienceYears"));
            String education = request.getParameter("education");

            // Xử lý avatar nếu có
            Part avatarPart = request.getPart("avatar");
            if (avatarPart != null && avatarPart.getSize() > 0) {
                processImageUpload(avatarPart, account, "avatar");
            }

            // Xử lý chữ ký nếu có
            Part signaturePart = request.getPart("signature");
            if (signaturePart != null && signaturePart.getSize() > 0) {
                processImageUpload(signaturePart, account, "signature");
            }

            // Cập nhật thông tin tài khoản
            account.setAccountName(accountName);
            account.setDateOfBirth(localDate);
            account.setGender(gender);
            account.setSpeciality(speciality);
            account.setPhone(phone);
            account.setBio(bio);
            account.setSkills(skills);
            account.setAddress(address);
            account.setExperienceYears(experienceYears);
            account.setEducation(education);

            AccountDAO accountDAO = new AccountDAO();
            try {
                if (accountDAO.updateAccountByEmail(account)) {
                    session.setAttribute("sessionAccount", account);
                    response.sendRedirect("group?action=view&account_id=" + accountId);
                } else {
                    response.sendRedirect("group?action=view&account_id=" + accountId);
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("404.html").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("404.html").forward(request, response);
        }
    }

    private void processImageUpload(Part filePart, Account account, String imageType) throws IOException {
        String fileName = getFileName(filePart);
        if (fileName == null || fileName.isEmpty()) {
            return;
        }

        InputStream imageInputStream = filePart.getInputStream();
        String typeOfImage = fileName.substring(fileName.lastIndexOf(".") + 1);

        // Kiểm tra định dạng file
        if (containsExtension(typeOfImage)) {
            Time timeObj = new Time(System.currentTimeMillis());
            String newImageName = timeObj.getTime() + "_" + fileName;

            String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
            File uploadDirectory = new File(uploadPath);
            if (!uploadDirectory.exists()) {
                uploadDirectory.mkdir();
            }

            Path destinationPath = Paths.get(uploadDirectory.getAbsolutePath());

            // Sử dụng try-with-resources để đảm bảo streams được đóng đúng cách
            try (InputStream inputStream = imageInputStream;
                 FileOutputStream fout = new FileOutputStream(destinationPath.resolve(newImageName).toString())) {

                // Sử dụng buffer để đọc/ghi file
                byte[] buffer = new byte[8192];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    fout.write(buffer, 0, bytesRead);
                }
                fout.flush();

                // Cập nhật đường dẫn tương ứng trong đối tượng account
                String imagePath = "images/" + newImageName;
                if (imageType.equals("avatar")) {
                    account.setAvatar(imagePath);
                } else if (imageType.equals("signature")) {
                    account.setSignature(imagePath);
                }
            }
        }
    }


    private void viewProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        Account account01 = accountDAO.getAccountById(account.getAccountId());
        List<Report> reportList = reportDAO.getLatest5ReportsByAccount(account.getAccountId());
        request.setAttribute("reportList", reportList);
        request.setAttribute("account", account01);
        request.getRequestDispatcher("infor-account.jsp").forward(request, response);
    }

    private String getFileName(Part part) {
        String contentDispositionHeader = part.getHeader("content-disposition");
        String[] elements = contentDispositionHeader.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "unknown.jpg";
    }

    private boolean containsExtension(String uploadedFileExtension) {
        String[] extensions = {"png", "jpg", "jpeg"};
        for (String value : extensions) {
            if (value.equalsIgnoreCase(uploadedFileExtension)) {
                return true;
            }
        }
        return false;
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        Account account01 = accountDAO.getAccountById(account.getAccountId());
        System.out.println(account01);
        request.setAttribute("account", account01);
        request.getRequestDispatcher("edit-account.jsp").forward(request, response);

    }
    private void loadWallet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        AccountDAO userDao = new AccountDAO();
        TransactionDAO transDao = new TransactionDAO();
        ArrayList<Transaction> transList = new ArrayList<>();
        try {
            transList = (ArrayList<Transaction>) transDao.getTransactionBySenderIdOrReceiverId(account.getAccountId());
        } catch (Exception ex) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("account", account);
        request.setAttribute("transList", transList);
        request.getRequestDispatcher("wallet.jsp").forward(request, response);
    }


    private void addWallet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        AccountDAO accountDao = new AccountDAO();
        TransactionDAO transactionDao = new TransactionDAO();
        // Kiểm tra xem 'amount-add' có tồn tại trong session không
        String amount = (String) session.getAttribute("amount-add");
        if (amount != null) {
            Transaction transaction = new Transaction();
            transaction.setSenderId(account.getAccountId());
            transaction.setReceiverId(account.getAccountId());
            transaction.setAmount(new BigDecimal(amount));
            transaction.setDescription("Nạp tiền vào ví");
            transaction.setTransactionType("Thêm tiền");
            transaction.setStatus(true);
            try {
                transactionDao.addTransaction(transaction);
            } catch (Exception ex) {
                Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            account.setAmountWallet(account.getAmountWallet().add(transaction.getAmount()));
            accountDao.addAmountWallet(account.getAccountId(), new BigDecimal(amount));
            // Xóa 'amount-add' khỏi session sau khi xử lý
            session.removeAttribute("amount-add");
        }else{
            response.getWriter().print(amount);
        }

        ArrayList<Transaction> transList = new ArrayList<>();
        try {
            transList = (ArrayList<Transaction>) transactionDao.getTransactionBySenderIdOrReceiverId(account.getAccountId());
        } catch (Exception ex) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("account", account);
        request.setAttribute("transList", transList);
        request.getRequestDispatcher("wallet.jsp").forward(request, response);
    }
    private void viewNotification(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Account sessionAccount = (Account) session.getAttribute("sessionAccount");
        NotificationDAO notificationDAO = new NotificationDAO();
        List<Notification> notificationList = notificationDAO.getNotificationByAccountId(sessionAccount.getAccountId());
        request.setAttribute("notificationList", notificationList);
        request.getRequestDispatcher("notification-list.jsp").forward(request, response);
    }

    private void showAccountReport(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            Account account = (Account) session.getAttribute("sessionAccount");
            Account account1 = accountDAO.getAccountById(account.getAccountId());
            //Danh sách bị tố cáo
            List<Report> reportedList = accountDAO.getReportByreportedAccount(account1.getAccountId());

            //Danh sách tố cáo
            List<Report> reportList = accountDAO.getReportByreportBy(account1.getAccountId());

            req.setAttribute("reportedList", reportedList);
            req.setAttribute("reportList", reportList);
            req.setAttribute("accountLogged", account1);

            req.getRequestDispatcher("account-report-list.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("home");
        }
    }

    private void showReportDetail(HttpServletRequest req, HttpServletResponse resp, int id) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            Account account = (Account) session.getAttribute("sessionAccount");
            Account account1 = accountDAO.getAccountById(account.getAccountId());
            Report report = accountDAO.getReportById(id);

            req.setAttribute("report", report);
            req.setAttribute("accountLogged", account1);
            req.getRequestDispatcher("report-detail.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("home");
        }
    }
    private void showJobManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            Account account = (Account) session.getAttribute("sessionAccount");
            Account account1 = accountDAO.getAccountById(account.getAccountId());
            List<Job> jobs = jobDAO.get3LatestJobs();
            request.setAttribute("jobList", jobs);
            request.setAttribute("account", account1);
            request.getRequestDispatcher("job-manage.jsp").forward(request, response);
        }else{
            response.sendRedirect("home");
        }
    }


    //    private void changePassword(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        String email = (String) session.getAttribute("account");
//        String currentPassword = request.getParameter("currentPassword");
//        String newPassword = request.getParameter("newPassword");
//        String repeatNewPassword = request.getParameter("");
//
//        if (newPassword.length() < 8) {
//            request.setAttribute("error", "Mật khẩu phải có ít nhất 8 ký tự");
//            request.getRequestDispatcher("profile?action=loadPassword").forward(request, response);
//            return;
//        }
//
//        AccountDAO acDAO = new AccountDAO();
//        Account ac = acDAO.getAccountByEmail(email);
//
//        if (ac == null) {
//            request.setAttribute("error", "Tài khoản không tồn tại");
//            request.getRequestDispatcher("profile?action=loadPassword").forward(request, response);
//            return;
//        }
//
//        if (ac.getPassword() != null && !BCrypt.checkpw(currentPassword, ac.getPassword())) {
//            request.setAttribute("error", "Mật khẩu hiện tại không đúng");
//            request.getRequestDispatcher("profile?action=loadPassword").forward(request, response);
//            return;
//        }
//
//        if (!newPassword.equals(repeatNewPassword)) {
//            request.setAttribute("error", "Mật khẩu mới nhập lại không khớp");
//            request.getRequestDispatcher("profile?action=loadPassword").forward(request, response);
//            return;
//        }
//
//        if (newPassword.equals(currentPassword)) {
//            request.setAttribute("error", "Mật khẩu mới không được trùng với mật khẩu cũ");
//            request.getRequestDispatcher("profile?action=loadPassword").forward(request, response);
//            return;
//        }
//
//        String hashedNewPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
//        acDAO.changePassword(email, hashedNewPassword);
//
//        request.setAttribute("success", "Đổi mật khẩu thành công");
//        request.getRequestDispatcher("profile?action=view").forward(request, response);
//    }
//}

//    private void loadWallet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            HttpSession session = request.getSession();
//            Account account = (Account) session.getAttribute("sessionAccount");
//            AccountDAO accountDAO = new AccountDAO();
//            List<Transaction> trans = accountDAO.getTransactionsByUserId(account.getAccountId());
//            request.setAttribute("trans", trans);
//            request.getRequestDispatcher("wallet.jsp").forward(request, response);
//        } catch (Exception e) {
//            response.sendRedirect("404.html");
//        }
//    }
}