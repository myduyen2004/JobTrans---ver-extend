//package jobtrans.controller.web.job;
//
//
//import jobtrans.dal.JobDAO;
//import jobtrans.model.Account;
//import jobtrans.model.Job;
//import jobtrans.model.JobGreeting;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//@WebServlet(name="JobServlet", urlPatterns={"/job"})
//public class JobServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//        switch (action) {
//            case "view-applied":
//                viewListApplied(request, response);
//                break;
//            case "list-job-by-status":
//                listJobByStatus(request,response);
//                break;
//            case "sort":
//                sapxep(request,response);
//                break;
//            case "detail":
////                detail(request,response);
//                break;
//            default:
//                response.getWriter().print("Lỗi rồi má");
//                break;
//        }
//
//    }
//    private void viewListApplied(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
=======
package jobtrans.controller.web.job;


import jobtrans.dal.AccountDAO;
import jobtrans.dal.JobDAO;
import jobtrans.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="JobServlet", urlPatterns={"/job"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class JobServlet extends HttpServlet {
    public static final int BUFFER_SIZE = 1024 * 1000;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        switch (action) {

            case "view-posted-jobs":
                viewPostedJobList(request, response);
                break;
            case "posted-job-detail":
                viewPostedJobDetail(request, response);
                break;
            case "pre-update":
                loadJobUpdate(request, response);
                break;
            case "deleteJob":
                deleteJob(request, response);
                break;
            case "view-applied":
                viewListApplied(request, response);
                break;
            case "list-job-by-status":
                listJobByStatus(request, response);
                break;
            case "sort":
                sapxep(request, response);
                break;
            case "detail":
//                detail(request,response);
                break;
            case "download":
                downloadFile(request, response);
                break;
            default:
                response.getWriter().print("Lỗi rồi má");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String action = req.getParameter("action");
        switch (action) {
            case "post-job":
                postJob(req, resp);
                break;
            case "update-job":
                updateJob(req, resp);
                break;
            default:
                resp.getWriter().print("Lỗi rồi má");
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
        jobGreetings = jobDAO.search(accountId, sort);

        request.setAttribute("job", jobGreetings);
        request.getRequestDispatcher("applied-job-list.jsp").forward(request, response);
    }

    public void viewPostedJobList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Login ok thì mở comment
        JobDAO jobDAO = new JobDAO();
        AccountDAO accountDAO = new AccountDAO();
        HttpSession session = request.getSession();
        if(session.getAttribute("sessionAccount") != null) {
            Account account = (Account) session.getAttribute("sessionAccount");
            Account account1 = accountDAO.getAccountById(account.getAccountId());
            int accountId = account1.getAccountId();
            List<Job> jobList = jobDAO.getAllJobByPostAccountId(accountId);
//        List<Job> jobList = jobDAO.getAllJobByPostAccountId(1); //Sau khi login ok thì bỏ dòng này
            request.setAttribute("jobList", jobList);
            request.getRequestDispatcher("job-posted-list-manage.jsp").forward(request, response);
        } else {
            response.sendRedirect("home");
        }
    }

    public void viewPostedJobDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        HttpSession session = request.getSession();
        JobDAO jobDAO = new JobDAO();
        if (session.getAttribute("sessionAccount") != null) {
            Job job = jobDAO.getJobById(jobId);
            List<JobGreeting> greetings = jobDAO.getJobGreetingsByJobId(jobId);
            request.setAttribute("job", job);
            request.setAttribute("greetings", greetings);
//        response.getWriter().print(job);
            request.getRequestDispatcher("job-post-detail.jsp").forward(request, response);
        }else {
            response.sendRedirect("home");
        }
    }

    public void postJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JobDAO jobDAO = new JobDAO();
        AccountDAO accountDAO = new AccountDAO();
        Job job = new Job();
        //Login ok thì mở comment
        HttpSession session = request.getSession();
        if(session.getAttribute("sessionAccount") != null) {
            Account account = (Account) session.getAttribute("sessionAccount");
            Account account1 = accountDAO.getAccountById(account.getAccountId());
            int accountId = account1.getAccountId();
            job.setPostAccountId(accountId);
//        job.setPostAccountId(1);
            job.setJobTitle(request.getParameter("title"));
            job.setCategoryId(Integer.parseInt(request.getParameter("category")));
            job.setNumOfMember(Integer.parseInt(request.getParameter("numOfMems")));
            job.setJobDescription(request.getParameter("description"));
            job.setRequirements(request.getParameter("requirement"));
            job.setBenefit(request.getParameter("benefit"));
            job.setBudgetMin(new BigDecimal(request.getParameter("budgetMin")));
            job.setBudgetMax(new BigDecimal(request.getParameter("budgetMax")));
            //Xu li test
            Test testO = new Test();
            String test = request.getParameter("kiemtra");
            String testLink = request.getParameter("kiemtra-content");
            String testRequired = request.getParameter("kiemtra-required");
            if ("yes".equals(test)) {
                // Người dùng chọn "Có"
                job.setHaveTested(true);
                testO.setTestLink(testLink);
                if ("yes".equals(testRequired)) {
                    testO.setHaveRequired(true);
                } else {
                    testO.setHaveRequired(false);
                }
            } else if ("no".equals(test)) {
                // Người dùng chọn "Không"
                job.setHaveTested(false);
            } else {
                // Không chọn gì
                job.setHaveTested(false);
            }
            Part p = request.getPart("file");
            String fileName = p.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                // Đường dẫn build cụ thể
                String path = getServletContext().getRealPath("") + "job_docs";
                File file = new File(path);
                if (!file.exists()) {
                    file.mkdirs();
                }
                p.write(path + File.separator + fileName);  // Ghi file vào thư mục build
                response.getWriter().print("File saved at: " + path + File.separator + fileName);
            } else {
                fileName = "";
                response.getWriter().print("No file uploaded.");
            }
            job.setAttachment(fileName);

            //Xu ly Interview
            Interview interview = new Interview();
            String interDate = request.getParameter("interviewDate");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            if (interDate != null && !interDate.isEmpty()) {
                // Convert từ String sang java.util.Date
                job.setHaveInterviewed(true);
                try {
                    interview.setStartDate(dateFormat.parse(interDate));
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
            } else {
                job.setHaveInterviewed(false);
            }

            String dueDateStr = request.getParameter("dueDate");
            if (dueDateStr != null && !dueDateStr.isEmpty()) {
                // Convert từ String sang java.util.Date
                job.setDueDatePost(Date.valueOf(dueDateStr));
            }

            //Them cong viec moi
            int jobId = jobDAO.addJob(job);

            //Them Interview
            interview.setJobId(jobId);
            jobDAO.insertInterview(interview);

            //Them test moi
            testO.setJobId(jobId);
            jobDAO.insertTest(testO);

            //Them JobTag
            String[] tags = request.getParameterValues("tag");
            if (tags != null) {
                for (String tag : tags) {
                    int tagId = Integer.parseInt(tag);
                    jobDAO.addJobTag(jobId, tagId);
                }
            }

            Job jobNew = jobDAO.getJobById(jobId);
            List<JobGreeting> greetings = jobDAO.getJobGreetingsByJobId(jobId);
            request.setAttribute("job", jobNew);
            request.setAttribute("greetings", greetings);
            request.getRequestDispatcher("job-post-detail.jsp").forward(request, response);
        }else {
            response.sendRedirect("home");
        }
    }

    public void loadJobUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            int jobId = Integer.parseInt(request.getParameter("jobId"));
            JobDAO jobDAO = new JobDAO();
            Job job = jobDAO.getJobById(jobId);
            request.setAttribute("job", job);
            request.getRequestDispatcher("update_job_post.jsp").forward(request, response);
        }else {
            response.sendRedirect("home");
        }
    }

    public void updateJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            JobDAO jobDAO = new JobDAO();
            Job job = new Job();
            int jobId = Integer.parseInt(request.getParameter("jobId"));
            Job oldJob = jobDAO.getJobById(jobId);
            job.setJobId(jobId);
            job.setPostAccountId(Integer.parseInt(request.getParameter("post-account-id")));
            job.setJobTitle(request.getParameter("title"));
            job.setCategoryId(Integer.parseInt(request.getParameter("category")));
            job.setNumOfMember(Integer.parseInt(request.getParameter("numOfMems")));
            job.setJobDescription(request.getParameter("description"));
            job.setRequirements(request.getParameter("requirement"));
            job.setBenefit(request.getParameter("benefit"));
            job.setBudgetMin(new BigDecimal(request.getParameter("budgetMin")));
            job.setBudgetMax(new BigDecimal(request.getParameter("budgetMax")));
            //Xu li test
            Test testO = new Test();
            String test = request.getParameter("kiemtra");
            String testLink = request.getParameter("kiemtra-content");
            String testRequired = request.getParameter("kiemtra-required");
            if ("yes".equals(test)) {
                // Người dùng chọn "Có"
                job.setHaveTested(true);
                testO.setTestLink(testLink);
                if ("yes".equals(testRequired)) {
                    testO.setHaveRequired(true);
                } else {
                    testO.setHaveRequired(false);
                }
            } else if ("no".equals(test)) {
                // Người dùng chọn "Không"
                job.setHaveTested(false);
            } else {
                // Không chọn gì
                job.setHaveTested(false);
            }
            Part p = request.getPart("file");
            String fileName = p.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                // Đường dẫn build cụ thể
                String path = getServletContext().getRealPath("") + "job_docs";
                File file = new File(path);
                if (!file.exists()) {
                    file.mkdirs();
                }
                p.write(path + File.separator + fileName);  // Ghi file vào thư mục build
                response.getWriter().print("File saved at: " + path + File.separator + fileName);
            } else {
                fileName = oldJob.getAttachment();
                response.getWriter().print("No file uploaded.");
            }
            job.setAttachment(fileName);

            //Xu ly Interview
            Interview interview = new Interview();
            String interDate = request.getParameter("interviewDate");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            if (interDate != null && !interDate.isEmpty()) {
                // Convert từ String sang java.util.Date
                job.setHaveInterviewed(true);
                try {
                    interview.setStartDate(dateFormat.parse(interDate));
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
            } else {
                job.setHaveInterviewed(false);
            }

            String dueDateStr = request.getParameter("dueDate");
            if (dueDateStr != null && !dueDateStr.isEmpty()) {
                // Convert từ String sang java.util.Date
                job.setDueDatePost(Date.valueOf(dueDateStr));
            }

            jobDAO.updateJobByJobId(job);

            //Them Interview
            interview.setJobId(jobId);
            jobDAO.updateInterviewByJobId(interview);

            //Them test moi
            testO.setJobId(jobId);
            jobDAO.insertTest(testO);

            //Them JobTag moi
            String[] tags = request.getParameterValues("tag");
            if (tags != null) {
                //Delete JobTag Cũ
                jobDAO.deleteJobTagByJobId(jobId);
                for (String tag : tags) {
                    int tagId = Integer.parseInt(tag);
                    jobDAO.addJobTag(jobId, tagId);
                }
            }

            Job jobNew = jobDAO.getJobById(jobId);
            List<JobGreeting> greetings = jobDAO.getJobGreetingsByJobId(jobId);
            request.setAttribute("job", jobNew);
            request.setAttribute("greetings", greetings);
            request.getRequestDispatcher("job-post-detail.jsp").forward(request, response);
        }else{
            response.sendRedirect("home");
        }
    }

    public void deleteJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            int jobId = Integer.parseInt(request.getParameter("jobId"));
            JobDAO jobDAO = new JobDAO();
            AccountDAO accountDAO = new AccountDAO();

            Account account = (Account) session.getAttribute("sessionAccount");
            Account account1 = accountDAO.getAccountById(account.getAccountId());
            int accountId = account1.getAccountId();

            boolean check = jobDAO.deleteJobByJobId(jobId);

            if(check){
                request.setAttribute("toastMessage", "Xóa công việc thành công");
                List<Job> jobList = jobDAO.getAllJobByPostAccountId(accountId);
                request.setAttribute("jobList", jobList);
                request.getRequestDispatcher("job-posted-list-manage.jsp").forward(request, response);
            } else {
                request.setAttribute("toastMessage", "Xóa công việc thất bại - có lỗi xảy ra!");
                request.setAttribute("toastType", "error");

                Job job = jobDAO.getJobById(jobId);
                List<JobGreeting> greetings = jobDAO.getJobGreetingsByJobId(jobId);
                request.setAttribute("job", job);
                request.setAttribute("greetings", greetings);
                request.getRequestDispatcher("job-post-detail.jsp").forward(request, response);
            }
        }else{
            response.sendRedirect("home");
        }
    }

    private void downloadFile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            String fileName = req.getParameter("fileName");
            if (fileName != null) {
                String path = getServletContext().getRealPath("") + "job_docs" + File.separator + fileName;
//        System.out.println(path);
//        response.getWriter().print(path);

                File file = new File(path);
                OutputStream os = null;
                FileInputStream fis = null;

                resp.setHeader("Content-Disposition", String.format("attachment;filename=\"%s\"", file.getName()));
                resp.setContentType("application/octet-stream");

                if (file.exists()) {
                    os = resp.getOutputStream();
                    fis = new FileInputStream(file);
                    byte[] bf = new byte[BUFFER_SIZE];
                    int byteRead = -1;
                    while ((byteRead = fis.read(bf)) != -1) {
                        os.write(bf, 0, byteRead);
                    }
                } else {
                    System.out.println("File Not Found: " + fileName);
                }
            }
        } else {
            resp.sendRedirect("home");
        }
    }
}

