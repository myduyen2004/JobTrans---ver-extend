package jobtrans.config;

import jobtrans.dal.ApiDAO;

import java.sql.SQLException;

public class ApiConfig {
    int ac = 1;
    // Thay thế cấu hình OpenAI bằng OpenRouter
//    public static final String OPENROUTER_API_KEY = System.getProperty("OPENROUTER_API_KEY") != null ?
//            System.getProperty("OPENROUTER_API_KEY") : System.getenv("OPENROUTER_API_KEY");
    public static final String OPENROUTER_API_KEY = "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";

//    static {
//        try {
//            OPENROUTER_API_KEY = getOpenRouterApiKey();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }

    public static final String OPENROUTER_API_URL = "https://openrouter.ai/api/v1/chat/completions";

    // Các model phổ biến trên OpenRouter (chọn 1 trong các model dưới)
    public static final String OPENROUTER_MODEL = "openchat/openchat-7b"; // Miễn phí

    // Hoặc các model khác:
    // public static final String OPENROUTER_MODEL = "anthropic/claude-2";
    // public static final String OPENROUTER_MODEL = "google/palm-2-chat-bison";
    // public static final String OPENROUTER_MODEL = "meta-llama/llama-2-70b-chat";
    // Thông tin bổ sung cần thiết cho OpenRouter

    public static final String APPLICATION_URL = "http://localhost:8080"; // Thay bằng URL thật của bạn
    public static final String APPLICATION_NAME = "JobTrans"; // Thay bằng tên ứng dụng của bạn
    public static String getOpenRouterApiKey() throws SQLException {
        int accountId=1;
        ApiDAO dao = new ApiDAO();
        return dao.getApiKeyByAccountId(accountId);
    }
}