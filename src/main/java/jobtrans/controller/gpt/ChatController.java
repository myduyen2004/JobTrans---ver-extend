package jobtrans.controller.gpt;

import com.google.gson.Gson;
import jobtrans.controller.web.home.HomeServlet;
import jobtrans.dal.ApiDAO;
import jobtrans.model.Account;
import jobtrans.service.OpenAIService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name="ChatController", urlPatterns={"/chat"})

public class ChatController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            if (action == null) {
                action = "home"; // Default action to list products
            }
            switch (action) {
                case "saveKey":
                    saveKey(request, response);
                    break;

            }

        } catch (Exception ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private void saveKey(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
//        Account account = (Account) session.getAttribute("sessionAccount");
        int ac = 1;
        String openRouterApiKey = request.getParameter("apiKey");
        try {
            ApiDAO apiDAO = new ApiDAO();
            apiDAO.saveApiKey(ac,openRouterApiKey);
            response.getWriter().write("API key đã được lưu thành công!");
            System.out.println(openRouterApiKey);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Lỗi khi lưu API key: " + e.getMessage());
        }
    }



}