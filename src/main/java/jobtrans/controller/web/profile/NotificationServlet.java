package jobtrans.controller.web.profile;

import jobtrans.dal.NotificationDAO;
import jobtrans.model.Account;
import jobtrans.model.Notification;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NotificationServlet", urlPatterns = {"/notification"})
@MultipartConfig

public class NotificationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "notification":
                viewNotification(request,response);
                break;
            default:
                response.sendRedirect("infor-account.jsp"); // Trang lỗi nếu action không hợp lệ
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        NotificationDAO notificationDAO = new NotificationDAO();
        Account account = (Account) session.getAttribute("sessionAccount");
        List<Notification> notificationList = null;
        if (action.equals("mark-all-notifications")) {
            notificationDAO.updateListNotiUnreadByAccount(account.getAccountId());
            notificationList = notificationDAO.getNotificationByAccountId(account.getAccountId());
        } else if (action.equals("mark-notification")) {
            String notificationId = req.getParameter("notificationId");
            notificationDAO.updateNotiUnreadById(Integer.parseInt(notificationId));
            notificationList = notificationDAO.getNotificationByAccountId(account.getAccountId());
        }
        req.setAttribute("notificationList", notificationList);
        resp.sendRedirect("notification?action=notification");
    }

    private void viewNotification(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account sessionAccount = (Account) session.getAttribute("sessionAccount");
        NotificationDAO notificationDAO = new NotificationDAO();
        List<Notification> notificationList = notificationDAO.getNotificationByAccountId(sessionAccount.getAccountId());
        request.setAttribute("notificationList", notificationList);
        request.getRequestDispatcher("notification-list.jsp").forward(request, response);
    }

}
