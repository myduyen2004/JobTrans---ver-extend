package jobtrans.controller.web.authentication;


import jobtrans.dal.AccountDAO;
import jobtrans.model.Account;
import jobtrans.utils.RandomGenerator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/verify-otp")
public class OtpVerificationServlet extends HttpServlet {

    private static final long OTP_VALID_DURATION = 5 * 60 * 1000; // 5 phút

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        String otp = request.getParameter("otp1") + request.getParameter("otp2") + request.getParameter("otp3") + request.getParameter("otp4")
                + request.getParameter("otp5") + request.getParameter("otp6");
        String code = session.getAttribute("otp").toString();
        AccountDAO accountDAO = new AccountDAO();
        if (otp.equals(code)) {
            accountDAO.addAccountBasic(account);
            session.removeAttribute("otp");
            session.setAttribute("sessionAccount", accountDAO.getAccountByEmail(account.getEmail()));
            response.sendRedirect("home");
        }else{
            request.setAttribute("toastType", "error");
            request.setAttribute("toastTitle", "Sai mã OTP");
            request.setAttribute("toastMessage", "Mã OTP sai, vui lòng thử lại");
            request.getRequestDispatcher("otp-verify.jsp").forward(request, response);
        }
    }
}