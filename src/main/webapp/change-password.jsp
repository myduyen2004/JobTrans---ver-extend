<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi Mật Khẩu | Hệ Thống Quản Lý</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-gradient: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            --secondary-color: #f5f7ff;
            --error-color: #ff5252;
            --success-color: #4caf50;
            --warning-color: #ff9800;
            --border-radius: 8px;
            --box-shadow: 0 10px 25px rgba(21, 32, 112, 0.2);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            background-image:
                    radial-gradient(at 10% 10%, rgba(21, 32, 112, 0.1) 0px, transparent 50%),
                    radial-gradient(at 90% 90%, rgba(39, 64, 179, 0.1) 0px, transparent 50%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 800px;
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
            animation: fadeIn 0.5s ease;
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

        .header {
            background: var(--primary-gradient);
            padding: 25px 30px;
            color: white;
            text-align: center;
            position: relative;
        }

        .header h2 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .header p {
            font-size: 14px;
            opacity: 0.8;
        }

        .header-icon {
            height: 80px;
            width: 80px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            color: rgb(39, 64, 179);
            font-size: 32px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .form-container {
            padding: 30px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #555;
            font-size: 14px;
        }

        .input-group {
            position: relative;
        }

        .input-group input {
            width: 100%;
            padding: 14px 15px 14px 40px;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            font-size: 15px;
            transition: var(--transition);
        }

        .input-group input:focus {
            border-color: rgb(39, 64, 179);
            box-shadow: 0 0 0 3px rgba(39, 64, 179, 0.1);
            outline: none;
        }

        .input-icon {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            color: #aaa;
        }

        .password-toggle {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            color: #aaa;
            cursor: pointer;
            transition: var(--transition);
        }

        .password-toggle:hover {
            color: rgb(39, 64, 179);
        }

        .password-strength {
            height: 5px;
            margin-top: 8px;
            border-radius: 5px;
            background-color: #eee;
            overflow: hidden;
        }

        .password-strength-bar {
            height: 100%;
            width: 0;
            transition: var(--transition);
        }

        .strength-text {
            font-size: 12px;
            margin-top: 5px;
            text-align: right;
        }

        .message {
            padding: 12px 15px;
            margin-bottom: 20px;
            border-radius: var(--border-radius);
            font-size: 14px;
            display: flex;
            align-items: center;
            animation: slideDown 0.3s ease;
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .message i {
            margin-right: 10px;
            font-size: 16px;
        }

        .error-message {
            background-color: rgba(255, 82, 82, 0.1);
            color: var(--error-color);
            border-left: 4px solid var(--error-color);
        }

        .success-message {
            background-color: rgba(76, 175, 80, 0.1);
            color: var(--success-color);
            border-left: 4px solid var(--success-color);
        }

        .warning-message {
            background-color: rgba(255, 152, 0, 0.1);
            color: var(--warning-color);
            border-left: 4px solid var(--warning-color);
        }

        .password-rules {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: var(--border-radius);
            margin-bottom: 20px;
            font-size: 13px;
        }

        .password-rules h4 {
            margin-bottom: 10px;
            color: #555;
        }

        .rule-item {
            margin-bottom: 5px;
            display: flex;
            align-items: center;
        }

        .rule-item i {
            margin-right: 8px;
            width: 18px;
            text-align: center;
        }

        .rule-valid {
            color: var(--success-color);
        }

        .rule-invalid {
            color: #aaa;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 15px;
            background: var(--primary-gradient);
            color: white;
            border: none;
            border-radius: var(--border-radius);
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .btn:hover {
            box-shadow: 0 5px 15px rgba(21, 32, 112, 0.3);
        }

        .btn:active {
            transform: translateY(2px);
        }

        .btn-ripple {
            position: absolute;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.3);
            transform: scale(0);
            animation: ripple 0.6s linear;
        }

        @keyframes ripple {
            to {
                transform: scale(2.5);
                opacity: 0;
            }
        }

        .btn-cancel {
            background: transparent;
            color: #777;
            border: 1px solid #ddd;
            margin-top: 10px;
        }

        .btn-cancel:hover {
            background: #f5f5f5;
            box-shadow: none;
        }

        .footer {
            margin-top: 20px;
            text-align: center;
            font-size: 13px;
            color: #777;
        }

        .footer a {
            color: rgb(39, 64, 179);
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        /* Responsive */
        @media (max-width: 480px) {
            .container {
                box-shadow: none;
            }

            .header {
                padding: 20px;
            }

            .form-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="header-icon">
            <i class="fas fa-lock"></i>
        </div>
        <h2>Đổi Mật Khẩu</h2>
        <p>Vui lòng nhập thông tin để đổi mật khẩu của bạn</p>
    </div>

    <div class="form-container">
        <%-- Hiển thị thông báo lỗi hoặc thành công nếu có --%>
        <%
            String error = request.getParameter("error");
            String success = request.getParameter("success");
            String warning = request.getParameter("warning");

            if (error != null && error.equals("1")) {
        %>
        <div class="message error-message">
            <i class="fas fa-times-circle"></i>
            <span>Mật khẩu hiện tại không chính xác!</span>
        </div>
        <% } else if (error != null && error.equals("2")) { %>
        <div class="message error-message">
            <i class="fas fa-times-circle"></i>
            <span>Mật khẩu mới và xác nhận mật khẩu không khớp!</span>
        </div>
        <% } else if (error != null && error.equals("3")) { %>
        <div class="message error-message">
            <i class="fas fa-times-circle"></i>
            <span>Mật khẩu mới không đáp ứng các yêu cầu bảo mật!</span>
        </div>
        <% } else if (success != null && success.equals("1")) { %>
        <div class="message success-message">
            <i class="fas fa-check-circle"></i>
            <span>Mật khẩu đã được thay đổi thành công!</span>
        </div>
        <% } else if (warning != null && warning.equals("1")) { %>
        <div class="message warning-message">
            <i class="fas fa-exclamation-triangle"></i>
            <span>Mật khẩu mới giống với mật khẩu cũ. Vui lòng chọn mật khẩu khác.</span>
        </div>
        <% } %>

        <form action="changePasswordProcess.jsp" method="post" id="changePasswordForm">
            <div class="form-group">
                <label for="currentPassword">Mật khẩu hiện tại</label>
                <div class="input-group">
                    <i class="fas fa-key input-icon"></i>
                    <input type="password" id="currentPassword" name="currentPassword" required>
                    <i class="fas fa-eye password-toggle" data-target="currentPassword"></i>
                </div>
            </div>

            <div class="form-group">
                <label for="newPassword">Mật khẩu mới</label>
                <div class="input-group">
                    <i class="fas fa-lock input-icon"></i>
                    <input type="password" id="newPassword" name="newPassword" required>
                    <i class="fas fa-eye password-toggle" data-target="newPassword"></i>
                </div>
                <div class="password-strength">
                    <div class="password-strength-bar" id="strengthBar"></div>
                </div>
                <div class="strength-text" id="strengthText">Chưa nhập mật khẩu</div>
            </div>

            <div class="password-rules" id="passwordRules">
                <h4>Mật khẩu mới phải có:</h4>
                <div class="rule-item" id="lengthRule">
                    <i class="fas fa-circle rule-invalid"></i>
                    <span>Ít nhất 8 ký tự</span>
                </div>
                <div class="rule-item" id="uppercaseRule">
                    <i class="fas fa-circle rule-invalid"></i>
                    <span>Ít nhất 1 chữ hoa (A-Z)</span>
                </div>
                <div class="rule-item" id="lowercaseRule">
                    <i class="fas fa-circle rule-invalid"></i>
                    <span>Ít nhất 1 chữ thường (a-z)</span>
                </div>
                <div class="rule-item" id="numberRule">
                    <i class="fas fa-circle rule-invalid"></i>
                    <span>Ít nhất 1 số (0-9)</span>
                </div>
                <div class="rule-item" id="specialRule">
                    <i class="fas fa-circle rule-invalid"></i>
                    <span>Ít nhất 1 ký tự đặc biệt (!@#$%^&*)</span>
                </div>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Xác nhận mật khẩu mới</label>
                <div class="input-group">
                    <i class="fas fa-lock input-icon"></i>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                    <i class="fas fa-eye password-toggle" data-target="confirmPassword"></i>
                </div>
            </div>

            <button type="submit" class="btn" id="submitBtn">Xác nhận thay đổi</button>
            <button type="button" class="btn btn-cancel" onclick="window.location.href='index.jsp'">Hủy bỏ</button>
        </form>

        <div class="footer">
            <p>Quay lại <a href="dashboard.jsp">Trang chủ</a> | <a href="help.jsp">Trợ giúp</a></p>
        </div>
    </div>
</div>

<script>
    // Hiệu ứng nút ripple
    document.querySelector('.btn').addEventListener('click', function(e) {
        const btnRect = this.getBoundingClientRect();
        const circle = document.createElement('span');
        const diameter = Math.max(btnRect.width, btnRect.height);

        circle.style.width = circle.style.height = `${diameter}px`;
        circle.style.left = `${e.clientX - btnRect.left - diameter/2}px`;
        circle.style.top = `${e.clientY - btnRect.top - diameter/2}px`;
        circle.classList.add('btn-ripple');

        this.appendChild(circle);

        setTimeout(() => {
            circle.remove();
        }, 600);
    });

    // Ẩn/hiện mật khẩu
    document.querySelectorAll('.password-toggle').forEach(toggle => {
        toggle.addEventListener('click', function() {
            const targetId = this.getAttribute('data-target');
            const inputField = document.getElementById(targetId);

            if (inputField.type === 'password') {
                inputField.type = 'text';
                this.classList.remove('fa-eye');
                this.classList.add('fa-eye-slash');
            } else {
                inputField.type = 'password';
                this.classList.remove('fa-eye-slash');
                this.classList.add('fa-eye');
            }
        });
    });

    // Kiểm tra độ mạnh mật khẩu
    const strengthBar = document.getElementById('strengthBar');
    const strengthText = document.getElementById('strengthText');
    const newPassword = document.getElementById('newPassword');

    // Quy tắc mật khẩu
    const lengthRule = document.getElementById('lengthRule');
    const uppercaseRule = document.getElementById('uppercaseRule');
    const lowercaseRule = document.getElementById('lowercaseRule');
    const numberRule = document.getElementById('numberRule');
    const specialRule = document.getElementById('specialRule');

    newPassword.addEventListener('input', function() {
        const password = this.value;
        const strength = calculatePasswordStrength(password);

        // Cập nhật thanh độ mạnh
        strengthBar.style.width = `${strength}%`;

        // Đặt màu cho thanh độ mạnh
        if (strength < 20) {
            strengthBar.style.backgroundColor = '#ff5252';
            strengthText.textContent = 'Rất yếu';
            strengthText.style.color = '#ff5252';
        } else if (strength < 40) {
            strengthBar.style.backgroundColor = '#ff9800';
            strengthText.textContent = 'Yếu';
            strengthText.style.color = '#ff9800';
        } else if (strength < 60) {
            strengthBar.style.backgroundColor = '#ffd600';
            strengthText.textContent = 'Trung bình';
            strengthText.style.color = '#ffd600';
        } else if (strength < 80) {
            strengthBar.style.backgroundColor = '#4caf50';
            strengthText.textContent = 'Mạnh';
            strengthText.style.color = '#4caf50';
        } else {
            strengthBar.style.backgroundColor = '#2e7d32';
            strengthText.textContent = 'Rất mạnh';
            strengthText.style.color = '#2e7d32';
        }

        // Cập nhật các quy tắc
        updateRules(password);
    });

    function calculatePasswordStrength(password) {
        if (!password) return 0;

        let strength = 0;

        // Kiểm tra độ dài
        if (password.length >= 8) strength += 20;
        else strength += (password.length * 2);

        // Kiểm tra chữ hoa
        if (/[A-Z]/.test(password)) strength += 20;

        // Kiểm tra chữ thường
        if (/[a-z]/.test(password)) strength += 20;

        // Kiểm tra số
        if (/[0-9]/.test(password)) strength += 20;

        // Kiểm tra ký tự đặc biệt
        if (/[^A-Za-z0-9]/.test(password)) strength += 20;

        return Math.min(strength, 100);
    }

    function updateRules(password) {
        // Cập nhật quy tắc độ dài
        if (password.length >= 8) {
            updateRuleStatus(lengthRule, true);
        } else {
            updateRuleStatus(lengthRule, false);
        }

        // Cập nhật quy tắc chữ hoa
        if (/[A-Z]/.test(password)) {
            updateRuleStatus(uppercaseRule, true);
        } else {
            updateRuleStatus(uppercaseRule, false);
        }

        // Cập nhật quy tắc chữ thường
        if (/[a-z]/.test(password)) {
            updateRuleStatus(lowercaseRule, true);
        } else {
            updateRuleStatus(lowercaseRule, false);
        }

        // Cập nhật quy tắc số
        if (/[0-9]/.test(password)) {
            updateRuleStatus(numberRule, true);
        } else {
            updateRuleStatus(numberRule, false);
        }

        // Cập nhật quy tắc ký tự đặc biệt
        if (/[^A-Za-z0-9]/.test(password)) {
            updateRuleStatus(specialRule, true);
        } else {
            updateRuleStatus(specialRule, false);
        }
    }

    function updateRuleStatus(ruleElement, isValid) {
        const icon = ruleElement.querySelector('i');

        if (isValid) {
            icon.classList.remove('fa-circle', 'rule-invalid');
            icon.classList.add('fa-check-circle', 'rule-valid');
        } else {
            icon.classList.remove('fa-check-circle', 'rule-valid');
            icon.classList.add('fa-circle', 'rule-invalid');
        }
    }

    // Kiểm tra form trước khi gửi
    document.getElementById('changePasswordForm').addEventListener('submit', function(event) {
        const currentPassword = document.getElementById('currentPassword').value;
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        // Kiểm tra mật khẩu hiện tại không trống
        if (!currentPassword) {
            event.preventDefault();
            showError("Vui lòng nhập mật khẩu hiện tại");
            return;
        }

        // Kiểm tra mật khẩu mới phải khác mật khẩu hiện tại
        if (newPassword === currentPassword) {
            event.preventDefault();
            showError("Mật khẩu mới phải khác mật khẩu hiện tại");
            return;
        }

        // Kiểm tra xác nhận mật khẩu
        if (newPassword !== confirmPassword) {
            event.preventDefault();
            showError("Mật khẩu mới và xác nhận mật khẩu không khớp");
            return;
        }

        // Kiểm tra độ mạnh mật khẩu
        const strength = calculatePasswordStrength(newPassword);
        if (strength < 60) {
            event.preventDefault();
            showError("Mật khẩu mới không đủ mạnh. Vui lòng đáp ứng tất cả các yêu cầu.");
            return;
        }

        // Kiểm tra các quy tắc
        if (!(/[A-Z]/.test(newPassword) && /[a-z]/.test(newPassword) &&
            /[0-9]/.test(newPassword) && /[^A-Za-z0-9]/.test(newPassword) &&
            newPassword.length >= 8)) {
            event.preventDefault();
            showError("Mật khẩu mới không đáp ứng các yêu cầu bảo mật");
            return;
        }
    });

    function showError(message) {
        // Kiểm tra xem đã có thông báo lỗi chưa
        const existingError = document.querySelector('.error-message');
        if (existingError) {
            existingError.remove();
        }

        // Tạo thông báo lỗi mới
        const errorDiv = document.createElement('div');
        errorDiv.className = 'message error-message';
        errorDiv.innerHTML = `<i class="fas fa-times-circle"></i><span>${message}</span>`;

        // Thêm vào đầu form container
        const formContainer = document.querySelector('.form-container');
        formContainer.insertBefore(errorDiv, formContainer.firstChild);

        // Cuộn lên đầu
        window.scrollTo(0, 0);
    }
</script>
</body>
</html>