<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Điều Khoản Hợp Đồng - ProLancer</title>
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
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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

        .status-active {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .status-active::before {
            background-color: #2ecc71;
            box-shadow: 0 0 0 3px rgba(46, 204, 113, 0.3);
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
            width: 50%;  /* 50% for second step active */
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

        .progress-step.completed .step-number::after {
            content: "✓";
            font-size: 22px;
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

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            font-size: 14px;
            color: var(--text-color);
            margin-bottom: 8px;
            font-weight: 500;
            display: block;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border-color);
            border-radius: var(--radius);
            font-size: 16px;
            color: var(--text-color);
            transition: var(--transition);
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(39, 64, 179, 0.1);
            outline: none;
        }

        textarea.form-control {
            resize: vertical;
            min-height: 120px;
        }

        .form-row {
            display: flex;
            margin: 0 -15px 20px;
        }

        .form-col {
            flex: 1;
            padding: 0 15px;
        }

        /* Checkbox Style */
        .checkbox-group {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .checkbox-input {
            width: 20px;
            height: 20px;
            margin-right: 10px;
            cursor: pointer;
            accent-color: var(--primary-color);
        }

        .checkbox-label {
            font-size: 16px;
            color: var(--text-color);
            cursor: pointer;
        }

        /* Radio Button Style */
        .radio-group {
            margin-bottom: 15px;
        }

        .radio-options {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .radio-option {
            display: flex;
            align-items: center;
        }

        .radio-input {
            width: 20px;
            height: 20px;
            margin-right: 8px;
            cursor: pointer;
            accent-color: var(--primary-color);
        }

        .radio-label {
            font-size: 16px;
            color: var(--text-color);
            cursor: pointer;
        }

        /* Select Style */
        .form-select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border-color);
            border-radius: var(--radius);
            font-size: 16px;
            color: var(--text-color);
            background-color: var(--white);
            transition: var(--transition);
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%232740b3' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 15px center;
            padding-right: 40px;
        }

        .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(39, 64, 179, 0.1);
            outline: none;
        }

        /* Date Input */
        .date-input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border-color);
            border-radius: var(--radius);
            font-size: 16px;
            color: var(--text-color);
            transition: var(--transition);
        }

        .date-input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(39, 64, 179, 0.1);
            outline: none;
        }

        /* File Upload */
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

        /* Info Text */
        .info-text {
            font-size: 14px;
            color: var(--text-light);
            margin-top: 5px;
            font-style: italic;
        }

        /* Add Term Button */
        .add-term-btn {
            display: flex;
            align-items: center;
            gap: 8px;
            color: var(--primary-color);
            background: transparent;
            border: 1px dashed var(--primary-color);
            padding: 10px 15px;
            border-radius: var(--radius);
            cursor: pointer;
            font-weight: 500;
            transition: var(--transition);
            width: 100%;
            justify-content: center;
            margin-top: 10px;
        }

        .add-term-btn:hover {
            background-color: rgba(39, 64, 179, 0.05);
        }

        /* Summary Box */
        .summary-box {
            background-color: var(--secondary-color);
            border-radius: var(--radius);
            padding: 20px;
            margin-top: 20px;
        }

        .summary-title {
            font-weight: 600;
            font-size: 16px;
            margin-bottom: 10px;
            color: var(--primary-dark);
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
        }

        .summary-value {
            font-weight: 500;
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

        .fa-plus {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%232740b3' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cline x1='12' y1='5' x2='12' y2='19'%3E%3C/line%3E%3Cline x1='5' y1='12' x2='19' y2='12'%3E%3C/line%3E%3C/svg%3E");
        }

        .fa-upload {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%232740b3' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4'%3E%3C/path%3E%3Cpolyline points='17 8 12 3 7 8'%3E%3C/polyline%3E%3Cline x1='12' y1='3' x2='12' y2='15'%3E%3C/line%3E%3C/svg%3E");
        }

        .fa-info-circle {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%236e6e6e' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Ccircle cx='12' cy='12' r='10'%3E%3C/circle%3E%3Cline x1='12' y1='16' x2='12' y2='12'%3E%3C/line%3E%3Cline x1='12' y1='8' x2='12.01' y2='8'%3E%3C/line%3E%3C/svg%3E");
            vertical-align: middle;
            margin-right: 5px;
        }

        /* Additional Term Box */
        .term-box {
            border: 1px solid var(--border-color);
            border-radius: var(--radius);
            padding: 15px;
            margin-bottom: 15px;
            position: relative;
        }

        .remove-term {
            position: absolute;
            top: 15px;
            right: 15px;
            color: var(--danger-color);
            font-size: 18px;
            cursor: pointer;
            background: none;
            border: none;
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            transition: var(--transition);
        }

        .remove-term:hover {
            background-color: rgba(220, 53, 69, 0.1);
        }

        /* Tooltip */
        .tooltip {
            position: relative;
            display: inline-block;
            margin-left: 5px;
            cursor: help;
        }

        .tooltip-icon {
            display: inline-block;
            width: 16px;
            height: 16px;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%236e6e6e' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Ccircle cx='12' cy='12' r='10'%3E%3C/circle%3E%3Cline x1='12' y1='16' x2='12' y2='12'%3E%3C/line%3E%3Cline x1='12' y1='8' x2='12.01' y2='8'%3E%3C/line%3E%3C/svg%3E");
            background-size: contain;
            background-repeat: no-repeat;
            vertical-align: middle;
        }

        .tooltip-text {
            visibility: hidden;
            width: 250px;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 8px 12px;
            position: absolute;
            z-index: 1;
            bottom: 125%;
            left: 50%;
            transform: translateX(-50%);
            opacity: 0;
            transition: opacity 0.3s;
            font-size: 12px;
            line-height: 1.4;
        }

        .tooltip-text::after {
            content: "";
            position: absolute;
            top: 100%;
            left: 50%;
            margin-left: -5px;
            border-width: 5px;
            border-style: solid;
            border-color: #333 transparent transparent transparent;
        }

        .tooltip:hover .tooltip-text {
            visibility: visible;
            opacity: 1;
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
                width: 25%;
            }
            to {
                width: 50%;
            }
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(46, 204, 113, 0.7);
            }
            70% {
                box-shadow: 0 0 0 6px rgba(46, 204, 113, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(46, 204, 113, 0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
            }

            .form-col {
                padding: 0;
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
    </style>
</head>
<body>
<%@include file="includes/header-01.jsp"%>
<section>
    <div class="container section-padding">
        <div class="justify-content-center">
            <main class="container">
                <div class="contract-header">
                    <div class="contract-title">Hợp Đồng Dịch Vụ Freelance</div>
                    <div class="contract-status status-active">Đang xác lập</div>
                </div>

                <div class="contract-progress">
                    <div class="progress-step completed">
                        <div class="step-number"></div>
                        <div class="step-label">Thông tin dự án</div>
                    </div>
                    <div class="progress-step active">
                        <div class="step-number">2</div>
                        <div class="step-label">Điều khoản</div>
                    </div>
                    <div class="progress-step">
                        <div class="step-number">3</div>
                        <div class="step-label">Ký kết</div>
                    </div>
                    <div class="progress-step">
                        <div class="step-number">4</div>
                        <div class="step-label">Hoàn thành</div>
                    </div>
                </div>

                <div class="contract-body">
                    <form id="contract-terms-form">
                        <div class="form-section">
                            <div class="section-title">Điều khoản chung</div>
                            <div class="form-group">
                                <label class="form-label">Thời gian bảo hành sau bàn giao
                                    <span class="tooltip">
                                            <span class="tooltip-icon"></span>
                                            <span class="tooltip-text">Thời gian hỗ trợ kỹ thuật sau khi bàn giao sản phẩm</span>
                                        </span>
                                </label>
                                <select class="form-select" name="warranty_period">
                                    <option value="1">1 tháng</option>
                                    <option value="3" selected>3 tháng</option>
                                    <option value="6">6 tháng</option>
                                    <option value="12">12 tháng</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Phạm vi bảo hành</label>
                                <textarea class="form-control" name="warranty_scope" rows="4" placeholder="Mô tả phạm vi bảo hành sau bàn giao...">Sửa lỗi phát sinh, hỗ trợ kỹ thuật và vận hành website trong thời gian bảo hành. Không bao gồm các thay đổi về chức năng hoặc thiết kế.</textarea>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Thời gian phản hồi khi có sự cố</label>
                                <select class="form-select" name="response_time">
                                    <option value="4">Trong vòng 4 giờ làm việc</option>
                                    <option value="8">Trong vòng 8 giờ làm việc</option>
                                    <option value="24" selected>Trong vòng 24 giờ</option>
                                    <option value="48">Trong vòng 48 giờ</option>
                                </select>
                            </div>
                        </div>

                        <!-- Thông tin Bên A - Employer -->
                        <div class="form-section">
                            <div class="section-title">Thông tin Bên A (Employer)</div>
                            <div class="form-group">
                                <label class="form-label">Tên đầy đủ</label>
                                <input type="text" class="form-control" name="employer_name" placeholder="Tên đầy đủ của Bên A">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Địa chỉ trụ sở (nếu có)</label>
                                <input type="text" class="form-control" name="employer_address" placeholder="Địa chỉ trụ sở của Bên A">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Đại diện</label>
                                <input type="text" class="form-control" name="employer_representative" placeholder="Họ tên người đại diện">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Chức vụ</label>
                                <input type="text" class="form-control" name="employer_position" placeholder="Chức vụ người đại diện">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Số CMND/CCCD</label>
                                <input type="text" class="form-control" name="employer_id_number" placeholder="Số CMND/CCCD">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày cấp</label>
                                <input type="date" class="form-control" name="employer_id_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Nơi cấp</label>
                                <input type="text" class="form-control" name="employer_id_place" placeholder="Nơi cấp CMND/CCCD">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Mã số thuế</label>
                                <input type="text" class="form-control" name="employer_tax_code" placeholder="Mã số thuế">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày sinh</label>
                                <input type="date" class="form-control" name="employer_birth_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Địa chỉ thường trú</label>
                                <input type="text" class="form-control" name="employer_permanent_address" placeholder="Địa chỉ thường trú">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Địa chỉ liên hệ</label>
                                <input type="text" class="form-control" name="employer_contact_address" placeholder="Địa chỉ liên hệ">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Số điện thoại</label>
                                <input type="tel" class="form-control" name="employer_phone" placeholder="Số điện thoại">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" name="employer_email" placeholder="Địa chỉ email">
                            </div>
                        </div>

                        <!-- Thông tin Bên B - Freelancer -->
                        <div class="form-section">
                            <div class="section-title">Thông tin Bên B (Freelancer)</div>
                            <div class="form-group">
                                <label class="form-label">Tên đầy đủ</label>
                                <input type="text" class="form-control" name="freelancer_name" placeholder="Tên đầy đủ của Bên B">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Đại diện (nếu có)</label>
                                <input type="text" class="form-control" name="freelancer_representative" placeholder="Họ tên người đại diện">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Chức vụ</label>
                                <input type="text" class="form-control" name="freelancer_position" placeholder="Chức vụ người đại diện">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Số CMND/CCCD</label>
                                <input type="text" class="form-control" name="freelancer_id_number" placeholder="Số CMND/CCCD">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày cấp</label>
                                <input type="date" class="form-control" name="freelancer_id_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Nơi cấp</label>
                                <input type="text" class="form-control" name="freelancer_id_place" placeholder="Nơi cấp CMND/CCCD">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày sinh</label>
                                <input type="date" class="form-control" name="freelancer_birth_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Địa chỉ liên hệ</label>
                                <input type="text" class="form-control" name="freelancer_contact_address" placeholder="Địa chỉ liên hệ">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Số điện thoại</label>
                                <input type="tel" class="form-control" name="freelancer_phone" placeholder="Số điện thoại">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" name="freelancer_email" placeholder="Địa chỉ email">
                            </div>
                        </div>

                        <!-- Nội dung công việc -->
                        <div class="form-section">
                            <div class="section-title">Điều 1: Nội dung công việc</div>
                            <div class="form-group">
                                <label class="form-label">Mô tả công việc</label>
                                <textarea class="form-control" name="job_description" rows="4" placeholder="Mô tả chi tiết công việc mà Bên B sẽ thực hiện cho Bên A"></textarea>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Yêu cầu về chất lượng công việc</label>
                                <textarea class="form-control" name="quality_requirements" rows="4" placeholder="Mô tả yêu cầu về chất lượng công việc"></textarea>
                            </div>
                        </div>

                        <!-- Thời gian và địa điểm thực hiện -->
                        <div class="form-section">
                            <div class="section-title">Điều 2: Thời gian và địa điểm thực hiện</div>
                            <div class="form-group">
                                <label class="form-label">Ngày bắt đầu</label>
                                <input type="date" class="form-control" name="start_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày kết thúc</label>
                                <input type="date" class="form-control" name="end_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Địa điểm thực hiện</label>
                                <input type="text" class="form-control" name="work_location" placeholder="Địa điểm thực hiện công việc">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày thanh lý hợp đồng</label>
                                <input type="date" class="form-control" name="liquidation_date">
                                <small class="form-text">Không quá 5 ngày sau ngày dự kiến hoàn thành công việc</small>
                            </div>
                        </div>

                        <!-- Phí dịch vụ và thanh toán -->
                        <div class="form-section">
                            <div class="section-title">Điều 3: Phí dịch vụ và thanh toán</div>
                            <div class="form-group">
                                <label class="form-label">Tổng phí dịch vụ (VNĐ)</label>
                                <input type="number" class="form-control" name="service_fee" placeholder="Nhập tổng phí dịch vụ (VNĐ)">
                                <small class="form-text">Thuế TNCN 10% sẽ được khấu trừ cho khoản thu nhập từ 2.000.000 VNĐ trở lên</small>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Đặt cọc của Bên A (VNĐ)</label>
                                <input type="number" class="form-control" name="employer_deposit" placeholder="Số tiền Bên A đặt cọc">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày đặt cọc của Bên A</label>
                                <input type="date" class="form-control" name="employer_deposit_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Đặt cọc của Bên B (VNĐ)</label>
                                <input type="number" class="form-control" name="freelancer_deposit" placeholder="Số tiền Bên B đặt cọc">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày đặt cọc của Bên B</label>
                                <input type="date" class="form-control" name="freelancer_deposit_date">
                            </div>
                        </div>

                        <!-- Điều khoản bảo hành -->
                        <div class="form-section">
                            <div class="section-title">Điều khoản bảo hành</div>
                            <div class="form-group">
                                <label class="form-label">Thời gian bảo hành sau bàn giao
                                    <span class="tooltip">
                <span class="tooltip-icon"></span>
                <span class="tooltip-text">Thời gian hỗ trợ kỹ thuật sau khi bàn giao sản phẩm</span>
            </span>
                                </label>
                                <select class="form-select" name="warranty_period">
                                    <option value="1">1 tháng</option>
                                    <option value="3" selected>3 tháng</option>
                                    <option value="6">6 tháng</option>
                                    <option value="12">12 tháng</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Phạm vi bảo hành</label>
                                <textarea class="form-control" name="warranty_scope" rows="4" placeholder="Mô tả phạm vi bảo hành sau bàn giao...">Sửa lỗi phát sinh, hỗ trợ kỹ thuật và vận hành trong thời gian bảo hành. Không bao gồm các thay đổi về chức năng hoặc thiết kế.</textarea>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Thời gian phản hồi khi có sự cố</label>
                                <select class="form-select" name="response_time">
                                    <option value="4">Trong vòng 4 giờ làm việc</option>
                                    <option value="8">Trong vòng 8 giờ làm việc</option>
                                    <option value="24" selected>Trong vòng 24 giờ</option>
                                    <option value="48">Trong vòng 48 giờ</option>
                                </select>
                            </div>
                        </div>

                        <!-- Điều khoản vi phạm hợp đồng -->
                        <div class="form-section">
                            <div class="section-title">Điều khoản vi phạm hợp đồng</div>
                            <div class="form-group">
                                <label class="form-label">Thời gian gia hạn tối đa khi chậm hoàn thành</label>
                                <input type="number" class="form-control" name="max_delay_days" value="5" readonly>
                                <small class="form-text">Số ngày tối đa được phép chậm hoàn thành công việc</small>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Mức phạt lãi suất chậm hoàn thành/thanh toán</label>
                                <input type="text" class="form-control" name="penalty_rate" value="0.1%/ngày" readonly>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Điểm trừ trên hệ thống khi vi phạm</label>
                                <input type="number" class="form-control" name="penalty_points" value="35" readonly>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Thời gian tối đa trước khi chấm dứt hợp đồng</label>
                                <input type="number" class="form-control" name="max_contract_termination_days" value="15" readonly>
                                <small class="form-text">Số ngày chậm tối đa trước khi bên không vi phạm có quyền đơn phương chấm dứt hợp đồng</small>
                            </div>
                        </div>

<%--                        <!-- Nút gửi form -->--%>
<%--                        <div class="form-group">--%>
<%--                            <button type="submit" class="btn btn-primary">Hoàn thành hợp đồng</button>--%>
<%--                        </div>--%>
<%--================================Phần EXTEND==================================--%>
<%--                        <div class="form-section">--%>
<%--                            <div class="section-title">Quyền sở hữu & bản quyền</div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Quyền sở hữu sản phẩm sau hoàn thành</label>--%>
<%--                                <div class="radio-group">--%>
<%--                                    <div class="radio-options">--%>
<%--                                        <div class="radio-option">--%>
<%--                                            <input type="radio" id="ownership_client" name="ownership" value="client" checked class="radio-input">--%>
<%--                                            <label for="ownership_client" class="radio-label">Khách hàng sở hữu toàn bộ</label>--%>
<%--                                        </div>--%>
<%--                                        <div class="radio-option">--%>
<%--                                            <input type="radio" id="ownership_shared" name="ownership" value="shared" class="radio-input">--%>
<%--                                            <label for="ownership_shared" class="radio-label">Sở hữu chung</label>--%>
<%--                                        </div>--%>
<%--                                        <div class="radio-option">--%>
<%--                                            <input type="radio" id="ownership_freelancer" name="ownership" value="freelancer" class="radio-input">--%>
<%--                                            <label for="ownership_freelancer" class="radio-label">Freelancer giữ bản quyền</label>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Chi tiết về quyền sở hữu trí tuệ</label>--%>
<%--                                <textarea class="form-control" name="intellectual_property_details" rows="4" placeholder="Mô tả chi tiết về quyền sở hữu...">Khách hàng sẽ sở hữu toàn bộ quyền đối với sản phẩm sau khi thanh toán đầy đủ, bao gồm mã nguồn, thiết kế và tất cả tài sản trí tuệ liên quan. Freelancer có thể sử dụng dự án trong portfolio của mình.</textarea>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Sử dụng tài nguyên của bên thứ ba</label>--%>
<%--                                <textarea class="form-control" name="third_party_resources" rows="3" placeholder="Liệt kê các tài nguyên của bên thứ ba sẽ được sử dụng...">Các plugin WordPress: WooCommerce, Yoast SEO, Contact Form 7. Thư viện JavaScript: jQuery, Bootstrap. Hình ảnh stock từ nguồn Unsplash (miễn phí sử dụng thương mại).</textarea>--%>
<%--                                <p class="info-text"><i class="fas fa-info-circle"></i> Cần liệt kê đầy đủ các thư viện, plugin, hình ảnh hoặc nội dung của bên thứ ba và bản quyền tương ứng</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-section">--%>
<%--                            <div class="section-title">Điều khoản bảo mật</div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Thỏa thuận không tiết lộ thông tin (NDA)</label>--%>
<%--                                <div class="checkbox-group">--%>
<%--                                    <input type="checkbox" id="nda_required" name="nda_required" class="checkbox-input" checked>--%>
<%--                                    <label for="nda_required" class="checkbox-label">Yêu cầu thỏa thuận bảo mật</label>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Nội dung thỏa thuận bảo mật</label>--%>
<%--                                <textarea class="form-control" name="nda_content" rows="4" placeholder="Mô tả chi tiết thỏa thuận bảo mật...">Freelancer đồng ý không tiết lộ bất kỳ thông tin kinh doanh, chiến lược, dữ liệu khách hàng hoặc thông tin độc quyền nào của khách hàng trong và sau quá trình thực hiện dự án. Thông tin bảo mật bao gồm nhưng không giới hạn: mã nguồn, tài liệu kinh doanh, chiến lược marketing, và thông tin người dùng.</textarea>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Thời hạn hiệu lực của thỏa thuận bảo mật</label>--%>
<%--                                <select class="form-select" name="nda_duration">--%>
<%--                                    <option value="1">1 năm sau khi kết thúc dự án</option>--%>
<%--                                    <option value="2" selected>2 năm sau khi kết thúc dự án</option>--%>
<%--                                    <option value="3">3 năm sau khi kết thúc dự án</option>--%>
<%--                                    <option value="5">5 năm sau khi kết thúc dự án</option>--%>
<%--                                    <option value="forever">Vô thời hạn</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Bảo vệ dữ liệu cá nhân</label>--%>
<%--                                <textarea class="form-control" name="data_protection" rows="3" placeholder="Mô tả biện pháp bảo vệ dữ liệu cá nhân...">Freelancer cam kết tuân thủ các quy định về bảo vệ dữ liệu cá nhân theo luật hiện hành. Mọi dữ liệu cá nhân được cung cấp trong quá trình thực hiện dự án sẽ được bảo mật, không chia sẻ với bên thứ ba và chỉ sử dụng cho mục đích hoàn thành dự án.</textarea>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-section">--%>
<%--                            <div class="section-title">Điều khoản thanh toán</div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Phương thức thanh toán</label>--%>
<%--                                <div class="radio-group">--%>
<%--                                    <div class="radio-options">--%>
<%--                                        <div class="radio-option">--%>
<%--                                            <input type="radio" id="payment_escrow" name="payment_method" value="escrow" checked class="radio-input">--%>
<%--                                            <label for="payment_escrow" class="radio-label">Qua ký quỹ ProLancer</label>--%>
<%--                                        </div>--%>
<%--                                        <div class="radio-option">--%>
<%--                                            <input type="radio" id="payment_direct" name="payment_method" value="direct" class="radio-input">--%>
<%--                                            <label for="payment_direct" class="radio-label">Thanh toán trực tiếp</label>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Lịch thanh toán</label>--%>
<%--                                <select class="form-select" name="payment_schedule">--%>
<%--                                    <option value="milestone">Theo cột mốc dự án</option>--%>
<%--                                    <option value="upfront_final" selected>Tạm ứng + Thanh toán cuối</option>--%>
<%--                                    <option value="equal">Chia đều các đợt</option>--%>
<%--                                    <option value="completion">Thanh toán khi hoàn thành</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Chi tiết lịch thanh toán</label>--%>
<%--                                <textarea class="form-control" name="payment_details" rows="4" placeholder="Mô tả chi tiết lịch thanh toán...">Đợt 1: 30% giá trị hợp đồng ngay sau khi ký hợp đồng.--%>
<%--Đợt 2: 30% sau khi hoàn thành giai đoạn thiết kế và được khách hàng phê duyệt.--%>
<%--Đợt 3: 40% sau khi hoàn thành toàn bộ dự án và bàn giao sản phẩm.</textarea>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Chính sách phạt trễ hạn thanh toán</label>--%>
<%--                                <textarea class="form-control" name="late_payment_penalty" rows="3" placeholder="Mô tả chính sách phạt khi trễ hạn thanh toán...">Nếu khách hàng chậm thanh toán quá 7 ngày so với thời hạn quy định, phí phạt 1% giá trị khoản thanh toán sẽ được áp dụng cho mỗi tuần chậm trễ. Nếu thanh toán chậm quá 30 ngày, freelancer có quyền tạm ngừng dự án cho đến khi thanh toán được thực hiện.</textarea>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-section">--%>
<%--                            <div class="section-title">Điều khoản chấm dứt hợp đồng</div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Điều kiện chấm dứt hợp đồng</label>--%>
<%--                                <textarea class="form-control" name="termination_conditions" rows="4" placeholder="Mô tả điều kiện chấm dứt hợp đồng...">Hợp đồng có thể bị chấm dứt trong các trường hợp sau:--%>
<%--1. Hai bên thỏa thuận chấm dứt bằng văn bản.--%>
<%--2. Một bên vi phạm nghiêm trọng các điều khoản hợp đồng và không khắc phục trong vòng 15 ngày sau khi nhận được thông báo bằng văn bản.--%>
<%--3. Khách hàng không thanh toán quá 45 ngày so với thời hạn quy định.--%>
<%--4. Freelancer không thể hoàn thành công việc sau khi đã gia hạn 30 ngày so với thời hạn ban đầu.</textarea>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Thanh toán khi chấm dứt sớm</label>--%>
<%--                                <textarea class="form-control" name="early_termination_payment" rows="3" placeholder="Mô tả chính sách thanh toán khi chấm dứt sớm...">Nếu hợp đồng bị chấm dứt sớm:--%>
<%--1. Khách hàng phải thanh toán cho tất cả công việc đã hoàn thành tính đến thời điểm chấm dứt.--%>
<%--2. Nếu chấm dứt do lỗi của khách hàng, khách hàng phải thanh toán thêm 20% giá trị còn lại của hợp đồng.--%>
<%--3. Nếu chấm dứt do lỗi của freelancer, freelancer phải hoàn trả các khoản đã nhận cho phần công việc chưa hoàn thành.</textarea>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Thông báo chấm dứt hợp đồng</label>--%>
<%--                                <select class="form-select" name="termination_notice">--%>
<%--                                    <option value="7">7 ngày trước bằng văn bản</option>--%>
<%--                                    <option value="14" selected>14 ngày trước bằng văn bản</option>--%>
<%--                                    <option value="30">30 ngày trước bằng văn bản</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-section">--%>
<%--                            <div class="section-title">Giải quyết tranh chấp</div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Phương thức giải quyết tranh chấp</label>--%>
<%--                                <div class="radio-group">--%>
<%--                                    <div class="radio-options">--%>
<%--                                        <div class="radio-option">--%>
<%--                                            <input type="radio" id="dispute_mediation" name="dispute_resolution" value="mediation" checked class="radio-input">--%>
<%--                                            <label for="dispute_mediation" class="radio-label">Hòa giải qua ProLancer</label>--%>
<%--                                        </div>--%>
<%--                                        <div class="radio-option">--%>
<%--                                            <input type="radio" id="dispute_arbitration" name="dispute_resolution" value="arbitration" class="radio-input">--%>
<%--                                            <label for="dispute_arbitration" class="radio-label">Trọng tài</label>--%>
<%--                                        </div>--%>
<%--                                        <div class="radio-option">--%>
<%--                                            <input type="radio" id="dispute_court" name="dispute_resolution" value="court" class="radio-input">--%>
<%--                                            <label for="dispute_court" class="radio-label">Tòa án có thẩm quyền</label>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Quy trình giải quyết tranh chấp</label>--%>
<%--                                <textarea class="form-control" name="dispute_process" rows="4" placeholder="Mô tả quy trình giải quyết tranh chấp...">1. Các bên sẽ nỗ lực giải quyết mọi tranh chấp thông qua đàm phán trực tiếp trong vòng 15 ngày kể từ khi phát sinh tranh chấp.--%>
<%--2. Nếu không thể giải quyết, các bên sẽ yêu cầu hòa giải thông qua dịch vụ hòa giải của ProLancer.--%>
<%--3. Nếu hòa giải không thành công trong vòng 30 ngày, vụ việc sẽ được đưa ra trọng tài theo quy tắc của Trung tâm Trọng tài Quốc tế Việt Nam (VIAC).--%>
<%--4. Quyết định của trọng tài là cuối cùng và có hiệu lực ràng buộc đối với các bên.</textarea>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Luật áp dụng</label>--%>
<%--                                <select class="form-select" name="governing_law">--%>
<%--                                    <option value="vietnam" selected>Luật pháp Việt Nam</option>--%>
<%--                                    <option value="international">Luật Thương mại Quốc tế</option>--%>
<%--                                    <option value="other">Khác (nêu rõ trong phần bổ sung)</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-section">--%>
<%--                            <div class="section-title">Điều khoản bổ sung</div>--%>

<%--                            <div class="term-box">--%>
<%--                                <button type="button" class="remove-term">×</button>--%>
<%--                                <div class="form-group">--%>
<%--                                    <label class="form-label">Tiêu đề điều khoản</label>--%>
<%--                                    <input type="text" class="form-control" name="additional_term_title_1" value="Quyền xem xét và yêu cầu sửa đổi">--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <label class="form-label">Nội dung điều khoản</label>--%>
<%--                                    <textarea class="form-control" name="additional_term_content_1" rows="3">Khách hàng có quyền xem xét và yêu cầu sửa đổi trong vòng 7 ngày làm việc sau khi nhận được bản giao sản phẩm. Mỗi giai đoạn được phép yêu cầu tối đa 3 lần chỉnh sửa nhỏ nằm trong phạm vi ban đầu của dự án.</textarea>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="term-box">--%>
<%--                                <button type="button" class="remove-term">×</button>--%>
<%--                                <div class="form-group">--%>
<%--                                    <label class="form-label">Tiêu đề điều khoản</label>--%>
<%--                                    <input type="text" class="form-control" name="additional_term_title_2" value="Quy định về thay đổi phạm vi dự án">--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <label class="form-label">Nội dung điều khoản</label>--%>
<%--                                    <textarea class="form-control" name="additional_term_content_2" rows="3">Bất kỳ thay đổi nào vượt quá phạm vi ban đầu của dự án sẽ được coi là yêu cầu thay đổi và cần có sự thống nhất bằng văn bản của cả hai bên. Các thay đổi này có thể dẫn đến điều chỉnh về thời gian và chi phí dự án.</textarea>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <button type="button" class="add-term-btn">--%>
<%--                                <i class="fas fa-plus"></i> Thêm điều khoản bổ sung--%>
<%--                            </button>--%>
<%--                        </div>--%>

<%--                        <div class="form-section">--%>
<%--                            <div class="section-title">Tài liệu đính kèm</div>--%>
<%--                            <div class="file-upload">--%>
<%--                                <div class="file-input-container">--%>
<%--                                    <button type="button" class="file-upload-btn">--%>
<%--                                        <i class="fas fa-upload"></i> Tải lên tài liệu đính kèm--%>
<%--                                    </button>--%>
<%--                                    <input type="file" class="file-input" multiple>--%>
<%--                                </div>--%>
<%--                                <div class="file-name">Chưa có tài liệu nào được chọn</div>--%>
<%--                                <p class="info-text"><i class="fas fa-info-circle"></i> Hỗ trợ định dạng PDF, DOCX, JPG, PNG (tối đa 5MB/file)</p>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Ghi chú về tài liệu đính kèm</label>--%>
<%--                                <textarea class="form-control" name="attachment_notes" rows="2" placeholder="Mô tả về tài liệu đính kèm..."></textarea>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-section">--%>
<%--                            <div class="section-title">Xác nhận điều khoản</div>--%>
<%--                            <div class="summary-box">--%>
<%--                                <div class="summary-title">Tóm tắt điều khoản chính</div>--%>
<%--                                <div class="summary-item">--%>
<%--                                    <div class="summary-label">Thời gian bảo hành:</div>--%>
<%--                                    <div class="summary-value">3 tháng</div>--%>
<%--                                </div>--%>
<%--                                <div class="summary-item">--%>
<%--                                    <div class="summary-label">Quyền sở hữu:</div>--%>
<%--                                    <div class="summary-value">Khách hàng sở hữu toàn bộ</div>--%>
<%--                                </div>--%>
<%--                                <div class="summary-item">--%>
<%--                                    <div class="summary-label">Thỏa thuận bảo mật:</div>--%>
<%--                                    <div class="summary-value">Áp dụng (2 năm)</div>--%>
<%--                                </div>--%>
<%--                                <div class="summary-item">--%>
<%--                                    <div class="summary-label">Phương thức thanh toán:</div>--%>
<%--                                    <div class="summary-value">Qua ký quỹ ProLancer</div>--%>
<%--                                </div>--%>
<%--                                <div class="summary-item">--%>
<%--                                    <div class="summary-label">Giải quyết tranh chấp:</div>--%>
<%--                                    <div class="summary-value">Hòa giải qua ProLancer</div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="checkbox-group" style="margin-top: 20px;">--%>
<%--                                <input type="checkbox" id="terms_agreement" name="terms_agreement" class="checkbox-input" required>--%>
<%--                                <label for="terms_agreement" class="checkbox-label">Tôi đã đọc và đồng ý với tất cả các điều khoản trên</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>

                        <div class="btn-container">
                            <button type="button" class="btn btn-outline">Quay lại</button>
                            <button type="submit" class="btn">Tiếp tục</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </div>
</section>
<%@include file="includes/footer.jsp"%>

<script>
    // JavaScript để xử lý tương tác người dùng
    document.addEventListener('DOMContentLoaded', function() {
        // Thêm điều khoản bổ sung
        const addTermBtn = document.querySelector('.add-term-btn');
        const termsContainer = addTermBtn.parentElement;
        let termCount = document.querySelectorAll('.term-box').length + 1;

        addTermBtn.addEventListener('click', function() {
            const newTermBox = document.createElement('div');
            newTermBox.className = 'term-box';
            newTermBox.innerHTML = `
                    <button type="button" class="remove-term">×</button>
                    <div class="form-group">
                        <label class="form-label">Tiêu đề điều khoản</label>
                        <input type="text" class="form-control" name="additional_term_title_${termCount}" placeholder="Nhập tiêu đề điều khoản">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Nội dung điều khoản</label>
                        <textarea class="form-control" name="additional_term_content_${termCount}" rows="3" placeholder="Nhập nội dung điều khoản chi tiết..."></textarea>
                    </div>
                `;

            termsContainer.insertBefore(newTermBox, addTermBtn);
            termCount++;

            // Thêm sự kiện xóa cho nút xóa mới
            const removeBtn = newTermBox.querySelector('.remove-term');
            removeBtn.addEventListener('click', function() {
                newTermBox.remove();
            });
        });

        // Xử lý nút xóa điều khoản
        document.querySelectorAll('.remove-term').forEach(btn => {
            btn.addEventListener('click', function() {
                this.closest('.term-box').remove();
            });
        });

        // Xử lý tải lên tài liệu
        const fileInput = document.querySelector('.file-input');
        const fileName = document.querySelector('.file-name');

        fileInput.addEventListener('change', function() {
            if (this.files.length > 0) {
                let fileNames = '';
                for (let i = 0; i < this.files.length; i++) {
                    fileNames += this.files[i].name + (i < this.files.length - 1 ? ', ' : '');
                }
                fileName.textContent = fileNames;
            } else {
                fileName.textContent = 'Chưa có tài liệu nào được chọn';
            }
        });

        // Xử lý form submit
        const contractForm = document.getElementById('contract-terms-form');
        contractForm.addEventListener('submit', function(e) {
            e.preventDefault();

            // Kiểm tra đồng ý điều khoản
            const termsAgreement = document.getElementById('terms_agreement');
            if (!termsAgreement.checked) {
                alert('Vui lòng đọc và đồng ý với các điều khoản để tiếp tục');
                return;
            }

            // Chuyển đến bước tiếp theo (ký kết)
            alert('Đã lưu điều khoản. Chuyển đến bước ký kết hợp đồng.');
            // Điều hướng đến trang ký kết (trong thực tế)
            // window.location.href = 'contract-signing.html';
        });

        // Cập nhật tóm tắt khi thay đổi các trường chính
        const warrantyPeriod = document.querySelector('select[name="warranty_period"]');
        const ownershipOptions = document.querySelectorAll('input[name="ownership"]');
        const ndaRequired = document.getElementById('nda_required');
        const ndaDuration = document.querySelector('select[name="nda_duration"]');
        const paymentMethod = document.querySelectorAll('input[name="payment_method"]');
        const disputeResolution = document.querySelectorAll('input[name="dispute_resolution"]');

        const updateSummary = function() {
            // Cập nhật thời gian bảo hành
            document.querySelector('.summary-item:nth-child(1) .summary-value').textContent =
                warrantyPeriod.options[warrantyPeriod.selectedIndex].text;

            // Cập nhật quyền sở hữu
            let ownershipValue = '';
            ownershipOptions.forEach(option => {
                if (option.checked) {
                    if (option.value === 'client') ownershipValue = 'Khách hàng sở hữu toàn bộ';
                    else if (option.value === 'shared') ownershipValue = 'Sở hữu chung';
                    else if (option.value === 'freelancer') ownershipValue = 'Freelancer giữ bản quyền';
                }
            });
            document.querySelector('.summary-item:nth-child(2) .summary-value').textContent = ownershipValue;

            // Cập nhật thỏa thuận bảo mật
            let ndaValue = ndaRequired.checked ?
                `Áp dụng (${ndaDuration.options[ndaDuration.selectedIndex].text})` : 'Không áp dụng';
            document.querySelector('.summary-item:nth-child(3) .summary-value').textContent = ndaValue;

            // Cập nhật phương thức thanh toán
            let paymentValue = '';
            paymentMethod.forEach(option => {
                if (option.checked) {
                    if (option.value === 'escrow') paymentValue = 'Qua ký quỹ ProLancer';
                    else if (option.value === 'direct') paymentValue = 'Thanh toán trực tiếp';
                }
            });
            document.querySelector('.summary-item:nth-child(4) .summary-value').textContent = paymentValue;

            // Cập nhật giải quyết tranh chấp
            let disputeValue = '';
            disputeResolution.forEach(option => {
                if (option.checked) {
                    if (option.value === 'mediation') disputeValue = 'Hòa giải qua ProLancer';
                    else if (option.value === 'arbitration') disputeValue = 'Trọng tài';
                    else if (option.value === 'court') disputeValue = 'Tòa án có thẩm quyền';
                }
            });
            document.querySelector('.summary-item:nth-child(5) .summary-value').textContent = disputeValue;
        };

        // Thêm sự kiện thay đổi cho các trường này
        warrantyPeriod.addEventListener('change', updateSummary);
        ownershipOptions.forEach(option => option.addEventListener('change', updateSummary));
        ndaRequired.addEventListener('change', updateSummary);
        ndaDuration.addEventListener('change', updateSummary);
        paymentMethod.forEach(option => option.addEventListener('change', updateSummary));
        disputeResolution.forEach(option => option.addEventListener('change', updateSummary));
    });
</script>
</body>
</html>