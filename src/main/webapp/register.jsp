<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/12/2025
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobTrans - Đăng ký</title>
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

        .signup-container {
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
        .signup-container::before {
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

        .signup-form-container {
            width: 470px;
            height: auto;
            padding: 40px 30px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            position: relative;
            z-index: 10;
            animation: formAppear 1s forwards ease-out;
            transform: translateY(30px);
            opacity: 0;
            backdrop-filter: blur(5px);
            margin: 80px 0;
        }

        @keyframes formAppear {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .logo {
            text-align: center;
            margin-bottom: 25px;
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

        .form-title {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            font-size: 20px;
            font-weight: 700;
            animation: fadeIn 0.8s forwards;
            opacity: 0;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }

        .account-type-container {
            margin-bottom: 25px;
            animation: slideUp 0.6s forwards ease-out;
            opacity: 0;
            transform: translateY(20px);
        }

        .account-type-label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-size: 14px;
            font-weight: 700;
        }

        .account-type-options {
            display: flex;
            gap: 15px;
            width: 100%;
        }

        .account-type-option {
            flex: 1;
            position: relative;
        }

        .account-type-option input[type="radio"] {
            position: absolute;
            opacity: 0;
            width: 0;
            height: 0;
        }

        .account-type-option label {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 15px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
        }

        .account-type-option input[type="radio"]:checked + label {
            border-color: #6383F8;
            background-color: rgba(99, 131, 248, 0.05);
            box-shadow: 0 0 0 3px rgba(99, 131, 248, 0.2);
        }

        .account-type-option input[type="radio"]:focus + label {
            box-shadow: 0 0 0 3px rgba(99, 131, 248, 0.3);
        }

        .account-type-icon {
            font-size: 24px;
            color: #6383F8;
        }

        .account-type-text {
            font-weight: 600;
            color: #333;
            font-size: 14px;
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

        .input-container:nth-child(4) {
            animation-delay: 0.6s;
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

        /* Password validation message */
        .validation-message {
            display: none;
            color: #ff3860;
            font-size: 12px;
            margin-top: 5px;
            padding-left: 10px;
            transition: all 0.3s ease;
            opacity: 0;
            transform: translateY(-5px);
        }

        .validation-message.show {
            display: block;
            animation: slideDown 0.3s forwards;
        }

        @keyframes slideDown {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .validation-message.valid {
            color: #23d160;
        }

        /* Terms checkbox */
        .terms-container {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
            animation: fadeIn 0.8s forwards;
            animation-delay: 0.8s;
            opacity: 0;
        }

        .terms-container input[type="checkbox"] {
            width: 18px;
            height: 18px;
            margin-right: 8px;
            margin-top: 2px;
            accent-color: #6383F8;
            cursor: pointer;
        }

        .terms-container label {
            color: #333;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: color 0.2s ease;
            line-height: 1.4;
        }

        .terms-container a {
            color: #6383F8;
            text-decoration: none;
            font-weight: 700;
            transition: all 0.2s ease;
        }

        .terms-container a:hover {
            text-decoration: underline;
        }

        .terms-container label:hover {
            color: #6383F8;
        }

        /* Signup button */
        .signup-button {
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
            animation-delay: 1s;
            opacity: 0;
            overflow: hidden;
            position: relative;
        }

        .signup-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.6s ease;
        }

        .signup-button:hover {
            background: linear-gradient(90deg, #5673e0 0%, #4562cf 100%);
            transform: translateY(-2px);
            box-shadow: 0 12px 20px rgba(103, 135, 254, 0.4);
        }

        .signup-button:hover::before {
            left: 100%;
        }

        .signup-button:active {
            transform: translateY(1px);
            box-shadow: 0 5px 10px rgba(103, 135, 254, 0.4);
        }

        /* Helper links */
        .helper-links {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
            font-weight: 500;
            animation: fadeIn 0.8s forwards;
            animation-delay: 1.2s;
            opacity: 0;
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
        .signup-form-container::after {
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

        /* Password strength indicator */
        .password-strength {
            width: 100%;
            height: 5px;
            background-color: #e0e0e0;
            border-radius: 5px;
            margin-top: 8px;
            overflow: hidden;
        }

        .strength-meter {
            height: 100%;
            width: 0%;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .strength-meter.weak {
            width: 33.33%;
            background-color: #ff3860;
        }

        .strength-meter.medium {
            width: 66.66%;
            background-color: #ffdd57;
        }

        .strength-meter.strong {
            width: 100%;
            background-color: #23d160;
        }

        .strength-text {
            font-size: 12px;
            margin-top: 5px;
            text-align: right;
            font-weight: 500;
        }

        .strength-text.weak {
            color: #ff3860;
        }

        .strength-text.medium {
            color: #ffaa00;
        }

        .strength-text.strong {
            color: #23d160;
        }

        /* Responsive adjustments */
        @media (max-width: 1200px) {
            .signup-container {
                padding-right: 50px;
            }

            .welcome-text {
                left: 100px;
            }
        }

        @media (max-width: 992px) {
            .signup-container {
                justify-content: center;
                padding-right: 0;
            }

            .signup-form-container {
                margin: 100px 0;
            }

            .welcome-text {
                width: 80%;
                left: 10%;
                text-align: center;
                top: 50px;
            }

            .welcome-text h1::after {
                left: 50%;
                transform: translateX(-50%);
            }
        }

        @media (max-width: 768px) {
            .signup-form-container {
                width: 90%;
                max-width: 450px;
                padding: 30px 20px;
            }

            .welcome-text {
                width: 90%;
                left: 5%;
                top: 30px;
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

            .account-type-options {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
<div class="signup-container">
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
        <h1>Tạo Tài Khoản<br>JobTrans</h1>
        <p>Bắt đầu hành trình tìm kiếm việc làm<br>và cơ hội nghề nghiệp tuyệt vời</p>
    </div>

    <!-- Signup form -->
    <div class="signup-form-container">
        <!-- Logo -->
        <div class="logo">
            <span class="logo-job">Job</span><span class="logo-trans">Trans</span>
        </div>

        <h2 class="form-title">Đăng ký tài khoản</h2>

        <!-- Form -->
        <form id="signupForm" method="post" action="register" accept-charset="UTF-8" novalidate>
            <!-- Account type selection -->
            <div class="account-type-container">
                <label class="account-type-label">Loại tài khoản</label>
                <div class="account-type-options">
                    <div class="account-type-option">
                        <input type="radio" id="personal" name="accountType" value="personal">
                        <label for="personal">
                            <span class="account-type-icon"><i class="fas fa-user"></i></span>
                            <span class="account-type-text">Cá nhân</span>
                        </label>
                    </div>
                    <div class="account-type-option">
                        <input type="radio" id="group" name="accountType" value="group">
                        <label for="group">
                            <span class="account-type-icon"><i class="fas fa-users"></i></span>
                            <span class="account-type-text">Nhóm</span>
                        </label>
                    </div>
                </div>
                <div class="validation-message" id="accountTypeValidation">Vui lòng chọn loại tài khoản</div>
            </div>

            <!-- Email field -->
            <div class="input-container">
                <input type="email" class="input-field" id="email" name="email" placeholder=" " required>
                <label for="email" class="input-label">Gmail</label>
                <i class="fas fa-envelope input-icon"></i>
                <div class="validation-message" id="emailValidation">Vui lòng nhập đúng định dạng Gmail</div>
            </div>

            <!-- Email field -->
            <div class="input-container">
                <input type="text" class="input-field" id=accountName name="accountName" placeholder=" " required>
                <label for="accountName" class="input-label">Tên tài khoản</label>
                <i class="fas fa-user input-icon"></i>
            </div>

            <!-- Password field -->
            <div class="input-container">
                <input type="password" class="input-field" id="password" name="password" placeholder=" " required>
                <label for="password" class="input-label">Mật khẩu</label>
                <i class="fas fa-lock input-icon"></i>
                <i class="far fa-eye toggle-password" id="togglePassword"></i>
                <div class="validation-message" id="passwordValidation">Mật khẩu phải có ít nhất 8 ký tự</div>
                <div class="password-strength">
                    <div class="strength-meter" id="strengthMeter"></div>
                </div>
                <div class="strength-text" id="strengthText"></div>
            </div>

            <!-- Confirm Password field -->
            <div class="input-container">
                <input type="password" class="input-field" id="confirmPassword" name="confirmPassword" placeholder=" " required>
                <label for="confirmPassword" class="input-label">Nhập lại mật khẩu</label>
                <i class="fas fa-lock input-icon"></i>
                <i class="far fa-eye toggle-password" id="toggleConfirmPassword"></i>
                <div class="validation-message" id="confirmPasswordValidation">Mật khẩu xác nhận không khớp</div>
            </div>

            <!-- Terms and conditions -->
            <div class="terms-container">
                <input type="checkbox" id="terms" name="terms" required>
                <label for="terms">Tôi đồng ý với <a href="#">Điều khoản sử dụng</a> và <a href="#">Chính sách bảo mật</a> của JobTrans</label>
            </div>

            <button type="submit" class="signup-button">
                <i class="fas fa-user-plus"></i> Đăng ký
            </button>

            <div class="helper-links">
                Đã có tài khoản? <a href="login.jsp" class="login-link">Đăng nhập ngay</a>
            </div>
        </form>
    </div>
    <%@include file="includes/toast-notification.jsp"%>
    </div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const signupForm = document.getElementById('signupForm');
        const passwordField = document.getElementById('password');
        const confirmPasswordField = document.getElementById('confirmPassword');
        const togglePassword = document.getElementById('togglePassword');
        const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
        const passwordValidation = document.getElementById('passwordValidation');
        const confirmPasswordValidation = document.getElementById('confirmPasswordValidation');
        const emailValidation = document.getElementById('emailValidation');
        const accountTypeValidation = document.getElementById('accountTypeValidation');
        const strengthMeter = document.getElementById('strengthMeter');
        const strengthText = document.getElementById('strengthText');

        // Toggle password visibility
        togglePassword.addEventListener('click', function() {
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);

            // Toggle eye icon
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });

        // Toggle confirm password visibility
        toggleConfirmPassword.addEventListener('click', function() {
            const type = confirmPasswordField.getAttribute('type') === 'password' ? 'text' : 'password';
            confirmPasswordField.setAttribute('type', type);

            // Toggle eye icon
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });

        // Check password strength
        function checkPasswordStrength(password) {
            let strength = 0;

            // If password length is less than 8, return "weak"
            if (password.length < 8) {
                strengthMeter.className = 'strength-meter';
                strengthText.className = 'strength-text';
                strengthText.textContent = '';
                return;
            }

            // If password contains both lower and uppercase characters
            if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) strength += 1;

            // If password has numbers and characters
            if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/)) strength += 1;

            // If password has special characters
            if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1;

            // If password length is 12 or more
            if (password.length >= 12) strength += 1;

            // Return strength value
            if (strength <= 1) {
                strengthMeter.className = 'strength-meter weak';
                strengthText.className = 'strength-text weak';
                strengthText.textContent = 'Yếu';
            } else if (strength === 2) {
                strengthMeter.className = 'strength-meter medium';
                strengthText.className = 'strength-text medium';
                strengthText.textContent = 'Trung bình';
            } else {
                strengthMeter.className = 'strength-meter strong';
                strengthText.className = 'strength-text strong';
                strengthText.textContent = 'Mạnh';
            }
        }

        // Password validation
        passwordField.addEventListener('input', function() {
            checkPasswordStrength(this.value);

            if (this.value.length < 8) {
                passwordValidation.classList.add('show');
                passwordValidation.classList.remove('valid');
                passwordValidation.textContent = "Mật khẩu phải có ít nhất 8 ký tự";
            } else {
                passwordValidation.classList.add('show', 'valid');
                passwordValidation.textContent = "Mật khẩu hợp lệ";
            }

            // Check if confirm password matches if it's not empty
            if (confirmPasswordField.value !== '') {
                if (confirmPasswordField.value === this.value) {
                    confirmPasswordValidation.classList.add('show', 'valid');
                    confirmPasswordValidation.textContent = "Mật khẩu khớp";
                } else {
                    confirmPasswordValidation.classList.add('show');
                    confirmPasswordValidation.classList.remove('valid');
                    confirmPasswordValidation.textContent = "Mật khẩu xác nhận không khớp";
                }
            }
        });

        // Confirm password validation
        confirmPasswordField.addEventListener('input', function() {
            if (this.value === '') {
                confirmPasswordValidation.classList.remove('show');
            } else if (this.value === passwordField.value) {
                confirmPasswordValidation.classList.add('show', 'valid');
                confirmPasswordValidation.textContent = "Mật khẩu khớp";
            } else {
                confirmPasswordValidation.classList.add('show');
                confirmPasswordValidation.classList.remove('valid');
                confirmPasswordValidation.textContent = "Mật khẩu xác nhận không khớp";
            }
        });

        // Email validation (chỉ cần có @)
        const emailInput = document.getElementById('email');
        emailInput.addEventListener('input', function() {
            if (this.value === '') {
                emailValidation.classList.remove('show');
            } else if (!this.value.includes('@')) {
                emailValidation.classList.add('show');
                emailValidation.classList.remove('valid');
                emailValidation.textContent = "Email phải chứa ký tự @";
            } else {
                emailValidation.classList.add('show', 'valid');
                emailValidation.textContent = "Email hợp lệ";
            }
        });


        // Account type validation
        const accountTypeInputs = document.querySelectorAll('input[name="accountType"]');
        accountTypeInputs.forEach(input => {
            input.addEventListener('change', function() {
                if (document.querySelector('input[name="accountType"]:checked')) {
                    accountTypeValidation.classList.remove('show');
                }
            });
        });

        // Form submission - Đã sửa để cho phép form gửi dữ liệu nếu hợp lệ
        signupForm.addEventListener('submit', function(event) {
            let isValid = true;

            // Validate account type
            if (!document.querySelector('input[name="accountType"]:checked')) {
                accountTypeValidation.classList.add('show');
                isValid = false;
            }

            // Validate email (chỉ cần có @)
            if (emailInput.value === '') {
                emailValidation.classList.add('show');
                emailValidation.classList.remove('valid');
                emailValidation.textContent = "Vui lòng nhập email";
                isValid = false;
            } else if (!emailInput.value.includes('@')) {
                emailValidation.classList.add('show');
                emailValidation.classList.remove('valid');
                emailValidation.textContent = "Email phải chứa ký tự @";
                isValid = false;
            } else {
                emailValidation.classList.add('show', 'valid');
                emailValidation.textContent = "Email hợp lệ";
            }


            // Validate password
            if (passwordField.value === '') {
                passwordValidation.classList.add('show');
                passwordValidation.classList.remove('valid');
                passwordValidation.textContent = "Vui lòng nhập mật khẩu";
                isValid = false;
            } else if (passwordField.value.length < 8) {
                passwordValidation.classList.add('show');
                passwordValidation.classList.remove('valid');
                passwordValidation.textContent = "Mật khẩu phải có ít nhất 8 ký tự";
                isValid = false;
            }

            // Validate confirm password
            if (confirmPasswordField.value === '') {
                confirmPasswordValidation.classList.add('show');
                confirmPasswordValidation.classList.remove('valid');
                confirmPasswordValidation.textContent = "Vui lòng nhập lại mật khẩu";
                isValid = false;
            } else if (confirmPasswordField.value !== passwordField.value) {
                confirmPasswordValidation.classList.add('show');
                confirmPasswordValidation.classList.remove('valid');
                confirmPasswordValidation.textContent = "Mật khẩu xác nhận không khớp";
                isValid = false;
            }

            // Validate terms
            const termsCheckbox = document.getElementById('terms');
            const termsContainer = document.querySelector('.terms-container');

            if (!termsCheckbox.checked) {
                termsContainer.style.color = '#ff3860';
                isValid = false;
            } else {
                termsContainer.style.color = '#333';
            }

            // Nếu form không hợp lệ, ngăn chặn gửi form
            if (!isValid) {
                event.preventDefault();

                // Scroll to the first invalid input
                const firstInvalidInput = document.querySelector('.validation-message.show:not(.valid)');
                if (firstInvalidInput) {
                    firstInvalidInput.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
            }
        });
    });
</script>
</body>
</html>