<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jobtrans.model.Account" %>
<%
    Account account = (Account) session.getAttribute("sessionAccount");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobTrans - Xác thực OTP</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #4776E6 0%, #3748AA 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        body::before {
            content: '';
            position: absolute;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            top: -100px;
            left: -100px;
        }

        body::after {
            content: '';
            position: absolute;
            width: 400px;
            height: 400px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
            bottom: -150px;
            right: -150px;
        }

        .container {
            display: flex;
            width: 100%;
            max-width: 1200px;
            height: 600px;
            position: relative;
            z-index: 10;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            overflow: hidden;
        }

        .left-side {
            flex: 1;
            padding: 60px;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: linear-gradient(145deg, rgba(71, 118, 230, 0.9) 0%, rgba(55, 72, 170, 0.9) 100%);
            position: relative;
            overflow: hidden;
        }

        .left-side::before {
            content: '';
            position: absolute;
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
            border-radius: 50%;
            top: -250px;
            left: -250px;
        }

        .right-side {
            flex: 1;
            background-color: white;
            padding: 50px;
            display: flex;
            flex-direction: column;
            transition: all 0.3s ease;
        }

        h1 {
            font-size: 2.8rem;
            margin-bottom: 25px;
            font-weight: 600;
            position: relative;
        }

        h1::after {
            content: '';
            position: absolute;
            width: 60px;
            height: 4px;
            background: white;
            bottom: -12px;
            left: 0;
            border-radius: 2px;
        }

        .subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
            line-height: 1.7;
            margin-bottom: 30px;
            max-width: 90%;
        }

        .logo {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 50px;
            text-align: center;
            letter-spacing: 0.5px;
        }

        .logo span {
            color: #4776E6;
            background: linear-gradient(135deg, #4776E6, #3748AA);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        h2 {
            font-size: 1.6rem;
            margin-bottom: 15px;
            text-align: center;
            color: #333;
            font-weight: 600;
        }

        .description {
            text-align: center;
            color: #777;
            margin-bottom: 40px;
            font-size: 0.95rem;
            line-height: 1.6;
        }

        .otp-container {
            display: flex;
            justify-content: space-between;
            margin: 20px 0 40px;
        }

        .otp-input {
            width: 55px;
            height: 65px;
            border: 2px solid #e1e1e1;
            border-radius: 12px;
            text-align: center;
            font-size: 24px;
            font-weight: 600;
            color: #333;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .otp-input:focus {
            border-color: #4776E6;
            outline: none;
            box-shadow: 0 0 0 3px rgba(71, 118, 230, 0.2);
            transform: translateY(-2px);
        }

        .btn {
            background: linear-gradient(135deg, #4776E6 0%, #3748AA 100%);
            color: white;
            border: none;
            border-radius: 30px;
            padding: 16px;
            font-size: 1.05rem;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(71, 118, 230, 0.3);
            position: relative;
            overflow: hidden;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(71, 118, 230, 0.4);
        }

        .btn:active {
            transform: translateY(-1px);
        }

        .btn::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: -100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.6s ease;
        }

        .btn:hover::after {
            left: 100%;
        }

        .resend {
            text-align: center;
            margin-top: 25px;
            color: #777;
            font-size: 0.95rem;
        }

        .resend a {
            color: #4776E6;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            border-bottom: 1px solid transparent;
            padding-bottom: 2px;
        }

        .resend a:hover {
            border-bottom-color: #4776E6;
        }

        .timer {
            text-align: center;
            margin-top: 15px;
            color: #666;
            font-size: 0.9rem;
        }

        @media (max-width: 992px) {
            .container {
                flex-direction: column;
                height: auto;
                max-width: 500px;
            }

            .left-side, .right-side {
                padding: 40px;
            }

            .left-side {
                display: none;
            }

            .right-side {
                border-radius: 15px;
            }
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(71, 118, 230, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(71, 118, 230, 0); }
            100% { box-shadow: 0 0 0 0 rgba(71, 118, 230, 0); }
        }

        .focused {
            animation: pulse 1.5s infinite;
        }

        .otp-input.filled {
            background-color: #f7faff;
            border-color: #4776E6;
        }

        .success-message {
            display: none;
            text-align: center;
            color: #2ecc71;
            font-weight: 500;
            margin-top: 15px;
        }

        .error-message {
            display: none;
            text-align: center;
            color: #e74c3c;
            font-weight: 500;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="left-side">
        <h1>Xác thực OTP</h1>
        <p class="subtitle">Để bảo vệ tài khoản JobTrans của bạn, vui lòng nhập mã OTP đã được gửi đến email đăng ký của bạn.</p>
    </div>
    <div class="right-side">
        <div class="logo">Job<span>Trans</span></div>
        <h2>Nhập mã xác thực OTP</h2>
        <p class="description">Vui lòng nhập mã 6 số đã được gửi đến email của bạn<br>Mã có hiệu lực trong 5 phút</p>

        <form action="verify-otp" method="post" id="otpForm">
            <input type="hidden" name="cmd" value="2">
            <div class="otp-container">
                <input type="text" class="otp-input" maxlength="1" name="otp1" id="otp1" required autofocus
                       oninput="moveToNext(this, 'otp2')" onfocus="addFocus(this)" onblur="removeFocus(this)">
                <input type="text" class="otp-input" maxlength="1" name="otp2" id="otp2" required
                       oninput="moveToNext(this, 'otp3')" onfocus="addFocus(this)" onblur="removeFocus(this)">
                <input type="text" class="otp-input" maxlength="1" name="otp3" id="otp3" required
                       oninput="moveToNext(this, 'otp4')" onfocus="addFocus(this)" onblur="removeFocus(this)">
                <input type="text" class="otp-input" maxlength="1" name="otp4" id="otp4" required
                       oninput="moveToNext(this, 'otp5')" onfocus="addFocus(this)" onblur="removeFocus(this)">
                <input type="text" class="otp-input" maxlength="1" name="otp5" id="otp5" required
                       oninput="moveToNext(this, 'otp6')" onfocus="addFocus(this)" onblur="removeFocus(this)">
                <input type="text" class="otp-input" maxlength="1" name="otp6" id="otp6" required
                       onfocus="addFocus(this)" onblur="removeFocus(this)" oninput="enableButton()">
            </div>

            <button type="submit" class="btn" id="submitBtn">Xác nhận</button>
            <div class="success-message" id="successMessage">Xác thực thành công!</div>
            <div class="error-message" id="errorMessage">Mã OTP không chính xác, vui lòng thử lại</div>
        </form>
        <p class="resend">Chưa nhận được mã? <a href="#" id="resendBtn">Gửi lại mã</a></p>
    </div>
</div>

<script>
    // Move to next input field
    function moveToNext(current, nextFieldName) {
        if (current.value.length >= current.maxLength) {
            document.getElementById(nextFieldName).focus();
            current.classList.add('filled');
        }

        if (current.value.length === 0) {
            current.classList.remove('filled');
        }

        checkAllFilled();
    }

    // Check if all OTP fields are filled
    function checkAllFilled() {
        const inputs = document.querySelectorAll('.otp-input');
        let allFilled = true;

        inputs.forEach(input => {
            if (input.value === '') {
                allFilled = false;
            }
        });

        return allFilled;
    }

    // Enable button if all fields filled
    function enableButton() {
        const submitBtn = document.getElementById('submitBtn');
        if (checkAllFilled()) {
            submitBtn.style.opacity = '1';
            submitBtn.disabled = false;
        } else {
            submitBtn.style.opacity = '0.7';
            submitBtn.disabled = true;
        }
    }

    // Add focus animation
    function addFocus(elem) {
        elem.classList.add('focused');
    }

    // Remove focus animation
    function removeFocus(elem) {
        elem.classList.remove('focused');
    }

    // Handle form submission
    document.getElementById('otpForm').addEventListener('submit', function(e) {
        const submitBtn = document.getElementById('submitBtn');
        submitBtn.innerHTML = '<span style="display:inline-block;width:20px;height:20px;border:3px solid white;border-radius:50%;border-top-color:transparent;animation:rotate 1s linear infinite;"></span>';

        // Simulate verification (replace with actual verification)
        setTimeout(() => {
            // For demo purposes, show success message
            // In real app, you'd verify OTP first
            document.getElementById('successMessage').style.display = 'block';
            submitBtn.innerHTML = 'Xác nhận thành công!';
            submitBtn.style.backgroundColor = '#2ecc71';
        }, 1500);
    });

    // Allow only numbers in OTP fields
    document.querySelectorAll('.otp-input').forEach(input => {
        input.addEventListener('keypress', function(e) {
            if (!/[0-9]/.test(e.key)) {
                e.preventDefault();
            }
        });

        // Handle paste event
        input.addEventListener('paste', function(e) {
            e.preventDefault();
            const paste = (e.clipboardData || window.clipboardData).getData('text');
            if (/^\d+$/.test(paste)) {
                const digits = paste.split('');
                const inputs = document.querySelectorAll('.otp-input');

                for (let i = 0; i < Math.min(digits.length, inputs.length); i++) {
                    inputs[i].value = digits[i];
                    inputs[i].classList.add('filled');
                }

                // Focus the next empty field or the last field
                const emptyInputs = Array.from(inputs).filter(inp => inp.value === '');
                if (emptyInputs.length > 0) {
                    emptyInputs[0].focus();
                } else {
                    inputs[inputs.length - 1].focus();
                }

                checkAllFilled();
            }
        });
    });

    // Initially disable submit button
    document.getElementById('submitBtn').style.opacity = '0.7';
    document.getElementById('submitBtn').disabled = true;

    // Add keyboard navigation
    document.querySelectorAll('.otp-input').forEach((input, index, inputs) => {
        input.addEventListener('keydown', function(e) {
            if (e.key === 'Backspace' && input.value === '' && index > 0) {
                inputs[index - 1].focus();
                inputs[index - 1].value = '';
                inputs[index - 1].classList.remove('filled');
            }

            if (e.key === 'ArrowLeft' && index > 0) {
                inputs[index - 1].focus();
            }

            if (e.key === 'ArrowRight' && index < inputs.length - 1) {
                inputs[index + 1].focus();
            }
        });
    });

    // Add animation to CSS
    const style = document.createElement('style');
    style.textContent = `
            @keyframes rotate {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }
        `;
    document.head.appendChild(style);
</script>
<script>
    document.getElementById("resendBtn").addEventListener("click", function(e) {

        const email = '<%= account.getEmail() %>'; // Lấy email từ session

        fetch("resend-otp", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "email=" + encodeURIComponent(email)
        })
            .then(response => response.text())
            .then(data => {
                alert("Đã gửi lại mã OTP!");
            })
            .catch(error => {
                console.error("Lỗi khi gửi lại mã:", error);
            });
    });
</script>


</body>
</html>