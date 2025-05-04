package jobtrans.controller.web.chat;

import jobtrans.dal.ConversationDAO;
import jobtrans.dal.MessageDAO;
import jobtrans.dal.StickerDAO;
import jobtrans.model.Conversation;
import jobtrans.model.Sticker;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/chat-app")
public class ChatServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null) {
            switch (action) {
                case "open-conversation":
                    try {
                        openConversation(req, resp);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    break;


            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
    public void openConversation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        Conversation conversation = new Conversation();
        ConversationDAO conversationDAO = new ConversationDAO();
        MessageDAO messageDAO = new MessageDAO();
        StickerDAO  stickerDAO = new StickerDAO();
        int jobId = Integer.parseInt(req.getParameter("jobId"));
        int conversationId = 0;
        if(conversationDAO.conversationExists(jobId)) {
            conversationId = conversationDAO.getConversationByJobId(jobId);
        }else{
            conversationId = conversationDAO.addConversation(jobId);
        }
        req.setAttribute("conversationId", conversationId);
        req.setAttribute("jobId", jobId);
        List<Sticker> stickerList = stickerDAO.getAllStickers();
//        HttpSession session = req.getSession();
//        session.setAttribute("conversationId", conversationId);
        req.setAttribute("stickerList", stickerList);
        req.getRequestDispatcher("chat.jsp").forward(req, resp);
    }
}
