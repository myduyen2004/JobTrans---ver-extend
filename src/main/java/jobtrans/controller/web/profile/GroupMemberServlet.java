package jobtrans.controller.web.profile;

import com.google.gson.Gson;
import jobtrans.dal.AccountDAO;
import jobtrans.dal.GroupMemberDAO;
import jobtrans.model.Account;
import jobtrans.model.GroupMember;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
        Account account = (Account) session.getAttribute("sessionAccount");
//        int accountId = Integer.parseInt(request.getParameter("account_id"));
//        Account account01 = accountDAO.getAccountById(account.getAccountId());
        List<GroupMember> members = groupMemberDAO.getMembersByAccountId(account.getAccountId());

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
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.sendRedirect(request.getContextPath() + "/group?action=showUpdateGroup&account_id=" + member.getAccountId());
    }

    private void getMemberDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int memberId = Integer.parseInt(request.getParameter("memberId"));
        GroupMember member = groupMemberDAO.getMemberByMemberId(memberId);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Create JSON response with member details
        String json = "{" +
                "\"memberName\":\"" + (member.getMemberName() != null ? member.getMemberName() : "") + "\"," +
                "\"dateOfBirth\":\"" + (member.getUtilsDateOfBirth() != null ? member.getUtilsDateOfBirth() : "") + "\"," +
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
}

