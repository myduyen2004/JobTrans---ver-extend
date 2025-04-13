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

    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large' />

    <!--new css -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        body {
            font-family: "Inter", sans-serif;
            background-color: #f0f2f5;
        }
        .chat-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 15px;
            margin: 10px auto;
        }
        .chat-header {
            text-align: center;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .chat-body {
            display: flex;
            flex-direction: column;
            overflow-y: auto;
            padding: 10px;
            border-bottom: 1px solid #ddd;
            justify-content: end;
        }
        .message {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .message img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-right: 10px;
            margin-left: 10px;
        }
        .message p {
            background: #f1f1f1;
            padding: 8px;
            border-radius: 10px;
            margin: 0;
        }
        .chat-footer {
            display: flex;
            align-items: center;
            padding: 10px;
        }
        .chat-footer input {
            flex: 1;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .chat-footer .send{
            background: #6787FE;
            color: white;
            border: none;
            padding: 8px 10px;
            margin-left: 5px;
            border-radius: 5px;
            cursor: pointer;
        }
        .chat-footer .follow_doc{
            color: #6787FE;
            margin-right: 5px;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .message {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            animation: fadeIn 0.3s ease-in-out;
        }
    </style>
</head>
<body>
<div class="m-3 p-2" style="background-color: #D9D9D950; border-radius: 15px;">
    <h2 class="mt-3 mb-3 ml-3" style="background-color: #6787FE; padding: 5px 10px 5px 10px; color: white; text-align: center; width: 500px; border-radius: 30px; font-size: 20px;">
        Đoạn chat - Lập trình web bán hàng
    </h2>
    <div class="chat-container">
        <div class="chat-header">
            <p>Lập Trình Web Bán Hàng</p>
            <small>Chào mừng bạn đến với cuộc hội thoại</small>
        </div>
        <div class="chat-body" id="chatBody" style="height: 500px;">
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
