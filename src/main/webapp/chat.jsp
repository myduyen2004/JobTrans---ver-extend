<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="jobtrans.model.Account" %>
<%@ page import="jobtrans.dal.MessageDAO" %>
<%@ page import="jobtrans.dal.ConversationDAO" %>
<%@ page import="jobtrans.dal.JobDAO" %>
<%@ page import="jobtrans.model.Message" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="jobtrans.model.Job" %>
<%
    Account sessionAccount = (Account) session.getAttribute("sessionAccount");
    Integer conversationIdObj = (Integer) request.getAttribute("conversationId");
    int conversationId = (conversationIdObj != null) ? conversationIdObj : -1;
    Integer jobIdObj = (Integer) request.getAttribute("jobId");
    int jobId = (jobIdObj != null) ? jobIdObj : -1;
    JobDAO jobDAO = new JobDAO();
    MessageDAO messageDAO = new MessageDAO();
    ConversationDAO conversationDAO = new ConversationDAO();
    // Lấy tin nhắn gần đây, đảm bảo thứ tự từ cũ đến mới
    Job job = jobDAO.getJobById(jobId);
    List<Message> recentMessages = messageDAO.getRecentMessages(conversationId,1000);
    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Room</title>
    <link rel="stylesheet" href="css/chat.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script>
        let userId = <%= sessionAccount.getAccountId() %>;
        let conversationId = <%=conversationId%>;
        let replyingTo = null;
    </script>
