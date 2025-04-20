package jobtrans.controller.admin;

import jobtrans.dal.AccountDAO;
import jobtrans.dal.GroupMemberDAO;
import jobtrans.model.Account;
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

@WebServlet(name = "AccountManagement", urlPatterns = {"/acc-manage"})
public class AccountManagement extends HttpServlet {

    public static final int BUFFER_SIZE = 1024 * 1000;

    AccountDAO accountDAO = new AccountDAO();
    GroupMemberDAO groupMemberDAO = new GroupMemberDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action = req.getParameter("action");

            if (action == null) {
                action = "viewAllUser";
            }
            switch (action) {
                case "viewAllUser":
                    viewAllUser(req, resp);
                    break;
                case "viewAccountDetails":
                    showAccount(req, resp);
                    break;
                case "viewAllReports":
                    showReports(req, resp);
                    break;
                case "viewReportDetail":
                    showReportDetail(req, resp);
                    break;
                case "download":
                    downloadFile(req, resp);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void viewAllUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            List<Account> list = accountDAO.getAllUserAccounts();
            req.setAttribute("list", list);
            req.getRequestDispatcher("user-manage.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("home");
        }
    }

    private void showAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            int id = Integer.parseInt(req.getParameter("accId"));
            Account account = accountDAO.getAccountById(id);
            List<GroupMember> members = null;
            try {
                members = groupMemberDAO.getMembersByAccountId(id);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            req.setAttribute("memberList", members);
            req.setAttribute("account", account);
            req.getRequestDispatcher("infor-account-manage.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("home");
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
        HttpSession session = req.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            int id = Integer.parseInt(req.getParameter("reportId"));
            Account account = (Account) session.getAttribute("sessionAccount");
            Account account1 = accountDAO.getAccountById(account.getAccountId());
            Report report = accountDAO.getReportById(id);

            req.setAttribute("report", report);
            req.setAttribute("accountLogged", account1);
            req.getRequestDispatcher("report-detail.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("home");
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
        }else {
            resp.sendRedirect("home");
        }
    }
}