package jobtrans.controller.admin;

import jobtrans.dal.AccountDAO;
import jobtrans.dal.GroupMemberDAO;
import jobtrans.model.Account;
import jobtrans.model.Criteria;
import jobtrans.model.GroupMember;
import jobtrans.model.Report;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AdminManagement", urlPatterns = {"/admin-manage"})
public class AdminManagement extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action = req.getParameter("action");
            switch (action) {
                case "menu-management":
                    menuManage(req, resp);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private void menuManage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("admin-menu-manage.jsp").forward(req, resp);
    }

}