<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>OpenRouter API Key</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #74ebd5, #ACB6E5);
      height: 100vh;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .container {
      background-color: white;
      padding: 40px 30px;
      border-radius: 16px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 450px;
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    .container h2 {
      margin: 0;
      font-size: 22px;
      color: #333;
      text-align: center;
      margin-bottom: 30px;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    input[type="text"] {
      padding: 12px 15px;
      font-size: 16px;
      border: 2px solid #ddd;
      border-radius: 8px;
      outline: none;
      transition: all 0.3s ease;
    }

    input[type="text"]:focus {
      border-color: #74ebd5;
      box-shadow: 0 0 5px rgba(116, 235, 213, 0.5);
    }

    button {
      padding: 12px;
      font-size: 16px;
      color: white;
      background-color: #74ebd5;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #60d3c2;
    }

    .link-button {
      text-align: center;
      text-decoration: none;
      background-color: #f0f0f0;
      color: #333;
      padding: 10px 15px;
      border-radius: 8px;
      border: 1px solid #ccc;
      transition: background-color 0.3s ease;
    }

    .link-button:hover {
      background-color: #e0e0e0;
    }

  </style>
</head>
<body>
<div class="container">
  <h2>Quản lý OpenRouter API Key</h2>

  <!-- Form nhập API key -->
  <form action="chat?action=saveKey" method="POST" >
    <input type="text" name="apiKey" placeholder="Nhập OpenRouter API Key" required />
    <button type="submit">Sử dụng API Key</button>
  </form>

  <!-- Link đăng ký -->
  <a class="link-button" href="https://openrouter.ai/keys" target="_blank">Đăng ký API Key</a>

  <!-- Link hướng dẫn -->
  <a class="link-button" href="/api-key-huong-dan">Xem hướng dẫn sử dụng API Key</a>
</div>
</body>
</html>
