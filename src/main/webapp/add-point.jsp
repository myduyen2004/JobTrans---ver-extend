<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Điều khoản cộng điểm</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #2E3B82;
            --secondary-color: #1E2A78;
            --accent-color: #4895ef;
            --border-radius: 12px;
            --box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f7ff;
            margin: 0;
            padding: 0;
            color: #212529;
            line-height: 1.6;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .policy-box {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 40px;
            position: relative;
        }

        .policy-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 15px;
            font-size: 20px;
            text-align: center;
            border-radius: var(--border-radius) var(--border-radius) 0 0;
            margin: -40px -40px 30px -40px;
        }

        .policy-list {
            list-style: none;
            padding: 0;
        }

        .policy-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px dashed #eee;
        }

        .point-value {
            padding: 3px 12px;
            border-radius: 20px;
            font-weight: 500;
            min-width: 80px;
            text-align: center;


        }

        @media (max-width: 768px) {
            .container {
                padding: 0 15px;
            }
            .policy-box {
                padding: 30px 20px;
            }
            .policy-header {
                margin: -30px -20px 20px -20px;
            }
        }
    </style>
</head>
<body>
<%@include file="includes/header-01.jsp"%>

<div class="container">
    <div class="policy-box">
        <div class="policy-header">Điều khoản cộng điểm</div>
        <ul class="policy-list">
            <li class="policy-item">
                <span>Người dùng xác thực tài khoản bằng liên kết của bên thứ 3 như LinkedIn</span>
                <span style="color: black" class="point-value">+50 điểm</span>
            </li>
            <li class="policy-item">
                <span>Hoàn thành 2 công việc đầu tiên</span>
                <span style="color: black" class="point-value">+30 điểm</span>
            </li>
            <li class="policy-item">
                <span>Seeker hoàn thành đúng hạn</span>
                <span style="color: black" class="point-value">+10 điểm/công việc</span>
            </li>
            <li class="policy-item">
                <span>Nhận đánh giá 5 sao từ khách hàng</span>
                <span style="color: black" class="point-value">+15 điểm</span>
            </li>
            <li class="policy-item">
                <span>Xây dựng hồ sơ đầy đủ, chi tiết</span>
                <span style="color: black" class="point-value">+5 điểm</span>
            </li>
            <li class="policy-item">
                <span>Seeker hoàn thành dự án trước deadline</span>
                <span style="color: black" class="point-value">+15 điểm</span>
            </li>
            <li class="policy-item">
                <span>Được khách hàng thuê lại nhiều lần</span>
                <span style="color: black" class="point-value">+10 điểm</span>
            </li>
            <li class="policy-item">
                <span>Employer trả tiền đúng hạn</span>
                <span style="color: black" class="point-value">+10 điểm/công việc</span>
            </li>
            <li class="policy-item">
                <span>Giới thiệu bạn bè (từ người thứ 2)</span>
                <span style="color: black" class="point-value">+5 điểm/người</span>
            </li>
            <li class="policy-item">
                <span>Tạo tài khoản</span>
                <span style="color: black" class="point-value">+10 điểm</span>
            </li>
        </ul>
    </div>
</div>

<%@include file="includes/footer.jsp"%>
</body>
</html>