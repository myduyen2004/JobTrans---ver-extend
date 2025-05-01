let socket = null;
let currentAttachment = null;

// Function to determine file type, color and icon based on file extension
function getFileIconInfo(fileUrl) {
    if (!fileUrl) return { bgColor: "#9E9E9E", fileType: "Tệp", iconClass: "fa-file" };

    // Extract file name from URL
    const fileName = fileUrl.split('/').pop() || "File";

    // Extract file extension
    const fileExtension = fileName.includes('.') ?
        fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase() : "";

    // Default values
    let bgColor = "#9E9E9E";
    let fileType = "Tệp";
    let iconClass = "fa-file";

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
    }

    return {
        bgColor: bgColor,
        fileType: fileType,
        iconClass: iconClass,
        fileName: fileName
    };
}

// Function to get file icon class based on file extension
function getFileIconClass(fileUrl) {
    if (!fileUrl) return 'fa-file';

    const extension = fileUrl.split('.').pop().toLowerCase();

    // Map file extensions to Font Awesome icons
    switch (extension) {
        // Documents
        case 'pdf':
            return 'fa-file-pdf';
        case 'doc':
        case 'docx':
            return 'fa-file-word';
        case 'txt':
            return 'fa-file-alt';

        // Spreadsheets
        case 'xls':
        case 'xlsx':
        case 'csv':
            return 'fa-file-excel';

        // Presentations
        case 'ppt':
        case 'pptx':
            return 'fa-file-powerpoint';

        // Images
        case 'jpg':
        case 'jpeg':
        case 'png':
        case 'gif':
        case 'bmp':
        case 'svg':
            return 'fa-file-image';

        // Audio
        case 'mp3':
        case 'wav':
        case 'ogg':
            return 'fa-file-audio';

        // Video
        case 'mp4':
        case 'avi':
        case 'mov':
        case 'wmv':
        case 'mkv':
        case 'm4a':
            return 'fa-file-video';

        // Archives
        case 'zip':
        case 'rar':
        case '7z':
        case 'tar':
        case 'gz':
            return 'fa-file-archive';

        // Code
        case 'js':
        case 'html':
        case 'css':
        case 'java':
        case 'py':
        case 'php':
        case 'c':
        case 'cpp':
            return 'fa-file-code';

        // Default
        default:
            return 'fa-file';
    }
}

const connectWebSocket = () => {
    socket = new WebSocket(`ws://${window.location.host}/JobTrans/chat/${userId}/${conversationId}`);

    socket.onopen = () => console.log('WebSocket connection established');

    socket.onmessage = (event) => {
        const message = JSON.parse(event.data);
        handleIncomingMessage(message);
    };

    socket.onclose = () => {
        console.log('WebSocket connection closed');
        setTimeout(connectWebSocket, 3000);
    };

    socket.onerror = (error) => console.error('WebSocket error:', error);
};

document.addEventListener('DOMContentLoaded', connectWebSocket);

// Modified handleIncomingMessage function with proper file icons
const handleIncomingMessage = (message) => {
    // Process different message types
    if (message.type === 'join' || message.type === 'leave') {
        // Handle join/leave notifications
        return;
    }

    // Handle regular messages
    const chatMessages = document.getElementById('chatMessages');

    const messageDiv = document.createElement('div');
    messageDiv.classList.add('message', message.senderId === userId ? 'own-message' : 'other-message');
    messageDiv.setAttribute('data-message-id', message.messageId);

    const headerDiv = document.createElement('div');
    headerDiv.classList.add('message-header');

    const senderSpan = document.createElement('span');
    senderSpan.classList.add('sender-name');
    senderSpan.textContent = message.senderName;

    const timeSpan = document.createElement('span');
    timeSpan.classList.add('message-time');
    timeSpan.textContent = new Date(message.sentTime).toLocaleString();

    headerDiv.appendChild(senderSpan);
    headerDiv.appendChild(timeSpan);
    messageDiv.appendChild(headerDiv);

    if (message.repliedToId && message.repliedToId !== -1) {
        const repliedDiv = document.createElement('div');
        repliedDiv.classList.add('replied-message');

        const repliedContent = document.createElement('div');
        repliedContent.classList.add('replied-content');

        // Add the reply icon
        const replyIcon = document.createElement('i');
        replyIcon.className = 'fas fa-reply';
        repliedContent.appendChild(replyIcon);

        // Add space after icon
        repliedContent.appendChild(document.createTextNode(' '));

        // Add replied text
        repliedContent.appendChild(document.createTextNode(message.repliedContent));

        repliedDiv.appendChild(repliedContent);
        messageDiv.appendChild(repliedDiv);
    }

    if (message.isSticker) {
        const stickerDiv = document.createElement('div');
        stickerDiv.classList.add('message-sticker');

        const img = document.createElement('img');
        img.src = message.content;
        img.alt = 'Sticker';

        stickerDiv.appendChild(img);
        messageDiv.appendChild(stickerDiv);
    } else {
        const contentDiv = document.createElement('div');
        contentDiv.classList.add('message-content');
        contentDiv.textContent = message.content;
        messageDiv.appendChild(contentDiv);
    }

    if (message.attachmentUrl) {
        // Get file info for styling
        const fileInfo = getFileIconInfo(message.attachmentUrl);
        // const fileIconClass = getFileIconClass(message.attachmentUrl);

        // Create attachment container
        const attachmentDiv = document.createElement('div');
        attachmentDiv.classList.add('file-attachment');

        // Create file icon container
        const fileIconDiv = document.createElement('div');
        fileIconDiv.classList.add('file-icon');
        fileIconDiv.style.backgroundColor = fileInfo.bgColor;

        // Add Font Awesome icon
        const iconElement = document.createElement('i');
        iconElement.className = `fas ${fileInfo.iconClass}`;
        fileIconDiv.appendChild(iconElement);

        // Create file details container
        const fileDetailsDiv = document.createElement('div');
        fileDetailsDiv.classList.add('file-details');

        // Create filename element
        const fileNameDiv = document.createElement('div');
        fileNameDiv.classList.add('file-name');
        fileNameDiv.textContent = fileInfo.fileName;

        // Create file type element
        const fileTypeDiv = document.createElement('div');
        fileTypeDiv.classList.add('file-type');
        fileTypeDiv.textContent = fileInfo.fileType;

        // Assemble the details
        fileDetailsDiv.appendChild(fileNameDiv);
        fileDetailsDiv.appendChild(fileTypeDiv);

        // Create download button
        const downloadBtn = document.createElement('a');
        downloadBtn.href = message.attachmentUrl;
        downloadBtn.classList.add('download-btn');
        downloadBtn.title = 'Tải xuống';
        downloadBtn.target = '_blank';

        // Add download icon
        const downloadIcon = document.createElement('i');
        downloadIcon.className = 'fas fa-download';
        downloadBtn.appendChild(downloadIcon);

        // Assemble the attachment component
        attachmentDiv.appendChild(fileIconDiv);
        attachmentDiv.appendChild(fileDetailsDiv);
        attachmentDiv.appendChild(downloadBtn);

        messageDiv.appendChild(attachmentDiv);
    }

    const actionsDiv = document.createElement('div');
    actionsDiv.classList.add('message-actions');

    const replyButton = document.createElement('button');
    replyButton.classList.add('btn-reply');

    // Add reply icon to button
    const replyBtnIcon = document.createElement('i');
    replyBtnIcon.className = 'fas fa-reply';
    replyButton.appendChild(replyBtnIcon);
    replyButton.appendChild(document.createTextNode(' Reply'));

    replyButton.onclick = () => replyToMessage(message.messageId, message.content);

    actionsDiv.appendChild(replyButton);
    messageDiv.appendChild(actionsDiv);

    // Add message to the END of message list
    chatMessages.appendChild(messageDiv);

    // Scroll down to show the newest message
    chatMessages.scrollTop = chatMessages.scrollHeight;
};

