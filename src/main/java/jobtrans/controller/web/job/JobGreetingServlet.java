package jobtrans.controller.web.job;


import jobtrans.dal.AccountDAO;
import jobtrans.dal.CvDAO;
import jobtrans.dal.JobDAO;
import jobtrans.dal.JobGreetingDAO;
import jobtrans.model.Account;
import jobtrans.model.CV;
import jobtrans.model.Job;
import jobtrans.model.JobGreeting;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name="JobGreetingServlet", urlPatterns={"/job-greeting"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 5242880, // 5 MB
        maxRequestSize = 20971520 // 20 MB
)
public class JobGreetingServlet extends HttpServlet {

    // Constants for file upload
    private static final int MAX_FILE_SIZE = 5 * 1024 * 1024; // 5MB
    private static final String UPLOAD_DIRECTORY = "uploads/attachments";

    AccountDAO accountDAO = new AccountDAO();
    JobGreetingDAO jobGreetingDAO = new JobGreetingDAO();
    JobDAO jobDAO = new JobDAO();
    CvDAO cvDAO = new CvDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view-applied":
                viewListApplied(request, response);
                break;
            case "show-send-application":
                showSendApplication(request, response);
                break;
            default:
                response.getWriter().print("Lỗi rồi má");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        Account account01 = accountDAO.getAccountById(account.getAccountId());

        int jobSeekerId = account01.getAccountId();

        try {
            // Get regular form parameters directly - assumes not multipart
            int jobId = Integer.parseInt(request.getParameter("jobId"));
            int cvId = Integer.parseInt(request.getParameter("cv_id"));
            int price = Integer.parseInt(request.getParameter("price").replaceAll("[^\\d]", ""));
            int expectedDay = Integer.parseInt(request.getParameter("expected_day"));
            String introduction = request.getParameter("introduction");

            // Kiểm tra tài khoản đã gửi chào giá cho công việc này chưa
//            if (jobGreetingDAO.checkExistingGreeting(jobSeekerId, jobId)) {
//                request.setAttribute("errorMessage", "Bạn đã gửi chào giá cho công việc này");
//                request.getRequestDispatcher("job-detail?jobId=" + jobId).forward(request, response);
//                return;
//            }

            // Process attachment (if any) using a separate method
            String attachment = processAttachment(request);

            // Create job greeting object
            JobGreeting jobGreeting = new JobGreeting();
            jobGreeting.setJobSeekerId(jobSeekerId);
            jobGreeting.setJobId(jobId);
            jobGreeting.setCvId(cvId);
            jobGreeting.setPrice(price);
            jobGreeting.setExpectedDay(expectedDay);
            jobGreeting.setIntroduction(introduction);
            jobGreeting.setAttachment(attachment);
            jobGreeting.setHaveRead(false);
            jobGreeting.setStatus("Chờ xét duyệt");


            System.out.println(jobGreeting);

            // Save job greeting to database
            boolean success = jobGreetingDAO.insertJobGreeting(jobGreeting);

            if (success) {
                // Send notification to job poster
                Job job = jobDAO.getJobById(jobId);
                Account applier = accountDAO.getAccountById(jobSeekerId);

//                sendNotification(job.getPostAccountId(), jobId, applier.getAccountName(), job.getJobTitle());

                // Redirect with success message
                request.setAttribute("successMessage", "Gửi chào giá thành công");
                response.sendRedirect(request.getContextPath() + "/job?action=details-job-posted&jobId=" + jobId);
            } else {
                request.setAttribute("errorMessage", "Có lỗi xảy ra, vui lòng thử lại sau");
                request.getRequestDispatcher("404.html").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            String jobId = request.getParameter("jobId");
            String redirectUrl = jobId != null ? "job-detail?jobId=" + jobId : "browse-jobs";
            request.setAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher(redirectUrl).forward(request, response);
        }
    }

    /**
     * Processes the attachment file upload
     */
    private String processAttachment(HttpServletRequest request) {
        try {
            Part filePart = request.getPart("attachment");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = getFileName(filePart);
                if (fileName != null && !fileName.isEmpty()) {
                    // Generate unique filename
                    String uniqueFileName = System.currentTimeMillis() + "_" + fileName;

                    // Create upload directory
                    String uploadPath = request.getServletContext().getRealPath("") + UPLOAD_DIRECTORY;
                    java.io.File uploadDir = new java.io.File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }

                    // Save the file
                    filePart.write(uploadPath + java.io.File.separator + uniqueFileName);

                    // Return relative path for database
                    return UPLOAD_DIRECTORY + "/" + uniqueFileName;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return null;
    }

    /**
     * Sends notification to job poster
     */
//    private void sendNotification(int recipientId, int jobId, String applicantName, String jobTitle) {
//        try {
//            NotificationDAO notificationDAO = new NotificationDAO();
//
//            Notification notification = new Notification();
//            notification.setAccountId(recipientId);
//            notification.setTitle("Ứng viên mới");
//            notification.setContent(applicantName + " đã ứng tuyển vào vị trí " + jobTitle);
//            notification.setType("job_application");
//            notification.setReferenceId(jobId);
//            notification.setIsRead(false);
//            notification.setCreatedAt(new Timestamp(System.currentTimeMillis()));
//
//            notificationDAO.createNotification(notification);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    private void showSendApplication(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            Account account = (Account) session.getAttribute("sessionAccount");
            if (account == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            Account account01 = accountDAO.getAccountById(account.getAccountId());

            int jobId = Integer.parseInt(request.getParameter("jobId"));
            JobDAO jobDAO = new JobDAO();
            Job job = jobDAO.getJobById(jobId);
            System.out.println(job);

            //Xử lý ngân sách dự án
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
            String formattedBudgetMin = currencyFormat.format(job.getBudgetMin());
            String formattedBudgetMax = currencyFormat.format(job.getBudgetMax());
            request.setAttribute("formattedBudgetMin", formattedBudgetMin);
            request.setAttribute("formattedBudgetMax", formattedBudgetMax);

            CvDAO cvDAO = new CvDAO();
            List<CV> cvList = cvDAO.getCVsByAccountId(account01.getAccountId());

            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

            request.setAttribute("job", job);
            request.setAttribute("cvList", cvList);
            request.setAttribute("account", account01);
            request.getRequestDispatcher("greeting.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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