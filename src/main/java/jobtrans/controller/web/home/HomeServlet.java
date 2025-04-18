package jobtrans.controller.web.home;

import jobtrans.dal.AccountDAO;
import jobtrans.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
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
                    homePage(request, response);
                    break;
                case "top100":
                    top100(request, response);
                    break;

            }
        } catch (Exception ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void homePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void top100(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            // Lấy danh sách top 100 tài khoản có điểm cao nhất
            AccountDAO accountDAO = new AccountDAO();
            List<Account> top100Accounts = accountDAO.getTop100ByPoints();

            // Đặt danh sách vào thuộc tính của request để JSP có thể truy cập
            request.setAttribute("top100", top100Accounts);

            // Chuyển hướng đến trang JSP để hiển thị
            request.getRequestDispatcher("top100.jsp").forward(request, response);

        } catch (Exception e) {
            // Xử lý lỗi
            System.out.println("Error in Top100FreelanceServlet: " + e.getMessage());
            e.printStackTrace();
            // Chuyển hướng đến trang lỗi hoặc hiển thị thông báo lỗi
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi tải danh sách top 100 freelancer");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }


}