</head>
<%@include file="includes/header-01.jsp"%>
<body>
<div class="chat-container">
    <div class="chat-header">
        <h2><i class="fas fa-comments"></i> Hội thoại: <%=job.getJobTitle()%> </h2>
        <a href="javascript:void(0);" class="btn-small" onclick="window.history.back();">
            <i class="fas fa-arrow-left"></i> Quay trở về
        </a>
    </div>
    <div class="chat-messages" id="chatMessages">
        <% for (int i = 0; i < recentMessages.size(); i++) {
            Message msg = recentMessages.get(i);
            boolean isOwnMessage = msg.getSenderId() == sessionAccount.getAccountId();
            String messageClass = isOwnMessage ? "message own-message" : "message other-message";
        %>
        <div class="<%= messageClass %>" data-message-id="<%= msg.getMessageId() %>">
            <div class="message-header">
                <span class="sender-name"><%= msg.getSenderName() %></span>
                <span class="message-time"><%= sdf.format(msg.getSentTime()) %></span>
            </div>

            <% if (msg.getRepliedToId() != null) { %>
            <div class="replied-message">
                <div class="replied-content"><i class="fas fa-reply"></i> <%= msg.getRepliedContent() %></div>
            </div>
            <% } %>

            <% if (msg.isSticker()) { %>
            <div class="message-sticker">
                <img src="<%= msg.getContent() %>" alt="Sticker">
            </div>
            <% } else { %>
            <div class="message-content"><%= msg.getContent() %></div>
            <% } %>

            <% if (msg.getAttachmentUrl() != null && !msg.getAttachmentUrl().isEmpty()) {
                String fileName = msg.getAttachmentUrl().split("/").length > 0 ?
                        msg.getAttachmentUrl().split("/")[msg.getAttachmentUrl().split("/").length-1] : "File";
                String fileExtension = fileName.contains(".") ? fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase() : "";

                // Get file icon info
                String bgColor = "#9E9E9E";
                String fileType = "Tệp";
                String iconClass = "fa-file";

                // Determine file type, color and icon based on extension
                switch (fileExtension) {
                    // Documents
                    case "pdf":
                        bgColor = "#FF5252";
                        fileType = "PDF";
                        iconClass = "fa-file-pdf";
                        break;
                    case "doc":
                    case "docx":
                        bgColor = "#2196F3";
                        fileType = "Word";
                        iconClass = "fa-file-word";
                        break;
                    case "txt":
                        bgColor = "#607D8B";
                        fileType = "Text";
                        iconClass = "fa-file-alt";
                        break;

                    // Spreadsheets
                    case "xls":
                    case "xlsx":
                    case "csv":
                        bgColor = "#4CAF50";
                        fileType = "Excel";
                        iconClass = "fa-file-excel";
                        break;

                    // Presentations
                    case "ppt":
                    case "pptx":
                        bgColor = "#FF9800";
                        fileType = "PowerPoint";
                        iconClass = "fa-file-powerpoint";
                        break;

                    // Images
                    case "jpg": case "jpeg": case "png": case "gif": case "bmp": case "svg":
                        bgColor = "#9C27B0";
                        fileType = "Hình ảnh";
                        iconClass = "fa-file-image";
                        break;

                    // Audio
                    case "mp3": case "wav": case "ogg":
                        bgColor = "#673AB7";
                        fileType = "Âm thanh";
                        iconClass = "fa-file-audio";
                        break;

                    // Video
                    case "mp4": case "avi": case "mov": case "wmv": case "mkv": case "m4a":
                        bgColor = "#9C27B0";
                        fileType = "Video";
                        iconClass = "fa-file-video";
                        break;

                    // Archives
                    case "zip": case "rar": case "7z": case "tar": case "gz":
                        bgColor = "#795548";
                        fileType = "Nén";
                        iconClass = "fa-file-archive";
                        break;

                    // Code
                    case "js": case "html": case "css": case "java": case "py": case "php": case "c": case "cpp":
                        bgColor = "#607D8B";
                        fileType = "Mã nguồn";
                        iconClass = "fa-file-code";
                        break;

                    // Default
                    default:
                        bgColor = "#9E9E9E";
                        fileType = "Tệp";
                        iconClass = "fa-file";
                        break;
                }
            %>
            <div class="file-attachment">
                <div class="file-icon" style="background-color: <%= bgColor %>;">
                    <i class="fas <%= iconClass %>"></i>
                </div>
                <div class="file-details">
                    <div class="file-name"><%= fileName %></div>
                    <div class="file-type"><%= fileType %></div>
                </div>
                <a href="<%= msg.getAttachmentUrl() %>" class="download-btn" target="_blank" title="Tải xuống">
                    <i class="fas fa-download"></i>
                </a>
            </div>
            <% } %>

            <div class="message-actions">
                <button class="btn-reply" onclick="replyToMessage(<%= msg.getMessageId() %>, '<%= msg.getContent().replace("'", "\\'") %>')">
                    <i class="fas fa-reply"></i> Reply
                </button>
            </div>
        </div>
        <% } %>
    </div>

    <div id="replyPreview" class="reply-preview" style="display: none;">
        <div class="reply-content">
            <i class="fas fa-reply"></i> <span id="replyContent"></span>
        </div>
        <button class="btn-cancel-reply" onclick="cancelReply()">×</button>
    </div>

    <!-- Updated Chat Input Structure -->
    <div class="chat-input">
        <div class="sticker-panel">
            <button class="btn-sticker" onclick="toggleStickerPanel()">😊</button>
            <div class="stickers" id="stickerPanel" style="display: none;">
                <c:forEach var="sticker" items="${stickerList}">
                    <div class="sticker" onclick="sendSticker('${pageContext.request.contextPath}/${sticker.stickerUrl}')">
                        <img src="${pageContext.request.contextPath}/${sticker.stickerUrl}" alt="${sticker.stickerName}" style="width: 40px; height: 40px;">
                    </div>
                </c:forEach>
            </div>
        </div>


        <div class="file-upload">
            <label for="fileInput" class="btn-file"><i class="fas fa-paperclip"></i></label>
            <input type="file" id="fileInput" style="display: none;">
            <span id="uploadStatus"></span>
        </div>

        <textarea id="messageInput" placeholder="Nhập tin nhắn..." rows="1"></textarea>
        <button id="sendButton" onclick="sendMessage()">
            <i class="fas fa-paper-plane"></i>
        </button>
    </div>
</div>
<script src="js/chat.js"></script>
<script>
    // Auto-scroll to bottom after loading messages
    window.addEventListener('DOMContentLoaded', () => {
        const chatMessages = document.getElementById('chatMessages');
        chatMessages.scrollTop = chatMessages.scrollHeight;
    });
</script>
</body>
</html>