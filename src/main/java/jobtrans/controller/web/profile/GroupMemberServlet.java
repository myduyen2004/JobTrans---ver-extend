package jobtrans.controller.web.profile;

import com.google.gson.Gson;
import jobtrans.dal.AccountDAO;
import jobtrans.dal.GroupMemberDAO;
import jobtrans.model.Account;
import jobtrans.model.GroupMember;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@WebServlet(name = "GroupMemberServlet", urlPatterns = {"/group"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)

public class GroupMemberServlet extends HttpServlet {
    private GroupMemberDAO groupMemberDAO = new GroupMemberDAO();
    private AccountDAO accountDAO = new AccountDAO();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view":
                try {
                    viewProfile(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "showAddMember":
                try {
                    showAddMember(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "showUpdateMember":
                try {
                    showUpdateMember(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "delete":
                try {
                    deleteMember(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                response.sendRedirect("infor-account.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            try {
                Account sessionAccount = (Account) session.getAttribute("sessionAccount");
                if (sessionAccount == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                Account account = accountDAO.getAccountById(sessionAccount.getAccountId());
                // Create new member object and populate it from request parameters
                GroupMember member = new GroupMember();

                member.setAccountId(account.getAccountId());
                member.setMemberName(request.getParameter("memberName"));
                member.setBio(request.getParameter("bio"));
                String dobString = request.getParameter("dateOfBirth");
                if (dobString != null && !dobString.isEmpty()) {
                    LocalDate localDate = LocalDate.parse(dobString); // yyyy-MM-dd
                    java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
                    member.setDateOfBirth(sqlDate);
                }

                member.setAddress(request.getParameter("address"));
                member.setPhone(request.getParameter("phone"));
                member.setSpeciality(request.getParameter("speciality"));
                member.setGender(request.getParameter("gender"));
                member.setExperienceYears(Integer.parseInt(request.getParameter("experienceYears")));
                String statusParam = request.getParameter("status");
                member.setStatus(statusParam != null && statusParam.equals("on") ? "Đang hoạt động" : "Ngừng hoạt động");

                member.setEducation(request.getParameter("education"));
                member.setPosition(request.getParameter("position"));
                member.setSkills(request.getParameter("skills"));

                // Handle file upload for avatar
                Part filePart = request.getPart("avatar");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = getUniqueFileName(getSubmittedFileName(filePart));
                    String uploadPath = getServletContext().getRealPath("/") + "img/avatar/";

                    // Create directory if it doesn't exist
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }

                    // Save the file
                    filePart.write(uploadPath + fileName);
                    member.setAvatarMember("img/avatar/" + fileName);
                } else {
                    member.setAvatarMember("img/default-avatar.jpg");
                }

                // Save member to database
                boolean success = groupMemberDAO.createMember(member);

//            response.getWriter().print(member);

                if (success) {
                    // Thêm thông báo thành công
                    session.setAttribute("successMessage", "Cập nhật thành viên thành công!");
                    response.sendRedirect("group?action=view&account_id=" + account.getAccountId());
                } else {
                    request.setAttribute("error", "Không thể cập nhật thành viên");
                    request.setAttribute("member", member);
                    response.sendRedirect("group?action=view&account_id=" + account.getAccountId());
                }

//            if (success) {
//                // Check if we need to send welcome email
//                boolean sendEmail = "on".equals(request.getParameter("sendWelcomeEmail"));
//                if (sendEmail) {
//                    // Code to send welcome email would go here
//                    // For now we'll just set a message about it
//                    request.getSession().setAttribute("emailSent", true);
//                }
//
//                response.sendRedirect(request.getContextPath() + "/member/");
//            } else {
//                request.setAttribute("error", "Failed to create member");
//                request.setAttribute("member", member); // Send back the filled form
//                request.getRequestDispatcher("/WEB-INF/views/member/form.jsp").forward(request, response);
//            }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("404.html").forward(request, response);
            }
        } else if (action.equals("update")) {
            try {
                Account sessionAccount = (Account) session.getAttribute("sessionAccount");
                if (sessionAccount == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                Account account = accountDAO.getAccountById(sessionAccount.getAccountId());

                int memberId = Integer.parseInt(request.getParameter("memberId"));

                // Get existing member
                GroupMember member = groupMemberDAO.getMemberByMemberId(memberId);
                if (member == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }

                String memberName = request.getParameter("memberName");
                System.out.println("Tên thành viên (servlet): " + memberName);

                member.setMemberName(request.getParameter("memberName"));
                member.setBio(request.getParameter("bio"));
                String dobString = request.getParameter("dateOfBirth");
                if (dobString != null && !dobString.isEmpty()) {
                    LocalDate localDate = LocalDate.parse(dobString); // yyyy-MM-dd
                    java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
                    member.setDateOfBirth(sqlDate);
                }

                member.setAddress(request.getParameter("address"));
                member.setPhone(request.getParameter("phone"));
                member.setSpeciality(request.getParameter("speciality"));
                member.setGender(request.getParameter("gender"));
                member.setExperienceYears(Integer.parseInt(request.getParameter("experienceYears")));
                String statusParam = request.getParameter("status");
                member.setStatus(statusParam != null && statusParam.equals("on") ? "Đang hoạt động" : "Ngừng hoạt động");
                member.setEducation(request.getParameter("education"));
                member.setPosition(request.getParameter("position"));
                member.setSkills(request.getParameter("skills"));

                // Handle file upload for avatar
            Part filePart = request.getPart("avatar");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = getUniqueFileName(getSubmittedFileName(filePart));
                String uploadPath = getServletContext().getRealPath("/") + "img/avatar/";

                // Create directory if it doesn't exist
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Delete old avatar file if it's not the default
                if (member.getAvatarMember() != null && !member.getAvatarMember().equals("img/default-avatar.jpg")) {
                    File oldFile = new File(getServletContext().getRealPath("/") + member.getAvatarMember());
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }

                // Save the new file
                filePart.write(uploadPath + fileName);
                member.setAvatarMember("img/avatar/" + fileName);
            }

                // Update member in database
                boolean success = groupMemberDAO.updateMember(member);
//            response.getWriter().print(member);
//            response.sendRedirect("group?action=view&account_id=" + account.getAccountId());
            if (success) {
                // Thêm thông báo thành công
                session.setAttribute("successMessage", "Cập nhật thành viên thành công!");
                response.sendRedirect("group?action=view&account_id=" + account.getAccountId());
            } else {
                request.setAttribute("error", "Không thể cập nhật thành viên");
                request.setAttribute("member", member);
                response.sendRedirect("group?action=view&account_id=" + account.getAccountId());
            }

            } catch (NumberFormatException e) {
                response.getWriter().print(e.getMessage());
            } catch (Exception e) {
                response.getWriter().print(e.getMessage());
                request.setAttribute("error", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("/WEB-INF/views/member/form.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            Account sessionAccount = (Account) session.getAttribute("sessionAccount");
            if (sessionAccount == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            Account account = accountDAO.getAccountById(sessionAccount.getAccountId());

            int memberId = Integer.parseInt(request.getParameter("memberId"));

            // Get existing member
            GroupMember member = groupMemberDAO.getMemberByMemberId(memberId);
            if (member == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            String memberName = request.getParameter("memberName");
            System.out.println("Tên thành viên (servlet): " + memberName);

            member.setMemberName(request.getParameter("memberName"));
            member.setBio(request.getParameter("bio"));
            String dobString = request.getParameter("dateOfBirth");
            if (dobString != null && !dobString.isEmpty()) {
                LocalDate localDate = LocalDate.parse(dobString); // yyyy-MM-dd
                java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
                member.setDateOfBirth(sqlDate);
            }

            member.setAddress(request.getParameter("address"));
            member.setPhone(request.getParameter("phone"));
            member.setSpeciality(request.getParameter("speciality"));
            member.setGender(request.getParameter("gender"));
            member.setExperienceYears(Integer.parseInt(request.getParameter("experienceYears")));
            String statusParam = request.getParameter("status");
            member.setStatus(statusParam != null && statusParam.equals("on") ? "Đang hoạt động" : "Ngừng hoạt động");
            member.setEducation(request.getParameter("education"));
            member.setPosition(request.getParameter("position"));
            member.setSkills(request.getParameter("skills"));

            // Handle file upload for avatar
//            Part filePart = request.getPart("avatar");
//            if (filePart != null && filePart.getSize() > 0) {
//                String fileName = getUniqueFileName(getSubmittedFileName(filePart));
//                String uploadPath = getServletContext().getRealPath("/") + "img/avatar/";
//
//                // Create directory if it doesn't exist
//                File uploadDir = new File(uploadPath);
//                if (!uploadDir.exists()) {
//                    uploadDir.mkdirs();
//                }
//
//                // Delete old avatar file if it's not the default
//                if (member.getAvatarMember() != null && !member.getAvatarMember().equals("img/default-avatar.jpg")) {
//                    File oldFile = new File(getServletContext().getRealPath("/") + member.getAvatarMember());
//                    if (oldFile.exists()) {
//                        oldFile.delete();
//                    }
//                }
//
//                // Save the new file
//                filePart.write(uploadPath + fileName);
//                member.setAvatarMember("img/avatar/" + fileName);
//            }

            // Update member in database
            boolean success = groupMemberDAO.updateMember(member);
//            response.getWriter().print(member);
//            response.sendRedirect("group?action=view&account_id=" + account.getAccountId());
            System.out.println(member);
//            if (success) {
//                // Thêm thông báo thành công
//                session.setAttribute("successMessage", "Cập nhật thành viên thành công!");
//                response.sendRedirect("group?action=view&account_id=" + account.getAccountId());
//            } else {
//                request.setAttribute("error", "Không thể cập nhật thành viên");
//                request.setAttribute("member", member);
//                response.sendRedirect("group?action=view&account_id=" + account.getAccountId());
//            }

        } catch (NumberFormatException e) {
            response.getWriter().print(e.getMessage());
        } catch (Exception e) {
            response.getWriter().print(e.getMessage());
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/member/form.jsp").forward(request, response);
        }
    }

    private void viewProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Account account01 = accountDAO.getAccountById(account.getAccountId());
        List<GroupMember> members = groupMemberDAO.getMembersByAccountId(account.getAccountId());
        request.setAttribute("account", account01);
        request.setAttribute("memberList", members);

        request.getRequestDispatcher("infor-account.jsp").forward(request, response);
    }

    private void showAddMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        Account account01 = accountDAO.getAccountById(account.getAccountId());

        request.setAttribute("account", account01);
        request.getRequestDispatcher("add-member.jsp").forward(request, response);
    }

    private void showUpdateMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        Account account01 = accountDAO.getAccountById(account.getAccountId());
        int memberId = Integer.parseInt(request.getParameter("memberId"));
        GroupMember member = groupMemberDAO.getMemberByMemberId(memberId);

        System.out.println(member);

//        int accountId = Integer.parseInt(request.getParameter("account_id"));
//        Account account01 = accountDAO.getAccountById(accountId);
        request.setAttribute("account", account01);
        request.setAttribute("member", member);
        request.getRequestDispatcher("edit-member.jsp").forward(request, response);
    }

    private void createMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void updateMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            Account sessionAccount = (Account) session.getAttribute("sessionAccount");
            if (sessionAccount == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            Account account = accountDAO.getAccountById(sessionAccount.getAccountId());

            int memberId = Integer.parseInt(request.getParameter("memberId"));

            // Get existing member
            GroupMember member = groupMemberDAO.getMemberByMemberId(memberId);
            if (member == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            String memberName = request.getParameter("memberName");
            System.out.println("Tên thành viên (servlet): " + memberName);

            member.setMemberName(request.getParameter("memberName"));
            member.setBio(request.getParameter("bio"));
            String dobString = request.getParameter("dateOfBirth");
            if (dobString != null && !dobString.isEmpty()) {
                LocalDate localDate = LocalDate.parse(dobString); // yyyy-MM-dd
                java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
                member.setDateOfBirth(sqlDate);
            }

            member.setAddress(request.getParameter("address"));
            member.setPhone(request.getParameter("phone"));
            member.setSpeciality(request.getParameter("speciality"));
            member.setGender(request.getParameter("gender"));
            member.setExperienceYears(Integer.parseInt(request.getParameter("experienceYears")));
            String statusParam = request.getParameter("status");
            member.setStatus(statusParam != null && statusParam.equals("on") ? "Đang hoạt động" : "Ngừng hoạt động");
            member.setEducation(request.getParameter("education"));
            member.setPosition(request.getParameter("position"));
            member.setSkills(request.getParameter("skills"));

            // Handle file upload for avatar
            Part filePart = request.getPart("avatar");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = getUniqueFileName(getSubmittedFileName(filePart));
                String uploadPath = getServletContext().getRealPath("/") + "img/avatar/";

                // Create directory if it doesn't exist
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Delete old avatar file if it's not the default
                if (member.getAvatarMember() != null && !member.getAvatarMember().equals("img/avatar-default.jpg")) {
                    File oldFile = new File(getServletContext().getRealPath("/") + member.getAvatarMember());
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }

                // Save the new file
                filePart.write(uploadPath + fileName);
                member.setAvatarMember("img/avatar/" + fileName);
            }

            // Update member in database
            boolean success = groupMemberDAO.updateMember(member);

//            response.sendRedirect("group?action=view&account_id=" + account.getAccountId());

            if (success) {
                // Thêm thông báo thành công
                session.setAttribute("successMessage", "Cập nhật thành viên thành công!");
                response.sendRedirect("group?action=view&account_id=" + account.getAccountId());
            } else {
                request.setAttribute("error", "Không thể cập nhật thành viên");
                request.setAttribute("member", member);
                response.sendRedirect("group?action=view&account_id=" + account.getAccountId());
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/member/form.jsp").forward(request, response);
        }
    }

    private void deleteMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String accountId = request.getParameter("accountId");
            int memberId = Integer.parseInt(request.getParameter("memberId"));
            // Get member first to handle avatar file deletion
            GroupMember member = groupMemberDAO.getMemberById(memberId);
            if (member != null && member.getAvatarMember() != null &&
                    !member.getAvatarMember().equals("img/avatar-default.jpg")) {
                File avatarFile = new File(getServletContext().getRealPath("/") + member.getAvatarMember());
                if (avatarFile.exists()) {
                    avatarFile.delete();
                }
            }

            // Delete from database
            boolean success = groupMemberDAO.deleteMember(memberId);

            if (success) {
                response.sendRedirect("group?action=view&account_id=" + accountId);
            } else {
                request.setAttribute("error", "Failed to delete member");
                response.sendRedirect("group?action=view&account_id=" + accountId);
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    // Helper method to get file name from part
    private String getSubmittedFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf('=') + 2, item.length() - 1);
            }
        }
        return "";
    }

    // Helper method to create unique file name to prevent overwrites
    private String getUniqueFileName(String originalFileName) {
        return System.currentTimeMillis() + "_" + originalFileName.replaceAll("\\s+", "_");
    }

}
