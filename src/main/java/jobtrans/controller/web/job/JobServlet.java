package jobtrans.controller.web.job;


import jobtrans.dal.JobDAO;
import jobtrans.model.Account;
import jobtrans.model.Job;
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

@WebServlet(name="JobServlet", urlPatterns={"/job"})
public class JobServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view-applied":
                viewListApplied(request, response);
                break;
            case "list-job-by-status":
                listJobByStatus(request,response);
                break;
            case "sort":
                sapxep(request,response);
                break;
            case "detail":
//                detail(request,response);
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
        JobDAO jobDAO = new JobDAO();
        List<JobGreeting> jobGreetings = jobDAO.getJobGreetingByJobSeekerId(accountId);

        request.setAttribute("job", jobGreetings);  // "jobGreetings" là key để jsp lấy ra
        request.getRequestDispatcher("applied-job-list.jsp").forward(request, response);
    }
    private void listJobByStatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status = request.getParameter("status"); // Lấy tham số từ request

        int accountId = 1; // Tạm fix cứng, sau này lấy từ session
        JobDAO jobDAO = new JobDAO();

        List<JobGreeting> jobGreetings;
        if (status == null || status.isEmpty() || "tất cả".equals(status)) {
            jobGreetings = jobDAO.getJobGreetingByJobSeekerId(accountId);
        } else {
            jobGreetings = jobDAO.getJobGreetingByStatus(accountId, status);
        }

        request.setAttribute("job", jobGreetings);
        request.getRequestDispatcher("applied-job-list.jsp").forward(request, response);
    }
    private void sapxep(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sort = request.getParameter("sort"); // Lấy tham số từ request

        int accountId = 1; // Tạm fix cứng, sau này lấy từ session
        JobDAO jobDAO = new JobDAO();

        List<JobGreeting> jobGreetings;
        jobGreetings = jobDAO.search(accountId,sort);

        request.setAttribute("job", jobGreetings);
        request.getRequestDispatcher("applied-job-list.jsp").forward(request, response);
    }
//    private void detail(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String jobGreetingId  = request.getParameter("jobGreetingId").trim();
//        String jobId = request.getParameter("jobId").trim();
//        int jgId = Integer.parseInt(jobGreetingId);
//        int j = Integer.parseInt(jobId);
//        JobDAO jd = new JobDAO();
//        JobGreeting jobGreeting = jd.getJobGreetingById(jgId);
//        Job job =jd.getJobById(j);
//        request.setAttribute("jobGreeting ", jobGreeting );
//        request.setAttribute("job", job);
//
//        request.getRequestDispatcher("infor-applied-job-detail.jsp").forward(request, response);
//    }
}