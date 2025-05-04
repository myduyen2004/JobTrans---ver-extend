package jobtrans.controller.web.job;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jobtrans.dal.InterviewDAO;
import jobtrans.dal.JobGreetingDAO;
import jobtrans.model.Account;
import jobtrans.model.Interview;
import jobtrans.model.JobGreeting;

@WebServlet(name = "InterviewServlet", urlPatterns = {"/interview"})
public class InterviewServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "view";
        }

        try {
            // Kiểm tra phiên đăng nhập
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("sessionAccount");
            if (account == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            switch (action) {
                case "create":
                    createInterview(request, response);
                    break;
                case "update":
                    updateInterview(request, response);
                    break;
                default:
                    response.sendRedirect("job-greeting");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Đã xảy ra lỗi: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void createInterview(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy thông tin từ form
            int greetingId = Integer.parseInt(request.getParameter("greetingId"));
            String interviewDateStr = request.getParameter("interviewDate");
            String interviewTimeStr = request.getParameter("interviewTime");
            String interviewForm = request.getParameter("interviewForm");
            String interviewNote = request.getParameter("interviewNote");

            // Kiểm tra nếu các trường bắt buộc bị thiếu
            if (interviewDateStr == null || interviewDateStr.isEmpty() ||
                    interviewTimeStr == null || interviewTimeStr.isEmpty() ||
                    interviewForm == null || interviewForm.isEmpty()) {

                request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin phỏng vấn");
                request.getRequestDispatcher("job-greeting?action=view-details-greeting&greetingId=" + greetingId).forward(request, response);
                return;
            }

            // Chuyển đổi chuỗi ngày và giờ thành đối tượng Date và Time
            Date interviewDate = Date.valueOf(interviewDateStr);
            Time interviewTime = Time.valueOf(interviewTimeStr + ":00"); // Thêm giây

            // Lấy thông tin greeting để có thể lấy jobId
            JobGreetingDAO jobGreetingDAO = new JobGreetingDAO();
            JobGreeting jobGreeting = jobGreetingDAO.getJobGreetingById(greetingId);

            if (jobGreeting == null) {
                request.setAttribute("errorMessage", "Không tìm thấy thông tin ứng tuyển");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Tạo đối tượng Interview
            Interview interview = new Interview();
            interview.setInterviewDate(interviewDate);
            interview.setInterviewTime(interviewTime);
            interview.setInterviewForm(interviewForm);
            interview.setInterviewNote(interviewNote);
            interview.setJobId(jobGreeting.getJobId());
            interview.setGreetingId(greetingId);

            if ("Offline".equals(interviewForm)) {
                String interviewAddress = request.getParameter("interviewAddress");
                if (interviewAddress != null && !interviewAddress.isEmpty()) {
                    interview.setInterviewAddress(interviewAddress);
                } else {
                    interview.setInterviewAddress("Trụ sở công ty"); // Hoặc một địa chỉ mặc định khác
                }
            } else if ("Online".equals(interviewForm)) {
                String interviewLink = request.getParameter("interviewLink");
                interview.setInterviewLink(interviewLink);
            }

            // Lưu vào cơ sở dữ liệu
            InterviewDAO interviewDAO = new InterviewDAO();
            boolean result = interviewDAO.createInterview(interview);

            if (result) {
                // Chuyển hướng về trang chi tiết với thông báo thành công
                request.getSession().setAttribute("successMessage", "Đã đặt lịch phỏng vấn thành công");
                response.sendRedirect("job-greeting?action=view-details-greeting&greetingId=" + greetingId);
            } else {
                request.setAttribute("errorMessage", "Không thể tạo lịch phỏng vấn. Vui lòng thử lại");
                request.getRequestDispatcher("job-greeting?action=view-details-greeting&greetingId=" + greetingId).forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Đã xảy ra lỗi khi đặt lịch phỏng vấn: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void updateInterview(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy thông tin từ form
            int interviewId = Integer.parseInt(request.getParameter("interviewId"));
            int greetingId = Integer.parseInt(request.getParameter("greetingId"));
            String interviewDateStr = request.getParameter("interviewDate");
            String interviewTimeStr = request.getParameter("interviewTime");
            String interviewForm = request.getParameter("interviewForm");
            String interviewNote = request.getParameter("interviewNote");

            // Kiểm tra nếu các trường bắt buộc bị thiếu
            if (interviewDateStr == null || interviewDateStr.isEmpty() ||
                    interviewTimeStr == null || interviewTimeStr.isEmpty() ||
                    interviewForm == null || interviewForm.isEmpty()) {

                request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin phỏng vấn");
                request.getRequestDispatcher("job-greeting?action=viewDetailsGreeting&greetingId=" + greetingId).forward(request, response);
                return;
            }

            // Chuyển đổi chuỗi ngày và giờ thành đối tượng Date và Time
            Date interviewDate = Date.valueOf(interviewDateStr);
            Time interviewTime = Time.valueOf(interviewTimeStr + ":00"); // Thêm giây

            // Lấy thông tin interview hiện tại
            InterviewDAO interviewDAO = new InterviewDAO();
            Interview interview = interviewDAO.getInterviewById(interviewId);

            if (interview == null) {
                request.setAttribute("errorMessage", "Không tìm thấy thông tin phỏng vấn");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Cập nhật thông tin
            interview.setInterviewDate(interviewDate);
            interview.setInterviewTime(interviewTime);
            interview.setInterviewForm(interviewForm);
            interview.setInterviewNote(interviewNote);

            // Xử lý địa chỉ hoặc link tùy thuộc vào hình thức phỏng vấn
            if ("Trực tiếp".equals(interviewForm)) {
                String interviewAddress = request.getParameter("interviewAddress");
                if (interviewAddress != null && !interviewAddress.isEmpty()) {
                    interview.setInterviewAddress(interviewAddress);
                }
                interview.setInterviewLink(null); // Xóa link nếu chuyển sang hình thức trực tiếp
            } else if ("Online".equals(interviewForm)) {
                String interviewLink = request.getParameter("interviewLink");
                interview.setInterviewLink(interviewLink);
                interview.setInterviewAddress(null); // Xóa địa chỉ nếu chuyển sang hình thức online
            }

            // Lưu vào cơ sở dữ liệu
            boolean result = interviewDAO.updateInterview(interview);

            if (result) {
                // Chuyển hướng về trang chi tiết với thông báo thành công
                request.getSession().setAttribute("successMessage", "Đã cập nhật lịch phỏng vấn thành công");
                response.sendRedirect("job-greeting?action=viewDetailsGreeting&greetingId=" + greetingId);
            } else {
                request.setAttribute("errorMessage", "Không thể cập nhật lịch phỏng vấn. Vui lòng thử lại");
                request.getRequestDispatcher("job-greeting?action=viewDetailsGreeting&greetingId=" + greetingId).forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Đã xảy ra lỗi khi cập nhật lịch phỏng vấn: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet để quản lý thông tin phỏng vấn";
    }
}