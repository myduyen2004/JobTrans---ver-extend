<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/17/2025
  Time: 9:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!-- Phần CSS cho toast -->
<style>
  .toast-container {
    position: fixed;
    top: 20px;
    right: 20px;
    z-index: 9999;
  }

  .toast {
    min-width: 250px;
    max-width: 350px;
    margin-bottom: 10px;
    color: white;
    border-radius: 4px;
    padding: 16px;
    display: flex;
    align-items: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    animation: slideIn 0.3s, fadeOut 0.5s 4.5s;
    animation-fill-mode: forwards;
    font-family: Arial, sans-serif;
  }

  .toast-icon {
    font-size: 20px;
    margin-right: 12px;
    min-width: 24px;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .toast-content {
    flex-grow: 1;
  }

  .toast-close {
    cursor: pointer;
    font-size: 18px;
    margin-left: 8px;
    opacity: 0.7;
  }

  .toast-close:hover {
    opacity: 1;
  }

  @keyframes slideIn {
    from {transform: translateX(100%); opacity: 0;}
    to {transform: translateX(0); opacity: 1;}
  }

  @keyframes fadeOut {
    from {opacity: 1;}
    to {opacity: 0; display: none;}
  }
</style>
<%
  // Lấy thông báo từ request attribute hoặc session attribute
  String message = (String) request.getAttribute("toastMessage");
  String type = (String) request.getAttribute("toastType"); // success, error, warning, info

  if (message == null) {
    message = (String) request.getAttribute("toastMessage");
    type = (String) request.getAttribute("toastType");
    // Xóa session attribute sau khi đã lấy
    if (message != null) {
      session.removeAttribute("toastMessage");
      session.removeAttribute("toastType");
    }
  }

  // Thiết lập màu sắc dựa vào loại thông báo
  String backgroundColor = "#4CAF50"; // Mặc định: success (màu xanh lá)
  String icon = "&#10003;"; // Mặc định: dấu tích

  if (type != null) {
    if (type.equals("error")) {
      backgroundColor = "#F44336";
      icon = "&#10006;"; // Dấu X
    } else if (type.equals("warning")) {
      backgroundColor = "#FF9800";
      icon = "&#9888;"; // Biểu tượng cảnh báo
    } else if (type.equals("info")) {
      backgroundColor = "#2196F3";
      icon = "&#8505;"; // Biểu tượng thông tin
    }
  }
%>
<!-- Phần HTML cho toast -->
<div class="toast-container">
  <% if (message != null && !message.isEmpty()) { %>
  <div class="toast" style="background-color: <%= backgroundColor %>;">
    <div class="toast-icon"><%= icon %></div>
    <div class="toast-content"><%= message %></div>
    <div class="toast-close" onclick="this.parentElement.style.display='none';">&times;</div>
  </div>
  <% } %>
</div>
<script>
  // Tự động ẩn toast sau 5 giây
  document.addEventListener('DOMContentLoaded', function() {
    var toasts = document.getElementsByClassName('toast');
    for (var i = 0; i < toasts.length; i++) {
      setTimeout(function(toast) {
        if (toast) {
          toast.style.display = 'none';
        }
      }, 5000, toasts[i]);
    }
  });
</script>