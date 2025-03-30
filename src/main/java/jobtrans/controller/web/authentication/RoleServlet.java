package jobtrans.controller.web.authentication;

import jobtrans.dal.AccountDAO;
import jobtrans.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name="RoleServlet", urlPatterns={"/role"})

public class RoleServlet extends HttpServlet {


    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String role = request.getParameter("role");
        String email = request.getParameter("email");
        AccountDAO accountDao = new AccountDAO();
        accountDao.updateRole(role, email);
        HttpSession session = request.getSession();

        Account account = accountDao.getAccountByEmail(email);
        session.setAttribute("account", email);
        session.setAttribute("accountName", account.getAccountName());
        session.setAttribute("email", account.getEmail());
        session.setAttribute("avatarUrl", account.getAvatar());
        session.setAttribute("oauthId", account.getOauthId());
        session.setAttribute("role", account.getRole());
        response.sendRedirect("index.jsp");
    }
}
