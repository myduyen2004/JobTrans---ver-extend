package jobtrans.controller.admin;

import jdk.jfr.Category;
import jobtrans.dal.AccountDAO;
import jobtrans.dal.GroupMemberDAO;
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
                case "download":
                    downloadFile(req, resp);
                    break;
                case "viewAccountReport":
                    showAccountReport(req, resp);
                    break;
                case "unbanUser":
                    unbanUser(req, resp);
                    viewAllUser(req, resp);
                    break;
                case "banUser":
                    banUser(req,resp);
                    viewAllUser(req, resp);
                    break;
                case "unbanUserFromDetail":
                    unbanUser(req, resp);
                    showAccount(req, resp);
                    break;
                case "banUserFromDetail":
                    banUser(req,resp);
                    showAccount(req, resp);
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
            int numBanned = accountDAO.getNumUserByStatus("Bị cấm");
            int numActive = accountDAO.getNumUserByStatus("Đang hoạt động");
            int numPrivate = accountDAO.getNumUserByTypeAccount("Cá nhân");
            int numGroup = accountDAO.getNumUserByTypeAccount("Nhóm");
            req.setAttribute("numBanned", numBanned);
            req.setAttribute("numActive", numActive);
            req.setAttribute("numPrivate", numPrivate);
            req.setAttribute("numGroup", numGroup);
            req.getRequestDispatcher("admin-user-list-manage.jsp").forward(req, resp);
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

    //View report from Account page
    private void showAccountReport(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            int accId = Integer.parseInt(req.getParameter("accId"));
            Account account1 = accountDAO.getAccountById(accId);
            //Danh sách bị tố cáo
            List<Report> reportedList = accountDAO.getReportByreportedAccount(account1.getAccountId());

            //Danh sách tố cáo
            List<Report> reportList = accountDAO.getReportByreportBy(account1.getAccountId());

            req.setAttribute("reportedList", reportedList);
            req.setAttribute("reportList", reportList);
            req.setAttribute("accountLogged", account1);

            req.getRequestDispatcher("account-report-list.jsp").forward(req, resp);
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
        } else {
            resp.sendRedirect("home");
        }
    }

    private void unbanUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            int accId = Integer.parseInt(req.getParameter("accId"));
            accountDAO.unbanAccount(accId);
        }else {
            resp.sendRedirect("home");
        }
    }

    private void banUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("sessionAccount") != null) {
            int accId = Integer.parseInt(req.getParameter("accId"));
            accountDAO.banAccount(accId);
        }else{
            resp.sendRedirect("home");
        }
    }
}