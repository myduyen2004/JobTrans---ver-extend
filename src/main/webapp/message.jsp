<%--
    Document   : message
    Created on : Mar 14, 2025, 6:31:46 AM
    Author     : ADM
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--<link rel="profile" href="https://gmpg.org/xfn/11">-->

    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large' />

    <!--new css -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="css/message.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
<!-- Preloading -->
<div id="preloader">
    <div class="spinner">
        <div class="uil-ripple-css"><div></div><div></div></div>
    </div>
</div>

<%@include file="includes/header-login-01.jsp"%>

<%--main chatn box--%>
<div class="m-3 p-2" style="background-color: #D9D9D950; border-radius: 15px;">
    <h2 class="mt-3 mb-3 ml-3" style="background-color: #6787FE; padding: 5px 10px 5px 10px; color: white; text-align: center; width: 500px; border-radius: 30px; font-size: 20px;">
        Đoạn chat - Lập trình web bán hàng
    </h2>
    <div class="chat-container">
        <div class="chat-header">
            <p>Lập Trình Web Bán Hàng</p>
            <small>Chào mừng bạn đến với cuộc hội thoại</small>
        </div>
        <div class="chat-body" id="chatBody" style="height: 250px;">
            <div class="message">
                <img src="https://i.pravatar.cc/30?img=1" alt="User">
                <p>Hello</p>
            </div>
            <div class="message">
                <img src="https://i.pravatar.cc/30?img=2" alt="User">
                <p>Hello</p>
            </div>
            <div class="message">
                <img src="https://i.pravatar.cc/30?img=3" alt="User">
                <p>Hello</p>
            </div>
            <div class="message" style="justify-content: flex-end;">
                <p style="background: #6787FE; color: white;">Hello</p>
                <img src="https://i.pravatar.cc/30?img=4" alt="User">
            </div>
        </div>
        <div class="chat-footer">
            <button class="follow_doc pl-1 pr-1" style="width: 40px; height: 40px; background-color: white;"><i class="fas fa-image" style="font-size:20px;"></i></button>
            <button class="follow_doc pl-1 pr-1" style="width: 40px; height: 40px; background-color: white;"><i class="fas fa-paperclip" style="font-size:20px;"></i></button>
            <input type="text" id="chatInput" placeholder="Nhập tin nhắn...">
            <button class="send" id="sendButton" style="width: 40px; height: 40px;"><i class="fas fa-share"></i></button>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const chatBody = document.getElementById("chatBody");
        const inputField = document.getElementById("chatInput");
        const sendButton = document.getElementById("sendButton");

        function addMessage(text, isUser = false) {
            if (text.trim() === "")
                return;

            const messageDiv = document.createElement("div");
            messageDiv.classList.add("message");
            if (isUser)
                messageDiv.style.justifyContent = "flex-end";

            const messageText = document.createElement("p");
            messageText.innerText = text;
            messageText.style.background = isUser ? "#6787FE" : "#f1f1f1";
            messageText.style.color = isUser ? "white" : "black";

            const avatar = document.createElement("img");
            avatar.src = `https://i.pravatar.cc/30?img=${isUser ? 4 : Math.floor(Math.random() * 5)}`;
            avatar.alt = "User";

            if (isUser) {
                messageDiv.appendChild(messageText);
                messageDiv.appendChild(avatar);
            } else {
                messageDiv.appendChild(avatar);
                messageDiv.appendChild(messageText);
            }

            chatBody.appendChild(messageDiv);

            // Tự động cuộn xuống cuối cùng
            chatBody.scrollTop = chatBody.scrollHeight;
        }

        sendButton.addEventListener("click", function () {
            addMessage(inputField.value, true);
            inputField.value = "";
        });

        inputField.addEventListener("keypress", function (event) {
            if (event.key === "Enter") {
                addMessage(inputField.value, true);
                inputField.value = "";
            }
        });

        // Giả lập nhận tin nhắn từ server sau 3 giây
//                setInterval(() => {
//                    addMessage("Tin nhắn từ server!", false);
//                }, 5000);
    });
</script>
</body>
</html>
