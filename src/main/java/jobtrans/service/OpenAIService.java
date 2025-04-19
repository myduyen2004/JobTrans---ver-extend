package jobtrans.service;

import jobtrans.config.ApiConfig;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;

public class OpenAIService {
    private static final int MAX_RETRIES = 3;
    private static final int BASE_RETRY_DELAY_MS = 2000;
    private static final int TIMEOUT_MS = 20000;
    private static long lastRequestTime = 0;
    private static final int MIN_REQUEST_INTERVAL_MS = 3000; // Tối thiểu 1 giây giữa các request

    public String getChatResponse(String prompt) throws IOException {
        enforceRateLimit();

        for (int i = 0; i < MAX_RETRIES; i++) {
            HttpURLConnection connection = null;
            try {
                // Tạo connection tới OpenRouter
                URL url = new URL(ApiConfig.OPENROUTER_API_URL);
                connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("POST");

                // Các headers bắt buộc cho OpenRouter
                connection.setRequestProperty("Authorization", "Bearer " + ApiConfig.OPENROUTER_API_KEY);
                connection.setRequestProperty("Content-Type", "application/json");
                connection.setRequestProperty("HTTP-Referer", ApiConfig.APPLICATION_URL);
                connection.setRequestProperty("X-Title", ApiConfig.APPLICATION_NAME);

                connection.setConnectTimeout(TIMEOUT_MS);
                connection.setReadTimeout(TIMEOUT_MS);
                connection.setDoOutput(true);

                // Tạo request body cho OpenRouter
                JSONObject requestBody = createRequestBody(prompt);

                // Gửi request
                try (OutputStream os = connection.getOutputStream()) {
                    os.write(requestBody.toString().getBytes(StandardCharsets.UTF_8));
                }

                // Xử lý response
                int responseCode = connection.getResponseCode();
                if (responseCode == HttpURLConnection.HTTP_OK) {
                    String response = readResponse(connection);
                    return parseOpenRouterResponse(response);
                } else if (responseCode == 429) {
                    String retryResult = handleRateLimitError(connection, i);
                    if (retryResult.isEmpty()) {
                        continue;
                    } else {
                        return retryResult;
                    }
                } else {
                    return handleApiError(connection);
                }
            } catch (Exception e) {
                if (i == MAX_RETRIES - 1) {
                    return "Lỗi hệ thống: " + e.getMessage();
                }
            } finally {
                if (connection != null) {
                    connection.disconnect();
                }
            }

            // Exponential backoff
            try {
                long delay = (long) (BASE_RETRY_DELAY_MS * Math.pow(2, i));
                Thread.sleep(delay);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                return "Yêu cầu bị gián đoạn";
            }
        }
        return "Không thể kết nối tới OpenRouter sau nhiều lần thử";
    }
    private String parseOpenRouterResponse(String jsonResponse) {
        try {
            JSONObject jsonObject = new JSONObject(jsonResponse);
            if (jsonObject.has("choices") && jsonObject.getJSONArray("choices").length() > 0) {
                // OpenRouter có cấu trúc response tương tự OpenAI
                return jsonObject.getJSONArray("choices")
                        .getJSONObject(0)
                        .getJSONObject("message")
                        .getString("content");
            } else {
                return "Không nhận được phản hồi hợp lệ từ OpenRouter.";
            }
        } catch (Exception e) {
            return "Không thể phân tích phản hồi từ OpenRouter: " + e.getMessage();
        }
    }

    private void enforceRateLimit() throws IOException {
        long currentTime = System.currentTimeMillis();
        long elapsed = currentTime - lastRequestTime;

        if (elapsed < MIN_REQUEST_INTERVAL_MS) {
            try {
                long sleepTime = MIN_REQUEST_INTERVAL_MS - elapsed;
                System.out.println("Rate limiting: Chờ " + sleepTime + "ms trước khi gửi request tiếp theo");
                TimeUnit.MILLISECONDS.sleep(sleepTime);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                throw new IOException("Rate limiting bị gián đoạn");
            }
        }
        lastRequestTime = System.currentTimeMillis();
    }

    private JSONObject createRequestBody(String prompt) {
        JSONObject requestBody = new JSONObject();
        JSONArray messages = new JSONArray();
        messages.put(new JSONObject().put("role", "user").put("content", prompt));

        requestBody.put("model", ApiConfig.OPENROUTER_MODEL); // Sử dụng model từ OpenRouter
        requestBody.put("messages", messages);
        requestBody.put("temperature", 0.7);
        requestBody.put("max_tokens", 500);

        return requestBody;
    }

    private String handleRateLimitError(HttpURLConnection connection, int retryCount) throws IOException {
        String retryAfter = connection.getHeaderField("Retry-After");
        int suggestedDelay = retryAfter != null
                ? Integer.parseInt(retryAfter) * 1000
                : (int) (BASE_RETRY_DELAY_MS * Math.pow(2, retryCount));

        // Thêm jitter và giới hạn delay tối đa
        suggestedDelay = Math.min(suggestedDelay + (int) (Math.random() * 1000), 60000);

        if (retryCount < MAX_RETRIES - 1) {
            try {
                System.out.println("Rate limited. Retrying after " + suggestedDelay + "ms");
                Thread.sleep(suggestedDelay);
                return null; // Báo hiệu cần retry
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                return "Hệ thống quá tải. Vui lòng thử lại sau.";
            }
        }
        String errorDetails = readErrorStream(connection);
        System.out.println("Lỗi 429 chi tiết từ OpenAI: " + errorDetails);
        return "Lỗi: Quá nhiều request. Vui lòng đợi " + (suggestedDelay / 1000) + " giây.";
    }

    private String readResponse(HttpURLConnection connection) throws IOException {
        try (BufferedReader br = new BufferedReader(
                new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                response.append(line);
            }
            return response.toString();
        }
    }

    private String parseResponse(String jsonResponse) {
        try {
            JSONObject jsonObject = new JSONObject(jsonResponse);
            if (jsonObject.has("choices") && jsonObject.getJSONArray("choices").length() > 0) {
                return jsonObject.getJSONArray("choices")
                        .getJSONObject(0)
                        .getJSONObject("message")
                        .getString("content");
            } else {
                return "Không nhận được phản hồi hợp lệ từ AI.";
            }
        } catch (Exception e) {
            return "Không thể phân tích phản hồi từ AI: " + e.getMessage();
        }
    }

    private String handleApiError(HttpURLConnection connection) throws IOException {
        String errorDetails = readErrorStream(connection);
        try {
            JSONObject errorJson = new JSONObject(errorDetails);
            if (errorJson.has("error")) {
                JSONObject error = errorJson.getJSONObject("error");
                return "Lỗi từ AI: " + error.optString("message", "Không rõ nguyên nhân");
            }
        } catch (Exception e) {
            // Fall through to generic error
        }
        return "Lỗi khi kết nối với dịch vụ AI. Chi tiết: " + errorDetails;
    }

    private String readErrorStream(HttpURLConnection connection) throws IOException {
        if (connection.getErrorStream() == null) {
            return "Không có thông tin lỗi";
        }
        try (BufferedReader br = new BufferedReader(
                new InputStreamReader(connection.getErrorStream(), StandardCharsets.UTF_8))) {
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                response.append(line);
            }
            return response.toString();
        }
    }
}