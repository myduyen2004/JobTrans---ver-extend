package jobtrans.config;

public class ApiConfig {
    // Thay thế cấu hình OpenAI bằng OpenRouter
    public static final String OPENROUTER_API_KEY = System.getProperty("OPENROUTER_API_KEY") != null ?
            System.getProperty("OPENROUTER_API_KEY") : System.getenv("OPENROUTER_API_KEY");

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
}

