package jobtrans.controller.web.job;


import jobtrans.dal.JobDAO;
import jobtrans.dal.JobGreetingDAO;
import jobtrans.model.Account;
import jobtrans.model.JobGreeting;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="JobGreetingServlet", urlPatterns={"/job-greeting"})
public class JobGreetingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view-applied":
                viewListApplied(request, response);
                break;
            default:
                response.getWriter().print("Lỗi rồi má");
                break;
        }
    }
    private void viewListApplied(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        int accountId = account.getAccountId();// tạm fix cứng, sau này lấy từ session
        JobGreetingDAO jobGreetingDAO = new JobGreetingDAO();
        List<JobGreeting> jobGreetings = jobGreetingDAO.getListJobGreetingBySeekerId(account);
        request.setAttribute("job", jobGreetings);  // "jobGreetings" là key để jsp lấy ra
        request.getRequestDispatcher("applied-job-list.jsp").forward(request, response);
    }
}