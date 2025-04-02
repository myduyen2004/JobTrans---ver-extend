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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
            String role = request.getParameter("account-type-radio");
            String status = "true";
            Account account = new Account();
            account.setAccountName(accountName);
            account.setEmail(email);
            account.setPassword(password);
            account.setRole(role);
            account.setStatus(status);
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
                    request.getRequestDispatcher("authentication/loginAndRegister.jsp").forward(request, response);
            }
        }
        else if(cmd.equals("2")){
            String emailReceive = request.getParameter("email");
            String otp = request.getParameter("otp1")+request.getParameter("otp2")+request.getParameter("otp3")+request.getParameter("otp4")
                    +request.getParameter("otp5")+request.getParameter("otp6");
            String code = (String) mySession.getAttribute(emailReceive);
            Account account1 = (Account) mySession.getAttribute("account");

            if (otp.equals(code)) {
                acd.addUserByRegister(account1);
                System.out.println(account1.toString());
                request.setAttribute("home", "home");
                mySession.setAttribute("accountId", account1.getAccountId());
                mySession.setAttribute("account", account1.getEmail());
                mySession.setAttribute("userName", account1.getAccountName());
                mySession.setAttribute("email", account1.getEmail());
                mySession.setAttribute("avatarUrl", account1.getAvatar());
                mySession.setAttribute("point", account1.getPoint());
                mySession.setAttribute("role",account1.getRole());
                request.setAttribute("success", "Thành công! Hãy đăng nhập để tiếp tục");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Xác minh mã OTP thất bại! Vui lòng thử lại");
                request.getRequestDispatcher("authentication/loginAndRegister.jsp").forward(request, response);
            }
        }
    }
}
