<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin tài khoản</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header section */
        .profile-header {
            background-image: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            border-radius: 8px;
            padding: 30px;
            color: white;
            margin-bottom: 24px;
            display: flex;
            flex-wrap: wrap;
        }

        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 4px solid white;
            object-fit: cover;
        }

        .profile-info {
            margin-left: 24px;
            flex: 1;
        }

        .profile-name {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 5px;
            display: flex;
            align-items: center;
        }

        .badge-verified {
            background-color: #10B981;
            font-size: 12px;
            font-weight: 600;
            padding: 3px 10px;
            border-radius: 20px;
            margin-left: 10px;
        }

        .badge-unverified {
            background-color: #F59E0B;
            font-size: 12px;
            font-weight: 600;
            padding: 3px 10px;
            border-radius: 20px;
            margin-left: 10px;
        }

        .profile-role {
            font-size: 18px;
            opacity: 0.9;
            margin-bottom: 5px;
        }

        .profile-location {
            opacity: 0.8;
        }

        .profile-actions {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            margin-left: auto;
        }

        .profile-points {
            margin-bottom: 10px;
            font-weight: bold;
        }

        .edit-button {
            background-color: white;
            color: rgb(39, 64, 179);
            padding: 10px 16px;
            border-radius: 5px;
            font-weight: 500;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }

        /* Content sections */
        .content-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 24px;
        }

        /*@media (min-width: 1536px) {*/
        /*    .*/
        /*    reports-container {*/
        /*        max-width: 1536px;*/
        /*    }*/
        /*}*/

        @media (max-width: 768px) {
            .content-grid {
                grid-template-columns: 1fr;
            }

            .profile-header {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .profile-info {
                margin-left: 0;
                margin-top: 15px;
            }

            .profile-actions {
                margin-left: 0;
                margin-top: 20px;
                align-items: center;
            }

            .profile-actions a:hover {
                text-decoration: none;
            }
        }

        .card {
            background-color: white;
            border-radius: 8px;
            padding: 24px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            margin-bottom: 24px;
        }

        .card-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 16px;
        }

        /* Info list */
        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .info-item {
            margin-bottom: 12px;
        }

        .info-label {
            font-size: 14px;
            color: #666;
            margin-bottom: 4px;
        }

        .info-value {
            font-size: 16px;
            color: #333;
        }

        /* Contact list */
        .contact-item {
            display: flex;
            margin-bottom: 15px;
        }

        .contact-icon {
            color: rgb(39, 64, 179);
            width: 20px;
            margin-right: 12px;
            text-align: center;
        }

        .contact-detail {
            flex: 1;
        }

        /* Projects */
        .project-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }

        .project-count {
            background-color: #e6e9f7;
            color: rgb(39, 64, 179);
            font-size: 12px;
            font-weight: 600;
            padding: 4px 10px;
            border-radius: 4px;
        }

        .progress-container {
            margin-top: 8px;
        }

        .progress-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
        }

        .progress-text {
            font-size: 14px;
            color: #666;
        }

        .progress-value {
            font-size: 14px;
            color: rgb(39, 64, 179);
            font-weight: 500;
        }

        .progress-bar {
            height: 8px;
            background-color: #e5e7eb;
            border-radius: 4px;
        }

        .progress-fill {
            height: 8px;
            background-color: rgb(39, 64, 179);
            border-radius: 4px;
            width: 90%;
        }

        /* Signature */
        .signature {
            padding: 16px;
            background-color: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            font-style: italic;
            color: #4b5563;
        }
    </style>
    <style>
        .reports-container {
            /*max-width: 1200px;*/
            margin: 0 auto;
            padding: 24px;
        }

        /* Header phần báo cáo */
        .reports-header {
            background-image: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            border-radius: 12px 12px 0 0;
            padding: 20px 25px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .reports-header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
            animation: pulse 15s infinite linear;
        }

        @keyframes pulse {
            0% {
                transform: rotate(0deg);
                opacity: 0.1;
            }
            50% {
                opacity: 0.3;
            }
            100% {
                transform: rotate(360deg);
                opacity: 0.1;
            }
        }

        .reports-title {
            font-size: 22px;
            font-weight: 600;
            position: relative;
            z-index: 1;
            display: flex;
            align-items: center;
            margin-left: 20px;
        }

        .reports-count {
            background-color: rgba(255, 255, 255, 0.2);
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
            position: relative;
            z-index: 1;
            display: inline-flex;
            align-items: center;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .reports-count:hover {
            background-color: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }

        /* Container cho bảng */
        .reports-body {
            background-color: white;
            border-radius: 0 0 12px 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        /* Bảng hiển thị báo cáo */
        .reports-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        .reports-table th {
            background-color: #f8f9fa;
            padding: 16px 20px;
            text-align: left;
            font-weight: 600;
            color: #374151;
            position: sticky;
            top: 0;
            box-shadow: 0 1px 0 #e5e7eb;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .reports-table td {
            padding: 16px 20px;
            border-bottom: 1px solid #f0f0f0;
            font-size: 15px;
            color: #4b5563;
            vertical-align: middle;
        }

        .reports-table tr:last-child td {
            border-bottom: none;
        }

        /* Hover effect cho dòng */
        .reports-table tbody tr {
            transition: all 0.2s ease;
            transform-origin: center;
        }

        .reports-table tbody tr:hover {
            background-color: #f9fafb;
            transform: scale(1.005);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            z-index: 1;
            position: relative;
        }

        /* Status badges */
        .status-badge {
            padding: 6px 10px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            transition: all 0.3s ease;
            position: relative;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .status-badge::before {
            content: '';
            display: inline-block;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            margin-right: 6px;
        }

        .status-pending {
            background-color: #FFF7ED;
            color: #EA580C;
        }

        .status-pending::before {
            background-color: #EA580C;
            box-shadow: 0 0 0 2px rgba(234, 88, 12, 0.2);
        }

        .status-resolved {
            background-color: #ECFDF5;
            color: #059669;
        }

        .status-resolved::before {
            background-color: #059669;
            box-shadow: 0 0 0 2px rgba(5, 150, 105, 0.2);
        }

        .status-rejected {
            background-color: #FEF2F2;
            color: #DC2626;
        }

        .status-rejected::before {
            background-color: #DC2626;
            box-shadow: 0 0 0 2px rgba(220, 38, 38, 0.2);
        }

        .status-processing {
            background-color: #EFF6FF;
            color: #3B82F6;
        }

        .status-processing::before {
            background-color: #3B82F6;
            box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.2);
        }

        /* Reporter information */
        .reporter {
            display: flex;
            align-items: center;
        }

        .reporter-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 10px;
            border: 2px solid white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Truncated content */
        .report-content {
            max-width: 300px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            position: relative;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .report-content:hover {
            color: rgb(39, 64, 179);
        }

        .report-content.expanded {
            white-space: normal;
            max-width: none;
        }

        /* Date format */
        .report-date {
            color: #6B7280;
            font-size: 14px;
        }

        /* "Show more" button */
        .show-more-container {
            padding: 20px;
            text-align: center;
            background: linear-gradient(to bottom, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 50%);
        }

        .show-more-btn {
            background-image: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            color: white;
            border: none;
            padding: 10px 24px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 4px 6px rgba(21, 32, 112, 0.25);
        }

        .show-more-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(21, 32, 112, 0.3);
        }

        .show-more-btn::after {
            content: '→';
            font-size: 18px;
            transition: transform 0.3s ease;
        }

        .show-more-btn:hover::after {
            transform: translateX(5px);
        }

        /* Tooltip for criteria */
        .criteria {
            position: relative;
            display: inline-block;
            padding-bottom: 2px;
            border-bottom: 1px dotted #6B7280;
            cursor: help;
        }

        .criteria::after {
            content: attr(data-tooltip);
            position: absolute;
            left: 50%;
            bottom: -10px;
            transform: translateX(-50%) translateY(100%) scale(0.8);
            background-color: #1F2937;
            color: #F9FAFB;
            text-align: center;
            padding: 8px 12px;
            border-radius: 6px;
            font-size: 12px;
            width: 220px;
            opacity: 0;
            visibility: hidden;
            transition: all 0.2s ease;
            z-index: 10;
            font-weight: normal;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .criteria:hover::after {
            opacity: 1;
            visibility: visible;
            transform: translateX(-50%) translateY(100%) scale(1);
        }

        /* Animation khi load page */
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

        .reports-container {
            animation: fadeIn 0.6s ease forwards;
        }

        /* Empty state */
        .empty-reports {
            padding: 40px 20px;
            text-align: center;
            color: #6B7280;
        }

        .empty-icon {
            font-size: 48px;
            margin-bottom: 16px;
            opacity: 0.7;
        }

        .empty-text {
            font-size: 16px;
            max-width: 300px;
            margin: 0 auto;
        }
    </style>
    <style>
        :root {
            --primary-color: #6787fe;
            --secondary-color: #6c63ff;
            --accent-color: #f0f4ff;
            --light-color: #f8f9fa;
            --dark-color: #343a40;
            --success-color: #4caf50;
            --warning-color: #ff9800;
            --danger-color: #f44336;
        }

        body {
            /*background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);*/
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            padding-bottom: 40px;
        }

        .page-header {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            padding: 30px 0;
            margin-bottom: 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }

        .page-header::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
            animation: rotate 25s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .header-container {
            position: relative;
            z-index: 1;
        }

        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            overflow: hidden;
            margin-bottom: 30px;
            background-color: white;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            /*border: 2px solid #6787fe;*/
        }

        .member-header {
            background: linear-gradient(45deg, #f3f4f6 0%, #ffffff 100%);
            padding: 25px 20px 15px;
            border-bottom: 1px solid rgba(0,0,0,0.05);
            position: relative;
        }

        .member-avatar-wrapper {
            position: relative;
            margin-right: 20px;
        }

        .member-avatar {
            width: 110px;
            height: 110px;
            border-radius: 20px;
            object-fit: cover;
            border: 5px solid white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .status-indicator {
            position: absolute;
            bottom: 5px;
            right: 5px;
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background-color: var(--success-color);
            border: 2px solid white;
        }

        .member-name {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--dark-color);
            margin-bottom: 5px;
        }

        .member-role {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 12px;
            font-size: 1.1rem;
        }

        .badge-custom {
            padding: 8px 15px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.8rem;
            margin-right: 10px;
            display: inline-flex;
            align-items: center;
        }

        .badge-custom i {
            margin-right: 5px;
        }

        .badge-specialty {
            background-color: #e8f0fe;
            color: #4285f4;
        }

        .badge-experience {
            background-color: #e6f4ea;
            color: #34a853;
        }

        .member-info {
            padding: 20px;
        }

        .bio-section {
            background-color: var(--accent-color);
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 20px;
            position: relative;
        }

        .bio-section::before {
            content: "";
            position: absolute;
            top: 0;
            left: 10px;
            font-size: 60px;
            color: rgba(78, 84, 200, 0.1);
            line-height: 1;
        }

        .bio-text {
            position: relative;
            z-index: 1;
        }

        .info-group {
            margin-bottom: 25px;
        }

        .info-label {
            display: block;
            font-size: 0.85rem;
            color: #6c757d;
            margin-bottom: 5px;
        }

        .info-value {
            font-weight: 600;
            color: var(--dark-color);
        }

        .info-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background-color: var(--accent-color);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-color);
            margin-right: 15px;
        }

        .btn-action {
            border-radius: 50px;
            padding: 10px 25px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .btn-action i {
            margin-right: 8px;
        }

        .btn-edit {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            color: white;
        }

        .btn-edit:hover {
            background-color: #3a40b5;
            border-color: #3a40b5;
            color: white;
        }

        .btn-delete {
            background-color: white;
            border-color: var(--danger-color);
            color: var(--danger-color);
        }

        .btn-delete:hover {
            background-color: var(--danger-color);
            color: white;
        }

        .actions-container {
            border-top: 1px solid rgba(0,0,0,0.05);
            padding: 20px;
            background-color: #fafbfc;
            display: flex;
            justify-content: space-between;
        }

        .btn-add-container {
            margin-bottom: 30px;
            display: flex;
            justify-content: flex-end;
        }

        .btn-add {
            background-color: var(--success-color);
            border-color: var(--success-color);
            padding: 12px 25px;
            font-size: 1rem;
            color: white;
        }

        .btn-add:hover {
            background-color: #43a047;
            border-color: #43a047;
            color: white;
        }

        .btn-details {
            background-color: var(--accent-color);
            color: var(--primary-color);
            border: none;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
            transition: all 0.3s;
        }

        .btn-details:hover {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-details .fa-chevron-down {
            transition: transform 0.3s ease;
        }

        [aria-expanded="true"] .fa-chevron-down {
            transform: rotate(180deg);
        }

        .collapse {
            visibility: visible;
        }

        .collapse-content {
            padding: 0;
            overflow: hidden;
            visibility: visible;
        }

        .collapsing {
            transition: height 0.35s ease;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Header -->
    <div class="profile-header">
        <img class="profile-avatar" src=" ${account.avatar}" alt="Ảnh đại diện">

        <div class="profile-info">
            <div class="profile-name">
                ${account.accountName}
                <span class="badge-verified">Đã xác thực</span>
            </div>
            <div class="profile-role">${account.typeAccount}</div>
            <div class="profile-points">${account.point} Điểm</div>
        </div>

        <div class="profile-actions">
            <a href="profile?action=showUpdateForm&account_id=${account.accountId}" class="edit-button">Chỉnh sửa hồ sơ</a>
        </div>
    </div>

    <!-- Body content -->
    <div class="content-grid">
        <!-- Left column -->
        <div>
            <div class="card">
                <h2 class="card-title">Giới thiệu</h2>
                <p>${account.bio}</p>
            </div>

            <div class="card">
                <h2 class="card-title">Thông tin chuyên môn</h2>
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-label">Chuyên môn</div>
                        <div class="info-value">${account.speciality}</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Kinh nghiệm</div>
                        <div class="info-value">${account.experienceYears}</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Học vấn</div>
                        <div class="info-value">${account.education}</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Trạng thái</div>
                        <div class="info-value">${account.status}</div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="project-header">
                    <h2 class="card-title">Hoàn thành dự án</h2>
                    <span class="project-count">15 dự án</span>
                </div>
                <div class="progress-container">
                    <div class="progress-header">
                        <span class="progress-text">Tỷ lệ hoàn thành</span>
                        <span class="progress-value">90%</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-fill"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right column -->
        <div>
            <div class="card">
                <h2 class="card-title">Thông tin liên hệ</h2>
                <div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-envelope"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Email</div>
                            <div class="info-value">${account.email}</div>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-phone-alt"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Điện thoại</div>
                            <div class="info-value">${account.phone}</div>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-map-marker-alt"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Địa chỉ</div>
                            <div class="info-value">${account.address}</div>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-birthday-cake"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Ngày sinh</div>
                            <div class="info-value">${account.dateOfBirth}</div>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-venus-mars"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Giới tính</div>
                            <div class="info-value">${account.gender}</div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="card">
                <h2 class="card-title">Chữ ký số</h2>
                <div class="signature">
                    "Sáng tạo không giới hạn, chất lượng là ưu tiên hàng đầu."
                </div>
            </div>
        </div>
    </div>

    <c:if test="${account.typeAccount == 'Nhóm'}">
        <div class="page-header text-center">
            <div class="header-container">
                <h1 class="display-4 fw-bold">Thành viên nhóm</h1>
                <p class="lead">Danh sách thành viên và thông tin chi tiết</p>
            </div>
        </div>

        <div class="container">
            <div class="btn-add-container">
                <a href="group?action=showAddMember&account_id=${account.accountId}" class="btn btn-add btn-action">
                    <i class="fas fa-plus"></i> Thêm thành viên
                </a>
            </div>

            <c:forEach var="members" items="${memberList}" varStatus="loop">
                <c:choose>
                    <c:when test="${not empty memberList}">
                        <div class="card">
                            <div class="member-header">
                                <div class="d-flex">
                                    <div class="member-avatar-wrapper">
                                        <img src="${members.avatarMember}" alt="${members.memberName}" class="member-avatar">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <h3 class="member-name">${members.memberName}</h3>
                                        <div class="member-role">${members.position}</div>
                                        <div>
                                                <%--                                            <span class="badge badge-custom badge-specialty">--%>
                                                <%--                                                <i class="fas fa-laptop-code"></i> ${members.speciality}--%>
                                                <%--                                            </span>--%>
                                            <span class="badge badge-custom badge-experience">
                                                  <i class="fas fa-briefcase"></i>Số năm kinh nghiệm: ${members.experienceYears}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="px-4 py-3 d-grid">
                                <button class="btn btn-details btn-action" type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#memberDetails${loop.index}"
                                        aria-expanded="false"
                                        aria-controls="memberDetails${loop.index}">
                                    <i class="fas fa-chevron-down me-2"></i> Xem thông tin chi tiết
                                </button>
                            </div>

                            <div class="collapse" id="memberDetails${loop.index}">
                                <div class="collapse-content">
                                    <div class="member-info">
                                        <div class="bio-section">
                                            <span class="info-label">Giới thiệu</span>
                                            <p class="bio-text mb-0">
                                                    ${members.bio}
                                            </p>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-user-tie"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Chuyên môn</span>
                                                        <div class="info-value">${members.speciality}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-tools"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Kĩ năng</span>
                                                        <div class="info-value">${members.skills}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-phone-alt"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Số điện thoại</span>
                                                        <div class="info-value">${members.phone}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Địa chỉ</span>
                                                        <div class="info-value">${members.address}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-graduation-cap"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Học vấn</span>
                                                        <div class="info-value">${members.education}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-birthday-cake"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Ngày sinh</span>
                                                        <div class="info-value">${members.dateOfBirth}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-venus-mars"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Giới tính</span>
                                                        <div class="info-value">${members.gender}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-check-circle"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Trạng thái</span>
                                                        <div class="info-value">${members.status}</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="actions-container">
                                <div class="d-flex">
                                    <div class="info-icon me-2">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <div>
                                        <div class="info-value">ID: TN-001</div>
                                    </div>
                                </div>

                                <div>
                                    <a href="#" class="btn btn-edit btn-action me-2">
                                        <i class="fas fa-edit"></i> Chỉnh sửa
                                    </a>
                                    <a href="group?action=delete&memberId=${members.memberId}&accountId=${members.accountId}" class="btn btn-delete btn-action">
                                        <i class="fas fa-trash-alt"></i> Xóa
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <p>Không có thành viên nào trong nhóm.</p>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </c:if>

    <!-- Reports Section -->
    <div class="reports-container">
        <div class="reports-header">
            <div class="contact-icon"><i class="fas fa-list"></i></div>
            <h2 class="reports-title">Danh sách các báo cáo nhận được</h2>
            <div class="reports-count">3 báo cáo</div>
        </div>

        <div class="reports-body">
            <table class="reports-table">
                <thead>
                <tr>
                    <th>Người báo cáo</th>
                    <th>Nội dung báo cáo</th>
                    <th>Tiêu chí vi phạm</th>
                    <th>Thời gian</th>
                    <th>Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <div class="reporter">
                            <img src="/api/placeholder/64/64" alt="Trần Văn B" class="reporter-avatar">
                            Trần Văn B
                        </div>
                    </td>
                    <td>
                        <div class="report-content">
                            Không thực hiện dự án theo đúng thỏa thuận và liên tục trì hoãn thời gian bàn giao sản phẩm mà không có thông báo trước.
                        </div>
                    </td>
                    <td>
                        <span class="criteria" data-tooltip="Vi phạm về việc không tuân thủ thời hạn đã cam kết trong hợp đồng làm việc">Vi phạm thời hạn</span>
                    </td>
                    <td>
                        <div class="report-date">12/04/2025</div>
                    </td>
                    <td>
                        <span class="status-badge status-pending">Đang xử lý</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="reporter">
                            <img src="/api/placeholder/64/64" alt="Lê Thị C" class="reporter-avatar">
                            Lê Thị C
                        </div>
                    </td>
                    <td>
                        <div class="report-content">
                            Cung cấp thiết kế không đạt chất lượng như đã thỏa thuận và từ chối chỉnh sửa theo yêu cầu của khách hàng.
                        </div>
                    </td>
                    <td>
                        <span class="criteria" data-tooltip="Vi phạm về chất lượng sản phẩm không đáp ứng các yêu cầu đã thỏa thuận trong hợp đồng">Chất lượng sản phẩm</span>
                    </td>
                    <td>
                        <div class="report-date">05/03/2025</div>
                    </td>
                    <td>
                        <span class="status-badge status-resolved">Đã giải quyết</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="reporter">
                            <img src="/api/placeholder/64/64" alt="Phạm Văn D" class="reporter-avatar">
                            Phạm Văn D
                        </div>
                    </td>
                    <td>
                        <div class="report-content">
                            Vi phạm bản quyền trong thiết kế đã cung cấp, sử dụng hình ảnh không được phép mà không thông báo cho khách hàng.
                        </div>
                    </td>
                    <td>
                        <span class="criteria" data-tooltip="Vi phạm quyền sở hữu trí tuệ, sử dụng nội dung có bản quyền không được phép hoặc không đúng quy định">Vi phạm bản quyền</span>
                    </td>
                    <td>
                        <div class="report-date">20/02/2025</div>
                    </td>
                    <td>
                        <span class="status-badge status-rejected">Đã từ chối</span>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="show-more-container">
                <button class="show-more-btn">Xem tất cả báo cáo</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>