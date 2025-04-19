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
        // Thiết lập timeout
        session.setMaxIdleTimeout(300000); // 5 phút
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        try {
            if (message == null || message.trim().isEmpty()) {
                session.getBasicRemote().sendText("Tin nhắn không được để trống");
                return;
            }

            System.out.println("Nhận message qua WebSocket: " + message);
            String response = openAIService.getChatResponse(message);
            System.out.println("Phản hồi từ AI: " + response);

            // Đảm bảo response không null
            if (response == null) {
                response = "Không nhận được phản hồi từ AI";
            }

            session.getBasicRemote().sendText(response);
        } catch (Exception e) {
            System.err.println("Lỗi khi xử lý WebSocket message: " + e.getMessage());
            session.getBasicRemote().sendText("Lỗi khi xử lý yêu cầu: " + e.getMessage());
        }
    }

    @OnClose
    public void onClose(Session session) {
        System.out.println("WebSocket closed: " + session.getId());
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.err.println("WebSocket error: " + throwable.getMessage());
        try {
            if (session.isOpen()) {
                session.close(new CloseReason(CloseReason.CloseCodes.UNEXPECTED_CONDITION, "Lỗi server"));
            }
        } catch (IOException e) {
            System.err.println("Lỗi khi đóng session: " + e.getMessage());
        }
    }
}