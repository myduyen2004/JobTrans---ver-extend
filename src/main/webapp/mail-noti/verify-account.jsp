<%--
    Document   : verify-account
    Created on : Sep 17, 2024, 8:07:17 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác nhận tài khoản</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f4f7fd;
            margin: 0;
            padding: 20px;
            color: #333;
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .email-container {
            max-width: 600px;
            width: 100%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid #e8eef3;
        }

        .email-header {
            background-color: #fff;
            padding: 0 0 20px 0;
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 1px solid #eaeaea;
        }

        .email-header img {
            width: 130px;
            height: auto;
        }

        .email-body {
            padding: 0;
            color: #333;
        }

        .email-body h1 {
            color: #3742fa;
            font-size: 24px;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 700;
        }

        .email-body h2 {
            color: #3742fa;
            font-size: 20px;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .email-body p {
            margin-bottom: 20px;
            font-size: 16px;
            color: #505050;
        }

        .email-footer {
            text-align: center;
            padding: 25px 0 0 0;
            font-size: 13px;
            color: #888;
            margin-top: 30px;
            border-top: 1px solid #eaeaea;
        }

        .email-footer a {
            color: #3742fa;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .email-footer a:hover {
            color: #1e27c9;
            text-decoration: underline;
        }

        .btn {
            display: inline-block;
            padding: 12px 24px;
            margin-top: 20px;
            background-color: #3742fa;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(55, 66, 250, 0.3);
        }

        .btn:hover {
            background-color: #2832cb;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(55, 66, 250, 0.4);
        }

        .code-block {
            background: linear-gradient(135deg, #3742fa 0%, #4776E6 100%);
            padding: 18px 0;
            color: #fff;
            text-align: center;
            font-weight: bold;
            font-size: 28px;
            letter-spacing: 8px;
            margin: 30px 0;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(55, 66, 250, 0.2);
            position: relative;
            overflow: hidden;
        }

        .code-block::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: 0.5s;
            pointer-events: none;
            animation: shine 3s infinite;
        }

        @keyframes shine {
            0% { left: -100%; }
            20% { left: 100%; }
            100% { left: 100%; }
        }

        .body1 {
            font-size: 20px;
            font-weight: bold;
            color: #444;
            margin: 30px 0 15px 0;
        }

        .body2 {
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
            line-height: 1.7;
            background-color: #f9f9fb;
            padding: 15px;
            border-left: 4px solid #3742fa;
            border-radius: 0 8px 8px 0;
        }

        b {
            color: #3742fa;
            font-weight: 700;
        }

        .link {
            color: #3742fa;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            border-bottom: 1px dashed #3742fa;
            padding-bottom: 2px;
        }

        .link:hover {
            color: #2832cb;
            border-bottom-style: solid;
        }

        /* Responsive design */
        @media only screen and (max-width: 600px) {
            .email-container {
                padding: 25px;
            }

            .email-body h1 {
                font-size: 22px;
            }

            .email-body h2 {
                font-size: 18px;
            }

            .code-block {
                font-size: 24px;
                letter-spacing: 6px;
                padding: 15px 0;
            }

            .body1 {
                font-size: 18px;
            }

            .body2 {
                font-size: 15px;
                padding: 12px;
            }
        }
    </style>
</head>
<body>
<div class="email-container">
    <!-- Email Header -->
    <div class="email-header">
        <link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">
    </div>

    <!-- Email Body -->
    <div class="email-body">
        <h1>Yêu cầu xác minh tài khoản</h1>
        <h2>Xin chào [NAME],</h2>
        <p>Cảm ơn bạn đã đăng ký tài khoản trên hệ thống <b>JOBTRANS</b>. Vui lòng sử dụng mã dưới đây để xác minh địa chỉ email của bạn.</p>
        <div class="code-block">[CODE]</div>
        <p class="body1">Đấy không phải tôi!</p>
        <p class="body2">
            Nếu bạn không phải là người gửi yêu cầu này cho chúng tôi, vui lòng bỏ qua email này. Chúng tôi xin
            lỗi đã làm phiền bạn. Chúc bạn một ngày vui vẻ!
        </p>
        <p class="body2">
            Chúng tôi chỉ có duy nhất một email để gửi thông báo cho bạn là
            <a class="link" href="sugiathanchet2004@gmail.com">sugiathanchet2004@gmail.com</a>. Để tránh bị lừa đảo
            bởi những email giả, xin vui lòng xem kĩ địa chỉ email gửi đến.
        </p>
    </div>

    <!-- Email Footer -->
    <div class="email-footer">
        <p>© 2024 JobTrans. All Rights Reserved.</p>
    </div>
</div>
</body>
</html>