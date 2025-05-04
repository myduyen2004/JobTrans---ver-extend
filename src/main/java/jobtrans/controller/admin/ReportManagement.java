package jobtrans.controller.admin;

import jobtrans.dal.AccountDAO;
import jobtrans.dal.GroupMemberDAO;
import jobtrans.dal.ReportDAO;
import jobtrans.model.Account;
import jobtrans.model.Criteria;
import jobtrans.model.GroupMember;
import jobtrans.model.Report;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ReportManagement", urlPatterns = {"/report-manage"})
public class ReportManagement extends HttpServlet {

    public static final int BUFFER_SIZE = 1024 * 1000;

    AccountDAO accountDAO = new AccountDAO();
    GroupMemberDAO groupMemberDAO = new GroupMemberDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action = req.getParameter("action");

            if (action == null) {
                action = "viewAllReports";
            }
            switch (action) {
                case "viewAllReports":
                    showReports(req, resp);
                    break;
                case "viewReportDetail":
//                    int id = Integer.parseInt(req.getParameter("reportId"));
                    showReportDetail(req, resp);
                    break;
                case "download":
                    downloadFile(req, resp);
                    break;
//                case "acceptReport":
//                    resolveReport(req, resp);
//                    break;
//                case "rejectReport":
//                    rejectReport(req, resp);
//                    break;
                case "banAccount":
                    banUser(req, resp);
                    break;
                case "saveNote":
                    saveNote(req, resp);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private void showReports(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            List<Report> reports = accountDAO.getReports();

            req.setAttribute("reports", reports);
            req.getRequestDispatcher("report-list.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("home");
        }
    }
    private void showReportDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String reportId = req.getParameter("reportId");
        ReportDAO reportDAO = new ReportDAO();
        Report report = reportDAO.getReportById(Integer.parseInt(reportId));
        req.setAttribute("report", report);
        req.getRequestDispatcher("/view-report-detail.jsp").forward(req, resp);

    }

//    private void showReportDetail(HttpServletRequest req, HttpServletResponse resp, int id) throws ServletException, IOException {
//        HttpSession session = req.getSession();
//        if (session.getAttribute("sessionAccount") != null) {
//            Account account = (Account) session.getAttribute("sessionAccount");
//            Account account1 = accountDAO.getAccountById(account.getAccountId());
//            Report report = accountDAO.getReportById(id);
//
//            req.setAttribute("report", report);
//            req.setAttribute("accountLogged", account1);
//            req.getRequestDispatcher("report-detail.jsp").forward(req, resp);
//        } else {
//            resp.sendRedirect("home");
//        }
//    }

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

//    private void resolveReport(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        HttpSession session = req.getSession();
//        if (session.getAttribute("sessionAccount") != null) {
//            int reportId = Integer.parseInt(req.getParameter("reportId"));
//            String noteAdimin = req.getParameter("noteAdimin");
//            Report report = accountDAO.getReportById(reportId);
//            report.setNoteByAdmin(noteAdimin);
//
//            Account reportedAccount = accountDAO.getAccountById(report.getReportedAccount());
//
//            Criteria criteria = accountDAO.getCriteriaById(report.getCriteriaId());
//
//            if (accountDAO.updateReportStatus(report.getReportId(), "Đã xử lí")) {
//                req.setAttribute("toastMessage", "Xử lí báo cáo thành công.");
//            } else {
//                req.setAttribute("toastMessage", "Xử lí báo cáo thất bại - có lỗi xảy ra!");
//                req.setAttribute("toastType", "error");
//            }
//
//            int count = reportedAccount.getCount();
//
//            if (accountDAO.updatePointAccount(reportedAccount.getAccountId(), criteria.getCriteriaPoint())) {
//                req.setAttribute("toastMessage", "Xử lí báo cáo thành công.");
//            } else {
//                req.setAttribute("toastMessage", "Cập nhật điểm thất bại.");
//                req.setAttribute("toastType", "error");
//            }
//
//            reportedAccount = accountDAO.getAccountById(report.getReportedAccount());
//
//            if (reportedAccount.getPoint() < 0) {
//                count += 1;
//                if (accountDAO.updateCountAccount(reportedAccount.getAccountId(), count)) {
//                    req.setAttribute("toastMessage", "Xử lí báo cáo thành công.");
//                } else {
//                    req.setAttribute("toastMessage", "Cập nhật số lần âm điểm thất bại.");
//                    req.setAttribute("toastType", "error");
//                }
//            }
//
//            report = accountDAO.getReportById(reportId);
//
//            Account account = (Account) session.getAttribute("sessionAccount");
//            Account account1 = accountDAO.getAccountById(account.getAccountId());
//            req.setAttribute("report", report);
//            req.setAttribute("accountLogged", account1);
//            req.getRequestDispatcher("report-detail.jsp").forward(req, resp);
//        } else {
//            resp.sendRedirect("home");
//        }
//    }

//    private void rejectReport(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        HttpSession session = req.getSession();
//        if (session.getAttribute("sessionAccount") != null) {
//            int reportId = Integer.parseInt(req.getParameter("reportId"));
//            Report report = accountDAO.getReportById(reportId);
//
//            Account account = (Account) session.getAttribute("sessionAccount");
//            Account account1 = accountDAO.getAccountById(account.getAccountId());
//            report = accountDAO.getReportById(reportId);
//
//            if (accountDAO.updateReportStatus(report.getReportId(), "Bị từ chối")) {
//                req.setAttribute("toastMessage", "Từ chối báo cáo thành công.");
//            } else {
//                req.setAttribute("toastMessage", "Từ chối báo cáo thất bại - có lỗi xảy ra!");
//                req.setAttribute("toastType", "error");
//            }
//
//            report = accountDAO.getReportById(reportId);
//
//            req.setAttribute("report", report);
//            req.setAttribute("accountLogged", account1);
//            req.getRequestDispatcher("report-detail.jsp").forward(req, resp);
//        } else {
//            resp.sendRedirect("home");
//        }
//    }

