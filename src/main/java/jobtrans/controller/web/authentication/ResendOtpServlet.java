package jobtrans.controller.web.authentication;

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

@WebServlet("/resend-otp")
public class ResendOtpServlet extends HttpServlet {
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.removeAttribute("otp");
        String email = request.getParameter("email");
        Account account = (Account) session.getAttribute("sessionAccount");
        String otpvalue = RandomGenerator.randString(RandomGenerator.NUMERIC_CHARACTER, 6);
        new Thread(() -> {
            sendVerificationMail(account.getAccountName(), "Xác thực đăng kí", email, otpvalue);
        }).start();
        session.setAttribute("otp", otpvalue);
        request.getRequestDispatcher("otp-verify.jsp").forward(request, response);

    }
}