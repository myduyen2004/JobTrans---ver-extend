package jobtrans.controller.admin;

import jobtrans.dal.AccountDAO;
import jobtrans.model.Account;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AccountManagement", urlPatterns = {"/acc-manage"})
public class AccountManagement extends HttpServlet {
    AccountDAO accountDAO = new AccountDAO();

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
            req.setAttribute("account", account);
            req.getRequestDispatcher("infor-user.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("home");
        }
    }
}