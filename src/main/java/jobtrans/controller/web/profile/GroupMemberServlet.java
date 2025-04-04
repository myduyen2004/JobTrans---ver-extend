package jobtrans.controller.web.profile;

import com.google.gson.Gson;
import jobtrans.dal.AccountDAO;
import jobtrans.dal.GroupMemberDAO;
import jobtrans.model.Account;
import jobtrans.model.GroupMember;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static org.apache.http.client.utils.DateUtils.formatDate;
import static org.apache.http.client.utils.DateUtils.parseDate;

@WebServlet(name = "GroupMemberServlet", urlPatterns = {"/group"})


public class GroupMemberServlet extends HttpServlet {
    private GroupMemberDAO groupMemberDAO = new GroupMemberDAO();
    private AccountDAO accountDAO = new AccountDAO();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "member-details":
                try {
                    getMemberDetail(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
//            case "updateGroupMember":
//                updateGroupMember(request, response);
//                break;
            case "showUpdateGroup":
                try {
                    showUpdateGroup(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                response.sendRedirect("viewProfile.jsp");
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "update":
                try {
                    updateMemberInfo(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                try {
                    showUpdateGroup(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void showUpdateGroup(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();

        int accountId = Integer.parseInt(request.getParameter("account_id"));
        Account account = accountDAO.getAccountById(accountId);
        List<GroupMember> members = groupMemberDAO.getMembersByAccountId(accountId);

        request.setAttribute("account", account);
        request.setAttribute("memberList", members);

        // If members exist, get the first member's details by default
        if (!members.isEmpty()) {
            GroupMember firstMember = members.get(0);
            request.setAttribute("selectedMember", firstMember);
        }

        request.getRequestDispatcher("enter_group_in4.jsp").forward(request, response);
    }

    private void updateMemberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int memberId = Integer.parseInt(request.getParameter("memberId"));
        System.out.println(memberId);
        GroupMember member = groupMemberDAO.getMemberByMemberId(memberId);
        System.out.println(member.toString());

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

//        member.setGender(request.getParameter("gender"));
        String experienceYearsStr = request.getParameter("experienceYears");
        if (experienceYearsStr != null && !experienceYearsStr.isEmpty()) {
            member.setExperienceYears(Integer.parseInt(experienceYearsStr));
        }

        member.setEducation(request.getParameter("education"));
        member.setBio(request.getParameter("bio"));
        member.setSpecialist(request.getParameter("specialist"));

        // Save updated member
        boolean updated = groupMemberDAO.updateMember(member);

        // Redirect back to the team account page
        if (updated) {
            request.setAttribute("message", "Member information updated successfully!");
        } else {
            request.setAttribute("error", "Failed to update member information.");
        }
        request.setAttribute("error", new Error("Lỗi xảy ra"));
        response.sendRedirect(request.getContextPath() + "/group?action=showUpdateGroup&account_id=" + member.getAccountId());
    }
//private void updateMemberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
//    // Lấy memberId từ request
//    String memberIdStr = request.getParameter("memberId");
//    if (memberIdStr == null || memberIdStr.isEmpty()) {
//        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//        response.getWriter().write("{\"error\": \"Missing memberId\"}");
//        return;
//    }
//
//    int memberId = Integer.parseInt(memberIdStr);
//    GroupMember member = groupMemberDAO.getMemberByMemberId(memberId);
//
//    // Kiểm tra nếu member không tồn tại
//    if (member == null) {
//        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
//        response.getWriter().write("{\"error\": \"Member not found\"}");
//        return;
//    }
//
//    // Cập nhật thông tin từ form
//    String memberName = request.getParameter("memberName");
//    if (memberName != null && !memberName.trim().isEmpty()) {
//        member.setMemberName(memberName);
//    }
//
//    // Xử lý ngày sinh (nếu có)
//    String dateOfBirthStr = request.getParameter("dateOfBirth");
//    if (dateOfBirthStr != null && !dateOfBirthStr.isEmpty()) {
//        try {
//            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//            Date dateOfBirth = dateFormat.parse(dateOfBirthStr);
//            member.setDateOfBirth(new java.sql.Date(dateOfBirth.getTime()));
//        } catch (ParseException e) {
//            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            response.getWriter().write("{\"error\": \"Invalid date format\"}");
//            return;
//        }
//    }
//
//    // Cập nhật các trường thông tin khác
//    String experienceYearsStr = request.getParameter("experienceYears");
//    if (experienceYearsStr != null && !experienceYearsStr.isEmpty()) {
//        try {
//            int experienceYears = Integer.parseInt(experienceYearsStr);
//            member.setExperienceYears(experienceYears);
//        } catch (NumberFormatException e) {
//            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            response.getWriter().write("{\"error\": \"Invalid experience years\"}");
//            return;
//        }
//    }
//
//    member.setEducation(request.getParameter("education"));
//    member.setBio(request.getParameter("bio"));
//    member.setSpecialist(request.getParameter("specialist"));
//
//    // Cập nhật member vào database
//    boolean updated = groupMemberDAO.updateMember(member);
//
//    // Trả về phản hồi dạng JSON
//    response.setContentType("application/json");
//    response.setCharacterEncoding("UTF-8");
//
//    if (updated) {
//        response.getWriter().write("{\"success\": true, \"message\": \"Member updated successfully\"}");
//    } else {
//        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//        response.getWriter().write("{\"success\": false, \"message\": \"Failed to update member information\"}");
//    }
//}


    private void getMemberDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int memberId = Integer.parseInt(request.getParameter("memberId"));
        GroupMember member = groupMemberDAO.getMemberByMemberId(memberId);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Create JSON response with member details
        String json = "{" +
                "\"memberName\":\"" + (member.getMemberName() != null ? member.getMemberName() : "") + "\"," +
                "\"dateOfBirth\":\"" + (member.getDateOfBirth() != null ? formatDate(member.getDateOfBirth()) : "") + "\"," +
                "\"gender\":\"" + (member.getGender() != null ? member.getGender() : "") + "\"," +
                "\"experienceYears\":\"" + member.getExperienceYears() + "\"," +
                "\"education\":\"" + (member.getEducation() != null ? member.getEducation() : "") + "\"," +
                "\"bio\":\"" + (member.getBio() != null ? member.getBio() : "") + "\"," +
                "\"specialist\":\"" + (member.getSpecialist() != null ? member.getSpecialist() : "") + "\"" +
                "}";

        response.getWriter().print(json);
    }

    private void getInforMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            int memberId = Integer.parseInt(request.getParameter("memberId"));

            // Tạo đối tượng DAO để truy xuất dữ liệu
            GroupMemberDAO memberDAO = new GroupMemberDAO();
            GroupMember member = memberDAO.getMemberByMemberId(memberId);

            // Chuyển đổi đối tượng thành JSON
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(member);

            // Gửi JSON về client
            response.getWriter().write(jsonResponse);

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"" + e.getMessage() + "\"}");
        }
    }

//    private void updateGroupMember(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//
//        try {
//            // Lấy dữ liệu từ form
//            int memberId = Integer.parseInt(request.getParameter("memberId"));
//            String name = request.getParameter("name");
//            String dateOfBirthStr = request.getParameter("dateOfBirth");
//            String gender = request.getParameter("gender");
//            int experience = Integer.parseInt(request.getParameter("experience"));
//            String education = request.getParameter("education");
//            String bio = request.getParameter("bio");
//            String specialist = request.getParameter("specialist");
//
//            // Chuyển đổi ngày sinh
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//            java.util.Date parsedDate = sdf.parse(dateOfBirthStr);
//            java.sql.Date dateOfBirth = new java.sql.Date(parsedDate.getTime());
//
//            // Tạo đối tượng GroupMember
//            GroupMember member = new GroupMember();
//            member.setMemberId(memberId);
//            member.setMemberName(name);
//            member.setDateOfBirth(dateOfBirth);
//            member.setGender(gender);
//            member.setExperienceYears(experience);
//            member.setEducation(education);
//            member.setBio(bio);
//            member.setSpecialist(specialist);
//
//            // Cập nhật vào database
//            GroupMemberDAO memberDAO = new GroupMemberDAO();
//            boolean success = memberDAO.updateMember(member);
//
//            // Trả về kết quả
//            if (success) {
//                response.getWriter().write("{\"success\": true}");
//            } else {
//                response.getWriter().write("{\"success\": false, \"message\": \"Không thể cập nhật\"}");
//            }
//
//        } catch (Exception e) {
//            response.getWriter().write("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
//        }
//    }
}


