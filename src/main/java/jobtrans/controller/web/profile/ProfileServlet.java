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
import java.util.Date;

//import jobtrans.dal.GroupMemberDAO;
//import jobtrans.model.GroupMember;
//import org.mindrot.jbcrypt.BCrypt;
import jobtrans.dal.AccountDAO;
import jobtrans.model.Account;

@WebServlet(name="ProfileServlet", urlPatterns={"/profile"})
@MultipartConfig

public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view":
//                viewProfile(request, response);
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
            case "loadUpdateProfile":
                loadUpdateProfile(request, response);
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
            Account account = (Account) session.getAttribute("sessionAccount");
//            int accountId = Integer.parseInt(request.getParameter("accountId"));
            String accountName = request.getParameter("fullName");
            Date dateOfBirth = java.sql.Date.valueOf(request.getParameter("dob"));
            String gender = request.getParameter("gender");
            String specialty = request.getParameter("specialty");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String bio = request.getParameter("introduction");
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
                try (FileOutputStream fout = new FileOutputStream(destinationPath.resolve(newImageName).toString())) {
                    fout.write(imageInputStream.readAllBytes());
                }
            }

            account.setAccountName(accountName);
            account.setDateOfBirth(dateOfBirth);
            account.setGender(gender);
            account.setSpecialist(specialty);
            account.setEmail(email);
            account.setPhone(phone);
            account.setBio(bio);
            if (newImageName != null) {
                account.setAvatar("images/" + newImageName);
            }
//            Account account1 = (Account) session.getAttribute("sessionAccount");

            AccountDAO accountDAO = new AccountDAO();
            if (accountDAO.updateAccount(account)) {
                session.setAttribute("sessionAccount", account);
                request.setAttribute("success", "Cập nhật thành công");
                request.setAttribute("account", account);
//                response.getWriter().print(account);
                request.getRequestDispatcher("edit-account.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Cập nhật thất bại");
                response.sendRedirect("edit-account.jsp");
            }

            response.getWriter().print(account);
            request.getRequestDispatcher("edit-account.jsp").forward(request, response);
        } catch (Exception e) {
            response.getWriter().print(e.getMessage());
        }
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
    private void loadUpdateProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Account sessionAccount = (Account) session.getAttribute("sessionAccount");
//            int accountId = Integer.parseInt(request.getParameter("accountId"));
            AccountDAO accountDAO = new AccountDAO();
//            Account account = accountDAO.getAccountById(sessionAccount.getAccountId());

            request.setAttribute("account", sessionAccount);
            request.getRequestDispatcher("edit-account.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("404.html");
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

}