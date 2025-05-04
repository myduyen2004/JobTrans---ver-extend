package jobtrans.controller.web.job;

import jobtrans.dal.AccountDAO;
import jobtrans.dal.CriteriaDAO;
import jobtrans.dal.JobDAO;
import jobtrans.model.Account;
import jobtrans.model.Criteria;
import jobtrans.model.Job;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
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
        String jobId = req.getParameter("jobId");
        String accountId = req.getParameter("accountId");
        String violationType = req.getParameter("violationType");
        String content = req.getParameter("content");

        // Xử lý file upload
        Collection<Part> parts = req.getParts();
        List<String> savedFiles = new ArrayList<>();

        for (Part part : parts) {
            if (part.getName().equals("evidences") && part.getSize() > 0) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + "uploads" + File.separator;
                new File(uploadPath).mkdirs(); // tạo thư mục nếu chưa có

                String filePath = uploadPath + fileName;
                part.write(filePath);

                savedFiles.add("uploads/" + fileName);
            }
        }


        // TODO: Lưu report vào DB (bao gồm jobId, accountId, violationType, content, savedFiles)

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
