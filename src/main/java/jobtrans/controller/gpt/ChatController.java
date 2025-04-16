package jobtrans.controller.gpt;

import com.google.gson.Gson;
import jobtrans.service.OpenAIService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name="ChatController", urlPatterns={"/chat"})
public class ChatController extends HttpServlet {
    private OpenAIService openAIService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.openAIService = new OpenAIService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");

        String userMessage = sanitizeInput(request.getParameter("message"));
        String gptResponse;

        try {
            gptResponse = openAIService.getChatResponse(userMessage);
        } catch (IOException e) {
            gptResponse = "Lỗi kết nối với dịch vụ AI: " + e.getMessage();
        }

        System.out.println("kết quả là: " + gptResponse);

        // Tạo response JSON
        Map<String, String> responseMap = new HashMap<>();
        responseMap.put("response", gptResponse);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(new Gson().toJson(responseMap));
        out.flush();
    }

    private String sanitizeInput(String input) {
        if (input == null) return "";
        return input.replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("<", "&lt;")
                .replace(">", "&gt;");
    }
}