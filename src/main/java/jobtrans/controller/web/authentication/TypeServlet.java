package jobtrans.controller.web.authentication;

import jobtrans.controller.web.home.HomeServlet;
import jobtrans.dal.AccountDAO;
import jobtrans.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name="RoleServlet", urlPatterns={"/type"})

public class TypeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action = req.getParameter("action");
            if (action == null) {
                action = "choose-form"; // Default action to list products
            }
            switch (action) {
                case "choose-form":
                    chooseRoleForm(req, resp);
                    break;
                case "choose":
                    doPost(req, resp);
                    break;

            }
        } catch (Exception ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void chooseRoleForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        req.getRequestDispatcher("choose-role-form.jsp").forward(req, resp);
    }
    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        String type = request.getParameter("type");
        AccountDAO accountDao = new AccountDAO();
        account.setTypeAccount(type);

        if(accountDao.updateTypeAccount(account)){
            account = accountDao.getAccountByEmail(account.getEmail());
            session.setAttribute("sessionAccount", account);
            response.sendRedirect("home");
        }else{
            response.sendRedirect("home");
        }

    }
}