    private void banUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            int reportId = Integer.parseInt(req.getParameter("reportId"));
            Report report = accountDAO.getReportById(reportId);

            if (accountDAO.banAccount(report.getReportedAccount())) {
                req.setAttribute("toastMessage", "Khóa tài khoản thành công.");
            } else {
                req.setAttribute("toastMessage", "Khóa tài khoản thất bại - có lỗi xảy ra!");
                req.setAttribute("toastType", "error");
            }
            report = accountDAO.getReportById(reportId);

            Account account = (Account) session.getAttribute("sessionAccount");
            Account account1 = accountDAO.getAccountById(account.getAccountId());
            req.setAttribute("report", report);
            req.setAttribute("accountLogged", account1);
            req.getRequestDispatcher("report-detail.jsp").forward(req, resp);
        }
    }

    private void saveNote(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            int reportId = Integer.parseInt(req.getParameter("reportId"));
            Report report = accountDAO.getReportById(reportId);

            String note = req.getParameter("note");

            int criteriaId = report.getCriteriaId();
            Criteria criteria = accountDAO.getCriteriaById(criteriaId);

            int accountId = report.getReportedAccount();

            if (accountDAO.insertPointHistory(accountId, criteriaId, note)) {
                req.setAttribute("toastMessage", "Thêm ghi chú thành công.");
            } else {
                req.setAttribute("toastMessage", "Thêm ghi chú thất bại!");
                req.setAttribute("toastType", "error");
            }

            report = accountDAO.getReportById(reportId);

            Account account = (Account) session.getAttribute("sessionAccount");
            Account account1 = accountDAO.getAccountById(account.getAccountId());
            req.setAttribute("report", report);
            req.setAttribute("accountLogged", account1);
            req.getRequestDispatcher("report-detail.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String reportIdParam = request.getParameter("reportId");
        int reportId = Integer.parseInt(reportIdParam);
        Report report = accountDAO.getReportById(reportId);
        String action = request.getParameter("action"); // Đây là giá trị của button được nhấn
        if(action.equals("accept")){
            report.setStatus("Được xử lí");
        }else if(action.equals("reject")){
            report.setStatus("Bị từ chối");
        }
        String adminNote = request.getParameter("adminNote");
        report.setNoteByAdmin(adminNote);
        ReportDAO reportDAO = new ReportDAO();
        reportDAO.updateReport(report);
        if(report.getStatus() == "Đã xử lí") {
            Criteria criteria = accountDAO.getCriteriaById(report.getCriteriaId());
            int subtractpoint = criteria.getCriteriaPoint();
            Account reportedAccount = accountDAO.getAccountById(report.getReportedAccount());
            reportedAccount.setPoint(reportedAccount.getPoint() - subtractpoint);
            accountDAO.updateAccountById(reportedAccount);
            reportedAccount = accountDAO.getAccountById(report.getReportedAccount());
            if(reportedAccount.getPoint()<0) {
                reportedAccount.setCount(reportedAccount.getCount()+1);
                accountDAO.updateAccountById(reportedAccount);
            }
        }
        request.setAttribute("report", report);
        request.getRequestDispatcher("view-report-detail.jsp").forward(request, response);
    }
}
