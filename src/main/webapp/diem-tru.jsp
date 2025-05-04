<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Điều khoản trừ điểm</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #2E3B82;
            --secondary-color: #1E2A78;
            --warning-color: #F44336;
            --block-color: #9E9E9E;
            --border-radius: 12px;
            --box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #4a5568;
            margin: 0;
            padding: 0;
            color: #0f1b49;
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

        .section {
            margin-bottom: 30px;
            border: 1px solid #eee;
            border-radius: var(--border-radius);
            padding: 20px;
        }

        .section-title {
            background: var(--primary-color);
            color: white;
            padding: 8px 15px;
            border-radius: 20px;
            display: inline-block;
            margin-bottom: 15px;
            font-size: 16px;
        }

        .policy-list {
            list-style: none;
            padding: 0;
        }

        .policy-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 5px 0;
            border-bottom: 1px dashed #4a5568;
        }

        .point-value {
            color: black;
            padding: 3px 12px;
            border-radius: 20px;
            font-weight: 500;
            min-width: 80px;
            text-align: center;
        }

        .negative {
            background: var(--warning-color);
        }

        .block {
            background: var(--block-color);
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
        <div class="policy-header">Điều khoản trừ điểm</div>

        <div class="section">
            <div class="section-title">Trường hợp bị báo cáo vi phạm người dùng</div>
            <ul class="policy-list">
                <li class="policy-item">
                    <span>Dùng từ thô thiển, vi phạm chuẩn mực</span>
                    <span style="color: black" class="point-value negative">-20 điểm</span>
                </li>
                <li class="policy-item">
                    <span>Giả mạo</span>
                    <span style="color: black" class="point-value block">BLOCK</span>
                </li>
                <li class="policy-item">
                    <span>Spam liên tục</span>
                    <span style="color: black" class="point-value negative">-30 điểm</span>
                </li>
                <li class="policy-item">
                    <span>Bán lại hoặc tiết lộ thông tin khách hàng trái phép</span>
                    <span style="color: black" class="point-value block">BLOCK</span>
                </li>
            </ul>
        </div>

        <div class="section">
            <div class="section-title">Đối tác khiếu nại lúc đang làm việc</div>
            <ul class="policy-list">
                <li class="policy-item">
                    <span>Thái độ làm việc</span>
                    <span style="color: black" class="point-value negative">-20 điểm</span>
                </li>
                <li class="policy-item">
                    <span>Quá hạn làm việc</span>
                    <span style="color: black" class="point-value negative">-30 điểm</span>
                </li>
                <li class="policy-item">
                    <span>Đạo văn</span>
                    <span style="color: black" class="point-value negative">-30 điểm</span>
                </li>
                <li class="policy-item">
                    <span>Tiết lộ thông tin</span>
                    <span style="color: black" class="point-value negative">-30 điểm</span>
                </li>
                <li class="policy-item">
                    <span>Sản phẩm kém chất lượng</span>
                    <span style="color: black" class="point-value negative">-30 điểm</span>
                </li>
            </ul>
        </div>

        <div class="section">
            <div class="section-title">Phản hồi trả tiền chậm khi đến hạn (Employer)</div>
            <ul class="policy-list">
                <li class="policy-item">
                    <span>Nhắc lần đầu (cảnh cáo)</span>
                    <span style="color: black" class="point-value negative">-5 điểm</span>
                </li>
                <li class="policy-item">
                    <span>Nhắc lần 2 sau 5 ngày (gắn nhãn cảnh báo)</span>
                    <span style="color: black" class="point-value negative">-30 điểm</span>
                </li>
            </ul>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>
</body>
</html>