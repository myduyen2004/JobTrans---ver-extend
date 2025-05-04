package jobtrans.controller.web.job;

import jobtrans.dal.AccountDAO;
import jobtrans.dal.CvDAO;
import jobtrans.dal.JobDAO;
import jobtrans.dal.JobGreetingDAO;
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

@WebServlet(name="ContractServlet", urlPatterns={"/contract"})
public class ContractServlet extends HttpServlet {

    AccountDAO accountDAO = new AccountDAO();
    JobGreetingDAO jobGreetingDAO = new JobGreetingDAO();
    JobDAO jobDAO = new JobDAO();
    CvDAO cvDAO = new CvDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view-infor-project-contract":
                viewInforProjectContract(request, response);
                break;
            case "show-form-terms-of-agreement":
                showFormTermsOfAgreement(request, response);
                break;
            default:
                response.getWriter().print("Lỗi rồi má");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void viewInforProjectContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            Account account = (Account) session.getAttribute("sessionAccount");
            if (account == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            int greetingId = Integer.parseInt(request.getParameter("greetingId"));
            Account account01 = accountDAO.getAccountById(account.getAccountId());
            JobGreeting jobGreeting = jobGreetingDAO.getJobGreetingById(greetingId);
            Account account02 = accountDAO.getAccountById(jobGreeting.getJobSeekerId());
            Job job = jobDAO.getJobById(jobGreeting.getJobId());

            System.out.println(account01);
            System.out.println(account02);
            System.out.println(jobGreeting);
            System.out.println(job);

            request.setAttribute("poster", account01);
            request.setAttribute("jobSeeker", account02);
            request.setAttribute("job", job);
            response.sendRedirect("infor-job-contract.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void showFormTermsOfAgreement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            Account account = (Account) session.getAttribute("sessionAccount");
            if (account == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
