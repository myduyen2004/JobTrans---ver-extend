<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin tài khoản</title>
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
            max-width: 1200px;
            margin: 0 auto;
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
        }

        .reports-title::before {
            content: '📋';
            margin-right: 10px;
            font-size: 24px;
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
</head>
<body>
<div class="container">
    <!-- Header -->
    <div class="profile-header">
        <img class="profile-avatar" src="img\avatar-default.jpg" alt="Ảnh đại diện">

        <div class="profile-info">
            <div class="profile-name">
                ${account.accountName}
                <span class="badge-verified">Đã xác thực</span>
            </div>
            <div class="profile-role">${account.type}</div>
            <div class="profile-location">${account.address}</div>
        </div>

        <div class="profile-actions">
            <div class="profile-points">${account.point}</div>
            <a href="#" class="edit-button">Chỉnh sửa hồ sơ</a>
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
                        <div class="info-value">${account.specialist}</div>
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