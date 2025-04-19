<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Chat với AI</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #6787FE;
      --primary-dark: #4a6cdf;
      --text-color: #2e3438;
      --light-gray: #f8f9fa;
      --border-color: #e0e0e0;
      --success-color: #4CAF50;
      --error-color: #e74c3c;
      --shadow-sm: 0 2px 5px rgba(0,0,0,0.1);
      --shadow-md: 0 4px 12px rgba(0,0,0,0.15);
      --radius-sm: 6px;
      --radius-md: 12px;
      --transition: all 0.3s ease;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f5f7ff;
      color: var(--text-color);
      line-height: 1.6;
      margin: 0;
      padding: 0;
    }

    /* Sidebar Styles */



    .dashboard-sidebar-inner {
      height: 100%;
      display: flex;
      flex-direction: column;
    }

    .dashboard-sidebar-header {
      text-align: center;
      font-size: 24px;
      font-weight: bold;
      padding: 25px 0;
      background: linear-gradient(135deg, var(--primary-color) 0%, #8a9eff 100%);
      color: white;
      margin-bottom: 0;
      box-shadow: var(--shadow-sm);
    }

    .chat-container {
      flex: 1;
      display: flex;
      flex-direction: column;
      padding: 20px;
      overflow-y: auto;
      height: calc(100vh - 180px);
    }

    .chat-title {
      color: white;
      margin: 0;
      font-size: 22px;
      text-align: center;
      padding: 15px 0;
    }

    .chat-form {
      display: flex;
      flex-direction: column;
      gap: 15px;
      margin-top: 20px;

    }

    .chat-form textarea {
      margin-left: 30px;
      width: 85%;
      padding: 15px;
      border: 2px solid var(--border-color);
      border-radius: var(--radius-sm);
      resize: none;
      font-size: 16px;
      line-height: 1.5;
      transition: var(--transition);
      min-height: 60px;
      background-color: white;
      box-shadow: inset 0 1px 3px rgba(0,0,0,0.05);

    }

    .chat-form textarea:focus {
      border-color: var(--primary-color);
      outline: none;
      box-shadow: 0 0 0 3px rgba(103, 135, 254, 0.2);
    }

    .submit-btn {
      background-color: var(--primary-color);
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: var(--radius-sm);
      cursor: pointer;
      font-size: 16px;
      font-weight: 600;
      transition: var(--transition);
      align-self: flex-end;
      display: flex;
      align-items: center;
      gap: 8px;
      margin-bottom: 40px;
    }

    .submit-btn:hover {
      background-color: var(--primary-dark);
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    .submit-btn i {
      font-size: 14px;
    }

    .response {
      margin-top: 25px;
      padding: 20px;
      background-color: white;
      border-radius: var(--radius-sm);
      box-shadow: var(--shadow-sm);
      border-left: 4px solid var(--primary-color);
      animation: fadeIn 0.5s ease-out;
    }

    .response h2 {
      color: var(--primary-color);
      margin-top: 0;
      font-size: 18px;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .response h2 i {
      color: var(--primary-dark);
    }

    .response p {
      font-size: 15px;
      line-height: 1.7;
      color: var(--text-color);
      margin: 10px 0 0 0;
    }

    /* Toggle button */
    .toggle-btn {
      position: fixed;
      top: 20px;
      right: 20px; /* Thay đổi từ left sang right */
      left: auto; /* Đảm bảo không bị ghi đè */
      cursor: pointer;
      font-size: 18px;
      background: var(--primary-color) !important;
      border: none !important;
      color: white !important;
      z-index: 1001;
      width: 50px !important;
      height: 50px !important;
      border-radius: 50% !important;
      display: flex !important;
      align-items: center !important;
      justify-content: center !important;
      box-shadow: var(--shadow-md) !important;
      transition: var(--transition) !important;
      padding: 0 !important;
      outline: none !important;
      margin-top: 750px;
    }

    /* Đặt sidebar ở bên phải */
    .dashboard-sidebar {
      width: 350px;
      background: linear-gradient(135deg, #ffffff 0%, #f8faff 100%);
      border-radius: var(--radius-md) 0 0 var(--radius-md); /* Bo góc trái thay vì phải */
      box-shadow: var(--shadow-md);
      padding: 0;
      transition: var(--transition);
      position: fixed;
      right: -350px; /* Thay đổi từ left sang right */
      top: 0;
      z-index: 1000;
      height: 100vh;
      overflow: hidden;
    }

    .dashboard-sidebar.expanded {
      right: 0; /* Hiển thị từ phải sang */
    }

    /* Điều chỉnh CV content khi sidebar mở */
    .dashboard-sidebar.expanded ~ .cv-content {
      margin-right: 350px; /* Thêm margin phải thay vì trái */
      transition: var(--transition);
    }
    .toggle-btn:hover {
      background: var(--primary-dark) !important;
      transform: scale(1.1) !important;
    }

    /* Scrollbar */
    .chat-container::-webkit-scrollbar {
      width: 8px;
    }

    .chat-container::-webkit-scrollbar-track {
      background: #f1f1f1;
      border-radius: 10px;
    }

    .chat-container::-webkit-scrollbar-thumb {
      background: #c1c1c1;
      border-radius: 10px;
    }

    .chat-container::-webkit-scrollbar-thumb:hover {
      background: #a1a1a1;
    }
    .welcome-message {
      padding: 20px;
      text-align: center;
      color: var(--text-light);
      flex: 1;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }

    .welcome-message i {
      font-size: 48px;
      color: var(--primary-color);
      margin-bottom: 16px;
      opacity: 0.8;
    }

    .welcome-message h3 {
      color: var(--text-color);
      margin-bottom: 8px;
      font-size: 18px;
      font-weight: 600;
    }

    .welcome-message p {
      max-width: 300px;
      margin: 0 auto;
      font-size: 14px;
      line-height: 1.5;
    }
    .chat-messages::-webkit-scrollbar {
      width: 8px;
    }

    .chat-messages::-webkit-scrollbar-track {
      background: #f1f1f1;
      border-radius: 10px;
    }

    .chat-messages::-webkit-scrollbar-thumb {
      background: #c1c1c1;
      border-radius: 10px;
    }

    .chat-messages::-webkit-scrollbar-thumb:hover {
      background: #a1a1a1;
    }
    /* Animations */
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }

    @keyframes slideDown {
      from { opacity: 0; transform: translateY(-10px); }
      to { opacity: 1; transform: translateY(0); }
    }

    /* Loading indicator */
    .loading {
      display: none;
      text-align: center;
      padding: 15px;
    }

    .loading i {
      color: var(--primary-color);
      font-size: 20px;
      animation: spin 1s linear infinite;
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }
  </style>
</head>
<body>

<button class="toggle-btn" id="sidebarToggle">
  <i class="fas fa-comment-dots"></i>
</button>

<div class="dashboard-sidebar" id="dashboardSidebar">
  <div class="dashboard-sidebar-inner">
    <div class="dashboard-sidebar-header">
      <span style="font-weight: 700;">AI</span> Chat Assistant
    </div>

    <div class="chat-container">
      <div class="chat-messages" id="chatMessages">
        <div class="welcome-message" id="welcomeMessage">
          <i class="fas fa-robot"></i>
          <h3>Xin chào! Tôi có thể giúp gì cho bạn?</h3>
          <p>Hỏi tôi bất cứ điều gì và tôi sẽ cố gắng trả lời tốt nhất có thể.</p>
        </div>
      </div>
      <div class="loading" id="loadingIndicator">
        <i class="fas fa-spinner"></i> Đang xử lý...
      </div>
      <div id="responseContainer"></div>
    </div>
    <form id="chatForm" class="chat-form">
      <textarea style="height: 60px" id="user-message" name="message" rows="5" placeholder="Nhập câu hỏi của bạn..."></textarea>
      <button type="submit" class="submit-btn">
        <i class="fas fa-paper-plane"></i> Gửi câu hỏi
      </button>
    </form>





  </div>
</div>

<script>

  document.addEventListener("DOMContentLoaded", function () {
    const toggleBtn = document.getElementById("sidebarToggle");
    const sidebar = document.getElementById("dashboardSidebar");
    const chatForm = document.getElementById("chatForm");
    const loadingIndicator = document.getElementById('loadingIndicator');
    const responseContainer = document.getElementById('responseContainer');
    const textarea = document.getElementById('user-message');

    let websocket;
    const contextPath = '<%=request.getContextPath()%>';
    const httpUrl = contextPath + '/chat';
    // Sửa URL WebSocket để tự động xác định host và context path
    const wsProtocol = window.location.protocol === 'https:' ? 'wss://' : 'ws://';
    const wsUrl = wsProtocol + window.location.host + contextPath + '/chatws';

    console.log('WebSocket URL:', wsUrl);

    // Hàm gửi tin nhắn qua HTTP
    async function sendViaHttp(message) {
      try {
        const response = await fetch(httpUrl, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: 'message=' + encodeURIComponent(message)
        });

        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response}`);
        }

        const data = await response.json();
        return data.response;
      } catch (error) {
        console.error('HTTP request failed:', error);
        throw error;
      }
    }

    // Hàm kết nối WebSocket
    function connectWebSocket() {

      if (websocket && (websocket.readyState === WebSocket.OPEN || websocket.readyState === WebSocket.CONNECTING)) {
        console.log('WebSocket đã kết nối hoặc đang kết nối');
        return;
      }

      websocket = new WebSocket(wsUrl);

      websocket.onopen = function() {
        console.log('✅ WebSocket connected');
      };

      websocket.onmessage = function(event) {
        loadingIndicator.style.display = 'none';
        addResponseToUI(event.data);
      };

      websocket.onerror = function(error) {
        console.error('❌ WebSocket error:', error);
        loadingIndicator.style.display = 'none';
        addErrorToUI('Lỗi kết nối WebSocket. Đang thử kết nối lại...');
        // Tự động kết nối lại sau 3 giây
        setTimeout(connectWebSocket, 3000);
      };

      websocket.onclose = function() {
        console.log('⚠️ WebSocket disconnected');
        // Tự động kết nối lại sau 5 giây
        setTimeout(connectWebSocket, 5000);
      };
    }
    // websocket.onopen = function() {
    //   console.log('✅ WebSocket connected');
    //   // Test gửi message ngay sau khi kết nối
    //   websocket.send("Test connection");
    // };
    // Hàm hiển thị phản hồi
    function addResponseToUI(response) {
      const safeResponse = escapeHtml(response);
      responseContainer.innerHTML += `
        <div class="response">
            <h2><i class="fas fa-robot"></i> Phản hồi từ AI</h2>
            <p>` + safeResponse + `</p>
        </div>`;
      responseContainer.scrollTop = responseContainer.scrollHeight;
      console.log("resopond ",responseContainer);
    }

    // Hàm hiển thị lỗi
    function addErrorToUI(error) {
      const safeError = escapeHtml(error);
      responseContainer.innerHTML += `
            <div class="response" style="border-left-color: var(--error-color)">
                <h2><i class="fas fa-exclamation-triangle"></i> Lỗi</h2>
                <p>${safeError}</p>
            </div>`;
    }

    // Hàm escape HTML để phòng chống XSS
    function escapeHtml(unsafe) {
      return unsafe
              .replace(/&/g, "&amp;")
              .replace(/</g, "&lt;")
              .replace(/>/g, "&gt;")
              .replace(/"/g, "&quot;")
              .replace(/'/g, "&#039;");
    }

    // Xử lý submit form
    chatForm.addEventListener('submit', async function(e) {
      e.preventDefault();
      const message = textarea.value.trim();
      if (!message) return;

      loadingIndicator.style.display = 'block';
      textarea.value = '';

      try {
        // Thử WebSocket trước
        if (websocket && websocket.readyState === WebSocket.OPEN) {
          websocket.send(message);
        } else {
          // Fallback dùng HTTP
          console.log('Sử dụng HTTP fallback');
          const response = await sendViaHttp(message);
          addResponseToUI(response);
        }
      } catch (error) {
        console.error('Error:', error);
        addErrorToUI('Không thể gửi tin nhắn: ' + error.message);
      } finally {
        loadingIndicator.style.display = 'none';
        textarea.style.height = 'auto';
      }
    });

    // Kết nối WebSocket khi mở sidebar
    toggleBtn.addEventListener("click", function() {
      sidebar.classList.toggle("expanded");
      if (sidebar.classList.contains("expanded")) {
        connectWebSocket();
      }
    });

    // Tự động điều chỉnh textarea
    textarea.addEventListener('input', function() {
      this.style.height = 'auto';
      this.style.height = (this.scrollHeight) + 'px';
    });

    // Kết nối WebSocket ngay khi tải trang
    connectWebSocket();
  });
</script>

</body>
</html>