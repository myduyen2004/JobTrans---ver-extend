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
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                try {
                    createMember(request, response);
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
            case "update":
                try {
                    updateMember(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                break;
        }
    }

    private void viewProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        HttpSession session = request.getSession();
//        Account account = (Account) session.getAttribute("sessionAccount");
//        Account account01 = accountDAO.getAccountById(account.getAccountId());
//        List<GroupMember> members = groupMemberDAO.getMembersByAccountId(account.getAccountId());

        int accountId = Integer.parseInt(request.getParameter("account_id"));
        Account account01 = accountDAO.getAccountById(accountId);
        List<GroupMember> members = groupMemberDAO.getMembersByAccountId(accountId);

        request.setAttribute("account", account01);
        request.setAttribute("memberList", members);

        request.getRequestDispatcher("infor-account.jsp").forward(request, response);
    }

    private void showAddMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        Account account = (Account) session.getAttribute("sessionAccount");
//        Account account01 = accountDAO.getAccountById(account.getAccountId());
//        List<GroupMember> members = groupMemberDAO.getMembersByAccountId(account.getAccountId());

        int accountId = Integer.parseInt(request.getParameter("account_id"));
        Account account01 = accountDAO.getAccountById(accountId);
        request.setAttribute("account", account01);
        request.getRequestDispatcher("add-member.jsp").forward(request, response);
    }

    private void updateMemberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int memberId = Integer.parseInt(request.getParameter("member_id"));
        GroupMember member = groupMemberDAO.getMemberByMemberId(memberId);

        // Update member information from form data
        member.setMemberName(request.getParameter("memberName"));
        String dateOfBirthStr = request.getParameter("dateOfBirth");
        if (dateOfBirthStr != null && !dateOfBirthStr.isEmpty()) {
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date dateOfBirth = dateFormat.parse(dateOfBirthStr);
                member.setDateOfBirth(new java.sql.Date(dateOfBirth.getTime()));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        member.setGender(request.getParameter("gender"));
        String experienceYearsStr = request.getParameter("experienceYears");
        if (experienceYearsStr != null && !experienceYearsStr.isEmpty()) {
            member.setExperienceYears(Integer.parseInt(experienceYearsStr));
        }

        member.setEducation(request.getParameter("education"));
        member.setBio(request.getParameter("bio"));
        member.setSpeciality(request.getParameter("speciality"));

        // Save updated member
        boolean updated = groupMemberDAO.updateMember(member);

        // Redirect back to the team account page
        if (updated) {
            request.setAttribute("message", "Member information updated successfully!");
        } else {
            request.setAttribute("error", "Failed to update member information.");
        }
        request.setAttribute("error", new Error("Lỗi xảy ra"));
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.sendRedirect(request.getContextPath() + "/group?action=showUpdateGroup&account_id=" + member.getAccountId());
    }

    private void createMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            // Create new member object and populate it from request parameters
            GroupMember member = new GroupMember();

            String accountId = request.getParameter("accountId");
            member.setMemberName(request.getParameter("memberName"));
            String accountIdParam = request.getParameter("accountId");
            if (accountIdParam != null && !accountIdParam.isEmpty()) {
                member.setAccountId(Integer.parseInt(accountIdParam));
            }

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
                member.setAvatarMember("img/avatar-default.jpg");
            }

            // Save member to database
            boolean success = groupMemberDAO.createMember(member);

            response.sendRedirect("group?action=view&account_id=" + accountId);


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
    }

    private void updateMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get member ID from request
            int memberId = Integer.parseInt(request.getParameter("memberId"));

            // Get existing member
            GroupMember member = groupMemberDAO.getMemberById(memberId);
            if (member == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            // Update member properties from request parameters
            member.setMemberName(request.getParameter("memberName"));

            // Handle account ID
            String accountIdParam = request.getParameter("accountId");
            if (accountIdParam != null && !accountIdParam.isEmpty()) {
                member.setAccountId(Integer.parseInt(accountIdParam));
            }

            member.setBio(request.getParameter("bio"));

            // Handle date of birth
            String dobString = request.getParameter("dateOfBirth");
            if (dobString != null && !dobString.isEmpty()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date dob = sdf.parse(dobString);
                member.setDateOfBirth(dob);
            }

            member.setSpeciality(request.getParameter("specialty"));
            member.setGender(request.getParameter("memberGender"));

            // Handle experience years
            String expParam = request.getParameter("experience");
            if (expParam != null && !expParam.isEmpty()) {
                if (expParam.equals("1")) {
                    member.setExperienceYears(0); // Under 1 year
                } else if (expParam.equals("1-3")) {
                    member.setExperienceYears(2); // Average of 1-3
                } else if (expParam.equals("3-5")) {
                    member.setExperienceYears(4); // Average of 3-5
                } else if (expParam.equals("5+")) {
                    member.setExperienceYears(5); // 5+ years
                }
            }

            // Status (active/inactive)
            String statusParam = request.getParameter("status");
            member.setStatus(statusParam != null && statusParam.equals("on") ? "active" : "inactive");

            member.setEducation(request.getParameter("education"));
            member.setPosition(request.getParameter("memberRole"));

            // Handle file upload for avatar
            Part filePart = request.getPart("imageUpload");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = getUniqueFileName(getSubmittedFileName(filePart));
                String uploadPath = getServletContext().getRealPath("/") + "uploads/avatars/";

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
                member.setAvatarMember("uploads/avatars/" + fileName);
            }

            // Update member in database
            boolean success = groupMemberDAO.updateMember(member);

//            if (success) {
//                response.sendRedirect(request.getContextPath() + "/member/view/" + memberId);
//            } else {
//                request.setAttribute("error", "Failed to update member");
//                request.setAttribute("member", member); // Send back the filled form
//                request.getRequestDispatcher("/WEB-INF/views/member/form.jsp").forward(request, response);
//            }
        } catch (ParseException e) {
            request.setAttribute("error", "Invalid date format");
            request.getRequestDispatcher("/WEB-INF/views/member/form.jsp").forward(request, response);
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

