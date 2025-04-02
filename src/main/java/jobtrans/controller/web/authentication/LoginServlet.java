package jobtrans.controller.web.authentication;

import jobtrans.controller.admin.AccountManagement;
import jobtrans.dal.AccountDAO;
import jobtrans.model.Account;
import jobtrans.model.GoogleAccount;
import jobtrans.utils.CookieUtils;
import jobtrans.utils.GoogleLogin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name="LoginServlet", urlPatterns={"/login"})

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        HttpSession session = request.getSession();

        // neu nguoi dung huy uy quyen
        if (error != null) {
            request.getRequestDispatcher("loginAndRegister.jsp").forward(request, response);
        }
        GoogleLogin gg = new GoogleLogin();
        String accessToken = gg.getToken(code);
        GoogleAccount acc = gg.getUserInfo(accessToken);
        // check tk da dky chua
        String email = acc.getEmail();
        String userName = acc.getName();
        String avatar = acc.getPicture();
        AccountDAO accountDAO = new AccountDAO();

        Account account = new Account();
        if (accountDAO.checkExistEmail(email)) {
            account = accountDAO.getAccountByEmail(email);
            session.setAttribute("accountId", account.getAccountId());
            session.setAttribute("account", email);
            session.setAttribute("userName", account.getAccountName());
            session.setAttribute("email", account.getEmail());
            session.setAttribute("avatarUrl", account.getAvatar());
            session.setAttribute("role",account.getRole());
            response.sendRedirect("index.jsp");
        }else{
            account =new Account(userName,email,avatar,"true","Google",code);
            account.setPoint(0);
            accountDAO.addUserByLoginGoogle(account);
            request.setAttribute("home", "home");
            session.setAttribute("accountId", account.getAccountId());
            session.setAttribute("account", email);
            session.setAttribute("userName", account.getAccountName());
            session.setAttribute("email", account.getEmail());
            session.setAttribute("avatarUrl", account.getAvatar());
            session.setAttribute("point", account.getPoint());
            session.setAttribute("role",account.getRole());
            response.sendRedirect("index.jsp");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String mail = request.getParameter("emailaddress");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        response.getWriter().print(mail);

        AccountDAO accountDAO = new AccountDAO();
        // In mail và password ra console
        System.out.println("Email: " + mail);
        System.out.println("Password (raw): " + password); // Chỉ in password raw trong quá trình debug, không nên trong production
        Account account = accountDAO.checkLogin(mail, password);
        if (account != null && account.getAccountId() != 0 && account.getEmail() != null) {
            if (request.getParameter("remember") != null) {
                String remember = request.getParameter("remember");
                CookieUtils.add("cookemail", mail, 15, response);
                CookieUtils.add("cookpass", password, 15, response);
                CookieUtils.add("cookrem", remember, 15, response);
            }
            session.setAttribute("account", mail);
            request.setAttribute("home", "home");
            Account acc = accountDAO.getAccountByEmail(mail);
            session.setAttribute("userId", acc.getAccountId());
            System.out.println(acc.getAccountId()+acc.getAccountName());
            session.setAttribute("userName", acc.getAccountName());
            session.setAttribute("email", acc.getEmail());
            session.setAttribute("avatarUrl", acc.getAvatar());
            session.setAttribute("role", acc.getRole());
            session.setAttribute("point", acc.getPoint());
            request.setAttribute("success", "Đăng nhập thành công!");
            request.getRequestDispatcher("index.jsp").forward(request, response);

        }else{
            request.setAttribute("error", "Đăng nhập thất bại!");
            request.getRequestDispatcher("authentication/loginAndRegister.jsp").forward(request, response);
        }
    }

}
