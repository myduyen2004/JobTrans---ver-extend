
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


    private void viewProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        Account account01 = accountDAO.getAccountById(account.getAccountId());
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
        request.setAttribute("account", account01);
        request.getRequestDispatcher("edit-account.jsp").forward(request, response);

    }
}