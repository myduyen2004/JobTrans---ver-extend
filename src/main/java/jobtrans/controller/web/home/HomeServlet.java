package jobtrans.controller.web.home;

import jobtrans.dal.AccountDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name="HomeServlet", urlPatterns={"/home"})

public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            if (action == null) {
                action = "home"; // Default action to list products
            }
            switch (action) {
                case "home":
//                    response.getWriter().print("Ủa");
                    homePage(request, response);
                    break;
                case "top4":
                    top4Page(request, response);
                    break;
                case "top100":
                    top100Page(request, response);
                    break;
                case "search":
                case "logout":

            }
        } catch (Exception ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void homePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    private void top4Page(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO accountDAO = new AccountDAO();
        request.setAttribute("top4", accountDAO.getTop4AccountByPoint());
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    private void top100Page(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO accountDAO = new AccountDAO();
        request.setAttribute("top100", accountDAO.getTop100AccountByPoint());
        request.getRequestDispatcher("top100.jsp").forward(request, response);
    }

}
