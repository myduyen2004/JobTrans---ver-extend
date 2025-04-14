package jobtrans.controller.gpt;



import jobtrans.service.OpenAIService;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;


@ServerEndpoint("/chatws")
public class ChatWebSocket {
    private OpenAIService openAIService = new OpenAIService();

    @OnOpen
    public void onOpen(Session session) {
        System.out.println("WebSocket opened: " + session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        try {
            String response = openAIService.getChatResponse(message);
            session.getBasicRemote().sendText(response);
        } catch (IOException e) {
            session.getBasicRemote().sendText("Lỗi kết nối với dịch vụ AI: " + e.getMessage());
        }
    }

    @OnClose
    public void onClose(Session session) {
        System.out.println("WebSocket closed: " + session.getId());
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.err.println("WebSocket error: " + throwable.getMessage());
    }
}