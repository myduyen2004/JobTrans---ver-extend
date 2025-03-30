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

import static jobtrans.dal.AccountDAO.getMd5;

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
            account =new Account(userName,email,"/img/anhcv/OIP.jpg","true","Google",code);

            accountDAO.addUserByLoginGoogle(account);
            session.setAttribute("accountId", account.getAccountId());
            session.setAttribute("account", email);
            session.setAttribute("userName", account.getAccountName());
            session.setAttribute("email", account.getEmail());
            session.setAttribute("avatarUrl", account.getAvatar());
            response.sendRedirect("index.jsp");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String mail = request.getParameter("emailaddress");
        String password = request.getParameter("password");
        String hashedPassword = getMd5(password);
        HttpSession session = request.getSession();
        response.getWriter().print(mail);

        AccountDAO accountDAO = new AccountDAO();
        // In mail và password ra console
        System.out.println("Email: " + mail);
        System.out.println("Password (raw): " + password); // Chỉ in password raw trong quá trình debug, không nên trong production
        System.out.println("Password (hashed): " + hashedPassword);
        Account account = accountDAO.checkLogin(mail, password);
        System.out.println(account);
        if (account != null && account.getAccountId() != 0 && account.getEmail() != null) {
            if (request.getParameter("remember") != null) {
                String remember = request.getParameter("remember");
                CookieUtils.add("cookemail", mail, 15, response);
                CookieUtils.add("cookpass", password, 15, response);
                CookieUtils.add("cookrem", remember, 15, response);
            }
            session.setAttribute("account", mail);
            Account acc = accountDAO.getAccountByEmail(mail);
            session.setAttribute("userId", acc.getAccountId());
            System.out.println(acc.getAccountId()+acc.getAccountName());
            session.setAttribute("userName", acc.getAccountName());
            session.setAttribute("email", acc.getEmail());
            session.setAttribute("avatarUrl", acc.getAvatar());
            session.setAttribute("role", acc.getRole());
            request.setAttribute("success", "Đăng nhập thành công!");
            response.sendRedirect("index.jsp");

        }else{

            request.setAttribute("error", "Đăng nhập thất bại!");
            System.out.println("hehe");
            request.getRequestDispatcher("authentication/loginAndRegister.jsp").forward(request, response);
        }
    }

}
