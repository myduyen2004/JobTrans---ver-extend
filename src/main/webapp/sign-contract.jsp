<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ký Kết Hợp Đồng - ProLancer</title>
    <style>
        :root {
            --primary-gradient: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            --primary-color: rgb(39, 64, 179);
            --primary-dark: rgb(21, 32, 112);
            --secondary-color: #f5f7ff;
            --text-color: #333;
            --text-light: #6e6e6e;
            --border-color: #e0e0e0;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --pending-color: #6c757d;
            --white: #ffffff;
            --shadow: 0 4px 12px rgba(21, 32, 112, 0.1);
            --radius: 30px;
            --transition: all 0.3s ease;
        }

        * {
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: #f9faff;
            color: var(--text-color);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .section-padding {
            padding: 40px 0;
        }

        /* Header Styling */
        .contract-header {
            background: var(--primary-gradient);
            color: var(--white);
            padding: 25px 30px;
            border-radius: var(--radius);
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            box-shadow: var(--shadow);
            animation: fadeIn 0.8s ease-out;
        }

        .contract-title {
            font-size: 26px;
            font-weight: 600;
        }

        .contract-status {
            padding: 8px 15px;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 500;
            display: flex;
            align-items: center;
        }

        .contract-status::before {
            content: "";
            display: inline-block;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            margin-right: 8px;
        }

        .status-signing {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .status-signing::before {
            background-color: #ffc107;
            box-shadow: 0 0 0 3px rgba(255, 193, 7, 0.3);
            animation: pulse 1.5s infinite;
        }

        /* Progress Steps */
        .contract-progress {
            display: flex;
            justify-content: space-between;
            margin-bottom: 40px;
            position: relative;
            padding: 0 10px;
        }

        .contract-progress::before {
            content: "";
            position: absolute;
            top: 25px;
            left: 0;
            right: 0;
            height: 3px;
            background-color: var(--border-color);
            z-index: 1;
        }

        .contract-progress::after {
            content: "";
            position: absolute;
            top: 25px;
            left: 0;
            width: 75%;  /* 75% for third step active */
            height: 3px;
            background: var(--primary-gradient);
            z-index: 2;
            transition: var(--transition);
            animation: progressGrow 1.5s ease-out;
        }

        .progress-step {
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
            z-index: 3;
            width: 25%;
        }

        .step-number {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: var(--white);
            border: 3px solid var(--border-color);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-bottom: 10px;
            position: relative;
            transition: var(--transition);
        }

        .step-label {
            font-size: 14px;
            font-weight: 500;
            color: var(--text-light);
            text-align: center;
            transition: var(--transition);
        }

        .progress-step.active .step-number {
            border-color: var(--primary-color);
            background: var(--primary-gradient);
            color: var(--white);
            box-shadow: 0 0 0 5px rgba(39, 64, 179, 0.2);
        }

        .progress-step.active .step-label {
            color: var(--primary-color);
            font-weight: 600;
        }

        .progress-step.completed .step-number {
            border-color: var(--success-color);
            background-color: var(--success-color);
            color: var(--white);
        }

        /* Các step đã hoàn thành có màu xanh */
        .progress-step.completed .step-number::after {
            content: "✓";
            font-size: 24px;
            line-height: 1;
        }

        .progress-step.completed .step-label {
            color: var(--success-color);
            font-weight: 600;
        }

        /* Contract Body */
        .contract-body {
            background-color: var(--white);
            border-radius: var(--radius);
            padding: 30px;
            box-shadow: var(--shadow);
            animation: slideUpFade 0.6s ease-out;
        }

        .form-section {
            margin-bottom: 30px;
            padding-bottom: 25px;
            border-bottom: 1px solid var(--border-color);
            animation: fadeIn 0.8s ease-out;
        }

        .form-section:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .section-title {
            font-size: 20px;
            font-weight: 600;
            color: var(--primary-dark);
            margin-bottom: 20px;
            position: relative;
            padding-left: 15px;
        }

        .section-title::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 4px;
            background: var(--primary-gradient);
            border-radius: 4px;
        }

        /* Contract Summary */
        .contract-summary {
            background-color: var(--secondary-color);
            border-radius: var(--radius);
            padding: 25px;
            margin-bottom: 30px;
        }

        .summary-header {
            font-size: 18px;
            font-weight: 600;
            color: var(--primary-dark);
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid var(--border-color);
        }

        .summary-section {
            margin-bottom: 20px;
        }

        .summary-section-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 12px;
            color: var(--primary-color);
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .summary-item:last-child {
            margin-bottom: 0;
        }

        .summary-label {
            color: var(--text-light);
            font-weight: 500;
        }

        .summary-value {
            font-weight: 500;
            color: var(--text-color);
        }

        /*Infor Poster And */
        .contract-parties {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .party-info {
            flex: 1;
            padding: 20px;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            margin-right: 20px;
        }

        .party-info:last-child {
            margin-right: 0;
        }

        /* Signature Section */
        .signature-container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            margin-bottom: 30px;
        }

        .signature-box {
            flex: 1;
            min-width: 300px;
            border: 1px solid var(--border-color);
            border-radius: var(--radius);
            padding: 20px;
            position: relative;
        }

        .signature-box-title {
            font-weight: 600;
            font-size: 16px;
            margin-bottom: 15px;
            color: var(--primary-dark);
        }

        .signature-canvas-container {
            border: 1px dashed var(--border-color);
            height: 150px;
            width: 100%;
            margin-bottom: 15px;
            position: relative;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #fafafa;
        }

        .signature-placeholder {
            color: var(--text-light);
            text-align: center;
            font-size: 14px;
        }

        .signature-input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border-color);
            border-radius: var(--radius);
            font-size: 16px;
            margin-bottom: 12px;
        }

        .signature-date {
            font-size: 14px;
            color: var(--text-light);
            margin-top: 10px;
        }

        .clear-signature {
            position: absolute;
            top: 20px;
            right: 20px;
            color: var(--danger-color);
            background: none;
            border: none;
            cursor: pointer;
            font-size: 13px;
            text-decoration: underline;
        }

        /* Upload ID Section */
        .upload-section {
            margin-top: 30px;
        }

        .file-upload {
            margin-bottom: 20px;
        }

        .file-input-container {
            position: relative;
            overflow: hidden;
            display: inline-block;
            cursor: pointer;
        }

        .file-input {
            font-size: 100px;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
            cursor: pointer;
        }

        .file-upload-btn {
            padding: 12px 24px;
            background: var(--secondary-color);
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
            border-radius: var(--radius);
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .file-upload-btn:hover {
            background-color: rgba(39, 64, 179, 0.1);
        }

        .file-name {
            margin-top: 10px;
            font-size: 14px;
            color: var(--text-light);
        }

        .info-text {
            font-size: 14px;
            color: var(--text-light);
            margin-top: 5px;
            font-style: italic;
        }

        /* Agreement Box */
        .agreement-box {
            background-color: #f9f9f9;
            border: 1px solid var(--border-color);
            border-radius: var(--radius);
            padding: 20px;
            margin-bottom: 30px;
            max-height: 200px;
            overflow-y: auto;
        }

        .agreement-text {
            font-size: 14px;
            line-height: 1.6;
        }

        /* Checkbox Style */
        .checkbox-group {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .checkbox-input {
            width: 20px;
            height: 20px;
            margin-right: 10px;
            margin-top: 3px;
            cursor: pointer;
            accent-color: var(--primary-color);
        }

        .checkbox-label {
            font-size: 14px;
            color: var(--text-color);
            cursor: pointer;
        }

        /* Buttons */
        .btn-container {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 24px;
            border-radius: var(--radius);
            font-weight: 500;
            font-size: 18px;
            cursor: pointer;
            transition: var(--transition);
            border: none;
            outline: none;
        }

        .btn-outline {
            background-color: transparent;
            border: 1px solid var(--primary-color);
            color: var(--primary-color);
        }

        .btn-outline:hover {
            background-color: rgba(39, 64, 179, 0.05);
        }

        .btn:not(.btn-outline) {
            background: var(--primary-gradient);
            color: var(--white);
            box-shadow: 0 4px 10px rgba(39, 64, 179, 0.3);
        }

        .btn:not(.btn-outline):hover {
            box-shadow: 0 6px 15px rgba(39, 64, 179, 0.4);
            transform: translateY(-2px);
        }

        /* Icons */
        .fas {
            display: inline-block;
            width: 16px;
            height: 16px;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
        }

        .fa-signature {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%232740b3' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M15 3h6v6'%3E%3C/path%3E%3Cpath d='M14 15L21 3'%3E%3C/path%3E%3Cpath d='M9 14l3-3 2 2'%3E%3C/path%3E%3Cpath d='M5 18l3-3'%3E%3C/path%3E%3Cpath d='M3 3v18h18'%3E%3C/path%3E%3C/svg%3E");
        }

        .fa-upload {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%232740b3' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4'%3E%3C/path%3E%3Cpolyline points='17 8 12 3 7 8'%3E%3C/polyline%3E%3Cline x1='12' y1='3' x2='12' y2='15'%3E%3C/line%3E%3C/svg%3E");
        }

        .fa-info-circle {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%236e6e6e' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Ccircle cx='12' cy='12' r='10'%3E%3C/circle%3E%3Cline x1='12' y1='16' x2='12' y2='12'%3E%3C/line%3E%3Cline x1='12' y1='8' x2='12.01' y2='8'%3E%3C/line%3E%3C/svg%3E");
            vertical-align: middle;
            margin-right: 5px;
        }

        .fa-check-circle {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%2328a745' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M22 11.08V12a10 10 0 1 1-5.93-9.14'%3E%3C/path%3E%3Cpolyline points='22 4 12 14.01 9 11.01'%3E%3C/polyline%3E%3C/svg%3E");
            vertical-align: middle;
            margin-right: 5px;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideUpFade {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes progressGrow {
            from {
                width: 50%;
            }
            to {
                width: 75%;
            }
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(255, 193, 7, 0.7);
            }
            70% {
                box-shadow: 0 0 0 6px rgba(255, 193, 7, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(255, 193, 7, 0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .signature-container {
                flex-direction: column;
            }

            .contract-progress {
                overflow-x: auto;
                padding-bottom: 15px;
            }

            .step-label {
                font-size: 12px;
            }

            .contract-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .contract-status {
                margin-top: 10px;
            }

            .btn-container {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }

        .document-preview {
            width: 100%;
            height: 300px;
            border: 1px solid var(--border-color);
            margin-bottom: 20px;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .document-icon {
            font-size: 48px;
            color: var(--primary-color);
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<section>
    <div class="container section-padding">
        <div class="justify-content-center">
            <main class="container">
                <div class="contract-header">
                    <div class="contract-title">Hợp Đồng Dịch Vụ Freelance</div>
                    <div class="contract-status status-signing">Đang ký kết</div>
                </div>

                <div class="contract-progress">
                    <div class="progress-step completed">
                        <div class="step-number"></div>
                        <div class="step-label">Thông tin dự án</div>
                    </div>
                    <div class="progress-step completed">
                        <div class="step-number"></div>
                        <div class="step-label">Điều khoản</div>
                    </div>
                    <div class="progress-step active">
                        <div class="step-number">3</div>
                        <div class="step-label">Ký kết</div>
                    </div>
                    <div class="progress-step">
                        <div class="step-number">4</div>
                        <div class="step-label">Hoàn thành</div>
                    </div>
                </div>

                <div class="contract-body">
                    <form id="contract-signing-form">
                        <div class="form-section">
                            <div class="section-title">Tóm tắt hợp đồng</div>
                            <div class="contract-summary">
                                <div class="summary-header">Thông tin chung</div>

                                <div class="summary-section">
                                    <div class="summary-section-title">Thông tin dự án</div>
                                    <div class="summary-item">
                                        <div class="summary-label">Tên dự án:</div>
                                        <div class="summary-value">Thiết kế và phát triển website thương mại điện tử</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Mô tả:</div>
                                        <div class="summary-value">Website bán hàng với đầy đủ chức năng quản lý sản phẩm, đơn hàng và thanh toán trực tuyến</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Thời gian thực hiện:</div>
                                        <div class="summary-value">45 ngày</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Ngày bắt đầu:</div>
                                        <div class="summary-value">05/05/2025</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Ngày kết thúc:</div>
                                        <div class="summary-value">19/06/2025</div>
                                    </div>
                                </div>

                                <div class="summary-section">
                                    <div class="summary-section-title">Giá trị hợp đồng</div>
                                    <div class="summary-item">
                                        <div class="summary-label">Tổng giá trị:</div>
                                        <div class="summary-value">45.000.000 VNĐ</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Lịch thanh toán:</div>
                                        <div class="summary-value">Tạm ứng + Thanh toán cuối</div>
                                    </div>
                                </div>

                                <div class="summary-section">
                                    <div class="summary-section-title">Các điều khoản quan trọng</div>
                                    <div class="summary-item">
                                        <div class="summary-label">Thời gian bảo hành:</div>
                                        <div class="summary-value">3 tháng</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Quyền sở hữu:</div>
                                        <div class="summary-value">Khách hàng sở hữu toàn bộ</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Thỏa thuận bảo mật:</div>
                                        <div class="summary-value">Áp dụng (2 năm)</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Giải quyết tranh chấp:</div>
                                        <div class="summary-value">Hòa giải qua ProLancer</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-section">
                            <div class="section-title">Thông tin các bên</div>

                            <div class="contract-parties">
                                <div class="party-info">
                                    <h3>Bên thuê (Employer)</h3>
                                    <p><strong>Công ty:</strong> Công ty TNHH ABC</p>
                                    <p><strong>Đại diện:</strong> Nguyễn Văn A</p>
                                    <p><strong>Chức vụ:</strong> Giám đốc</p>
                                    <p><strong>Địa chỉ:</strong> 123 Đường Lê Lợi, Quận 1, TP. HCM</p>
                                    <p><strong>Email:</strong> contact@abc.com</p>
                                    <p><strong>Điện thoại:</strong> 0901234567</p>
                                </div>
                                <div class="party-info">
                                    <h3>Bên cung cấp dịch vụ (Freelancer)</h3>
                                    <p><strong>Họ tên:</strong> Trần Thị B</p>
                                    <p><strong>CMND/CCCD:</strong> 012345678</p>
                                    <p><strong>Địa chỉ:</strong> 456 Đường Nguyễn Huệ, Quận 3, TP. HCM</p>
                                    <p><strong>Email:</strong> tranthib@email.com</p>
                                    <p><strong>Điện thoại:</strong> 0909876543</p>
                                </div>
                            </div>
                        </div>

                        <div class="form-section">
                            <div class="section-title">Xem xét nội dung hợp đồng</div>
                            <div class="document-preview">
                                <div class="document-icon">📄</div>
                                <div class="info-value">Hợp đồng dịch vụ thiết kế website thương mại điện tử ABC Store</div>
                                <div style="margin-top: 20px;">
                                    <a class="btn btn-outline">Xem toàn bộ hợp đồng</a>
                                </div>
                            </div>
                            <div class="checkbox-group">
                                <input type="checkbox" class="checkbox-input" id="agreement" required>
                                <label class="checkbox-label" for="agreement">Tôi đã đọc và đồng ý với các điều khoản trong hợp đồng</label>
                            </div>
                            <div class="checkbox-group">
                                <input type="checkbox" class="checkbox-input" id="confirmation" required>
                                <label class="checkbox-label" for="confirmation">Tôi xác nhận thông tin cung cấp là chính xác và đầy đủ</label>
                            </div>
                        </div>

                        <div class="form-section">
                            <div class="section-title">Chữ ký của các bên</div>
                            <div class="signature-container">
                                <div class="signature-box">
                                    <h4 class="signature-box-title">Bên A (Bên Thuê)</h4>
                                    <div class="signature-canvas-container" id="employer-signature">
                                        <div class="signature-placeholder">
                                            <i class="fas fa-signature"></i>
                                            <p>Nhấp vào đây để ký</p>
                                        </div>
                                    </div>
                                    <input type="text" class="signature-input" placeholder="Họ và tên người ký">
                                    <div class="signature-date">Ngày ký: 01/05/2025</div>
                                    <button type="button" class="clear-signature" id="clear-employer-signature">Xóa chữ ký</button>
                                </div>

                                <div class="signature-box">
                                    <h4 class="signature-box-title">Bên B (Freelancer)</h4>
                                    <div class="signature-canvas-container" id="freelancer-signature">
                                        <div class="signature-placeholder">
                                            <i class="fas fa-signature"></i>
                                            <p>Nhấp vào đây để ký</p>
                                        </div>
                                    </div>
                                    <input type="text" class="signature-input" placeholder="Họ và tên người ký">
                                    <div class="signature-date">Ngày ký: 01/05/2025</div>
                                    <button type="button" class="clear-signature" id="clear-freelancer-signature">Xóa chữ ký</button>
                                </div>
                            </div>
                        </div>

                        <div class="form-section">
                            <div class="section-title">Xác minh danh tính</div>
                            <p class="info-text">
                                <i class="fas fa-info-circle"></i>
                                Để đảm bảo tính pháp lý của hợp đồng, vui lòng tải lên bản quét/hình chụp CMND/CCCD/Hộ chiếu.
                            </p>

                            <div class="upload-section">
                                <div class="file-upload">
                                    <div class="file-input-container">
                                        <input type="file" class="file-input" id="id-front" accept="image/*">
                                        <button type="button" class="file-upload-btn">
                                            <i class="fas fa-upload"></i>
                                            Tải lên mặt trước CMND/CCCD
                                        </button>
                                    </div>
                                    <div class="file-name" id="id-front-name"></div>
                                </div>

                                <div class="file-upload">
                                    <div class="file-input-container">
                                        <input type="file" class="file-input" id="id-back" accept="image/*">
                                        <button type="button" class="file-upload-btn">
                                            <i class="fas fa-upload"></i>
                                            Tải lên mặt sau CMND/CCCD
                                        </button>
                                    </div>
                                    <div class="file-name" id="id-back-name"></div>
                                </div>
                            </div>

                            <div class="info-text">
                                <i class="fas fa-info-circle"></i>
                                Thông tin này chỉ được sử dụng để xác minh danh tính và sẽ được bảo mật theo quy định của ProLancer.
                            </div>
                        </div>

                        <div class="btn-container">
                            <button type="button" class="btn btn-outline" id="btn-back">Quay lại</button>
                            <button type="submit" class="btn" id="btn-submit">Hoàn tất ký kết</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </div>
</section>

<script>
    // Xử lý hiển thị tên file khi upload
    document.getElementById('id-front').addEventListener('change', function(e) {
        if (e.target.files.length > 0) {
            document.getElementById('id-front-name').textContent = e.target.files[0].name;
        }
    });

    document.getElementById('id-back').addEventListener('change', function(e) {
        if (e.target.files.length > 0) {
            document.getElementById('id-back-name').textContent = e.target.files[0].name;
        }
    });

    // Xử lý canvas chữ ký
    document.addEventListener('DOMContentLoaded', function() {
        const employerCanvas = document.getElementById('employer-signature');
        const freelancerCanvas = document.getElementById('freelancer-signature');

        // Khởi tạo canvas chữ ký cho Bên A
        const setupSignature = (container, clearButton) => {
            let isDrawing = false;
            let lastX = 0;
            let lastY = 0;

            // Tạo canvas element
            const canvas = document.createElement('canvas');
            canvas.width = container.offsetWidth;
            canvas.height = container.offsetHeight;
            canvas.style.display = 'none';
            canvas.style.position = 'absolute';
            canvas.style.top = '0';
            canvas.style.left = '0';
            canvas.style.width = '100%';
            canvas.style.height = '100%';
            canvas.style.cursor = 'crosshair';

            container.appendChild(canvas);
            const ctx = canvas.getContext('2d');

            // Sự kiện mousedown/touchstart
            const startDrawing = (e) => {
                isDrawing = true;
                container.querySelector('.signature-placeholder').style.display = 'none';
                canvas.style.display = 'block';

                const rect = canvas.getBoundingClientRect();
                const x = (e.clientX || e.touches[0].clientX) - rect.left;
                const y = (e.clientY || e.touches[0].clientY) - rect.top;

                lastX = x;
                lastY = y;
            };

            // Sự kiện mousemove/touchmove
            const draw = (e) => {
                if (!isDrawing) return;
                e.preventDefault();

                const rect = canvas.getBoundingClientRect();
                const x = (e.clientX || e.touches[0].clientX) - rect.left;
                const y = (e.clientY || e.touches[0].clientY) - rect.top;

                ctx.beginPath();
                ctx.moveTo(lastX, lastY);
                ctx.lineTo(x, y);
                ctx.strokeStyle = '#152070';
                ctx.lineWidth = 2;
                ctx.lineCap = 'round';
                ctx.stroke();

                lastX = x;
                lastY = y;
            };

            // Sự kiện mouseup/touchend
            const stopDrawing = () => {
                isDrawing = false;
            };

            // Gán sự kiện cho canvas
            container.addEventListener('mousedown', startDrawing);
            container.addEventListener('touchstart', startDrawing);
            document.addEventListener('mousemove', draw);
            document.addEventListener('touchmove', draw, { passive: false });
            document.addEventListener('mouseup', stopDrawing);
            document.addEventListener('touchend', stopDrawing);

            // Xóa chữ ký
            document.getElementById(clearButton).addEventListener('click', function() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                container.querySelector('.signature-placeholder').style.display = 'flex';
                canvas.style.display = 'none';
            });
        };

        // Khởi tạo chữ ký cho cả hai bên
        setupSignature(employerCanvas, 'clear-employer-signature');
        setupSignature(freelancerCanvas, 'clear-freelancer-signature');

        // Xử lý form submit
        document.getElementById('contract-signing-form').addEventListener('submit', function(e) {
            e.preventDefault();

            // Kiểm tra chữ ký và các trường bắt buộc
            // Sau đó chuyển đến màn hình hoàn thành

            alert('Hợp đồng đã được ký kết thành công!');
            // Chuyển hướng đến trang hoàn thành
            // window.location.href = 'contract-complete.jsp';
        });
    });
</script>
</body>
</html>