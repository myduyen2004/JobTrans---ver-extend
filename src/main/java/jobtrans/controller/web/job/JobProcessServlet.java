package jobtrans.controller.web.job;

import jobtrans.dal.AccountDAO;
import jobtrans.dal.CriteriaDAO;
import jobtrans.dal.JobDAO;
import jobtrans.dal.ReportDAO;
import jobtrans.model.Account;
import jobtrans.model.Criteria;
import jobtrans.model.Job;
import jobtrans.model.Report;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,     // 1MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
@WebServlet(name="JobProcessServlet", urlPatterns={"/job-manage-process"})
public class JobProcessServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch(action) {
            case "process-tool":
                processTool(req, resp);
                break;
            case "view-report-form":
                reportForm(req,resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        String jobId = req.getParameter("jobId");
        String accountId = req.getParameter("accountId");
        String violationType = req.getParameter("violationType");
        String content = req.getParameter("content");

        // Xử lý file upload
        Collection<Part> parts = req.getParts();
        String savedFiles = "";

        for (Part part : parts) {
            if (part.getName().equals("evidences") && part.getSize() > 0) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + "uploads" + File.separator;
                new File(uploadPath).mkdirs(); // tạo thư mục nếu chưa có

                String filePath = uploadPath + fileName;
                part.write(filePath);

                savedFiles = "uploads/"+ fileName;
            }
        }
        Report report = new Report();
        report.setJobId(Integer.parseInt(jobId));
        report.setReportBy(account.getAccountId());
        report.setReportedAccount(Integer.parseInt(accountId));
        report.setContentReport(content);
        report.setAttachment(savedFiles);
        report.setCriteriaId(Integer.parseInt(violationType));
        ReportDAO reportDAO = new ReportDAO();
        reportDAO.addReport(report);

        resp.sendRedirect("report-success.jsp");

    }
    private void processTool(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String jobId = req.getParameter("jobId");
        JobDAO jobDAO = new JobDAO();
        Job job = jobDAO.getJobById(Integer.parseInt(jobId));
        req.setAttribute("job", job);
        req.getRequestDispatcher("/job-manage-tool.jsp").forward(req, resp);
    }
    private void reportForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String jobId = req.getParameter("jobId");
        String accountId = req.getParameter("accountId");
        JobDAO jobDAO = new JobDAO();
        AccountDAO accountDAO = new AccountDAO();
        CriteriaDAO criteriaDAO = new CriteriaDAO();
        Job job = jobDAO.getJobById(Integer.parseInt(jobId));
        Account account = accountDAO.getAccountById(Integer.parseInt(accountId));
        List<Criteria> criteriaList;
        try {
            criteriaList = criteriaDAO.getPointDeductionCriteria();
            criteriaList.addAll(criteriaDAO.getBlockingCriteria());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("job", job);
        req.setAttribute("account", account);
        req.setAttribute("criteriaList", criteriaList);
        req.getRequestDispatcher("report-form.jsp").forward(req, resp);
    }
}
