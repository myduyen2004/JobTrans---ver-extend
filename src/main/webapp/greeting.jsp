
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Job Application Greeting</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      background-color: #f5f5f5;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 20px;
    }

    .container {
      width: 100%;
      max-width: 800px;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
      animation: fadeIn 0.8s ease-in-out;
    }

    .header {
      background: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
      color: white;
      padding: 30px;
      text-align: center;
      position: relative;
      overflow: hidden;
    }

    .header h1 {
      font-size: 28px;
      margin-bottom: 10px;
      position: relative;
      z-index: 1;
    }

    .header p {
      font-size: 16px;
      opacity: 0.9;
      position: relative;
      z-index: 1;
    }

    .bubble {
      position: absolute;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.1);
      animation: float 10s infinite ease-in-out;
    }

    .bubble:nth-child(1) {
      width: 120px;
      height: 120px;
      top: -30px;
      left: 10%;
      animation-delay: 0s;
    }

    .bubble:nth-child(2) {
      width: 80px;
      height: 80px;
      top: 20px;
      right: 20%;
      animation-delay: 2s;
    }

    .bubble:nth-child(3) {
      width: 60px;
      height: 60px;
      bottom: -10px;
      right: 10%;
      animation-delay: 4s;
    }

    .form-container {
      background: white;
      padding: 30px;
      overflow: auto;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
      color: #333;
    }

    .form-group input,
    .form-group textarea,
    .form-group select {
      width: 100%;
      padding: 12px;
      border: 1px solid #ddd;
      border-radius: 6px;
      font-size: 15px;
      transition: all 0.3s ease;
    }

    .form-group input:focus,
    .form-group textarea:focus,
    .form-group select:focus {
      border-color: rgb(39, 64, 179);
      box-shadow: 0 0 0 3px rgba(39, 64, 179, 0.2);
      outline: none;
    }

    .form-group textarea {
      min-height: 120px;
      resize: vertical;
    }

    .form-footer {
      display: flex;
      justify-content: center;
      margin-top: 30px;
    }

    .submit-btn {
      background: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
      color: white;
      border: none;
      padding: 12px 30px;
      border-radius: 50px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 4px 15px rgba(39, 64, 179, 0.3);
    }

    .submit-btn:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(39, 64, 179, 0.4);
    }

    .submit-btn:active {
      transform: translateY(0);
    }

    .file-input-container {
      position: relative;
      overflow: hidden;
    }

    .file-input-label {
      display: block;
      background: #f5f5f5;
      padding: 12px;
      text-align: center;
      border: 1px dashed #ddd;
      border-radius: 6px;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .file-input-label:hover {
      background: #e9e9e9;
      border-color: #bbb;
    }

    .file-input {
      position: absolute;
      left: 0;
      top: 0;
      opacity: 0;
      width: 100%;
      height: 100%;
      cursor: pointer;
    }

    .file-name {
      margin-top: 8px;
      font-size: 14px;
      color: #666;
    }

    .file-list .attachment-item {
        display: flex;
        align-items: center;
        gap: 15px;
        padding: 15px;
        background: #f7f9fc;
        border-radius: 10px;
        margin-bottom: 10px;
        cursor: pointer;
        transition: all 0.3s ease;
      }

    .file-list .attachment-item:hover {
        background: #eef2f7;
        transform: translateX(5px);
      }

    .file-list .attachment-icon {
        width: 40px;
        height: 40px;
        background: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
      }

       .attachment-info {
        flex: 1;
      }

      .attachment-title {
        font-weight: 500;
        margin-bottom: 3px;
      }

      .attachment-size {
        font-size: 12px;
        color: #777;
      }

      .attachment-actions {
        display: flex;
        gap: 10px;
      }

      .attachment-action {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        background: #f0f2f5;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #555;
        transition: all 0.3s ease;
      }

      .attachment-action:hover {
        background: rgb(39, 64, 179);
        color: white;
      }

    @keyframes float {
      0%, 100% {
        transform: translateY(0) scale(1);
      }
      50% {
        transform: translateY(-20px) scale(1.1);
      }
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .form-row {
      display: flex;
      gap: 20px;
    }

    .form-row .form-group {
      flex: 1;
    }

    @media (max-width: 768px) {
      .form-row {
        flex-direction: column;
        gap: 0;
      }
    }

    .input-with-icon {
      position: relative;
    }

    .input-with-icon span {
      position: absolute;
      right: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #666;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <h1>Job Application Greeting</h1>
    <p>Make a great first impression with your job application</p>
  </div>

  <div class="form-container">
    <form id="jobGreetingForm">
      <input type="hidden" id="jobSeekerId" name="jobSeekerId" value="1"> <!-- This would be dynamically set -->

      <div class="form-group">
        <label for="jobId">Job Position</label>
        <select id="jobId" name="jobId" required>
          <option value="" disabled selected>Select the job position</option>
          <option value="1">Software Developer</option>
          <option value="2">UI/UX Designer</option>
          <option value="3">Project Manager</option>
          <option value="4">Marketing Specialist</option>
        </select>
      </div>

      <div class="form-group">
        <label for="cvId">Select Your CV</label>
        <select id="cvId" name="cvId" required>
          <option value="" disabled selected>Choose your CV</option>
          <option value="1">My Professional CV</option>
          <option value="2">Technical Resume</option>
          <option value="3">Creative Portfolio</option>
        </select>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label for="price">Expected Salary (VND)</label>
          <div class="input-with-icon">
            <input type="number" id="price" name="price" placeholder="e.g. 15000000" required>
          </div>
        </div>

        <div class="form-group">
          <label for="expectedDay">Available to Start (Days)</label>
          <input type="number" id="expectedDay" name="expectedDay" placeholder="e.g. 14" required>
        </div>
      </div>

      <div class="form-group">
        <label for="introduction">Introduction Letter</label>
        <textarea id="introduction" name="introduction" placeholder="Introduce yourself and explain why you're a good fit for this position..." required></textarea>
      </div>

      <div class="form-group">
        <label for="attachment">Additional Attachments</label>
        <div class="file-input-container">
          <label class="file-input-label">
            <i class="fas fa-cloud-upload-alt"></i> Choose file(s)
            <input type="file" id="attachment" name="attachment" class="file-input" multiple>
          </label>
        </div>

        <div id="fileList" class="file-list">
          <div class="no-files">No files selected yet</div>
        </div>
      </div>

      <div class="form-footer">
        <button type="submit" class="submit-btn">Submit Application</button>
      </div>
    </form>
  </div>
</div>


<script>
  // Thay thế phần xử lý file input change bằng:
  document.getElementById('attachment').addEventListener('change', function(e) {
    const files = Array.from(e.target.files);
    const fileListContainer = document.getElementById('fileList');

    fileListContainer.innerHTML = files.length === 0
            ? '<div class="no-files">No files selected yet</div>'
            : '';

    files.forEach((file, index) => {
      const fileElement = document.createElement('div');
      fileElement.className = 'attachment-item file-preview';
      fileElement.dataset.index = index;
      fileElement.dataset.fileName = file.name; // Lưu tên file để tham chiếu sau này

      const fileIcon = getFileIcon(file.name);

      fileElement.innerHTML = `
      <!-- Giữ nguyên cấu trúc HTML -->
    `;

      fileListContainer.appendChild(fileElement);
    });

    addFileActionListeners();
  });

  // Cập nhật phần xử lý remove file
  document.querySelectorAll('.remove-file').forEach(button => {
    button.addEventListener('click', function(e) {
      e.stopPropagation();
      const fileItem = this.closest('.attachment-item');
      const index = fileItem.dataset.index;

      // Xóa file khỏi danh sách hiển thị
      fileItem.remove();

      // Cập nhật FileList trong input
      const input = document.getElementById('attachment');
      const files = Array.from(input.files);
      files.splice(index, 1);

      // Tạo DataTransfer để cập nhật files
      const dataTransfer = new DataTransfer();
      files.forEach(file => dataTransfer.items.add(file));
      input.files = dataTransfer.files;

      // Kiểm tra nếu không còn file
      if (input.files.length === 0) {
        document.getElementById('fileList').innerHTML = '<div class="no-files">No files selected yet</div>';
      }
    });
  });
</script>


<%--<script>--%>
<%--  // Function to format file size--%>
<%--  function formatFileSize(bytes) {--%>
<%--    if (bytes === 0) return '0 Bytes';--%>

<%--    const k = 1024;--%>
<%--    const sizes = ['Bytes', 'KB', 'MB', 'GB'];--%>
<%--    const i = Math.floor(Math.log(bytes) / Math.log(k));--%>

<%--    return parseFloat((bytes / Math.pow(k, i)).toFixed(1)) + ' ' + sizes[i];--%>
<%--  }--%>

<%--  // Function to get appropriate icon for file type--%>
<%--  function getFileIcon(fileName) {--%>
<%--    const extension = fileName.split('.').pop().toLowerCase();--%>
<%--    let iconClass = 'fa-file';--%>

<%--    if (['jpg', 'jpeg', 'png', 'gif', 'svg', 'webp'].includes(extension)) {--%>
<%--      iconClass = 'fa-file-image';--%>
<%--    } else if (['pdf'].includes(extension)) {--%>
<%--      iconClass = 'fa-file-pdf';--%>
<%--    } else if (['doc', 'docx'].includes(extension)) {--%>
<%--      iconClass = 'fa-file-word';--%>
<%--    } else if (['xls', 'xlsx'].includes(extension)) {--%>
<%--      iconClass = 'fa-file-excel';--%>
<%--    } else if (['ppt', 'pptx'].includes(extension)) {--%>
<%--      iconClass = 'fa-file-powerpoint';--%>
<%--    } else if (['zip', 'rar', '7z'].includes(extension)) {--%>
<%--      iconClass = 'fa-file-archive';--%>
<%--    } else if (['txt', 'md'].includes(extension)) {--%>
<%--      iconClass = 'fa-file-alt';--%>
<%--    }--%>

<%--    return iconClass;--%>
<%--  }--%>

<%--  // Handle file input change--%>
<%--  document.getElementById('attachment').addEventListener('change', function(e) {--%>
<%--    const files = Array.from(e.target.files);--%>
<%--    const fileListContainer = document.getElementById('fileList');--%>

<%--    if (files.length === 0) {--%>
<%--      fileListContainer.innerHTML = '<div class="no-files">No files selected yet</div>';--%>
<%--      return;--%>
<%--    }--%>

<%--    fileListContainer.innerHTML = '';--%>

<%--    files.forEach((file, index) => {--%>
<%--      const fileElement = document.createElement('div'); // Đảm bảo dùng const/let--%>

<%--      if (!fileElement || !('dataset' in fileElement)) {--%>
<%--        console.error('Invalid element or dataset not supported');--%>
<%--        return;--%>
<%--      }--%>

<%--      fileElement.className = 'attachment-item file-preview';--%>
<%--      fileElement.setAttribute('data-index', index); // Cách thay thế an toàn hơn--%>

<%--// Hoặc nếu muốn dùng dataset:--%>
<%--      if (fileElement.dataset) {--%>
<%--        fileElement.dataset.index = index;--%>
<%--      }--%>

<%--      const fileIcon = getFileIcon(file.name);--%>

<%--      fileElement.innerHTML = `--%>
<%--                    <div class="attachment-icon">--%>
<%--                        <i class="fas ${fileIcon}"></i>--%>
<%--                    </div>--%>
<%--                    <div class="attachment-info">--%>
<%--                        <div class="attachment-title">${file.name}</div>--%>
<%--                        <div class="attachment-size">${formatFileSize(file.size)}</div>--%>
<%--                    </div>--%>
<%--                    <div class="attachment-actions">--%>
<%--                        <div class="attachment-action preview-file" title="Preview">--%>
<%--                            <i class="fas fa-eye"></i>--%>
<%--                        </div>--%>
<%--                        <div class="attachment-action remove-file" title="Remove">--%>
<%--                            <i class="fas fa-times"></i>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                `;--%>

<%--      fileListContainer.appendChild(fileElement);--%>
<%--    });--%>

<%--    // Add event listeners for preview and remove buttons--%>
<%--    addFileActionListeners();--%>
<%--  });--%>

<%--  // Add event listeners for file actions--%>
<%--  function addFileActionListeners() {--%>
<%--    // Remove file action--%>
<%--    document.querySelectorAll('.remove-file').forEach(button => {--%>
<%--      button.addEventListener('click', function(e) {--%>
<%--        e.stopPropagation();--%>
<%--        const fileItem = this.closest('.attachment-item');--%>
<%--        fileItem.style.opacity = '0';--%>
<%--        setTimeout(() => {--%>
<%--          fileItem.remove();--%>

<%--          // Check if there are no more files--%>
<%--          const fileListContainer = document.getElementById('fileList');--%>
<%--          if (fileListContainer.children.length === 0) {--%>
<%--            fileListContainer.innerHTML = '<div class="no-files">No files selected yet</div>';--%>
<%--          }--%>
<%--        }, 300);--%>
<%--      });--%>
<%--    });--%>

<%--    // Preview file action (just a placeholder - in a real app, you'd show a preview)--%>
<%--    document.querySelectorAll('.preview-file').forEach(button => {--%>
<%--      button.addEventListener('click', function(e) {--%>
<%--        e.stopPropagation();--%>
<%--        const fileItem = this.closest('.attachment-item');--%>
<%--        const fileName = fileItem.querySelector('.attachment-title').textContent;--%>
<%--        alert(`Preview functionality would open ${fileName} here`);--%>
<%--        // In a real implementation, you would show a modal with file preview--%>
<%--      });--%>
<%--    });--%>
<%--  }--%>

<%--  document.getElementById('jobGreetingForm').addEventListener('submit', function(e) {--%>
<%--    e.preventDefault();--%>

<%--    // Animation for submission--%>
<%--    const btn = document.querySelector('.submit-btn');--%>
<%--    btn.textContent = 'Submitting...';--%>
<%--    btn.disabled = true;--%>

<%--    // Simulate form submission--%>
<%--    setTimeout(() => {--%>
<%--      alert('Your application has been submitted successfully!');--%>
<%--      btn.textContent = 'Submit Application';--%>
<%--      btn.disabled = false;--%>
<%--      // Uncomment in real implementation--%>
<%--      // this.reset();--%>
<%--      // document.getElementById('fileList').innerHTML = '<div class="no-files">No files selected yet</div>';--%>
<%--    }, 2000);--%>

<%--    // In a real implementation, you would collect all form data including files--%>
<%--    // const formData = new FormData(this);--%>
<%--    // fetch('/api/job-greetings', {--%>
<%--    //     method: 'POST',--%>
<%--    //     body: formData--%>
<%--    // })--%>
<%--    // .then(response => response.json())--%>
<%--    // .then(data => {--%>
<%--    //     // Handle success--%>
<%--    // })--%>
<%--    // .catch(error => {--%>
<%--    //     // Handle error--%>
<%--    // });--%>
<%--  });--%>
<%--</script>--%>




<%--<script>--%>
<%--  document.getElementById('attachment').addEventListener('change', function(e) {--%>
<%--    const fileCount = e.target.files.length;--%>
<%--    document.getElementById('fileName').textContent = fileCount > 0--%>
<%--            ? fileCount === 1--%>
<%--                    ? e.target.files[0].name--%>
<%--                    : fileCount + ' files selected'--%>
<%--            : 'No file chosen';--%>
<%--  });--%>

<%--  document.getElementById('jobGreetingForm').addEventListener('submit', function(e) {--%>
<%--    e.preventDefault();--%>

<%--    // Animation for submission--%>
<%--    const btn = document.querySelector('.submit-btn');--%>
<%--    btn.textContent = 'Submitting...';--%>
<%--    btn.disabled = true;--%>

<%--    // Simulate form submission--%>
<%--    setTimeout(() => {--%>
<%--      alert('Your application has been submitted successfully!');--%>
<%--      btn.textContent = 'Submit Application';--%>
<%--      btn.disabled = false;--%>
<%--      // Uncomment in actual implementation:--%>
<%--      // this.reset();--%>
<%--    }, 2000);--%>

<%--    // In a real implementation, you would send the form data to your server--%>
<%--    // const formData = new FormData(this);--%>
<%--    // fetch('/api/job-greetings', {--%>
<%--    //     method: 'POST',--%>
<%--    //     body: formData--%>
<%--    // })--%>
<%--    // .then(response => response.json())--%>
<%--    // .then(data => {--%>
<%--    //     // Handle success--%>
<%--    // })--%>
<%--    // .catch(error => {--%>
<%--    //     // Handle error--%>
<%--    // });--%>
<%--  });--%>
<%--</script>--%>
</body>
</html>