package jobtrans.controller.web.authentication;

import jobtrans.dal.AccountDAO;
import jobtrans.model.Account;
import jobtrans.utils.Gmail;
import jobtrans.utils.PasswordEncoder;
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

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

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
        // Đặt encoding để xử lý tiếng Việt
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        String cmd = request.getParameter("cmd");
            try {
                // Lấy dữ liệu từ form đăng ký
                String accountType = request.getParameter("accountType");
                if(accountType.equals("personal")) {
                    accountType = "Cá nhân";
                } else if (accountType.equals("group")) {
                    accountType = "Nhóm";
                }
                String accountName = request.getParameter("accountName");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String confirmPassword = request.getParameter("confirmPassword");
                String termsAccepted = request.getParameter("terms");

                // Kiểm tra xem email đã tồn tại trong hệ thống chưa
                AccountDAO accountDAO = new AccountDAO();
                if (accountDAO.getAccountByEmail(email) != null) {
                    request.setAttribute("toastType", "error");
                    request.setAttribute("toastTitle", "Xảy ra lỗi");
                    request.setAttribute("toastMessage", "Email đã được đăng kí");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                    return;
                }
                // Mã hóa mật khẩu (nên sử dụng thư viện mã hóa an toàn như BCrypt)
                String hashedPassword = PasswordEncoder.encode(password);

                // Tạo đối tượng Account mới
                Account account = new Account();
                account.setEmail(email);
                account.setAccountName(accountName);
                account.setPassword(hashedPassword);
                account.setTypeAccount(accountType);

                session.setAttribute("sessionAccount", account);
                request.setAttribute("toastTitle", "Vui lòng xác thực mã OTP");
                request.setAttribute("toastMessage", "Mã OTP đã gửi về gmail cho bạn, vui lòng nhập mã OTP để xác nhận");
                String otpvalue = RandomGenerator.randString(RandomGenerator.NUMERIC_CHARACTER, 6);
                new Thread(() -> {
                    sendVerificationMail(accountName, "Xác thực đăng kí", email, otpvalue);
                }).start();
                session.setAttribute("otp", otpvalue);
                request.getRequestDispatcher("otp-verify.jsp").forward(request, response);
            } catch (Exception e) {
                // Xử lý ngoại lệ
                request.setAttribute("toastType", "error");
                request.setAttribute("toastTitle", "Xảy ra lỗi");
                request.setAttribute("toastMessage", "Lỗi hệ thống: " + e.getMessage());
                response.sendRedirect("register.jsp");
                return;
            }

    }
}
