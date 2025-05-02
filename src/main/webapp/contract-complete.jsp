<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hoàn Thành Ký Kết Hợp Đồng - ProLancer</title>
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

        .status-completed {
            background-color: rgba(40, 167, 69, 0.2);
        }

        .status-completed::before {
            background-color: var(--success-color);
            box-shadow: 0 0 0 3px rgba(40, 167, 69, 0.3);
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
            width: 100%;  /* 100% for all steps completed */
            height: 3px;
            background: var(--primary-gradient);
            z-index: 2;
            transition: var(--transition);
            animation: progressComplete 1.5s ease-out;
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

        .progress-step.completed .step-number::after {
            content: "✓";
            font-size: 24px;
            line-height: 1;
        }

        .progress-step.completed .step-label {
            color: var(--success-color);
            font-weight: 600;
        }

        /* Success Message */
        .success-message {
            background-color: var(--white);
            border-radius: var(--radius);
            padding: 40px;
            box-shadow: var(--shadow);
            text-align: center;
            margin-bottom: 30px;
            animation: slideUpFade 0.8s ease-out;
        }

        .success-icon {
            width: 100px;
            height: 100px;
            background-color: rgba(40, 167, 69, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
        }

        .success-icon i {
            font-size: 50px;
            color: var(--success-color);
        }

        .success-title {
            font-size: 28px;
            font-weight: 700;
            color: var(--primary-dark);
            margin-bottom: 15px;
        }

        .success-text {
            font-size: 16px;
            color: var(--text-light);
            margin-bottom: 30px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        /* Contract Details */
        .contract-details {
            background-color: var(--white);
            border-radius: var(--radius);
            padding: 30px;
            box-shadow: var(--shadow);
            margin-bottom: 30px;
            animation: slideUpFade 0.6s ease-out;
            animation-delay: 0.3s;
            animation-fill-mode: both;
        }

        .details-section {
            margin-bottom: 30px;
        }

        .details-section:last-child {
            margin-bottom: 0;
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

        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid var(--border-color);
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .detail-label {
            font-weight: 500;
            color: var(--text-light);
        }

        .detail-value {
            font-weight: 600;
            color: var(--text-color);
        }

        /* Signature Display */
        .signatures-section {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }

        .signature-card {
            flex: 1;
            min-width: 300px;
            border: 1px solid var(--border-color);
            border-radius: var(--radius);
            padding: 20px;
            background-color: var(--secondary-color);
        }

        .signature-card-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--primary-color);
        }

        .signature-image {
            width: 100%;
            height: 100px;
            background-color: var(--white);
            border: 1px solid var(--border-color);
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
            padding: 10px;
        }

        .signature-image img {
            max-width: 100%;
            max-height: 100%;
        }

        .signature-name {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .signature-date {
            font-size: 14px;
            color: var(--text-light);
        }

        /* Next Steps */
        .next-steps {
            background-color: var(--white);
            border-radius: var(--radius);
            padding: 30px;
            box-shadow: var(--shadow);
            margin-bottom: 30px;
            animation: slideUpFade 0.6s ease-out;
            animation-delay: 0.6s;
            animation-fill-mode: both;
        }

        .steps-list {
            margin-top: 20px;
            counter-reset: step-counter;
        }

        .step-item {
            display: flex;
            margin-bottom: 20px;
            counter-increment: step-counter;
        }

        .step-item:last-child {
            margin-bottom: 0;
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

        .step-content {
            flex: 1;
        }

        .step-title {
            font-weight: 600;
            margin-bottom: 5px;
            color: var(--primary-dark);
        }

        .step-description {
            font-size: 14px;
            color: var(--text-light);
        }

        /* Action Buttons */
        .action-buttons {
            text-align: center;
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin: 30px 0;
            animation: slideUpFade 0.6s ease-out;
            animation-delay: 0.9s;
            animation-fill-mode: both;
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
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-outline {
            background-color: transparent;
            border: 1px solid var(--primary-color);
            color: var(--primary-color);
        }

        .btn-outline:hover {
            background-color: rgba(39, 64, 179, 0.05);
        }

        .btn-primary {
            background: var(--primary-gradient);
            color: var(--white);
            box-shadow: 0 4px 10px rgba(39, 64, 179, 0.3);
        }

        .btn-primary:hover {
            box-shadow: 0 6px 15px rgba(39, 64, 179, 0.4);
            transform: translateY(-2px);
        }

        .btn-success {
            background-color: var(--success-color);
            color: var(--white);
            box-shadow: 0 4px 10px rgba(40, 167, 69, 0.3);
        }

        .btn-success:hover {
            box-shadow: 0 6px 15px rgba(40, 167, 69, 0.4);
            transform: translateY(-2px);
        }

        /* Contract Summary Panel */
        .contract-summary-panel {
            background-color: var(--secondary-color);
            border-radius: var(--radius);
            padding: 20px;
            margin-top: 20px;
        }

        .contract-summary-item {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px solid var(--border-color);
        }

        .contract-summary-item:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .summary-item-label {
            font-weight: 500;
            color: var(--text-light);
        }

        .summary-item-value {
            font-weight: 600;
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

        .fa-check-circle {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%2328a745' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M22 11.08V12a10 10 0 1 1-5.93-9.14'%3E%3C/path%3E%3Cpolyline points='22 4 12 14.01 9 11.01'%3E%3C/polyline%3E%3C/svg%3E");
            width: 50px;
            height: 50px;
        }

        .fa-download {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23ffffff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4'%3E%3C/path%3E%3Cpolyline points='7 10 12 15 17 10'%3E%3C/polyline%3E%3Cline x1='12' y1='15' x2='12' y2='3'%3E%3C/line%3E%3C/svg%3E");
            vertical-align: text-bottom;
        }

        .fa-print {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%232740b3' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 6 2 18 2 18 9'%3E%3C/polyline%3E%3Cpath d='M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2'%3E%3C/path%3E%3Crect x='6' y='14' width='12' height='8'%3E%3C/rect%3E%3C/svg%3E");
            vertical-align: text-bottom;
        }

        .fa-file-contract {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%232740b3' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z'%3E%3C/path%3E%3Cpolyline points='14 2 14 8 20 8'%3E%3C/polyline%3E%3Cline x1='16' y1='13' x2='8' y2='13'%3E%3C/line%3E%3Cline x1='16' y1='17' x2='8' y2='17'%3E%3C/line%3E%3Cpolyline points='10 9 9 9 8 9'%3E%3C/polyline%3E%3C/svg%3E");
            vertical-align: text-bottom;
        }

        .fa-project-diagram {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%232740b3' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Crect x='2' y='4' width='6' height='6' rx='1'%3E%3C/rect%3E%3Crect x='14' y='4' width='6' height='6' rx='1'%3E%3C/rect%3E%3Crect x='8' y='16' width='6' height='6' rx='1'%3E%3C/rect%3E%3Cpath d='M5 10v6h12v-6'%3E%3C/path%3E%3C/svg%3E");
            vertical-align: text-bottom;
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

        @keyframes progressComplete {
            from {
                width: 75%;
            }
            to {
                width: 100%;
            }
        }

        /* Certificate Style */
        .certificate {
            background-color: var(--white);
            border: 5px solid var(--primary-dark);
            border-radius: var(--radius);
            padding: 30px;
            margin: 30px auto;
            max-width: 800px;
            position: relative;
            box-shadow: 0 10px 25px rgba(21, 32, 112, 0.25);
        }

        .certificate::before {
            content: "";
            position: absolute;
            top: 10px;
            right: 10px;
            bottom: 10px;
            left: 10px;
            border: 2px solid var(--primary-color);
            border-radius: 4px;
            pointer-events: none;
        }

        .certificate-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .certificate-logo {
            margin-bottom: 20px;
        }

        .certificate-title {
            font-size: 28px;
            font-weight: 700;
            color: var(--primary-dark);
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 10px;
        }

        .certificate-subtitle {
            font-size: 18px;
            color: var(--text-light);
        }

        .certificate-body {
            text-align: center;
            margin-bottom: 30px;
        }

        .certificate-id {
            font-size: 14px;
            color: var(--text-light);
            margin-bottom: 20px;
        }

        .certificate-text {
            font-size: 16px;
            line-height: 1.8;
            margin-bottom: 30px;
        }

        .certificate-signatures {
            display: flex;
            justify-content: space-around;
            margin-top: 50px;
        }

        .certificate-signature {
            text-align: center;
            width: 200px;
        }

        .signature-line {
            width: 100%;
            height: 1px;
            background-color: var(--text-color);
            margin-bottom: 10px;
        }

        .certificate-footer {
            text-align: center;
            margin-top: 30px;
            font-size: 14px;
            color: var(--text-light);
        }

        .certificate-stamp {
            position: absolute;
            bottom: 60px;
            right: 60px;
            width: 120px;
            height: 120px;
            background-color: rgba(39, 64, 179, 0.1);
            border: 2px solid var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transform: rotate(-15deg);
            opacity: 0.8;
        }

        .certificate-stamp-text {
            font-size: 14px;
            font-weight: 700;
            color: var(--primary-dark);
            text-transform: uppercase;
            text-align: center;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
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

            .signatures-section {
                flex-direction: column;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }

            .certificate {
                padding: 20px;
            }

            .certificate-stamp {
                width: 80px;
                height: 80px;
                bottom: 40px;
                right: 40px;
            }

            .certificate-stamp-text {
                font-size: 12px;
            }
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
                    <div class="contract-status status-completed">Đã hoàn thành</div>
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
                    <div class="progress-step completed">
                        <div class="step-number"></div>
                        <div class="step-label">Ký kết</div>
                    </div>
                    <div class="progress-step active">
                        <div class="step-number">4</div>
                        <div class="step-label">Hoàn thành</div>
                    </div>
                </div>

                <div class="success-message">
                    <div class="success-icon">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <h2 class="success-title">Ký kết hợp đồng thành công!</h2>
                    <p class="success-text">
                        Chúc mừng! Cả hai bên đã hoàn thành việc ký kết hợp đồng. Hợp đồng này có hiệu lực từ hôm nay và đã được lưu trữ trên hệ thống ProLancer.
                    </p>
                    <div class="contract-summary-panel">
                        <div class="contract-summary-item">
                            <div class="summary-item-label">Mã hợp đồng:</div>
                            <div class="summary-item-value">PL-2025050201</div>
                        </div>
                        <div class="contract-summary-item">
                            <div class="summary-item-label">Ngày ký:</div>
                            <div class="summary-item-value">02/05/2025</div>
                        </div>
                        <div class="contract-summary-item">
                            <div class="summary-item-label">Tình trạng:</div>
                            <div class="summary-item-value" style="color: var(--success-color);">Đã ký đầy đủ</div>
                        </div>
                    </div>
                </div>

                <div class="contract-details">
                    <div class="details-section">
                        <div class="section-title">Thông tin dự án</div>
                        <div class="detail-row">
                            <div class="detail-label">Tên dự án:</div>
                            <div class="detail-value">Thiết kế và phát triển website thương mại điện tử</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Ngày bắt đầu:</div>
                            <div class="detail-value">05/05/2025</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Ngày kết thúc dự kiến:</div>
                            <div class="detail-value">19/06/2025</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Tổng giá trị hợp đồng:</div>
                            <div class="detail-value">45.000.000 VNĐ</div>
                        </div>
                    </div>

                    <div class="details-section">
                        <div class="section-title">Chữ ký các bên</div>
                        <div class="signatures-section">
                            <div class="signature-card">
                                <div class="signature-card-title">Bên A (Bên Thuê)</div>
                                <div class="signature-image">
                                    <img src="/api/placeholder/200/100" alt="Chữ ký của Bên A" />
                                </div>
                                <div class="signature-name">Nguyễn Văn A</div>
                                <div class="signature-date">Đã ký ngày: 02/05/2025</div>
                            </div>

                            <div class="signature-card">
                                <div class="signature-card-title">Bên B (Freelancer)</div>
                                <div class="signature-image">
                                    <img src="/api/placeholder/200/100" alt="Chữ ký của Bên B" />
                                </div>
                                <div class="signature-name">Trần Thị B</div>
                                <div class="signature-date">Đã ký ngày: 02/05/2025</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="certificate">
                    <div class="certificate-header">
                        <div class="certificate-logo">
                            <img src="/api/placeholder/150/50" alt="ProLancer Logo" />
                        </div>
                        <h2 class="certificate-title">Xác nhận hợp đồng</h2>
                        <p class="certificate-subtitle">Hợp đồng dịch vụ thiết kế website thương mại điện tử</p>
                    </div>

                    <div class="certificate-body">
                        <div class="certificate-id">Mã hợp đồng: PL-2025050201</div>
                        <p class="certificate-text">
                            Văn bản này xác nhận rằng hai bên đã chính thức ký kết hợp đồng dịch vụ thiết kế và phát triển website thương mại điện tử theo các điều khoản và điều kiện đã được thỏa thuận. Hợp đồng này có giá trị kể từ ngày 02/05/2025 và được bảo đảm bởi nền tảng ProLancer.
                        </p>

                        <div class="certificate-signatures">
                            <div class="certificate-signature">
                                <div class="signature-line"></div>
                                <div class="signature-name">Nguyễn Văn A</div>
                                <div class="signature-title">Bên A (Bên Thuê)</div>
                            </div>
                            <div class="certificate-signature">
                                <div class="signature-line"></div>
                                <div class="signature-name">Trần Thị B</div>
                                <div class="signature-title">Bên B (Freelancer)</div>
                            </div>
                        </div>
                    </div>

                    <div class="certificate-footer">
                        <p>Văn bản này được tạo tự động bởi hệ thống ProLancer và có giá trị pháp lý theo quy định của pháp luật Việt Nam.</p>
                        <p>© 2025 ProLancer - Nền tảng kết nối Freelancer hàng đầu Việt Nam</p>
                    </div>

                    <div class="certificate-stamp">
                        <div class="certificate-stamp-text">Xác nhận<br>ProLancer</div>
                    </div>
                </div>

                <div class="next-steps">
                    <div class="section-title">Các bước tiếp theo</div>
                    <div class="steps-list">
                        <div class="step-item">
                            <div class="step-number"></div>
                            <div class="step-content">
                                <div class="step-title">Liên hệ và bắt đầu dự án</div>
                                <div class="step-description">
                                    Cả hai bên nên tổ chức cuộc họp khởi động dự án để thảo luận chi tiết về yêu cầu và lịch trình làm việc.
                                </div>
                            </div>
                        </div>
                        <div class="step-item">
                            <div class="step-number"></div>
                            <div class="step-content">
                                <div class="step-title">Theo dõi tiến độ dự án</div>
                                <div class="step-description">
                                    Sử dụng công cụ quản lý dự án trên nền tảng ProLancer để cập nhật và theo dõi tiến độ công việc.
                                </div>
                            </div>
                        </div>
                        <div class="step-item">
                            <div class="step-number"></div>
                            <div class="step-content">
                                <div class="step-title">Thanh toán theo cột mốc</div>
                                <div class="step-description">
                                    Thanh toán sẽ được thực hiện theo các cột mốc đã thỏa thuận trong hợp đồng khi mỗi giai đoạn hoàn thành.
                                </div>
                            </div>
                        </div>
                        <div class="step-item">
                            <div class="step-number"></div>
                            <div class="step-content">
                                <div class="step-title">Nghiệm thu và hoàn thành dự án</div>
                                <div class="step-description">
                                    Khi dự án hoàn thành, cả hai bên sẽ tiến hành nghiệm thu và đánh giá chất lượng công việc.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="action-buttons">
                    <button class="btn btn-success">
                        <i class="fas fa-download"></i> Tải xuống hợp đồng
                    </button>
                    <button class="btn btn-outline">
                        <i class="fas fa-print"></i> In hợp đồng
                    </button>
                    <button class="btn btn-primary">
                        <i class="fas fa-project-diagram"></i> Quản lý dự án
                    </button>
                    <button class="btn btn-outline">
                        <i class="fas fa-file-contract"></i> Xem chi tiết hợp đồng
                    </button>
                </div>

                <div class="contract-details">
                    <div class="details-section">
                        <div class="section-title">Chi tiết thanh toán</div>
                        <div class="detail-row">
                            <div class="detail-label">Phương thức thanh toán:</div>
                            <div class="detail-value">Chuyển khoản ngân hàng</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Lịch thanh toán:</div>
                            <div class="detail-value">Chia làm 3 đợt theo cột mốc</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Đợt 1 (30%):</div>
                            <div class="detail-value">13.500.000 VNĐ - Sau khi phê duyệt thiết kế</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Đợt 2 (40%):</div>
                            <div class="detail-value">18.000.000 VNĐ - Sau khi hoàn thành lập trình</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Đợt 3 (30%):</div>
                            <div class="detail-value">13.500.000 VNĐ - Sau khi nghiệm thu và bàn giao</div>
                        </div>
                    </div>

                    <div class="details-section">
                        <div class="section-title">Thông tin liên hệ</div>
                        <div class="detail-row">
                            <div class="detail-label">Bên A:</div>
                            <div class="detail-value">Nguyễn Văn A</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Email:</div>
                            <div class="detail-value">nguyenvana@email.com</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Số điện thoại:</div>
                            <div class="detail-value">0901234567</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Bên B:</div>
                            <div class="detail-value">Trần Thị B</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Email:</div>
                            <div class="detail-value">tranthib@email.com</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Số điện thoại:</div>
                            <div class="detail-value">0909876543</div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</section>

<script>
    // Animation for progress steps
    document.addEventListener('DOMContentLoaded', function() {
        // Simulate progress completion animation
        setTimeout(function() {
            document.querySelectorAll('.progress-step').forEach(function(step, index) {
                setTimeout(function() {
                    step.classList.add('active');
                }, index * 500);
            });
        }, 500);
    });
</script>
</body>
</html>
