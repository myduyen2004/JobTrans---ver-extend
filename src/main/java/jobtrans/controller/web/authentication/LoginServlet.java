package jobtrans.controller.web.authentication;

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
import java.io.PrintWriter;


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
        if (error != null) {
            request.getRequestDispatcher("login-and-register.jsp").forward(request, response);
        }
        GoogleLogin gg = new GoogleLogin();
        String accessToken = gg.getToken(code);
        GoogleAccount acc = gg.getUserInfo(accessToken);
        // check tk da dky chua
        String email = acc.getEmail();
        String accountName = acc.getName();
        String avatar = acc.getPicture();
        AccountDAO accountDAO = new AccountDAO();

        Account account = new Account();
        if (accountDAO.getAccountByEmail(email) != null) {
            account = accountDAO.getAccountByEmail(email);
            session.setAttribute("sessionAccount", account);
            response.sendRedirect("home");
        }else{
            account.setEmail(email);
            account.setAccountName(accountName);
            account.setAvatar(avatar);
            account.setOauthProvider("Google");
            account.setOauthId(code);

            if(accountDAO.addAccountWithGoogle(account) != 0) {
                account = accountDAO.getAccountByEmail(email);
                session.setAttribute("sessionAccount", account);
                if (account.getTypeAccount() == null) {
                    response.sendRedirect("type");
                } else {
                    response.sendRedirect("home");
                }
            }else{
                request.setAttribute("toastType", "error");
                request.setAttribute("toastTitle", "Có lỗi xảy ra");
                request.setAttribute("toastMessage", "Có lỗi xảy ra trong quá trình đăng nhập, vui lòng thử lại");
                request.getRequestDispatcher("login.jsp").forward(request, response);

            }
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        // Lấy dữ liệu từ form
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean rememberMe = "on".equals(request.getParameter("remember"));
        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.checkLogin(email, password);
        if (account != null) {
            if (rememberMe) {
                String remember = request.getParameter("remember");
                CookieUtils.add("cookemail", email, 15, response);
                CookieUtils.add("cookpass", password, 15, response);
                CookieUtils.add("cookrem", remember, 15, response);
            }
            // Đăng nhập thành công, lưu thông tin người dùng vào session
            session.setAttribute("sessionAccount", account);
            // Chuyển hướng đến trang chính sau khi đăng nhập thành công
            response.sendRedirect("home");
        } else {
            // Đăng nhập thất bại, quay lại trang đăng nhập và hiển thị thông báo lỗi
            request.setAttribute("toastType", "error");
            request.setAttribute("toastTitle", "Có lỗi xảy ra");
            request.setAttribute("toastMessage", "Có lỗi xảy ra trong quá trình đăng nhập, vui lòng thử lại");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}
