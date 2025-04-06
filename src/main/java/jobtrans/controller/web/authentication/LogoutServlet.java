package jobtrans.controller.web.authentication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name="LogoutServlet", urlPatterns={"/logout"})

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        CookieUtils.add("cookuser", null, 0, response);
//        CookieUtils.add("cookpass", null, 0, response);
//        CookieUtils.add("cookrem", null, 0, response);
        HttpSession session = request.getSession();
        session.removeAttribute("account");
        session.invalidate();
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