const sendMessage = () => {
    const messageInput = document.getElementById('messageInput');
    const content = messageInput.value.trim();
    if (!content && !currentAttachment) return;

    const message = {
        type: 'message',
        content: content,
        isSticker: false,
        repliedToId: replyingTo
    };

    if (currentAttachment) {
        message.attachmentUrl = currentAttachment;
    }

    socket.send(JSON.stringify(message));
    messageInput.value = '';
    cancelReply();
    currentAttachment = null;
    document.getElementById('uploadStatus').textContent = '';
};

const replyToMessage = (messageId, content) => {
    replyingTo = messageId;
    document.getElementById('replyContent').textContent = content;
    document.getElementById('replyPreview').style.display = 'flex';
    document.getElementById('messageInput').focus();
};

const cancelReply = () => {
    replyingTo = null;
    document.getElementById('replyPreview').style.display = 'none';
};

const toggleStickerPanel = () => {
    const stickerPanel = document.getElementById('stickerPanel');
    stickerPanel.style.display = stickerPanel.style.display === 'none' ? 'grid' : 'none';
};

const sendSticker = (stickerUrl) => {
    const message = {
        type: 'message',
        content: stickerUrl,
        isSticker: true,
        repliedToId: replyingTo
    };
    socket.send(JSON.stringify(message));
    document.getElementById('stickerPanel').style.display = 'none';
    cancelReply();
};

document.getElementById('fileInput').addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (!file) return;

    const formData = new FormData();
    formData.append('file', file);
    const uploadStatus = document.getElementById('uploadStatus');
    const messageInput = document.getElementById('messageInput');
    uploadStatus.textContent = 'Đang tải lên...';

    fetch('upload', {
        method: 'POST',
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                currentAttachment = data.fileUrl;
                uploadStatus.textContent = `Đã tải lên: ${data.fileName}`;
                // Focus back on textarea after upload
                messageInput.focus();
            } else {
                uploadStatus.textContent = `Lỗi: ${data.error}`;
            }
        })
        .catch(error => {
            console.error('Upload error:', error);
            uploadStatus.textContent = 'Lỗi tải lên';
        });
});

// Auto-resize textarea function
document.addEventListener('DOMContentLoaded', function() {
    const textarea = document.getElementById('messageInput');

    // Function to auto-resize the textarea
    function autoResize() {
        textarea.style.height = 'auto';
        textarea.style.height = (textarea.scrollHeight) + 'px';

        // Limit max height
        if (textarea.scrollHeight > 100) {
            textarea.style.overflowY = 'auto';
        } else {
            textarea.style.overflowY = 'hidden';
        }
    }

    // Initial resize and event listeners
    autoResize();
    textarea.addEventListener('input', autoResize);
    textarea.addEventListener('focus', autoResize);

    // Modified event listener for Enter key (send on Enter, new line with Shift+Enter or Ctrl+Enter)
    textarea.addEventListener('keydown', function(e) {
        // Auto-resize on any keydown
        setTimeout(autoResize, 0);

        // Send message on Enter without modifiers
        if (e.key === 'Enter' && !e.shiftKey && !e.ctrlKey) {
            e.preventDefault();
            sendMessage();
        }
        // Allow newline with Shift+Enter or Ctrl+Enter
        else if (e.key === 'Enter' && (e.shiftKey || e.ctrlKey)) {
            // Do nothing, allow default behavior (newline)
        }
    });

    // Auto-scroll to bottom after loading messages
    const chatMessages = document.getElementById('chatMessages');
    chatMessages.scrollTop = chatMessages.scrollHeight;
});