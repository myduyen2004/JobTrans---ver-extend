package jobtrans.controller.web.authentication;

import jobtrans.dal.AccountDAO;
import jobtrans.model.Account;
import jobtrans.utils.Gmail;
import jobtrans.utils.RandomGenerator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name="RegisterServlet", urlPatterns={"/register"})

public class RegisterServlet extends HttpServlet {
    Account account = new Account();
    AccountDAO acd = new AccountDAO();
    private void sendVerificationMail(String userName, String subject, String email, String code) {

        try {
            new Gmail(email)
                    .setContentType("text/html; charset=UTF-8")
                    .setSubject(subject)
                    .initMacro()
                    .appendMacro("NAME", userName)
                    .appendMacro("CODE", code)
                    .sendTemplate(new URL("http://localhost:8080/JobTrans/mail-noti/verify-account.jsp"));
        } catch (MalformedURLException ex) {
            Logger.getLogger(ForgotPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cmd = request.getParameter("cmd");
        HttpSession mySession = request.getSession();
        if (cmd.equals("1")) {
            String accountName = request.getParameter("accountName");
            String email = request.getParameter("email-register");
            String password = request.getParameter("password-register");
            String type = request.getParameter("account-type-radio");
//            String status = "true";
            Account account = new Account();
            account.setAccountName(accountName);
            account.setEmail(email);
            account.setPassword(password);
            account.setType(type);
//            account.setStatus(status);
            account.setPoint(0);
            if (acd.checkExistEmail(email) == false) {
                String otpvalue = RandomGenerator.randString(RandomGenerator.NUMERIC_CHARACTER, 6);
                new Thread(() -> {
                    sendVerificationMail(accountName, "Xác thực đăng kí", email, otpvalue);
                }).start();
                request.setAttribute("email", email);
                request.setAttribute("success", "Vui lòng kiểm tra email để xác nhận đăng kí!");
                mySession.setAttribute(email, otpvalue);
                mySession.setAttribute("account", account);
                request.setCharacterEncoding("UTF-8");
                request.getRequestDispatcher("verify-otp-1.jsp").forward(request, response);
            } else {

                    request.setAttribute("error", "Email đã được đăng kí. Thất bại");//lỗi js
                    request.getRequestDispatcher("login-and-register.jsp").forward(request, response);
            }
        } else if(cmd.equals("2")){
            String emailReceive = request.getParameter("email");
            String otp = request.getParameter("otp1")+request.getParameter("otp2")+request.getParameter("otp3")+request.getParameter("otp4")
                    +request.getParameter("otp5")+request.getParameter("otp6");
            String code = (String) mySession.getAttribute(emailReceive);
            Account account1 = (Account) mySession.getAttribute("account");
            account1.setAvatar("img/avatar-default.jpg");

            if (otp.equals(code)) {
                acd.addUserByRegister(account1);
                HttpSession session = request.getSession();
                session.setAttribute("sessionAccount", account1);
//                Account account = (Account) session.getAttribute("sessionAccount");

                response.sendRedirect("home");
            } else {
                request.setAttribute("error", "Xác minh mã OTP thất bại! Vui lòng nhập lại");
                request.getRequestDispatcher("login-and-register.jsp").forward(request, response);
            }
        }
    }
}