//    private void viewListApplied(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        Account account = (Account) session.getAttribute("sessionAccount");
//        int accountId = account.getAccountId();// tạm fix cứng, sau này lấy từ session
//        JobDAO jobDAO = new JobDAO();
//        List<JobGreeting> jobGreetings = jobDAO.getJobGreetingByJobSeekerId(accountId);
//
//        request.setAttribute("job", jobGreetings);  // "jobGreetings" là key để jsp lấy ra
//        request.getRequestDispatcher("applied-job-list.jsp").forward(request, response);
//    }
//    private void listJobByStatus(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String status = request.getParameter("status"); // Lấy tham số từ request
//
//        int accountId = 1; // Tạm fix cứng, sau này lấy từ session
//        JobDAO jobDAO = new JobDAO();
//
//        List<JobGreeting> jobGreetings;
//        if (status == null || status.isEmpty() || "tất cả".equals(status)) {
//            jobGreetings = jobDAO.getJobGreetingByJobSeekerId(accountId);
//        } else {
//            jobGreetings = jobDAO.getJobGreetingByStatus(accountId, status);
//        }
//
//        request.setAttribute("job", jobGreetings);
//        request.getRequestDispatcher("applied-job-list.jsp").forward(request, response);
//    }
//    private void sapxep(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String sort = request.getParameter("sort"); // Lấy tham số từ request
//
//        int accountId = 1; // Tạm fix cứng, sau này lấy từ session
//        JobDAO jobDAO = new JobDAO();
//
//        List<JobGreeting> jobGreetings;
//        jobGreetings = jobDAO.search(accountId,sort);
//
//        request.setAttribute("job", jobGreetings);
//        request.getRequestDispatcher("applied-job-list.jsp").forward(request, response);
//    }
////    private void detail(HttpServletRequest request, HttpServletResponse response)
////            throws ServletException, IOException {
////        String jobGreetingId  = request.getParameter("jobGreetingId").trim();
////        String jobId = request.getParameter("jobId").trim();
////        int jgId = Integer.parseInt(jobGreetingId);
////        int j = Integer.parseInt(jobId);
////        JobDAO jd = new JobDAO();
////        JobGreeting jobGreeting = jd.getJobGreetingById(jgId);
////        Job job =jd.getJobById(j);
////        request.setAttribute("jobGreeting ", jobGreeting );
////        request.setAttribute("job", job);
////
////        request.getRequestDispatcher("infor-applied-job-detail.jsp").forward(request, response);
////    }
=======
//
//        request.setAttribute("job", jobGreetings);  // "jobGreetings" là key để jsp lấy ra
//        request.getRequestDispatcher("applied-job-list.jsp").forward(request, response);
//    }
//}