<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/12/2025
  Time: 9:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jobtrans.utils.CookieUtils" %>
<%
    String email = CookieUtils.get("cookemail", request);
    String password = CookieUtils.get("cookpass", request);
    String rememberVal = CookieUtils.get("cookrem", request);
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobTrans - Đăng nhập</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            overflow-x: hidden;
        }

        .login-container {
            width: 100%;
            min-height: 100vh;
            position: relative;
            background: linear-gradient(135deg, #6484F9 0%, #1B2A78 72%);
            display: flex;
            justify-content: flex-end; /* Căn phải */
            align-items: center;
            padding-right: 100px; /* Khoảng cách từ phải */
            overflow: hidden;
        }

        /* Animated background */
        .login-container::before {
            content: '';
            position: absolute;
            width: 120%;
            height: 120%;
            top: -10%;
            left: -10%;
            background:
                    radial-gradient(circle at 20% 30%, rgba(255, 255, 255, 0.1) 0%, transparent 8%),
                    radial-gradient(circle at 75% 20%, rgba(255, 255, 255, 0.1) 0%, transparent 10%),
                    radial-gradient(circle at 40% 70%, rgba(255, 255, 255, 0.08) 0%, transparent 12%);
            animation: backgroundShift 25s infinite alternate ease-in-out;
            z-index: 0;
        }

        /* Floating particles */
        .particles {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            overflow: hidden;
            z-index: 1;
        }

        .particle {
            position: absolute;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            pointer-events: none;
        }

        .particle:nth-child(1) {
            width: 15px;
            height: 15px;
            top: 20%;
            left: 10%;
            animation: float 20s infinite linear;
        }

        .particle:nth-child(2) {
            width: 20px;
            height: 20px;
            top: 70%;
            left: 20%;
            animation: float 15s infinite linear;
        }

        .particle:nth-child(3) {
            width: 10px;
            height: 10px;
            top: 40%;
            left: 30%;
            animation: float 25s infinite linear;
        }

        .particle:nth-child(4) {
            width: 18px;
            height: 18px;
            top: 80%;
            left: 80%;
            animation: float 18s infinite linear;
        }

        .particle:nth-child(5) {
            width: 12px;
            height: 12px;
            top: 30%;
            left: 60%;
            animation: float 22s infinite linear;
        }

        @keyframes float {
            0% {
                transform: translate(0, 0) rotate(0deg);
                opacity: 0.2;
            }
            25% {
                opacity: 0.5;
            }
            50% {
                transform: translate(100px, 100px) rotate(180deg);
                opacity: 0.3;
            }
            75% {
                opacity: 0.6;
            }
            100% {
                transform: translate(0, 0) rotate(360deg);
                opacity: 0.2;
            }
        }

        @keyframes backgroundShift {
            0% {
                transform: scale(1) rotate(0deg);
            }
            50% {
                transform: scale(1.05) rotate(1deg);
            }
            100% {
                transform: scale(1) rotate(0deg);
            }
        }

        .login-form-container {
            width: 430px;
            height: 500px;
            padding: 40px 30px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            position: relative;
            top: -50px; /* Nâng form lên cao hơn */
            z-index: 10;
            animation: formAppear 1s forwards ease-out;
            transform: translateY(30px);
            opacity: 0;
            backdrop-filter: blur(5px);
        }

        @keyframes formAppear {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .logo {
            text-align: center;
            margin-bottom: 30px;
            animation: logoReveal 1.5s forwards ease-out;
            opacity: 0;
            transform: scale(0.8);
        }

        @keyframes logoReveal {
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .logo-job {
            color: black;
            font-size: 28px;
            font-style: italic;
            font-weight: 900;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .logo-trans {
            color: #6383F8;
            font-size: 28px;
            font-weight: 900;
            text-shadow: 0 2px 4px rgba(99, 131, 248, 0.3);
        }

        .input-container {
            position: relative;
            margin-bottom: 25px;
            animation: slideUp 0.6s forwards ease-out;
            opacity: 0;
            transform: translateY(20px);
        }

        .input-container:nth-child(2) {
            animation-delay: 0.2s;
        }

        .input-container:nth-child(3) {
            animation-delay: 0.4s;
        }

        @keyframes slideUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .input-field {
            width: 100%;
            height: 58px;
            background: white;
            border-radius: 12px;
            border: 1px solid rgba(0, 0, 0, 0.20);
            padding: 15px 15px 15px 45px; /* Thêm padding trái để chứa icon */
            font-size: 14px;
            transition: all 0.3s ease;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .input-field:focus {
            border-color: #6383F8;
            outline: none;
            box-shadow: 0 0 0 3px rgba(99, 131, 248, 0.3), inset 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .input-label {
            position: absolute;
            left: 45px; /* Căn chỉnh label với vị trí text sau icon */
            top: 50%;
            transform: translateY(-50%);
            color: rgba(0, 0, 0, 0.5);
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
            pointer-events: none;
            background: transparent;
        }

        .input-field:focus + .input-label,
        .input-field:not(:placeholder-shown) + .input-label {
            top: 12px;
            left: 45px;
            font-size: 11px;
            color: #6383F8;
            background: white;
            padding: 0 5px;
            font-weight: 700;
        }

        /* Icon styling */
        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6383F8;
            font-size: 18px;
            transition: all 0.3s ease;
        }

        .input-field:focus ~ .input-icon {
            color: #1B2A78;
            transform: translateY(-50%) scale(1.1);
        }

        /* Password visibility toggle */
        .toggle-password {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6383F8;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.2s ease;
        }

        .toggle-password:hover {
            color: #1B2A78;
            transform: translateY(-50%) scale(1.1);
        }

        /* Remember password checkbox */
        .remember-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            animation: fadeIn 0.8s forwards;
            animation-delay: 0.6s;
            opacity: 0;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }

        .remember-container input[type="checkbox"] {
            width: 18px;
            height: 18px;
            margin-right: 8px;
            accent-color: #6383F8;
            cursor: pointer;
        }

        .remember-container label {
            color: #333;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: color 0.2s ease;
        }

        .remember-container label:hover {
            color: #6383F8;
        }

        /* Login button */
        .login-button {
            width: 100%;
            height: 50px;
            background: linear-gradient(90deg, #6787FE 0%, #5673e0 100%);
            border-radius: 25px;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            margin: 10px 0 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            box-shadow: 0 8px 15px rgba(103, 135, 254, 0.3);
            animation: fadeIn 0.8s forwards;
            animation-delay: 0.8s;
            opacity: 0;
            overflow: hidden;
            position: relative;
        }

        .login-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.6s ease;
        }

        .login-button:hover {
            background: linear-gradient(90deg, #5673e0 0%, #4562cf 100%);
            transform: translateY(-2px);
            box-shadow: 0 12px 20px rgba(103, 135, 254, 0.4);
        }

        .login-button:hover::before {
            left: 100%;
        }

        .login-button:active {
            transform: translateY(1px);
            box-shadow: 0 5px 10px rgba(103, 135, 254, 0.4);
        }

        /* Helper links */
        .helper-links {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            font-size: 13px;
            font-weight: 500;
            animation: fadeIn 0.8s forwards;
            animation-delay: 1s;
            opacity: 0;
        }

        .forgot-password, .google-login {
            color: #333;
            text-decoration: none;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 5px;
            position: relative;
        }

        .forgot-password::after, .google-login::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -2px;
            left: 0;
            background-color: #6383F8;
            transition: width 0.3s ease;
        }

        .forgot-password:hover, .google-login:hover {
            color: #6383F8;
        }

        .forgot-password:hover::after, .google-login:hover::after {
            width: 100%;
        }

        /* Password validation message */
        .password-validation {
            display: none;
            color: #ff3860;
            font-size: 12px;
            margin-top: 5px;
            padding-left: 10px;
            transition: all 0.3s ease;
            opacity: 0;
            transform: translateY(-5px);
        }

        .password-validation.show {
            display: block;
            animation: slideDown 0.3s forwards;
        }

        @keyframes slideDown {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .password-validation.valid {
            color: #23d160;
        }

        /* Google button */
        .google-login .fa-google {
            color: #DB4437;
            transition: transform 0.3s ease;
        }

        .google-login:hover .fa-google {
            transform: rotate(360deg);
        }

        /* Helper links */
        .helper-links {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            font-size: 12px;
            font-weight: 900;
        }

        /* Welcome text */
        .welcome-text {
            position: absolute;
            width: 488px;
            left: 204px;
            top: 318px;
            color: white;
            z-index: 5;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            animation: textReveal 1.5s forwards ease-out;
            opacity: 0;
            transform: translateX(-30px);
        }

        @keyframes textReveal {
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .welcome-text h1 {
            font-size: 40px;
            font-weight: 900;
            margin-bottom: 20px;
            position: relative;
        }

        .welcome-text h1::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: -10px;
            width: 80px;
            height: 4px;
            background: linear-gradient(90deg, #fff, rgba(255,255,255,0.5));
            border-radius: 2px;
        }

        .welcome-text p {
            font-size: 18px;
            font-weight: 700;
            line-height: 1.6;
            opacity: 0.9;
        }

        /* Glow effect */
        .login-form-container::after {
            content: '';
            position: absolute;
            top: -20px;
            left: -20px;
            right: -20px;
            bottom: -20px;
            background: radial-gradient(
                    circle at 50% 50%,
                    rgba(99, 131, 248, 0.2),
                    transparent 70%
            );
            z-index: -1;
            border-radius: 30px;
            animation: glow 3s infinite alternate ease-in-out;
        }
        .login-link {
            color: #6383F8;
            text-decoration: none;
            font-weight: 700;
            transition: all 0.3s ease;
            position: relative;
        }

        .login-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -2px;
            left: 0;
            background-color: #6383F8;
            transition: width 0.3s ease;
        }

        .login-link:hover {
            color: #5673e0;
        }

        .login-link:hover::after {
            width: 100%;
        }

        @keyframes glow {
            0% {
                opacity: 0.5;
                transform: scale(1);
            }
            100% {
                opacity: 0.8;
                transform: scale(1.05);
            }
        }

        /* Responsive adjustments */
        @media (max-width: 1200px) {
            .login-container {
                padding-right: 50px;
            }

            .welcome-text {
                left: 100px;
            }
        }

        @media (max-width: 992px) {
            .login-container {
                justify-content: center;
                padding-right: 0;
            }

            .login-form-container {
                top: 0;
                margin-top: 50px;
            }

            .welcome-text {
                width: 80%;
                left: 10%;
                text-align: center;
                top: 100px;
            }

            .welcome-text h1::after {
                left: 50%;
                transform: translateX(-50%);
            }
        }

        @media (max-width: 768px) {
            .login-form-container {
                width: 90%;
                max-width: 400px;
            }

            .welcome-text {
                width: 90%;
                left: 5%;
                top: 50px;
            }

            .welcome-text h1 {
                font-size: 32px;
            }

            .welcome-text p {
                font-size: 16px;
            }
        }

        @media (max-width: 480px) {
            .welcome-text h1 {
                font-size: 28px;
            }

            .helper-links {
                flex-direction: column;
                gap: 15px;
                align-items: center;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <!-- Animated particles -->
    <div class="particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>

    <!-- Welcome text section -->
    <div class="welcome-text">
        <h1>Chào Mừng Bạn Đến Với<br>JobTrans</h1>
        <p>Nền Tảng Cho Thuê & Tìm Việc Uy Tín - <br>Giúp Bạn Tiết Kiệm Thời Gian & Chi Phí</p>
    </div>

    <!-- Login form -->
    <div class="login-form-container">
        <!-- Logo -->
        <div class="logo">
            <span class="logo-job">Job</span><span class="logo-trans">Trans</span>
        </div>

        <!-- Form -->
        <form id="loginForm" novalidate method="POST" action="login">
            <div class="input-container">
                <input type="text" class="input-field" id="email" name="email" placeholder=" " value="<%=email%>" required>
                <label for="email" class="input-label">Email đăng nhập</label>
                <i class="fas fa-user input-icon"></i>
            </div>

            <div class="input-container">
                <input type="password" class="input-field" id="password" name="password" placeholder=" " value="<%=password%>" required>
                <label for="password" class="input-label">Mật khẩu</label>
                <i class="fas fa-lock input-icon"></i>
                <i class="far fa-eye toggle-password" id="togglePassword"></i>
                <div class="password-validation" id="passwordValidation">Mật khẩu phải có ít nhất 8 ký tự</div>
            </div>

            <div class="remember-container">
                <input type="checkbox" id="remember" name="remember" <%= "1".equals(rememberVal.trim()) ? "checked=\"checked\"" : "" %>>
                <label for="remember">Nhớ mật khẩu</label>
            </div>

            <button type="submit" class="login-button">
                <i class="fas fa-sign-in-alt"></i> Đăng nhập
            </button>

            <div class="helper-links">
                <a href="#" class="forgot-password">
                    <i class="fas fa-key"></i> Quên mật khẩu?
                </a>
                <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/JobTrans/login&response_type=code&client_id=907520357121-f3uva6g9h5qq1anbsdfatm21bf1pfu8p.apps.googleusercontent.com&approval_prompt=force"
                   class="google-login">
                    <i class="fab fa-google"></i> Đăng nhập bằng Google
                </a>
            </div>
            <div class="helper-links">
                Chưa có tài khoản? <a href="register.jsp" class="login-link">Đăng kí ngay</a>
            </div>
        </form>

    </div>
    <%@include file="includes/toast-notification.jsp"%>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const passwordField = document.getElementById('password');
        const togglePassword = document.getElementById('togglePassword');
        const passwordValidation = document.getElementById('passwordValidation');
        const loginForm = document.getElementById('loginForm');

        // Toggle password visibility
        togglePassword.addEventListener('click', function() {
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);

            // Toggle eye icon
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });

        // Password validation
        passwordField.addEventListener('input', function() {
            passwordValidation.classList.add('show');

            if (this.value.length >= 8) {
                passwordValidation.textContent = "Mật khẩu hợp lệ";
                passwordValidation.classList.add('valid');
            } else {
                passwordValidation.textContent = "Mật khẩu phải có ít nhất 8 ký tự";
                passwordValidation.classList.remove('valid');
            }
        });

        // Form submission
        loginForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const username = document.getElementById('username').value;
            const password = passwordField.value;
            const remember = document.getElementById('remember').checked;

            // Validate password length
            if (password.length < 8) {
                passwordValidation.classList.add('show');
                return;
            }

            // Add loading state to button
            const loginButton = document.querySelector('.login-button');
            const originalButtonText = loginButton.innerHTML;
            loginButton.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xác thực...';
            loginButton.disabled = true;

            // Simulate loading (would be replaced by real authentication)
            setTimeout(() => {
                // Save to localStorage if remember is checked
                if (remember) {
                    localStorage.setItem('savedUsername', username);
                    // Note: In a real app, never store passwords in localStorage
                } else {
                    localStorage.removeItem('savedUsername');
                    localStorage.removeItem('savedPassword');
                }

                // Here you would typically send the form data to the server
                console.log('Form submitted:', { username, password, remember });

                // Reset button state
                loginButton.innerHTML = '<i class="fas fa-check"></i> Đăng nhập thành công!';

                // Show success animation
                setTimeout(() => {
                    alert('Đăng nhập thành công!');
                    loginButton.innerHTML = originalButtonText;
                    loginButton.disabled = false;
                }, 1000);
            }, 1500);

        });
        loginForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const password = passwordField.value;

            // Kiểm tra điều kiện hợp lệ
            if (password.length < 8) {
                passwordValidation.classList.add('show');
                return;
            }

            // Gửi form đi sau khi hợp lệ
            loginForm.submit(); // ✅ Bổ sung dòng này
        });

        // Check if we have saved credentials
        const savedUsername = localStorage.getItem('savedUsername');
        if (savedUsername) {
            document.getElementById('username').value = savedUsername;
            document.getElementById('remember').checked = true;
        }
    });
</script>

</body>
</html>