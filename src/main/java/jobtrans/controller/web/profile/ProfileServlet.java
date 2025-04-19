
package jobtrans.controller.web.profile;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import jobtrans.dal.TransactionDAO;
import jobtrans.model.Account;
import jobtrans.model.GroupMember;
import jobtrans.model.Transaction;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
@MultipartConfig

public class ProfileServlet extends HttpServlet {
    private AccountDAO accountDAO = new AccountDAO();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view":
                viewProfile(request, response);
                break;
            case "changePassword":
//                changePassword(request, response);
                break;
            case "wallet":
//                loadWallet(request, response);
                break;
            case "addWallet":
//                addWallet(request, response);
                break;
            case "showUpdateForm":
                showUpdateForm(request, response);
                break;
            case "updateProfile":
//                updateProfile(request, response);
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

//            Account account = (Account) session.getAttribute("sessionAccount");

            int accountId = Integer.parseInt(request.getParameter("accountId"));
            Account account = accountDAO.getAccountById(accountId);

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
            Part filePart = request.getPart("avatar");
            String fileName = getFileName(filePart);
            InputStream imageInputStream = filePart.getInputStream();
            String typeOfImage = fileName.substring(fileName.lastIndexOf(".") + 1);
            String newImageName = null;
            String uploadDir = getServletContext().getRealPath("/images");
            File uploadDirFile = new File(uploadDir);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdir();
            }

            if (containsExtension(typeOfImage)) {
                Time timeObj = new Time(System.currentTimeMillis());
                newImageName = timeObj.getTime() + "_" + fileName;

                String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
                File uploadDirectory = new File(uploadPath);
                if (!uploadDirectory.exists()) {
                    uploadDirectory.mkdir();
                }

                Path destinationPath = Paths.get(uploadDirectory.getAbsolutePath());

                // Đóng input stream đúng cách
                try {
                    // Sử dụng try-with-resources cho cả hai luồng để đảm bảo chúng được đóng
                    try (InputStream inputStream = imageInputStream;
                         FileOutputStream fout = new FileOutputStream(destinationPath.resolve(newImageName).toString())) {

                        // Sử dụng buffer để đọc/ghi tệp thay vì readAllBytes()
                        byte[] buffer = new byte[8192];
                        int bytesRead;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            fout.write(buffer, 0, bytesRead);
                        }

                        // Đảm bảo các luồng được flush
                        fout.flush();
                    }

                    // Sau khi ghi tệp thành công, đặt đường dẫn avatar
                    if (newImageName != null) {
                        account.setAvatar("images/" + newImageName);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                    // Xử lý ngoại lệ theo cách phù hợp với ứng dụng của bạn
                }
            }

            account.setAccountName(accountName);
            account.setDateOfBirth(localDate);
            account.setGender(gender);
            account.setSpeciality(speciality);
            account.setPhone(phone);
            account.setBio(bio);
            account.setSkills(skills);

//            Account account1 = (Account) session.getAttribute("sessionAccount");

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
        } finally {

        }
    }


    private void viewProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //        HttpSession session = request.getSession();
        //        Account account = (Account) session.getAttribute("sessionAccount");
        //        Account account01 = accountDAO.getAccountById(account.getAccountId());

        int accountId = Integer.parseInt(request.getParameter("account_id"));
        Account account01 = accountDAO.getAccountById(accountId);

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

        //        HttpSession session = request.getSession();
        //        Account account = (Account) session.getAttribute("sessionAccount");
        //        Account account01 = accountDAO.getAccountById(account.getAccountId());

        int accountId = Integer.parseInt(request.getParameter("account_id"));
        Account account01 = accountDAO.getAccountById(accountId);

        request.setAttribute("account", account01);
        request.getRequestDispatcher("edit-account.jsp").forward(request, response);

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