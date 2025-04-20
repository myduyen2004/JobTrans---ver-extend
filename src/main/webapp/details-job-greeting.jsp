<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết lời chào việc làm</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f7fb;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            background: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            color: white;
            padding: 20px 0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            border-radius: 0 0 20px 20px;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .brand {
            font-size: 24px;
            font-weight: bold;
            letter-spacing: 1px;
            display: flex;
            align-items: center;
        }

        .brand i {
            margin-right: 10px;
            font-size: 28px;
        }

        .back-button {
            display: flex;
            align-items: center;
            gap: 10px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 30px;
            padding: 8px 20px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .back-button:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateX(-5px);
        }

        .greeting-detail-container {
            display: grid;
            grid-template-columns: 3fr 2fr;
            gap: 30px;
            animation: fadeIn 0.6s ease-out;
        }

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

        .greeting-main {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .greeting-header {
            padding: 30px;
            background: linear-gradient(to right, rgba(21, 32, 112, 0.95), rgba(39, 64, 179, 0.95));
            color: white;
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .greeting-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .greeting-company {
            font-size: 16px;
            opacity: 0.9;
            margin-bottom: 15px;
        }

        .greeting-date {
            font-size: 14px;
            opacity: 0.8;
        }

        .greeting-status-badge {
            padding: 8px 20px;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 600;
            margin-top: 5px;
            display: inline-block;
        }

        .status-pending {
            background-color: #FFF8E5;
            color: #FFA113;
        }

        .status-interview {
            background-color: #E5F5FF;
            color: #0095FF;
        }

        .status-rejected {
            background-color: #FFE5E5;
            color: #FF4D4F;
        }

        .status-accepted {
            background-color: #E5FFF2;
            color: #00C853;
        }

        .greeting-content {
            padding: 30px;
        }

        .greeting-section {
            margin-bottom: 30px;
        }

        .greeting-section:last-child {
            margin-bottom: 0;
        }

        .section-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 15px;
            color: rgb(21, 32, 112);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section-title i {
            width: 30px;
            height: 30px;
            background: rgba(21, 32, 112, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: rgb(39, 64, 179);
        }

        .introduction-text {
            line-height: 1.6;
            color: #444;
            text-align: justify;
        }

        .detail-value {
            font-weight: 500;
            color: #333;
        }

        .attachment-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px;
            background: #f7f9fc;
            border-radius: 10px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .attachment-item:hover {
            background: #eef2f7;
            transform: translateX(5px);
        }

        .attachment-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        .attachment-info {
            flex: 1;
        }

        .attachment-title {
            font-weight: 500;
            margin-bottom: 3px;
        }

        .attachment-size {
            font-size: 12px;
            color: #777;
        }

        .attachment-actions {
            display: flex;
            gap: 10px;
        }

        .attachment-action {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: #f0f2f5;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #555;
            transition: all 0.3s ease;
        }

        .attachment-action:hover {
            background: rgb(39, 64, 179);
            color: white;
        }

        .greeting-sidebar {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .sidebar-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .sidebar-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(21, 32, 112, 0.15);
        }

        .sidebar-card-header {
            padding: 20px;
            background: linear-gradient(to right, rgba(21, 32, 112, 0.95), rgba(39, 64, 179, 0.95));
            color: white;
        }

        .sidebar-card-title {
            font-size: 18px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .sidebar-card-content {
            padding: 20px;
        }

        .seeker-profile {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 20px;
        }

        .seeker-avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            overflow: hidden;
            position: relative;
            background: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 24px;
            font-weight: bold;
        }

        .seeker-info {
            flex: 1;
        }

        .seeker-name {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .seeker-role {
            color: #777;
            font-size: 14px;
        }

        .profile-stats {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .stat-item {
            background: #f7f9fc;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
        }

        .stat-value {
            font-size: 20px;
            font-weight: 600;
            color: rgb(39, 64, 179);
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 12px;
            color: #777;
        }

        .cv-preview {
            border: 1px solid #eee;
            border-radius: 10px;
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f7f9fc;
            margin-bottom: 20px;
            overflow: hidden;
            position: relative;
        }

        .cv-preview img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }

        .cv-preview-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(21, 32, 112, 0.7);
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: all 0.3s ease;
        }

        .cv-preview:hover .cv-preview-overlay {
            opacity: 1;
        }

        .preview-button {
            background: white;
            color: rgb(39, 64, 179);
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .preview-button:hover {
            transform: scale(1.05);
        }

        .action-buttons {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .action-button {
            padding: 12px 0;
            border-radius: 8px;
            font-weight: 600;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .accept-button {
            background: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            color: white;
        }

        .reject-button {
            background: #f0f2f5;
            color: #555;
        }

        .action-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .action-button.accept-button:hover {
            box-shadow: 0 5px 15px rgba(21, 32, 112, 0.3);
        }

        .timeline {
            position: relative;
            padding-left: 30px;
        }

        .timeline::before {
            content: '';
            position: absolute;
            left: 10px;
            top: 0;
            height: 100%;
            width: 2px;
            background: #eee;
        }

        .timeline-item {
            position: relative;
            margin-bottom: 20px;
        }

        .timeline-item:last-child {
            margin-bottom: 0;
        }

        .timeline-dot {
            position: absolute;
            left: -30px;
            top: 0;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: white;
            border: 2px solid rgb(39, 64, 179);
            z-index: 1;
        }

        .timeline-dot.active {
            background: rgb(39, 64, 179);
        }

        .timeline-content {
            background: #f7f9fc;
            border-radius: 10px;
            padding: 15px;
        }

        .timeline-date {
            font-size: 12px;
            color: #777;
            margin-bottom: 5px;
        }

        .timeline-title {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .timeline-description {
            font-size: 14px;
            color: #555;
        }

        /* Animation */
        .pulse {
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(39, 64, 179, 0.4);
            }
            70% {
                box-shadow: 0 0 0 10px rgba(39, 64, 179, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(39, 64, 179, 0);
            }
        }

        .fade-in-up {
            animation: fadeInUp 0.6s both;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .sidebar-card:nth-child(1) {
            animation-delay: 0.2s;
        }

        .sidebar-card:nth-child(2) {
            animation-delay: 0.4s;
        }

        .sidebar-card:nth-child(3) {
            animation-delay: 0.6s;
        }

        /* Responsive */
        @media (max-width: 992px) {
            .greeting-detail-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <div class="header-content">
            <div class="brand">
                <i class="fas fa-briefcase"></i>
                <span>JobConnect</span>
            </div>
            <div class="back-button">
                <i class="fas fa-arrow-left"></i>
                <span>Quay lại danh sách</span>
            </div>
        </div>
    </div>
</header>

<div class="container">
    <div class="greeting-detail-container">
        <div class="greeting-main fade-in-up">
            <div class="greeting-header">
                <div>
                    <div class="greeting-title">Lập trình viên Front-end</div>
                    <div class="greeting-company">Tech Solutions Inc.</div>
                    <div class="greeting-date">Ngày gửi: 15/04/2025</div>
                </div>
                <div class="greeting-status-badge status-interview">Chờ phỏng vấn</div>
            </div>

            <div class="greeting-content">
                <div class="greeting-section">
                    <div class="section-title">
                        <i class="fas fa-info-circle"></i>
                        <span>Thông tin cơ bản</span>
                    </div>
                    <div class="info-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                        <div class="info-item">
                            <div style="color: #777; margin-bottom: 5px;">Giá đề xuất:</div>
                            <div class="detail-value">20,000,000 VND</div>
                        </div>
                        <div class="info-item">
                            <div style="color: #777; margin-bottom: 5px;">Thời gian hoàn thành:</div>
                            <div class="detail-value">30 ngày</div>
                        </div>
                        <div class="info-item">
                            <div style="color: #777; margin-bottom: 5px;">Tình trạng:</div>
                            <div class="detail-value">Đã đọc</div>
                        </div>
                        <div class="info-item">
                            <div style="color: #777; margin-bottom: 5px;">Mã CV:</div>
                            <div class="detail-value">CV-2025-0438</div>
                        </div>
                    </div>
                </div>

                <div class="greeting-section">
                    <div class="section-title">
                        <i class="fas fa-comment-alt"></i>
                        <span>Thư giới thiệu</span>
                    </div>
                    <div class="introduction-text">
                        <p>Kính gửi Quý công ty Tech Solutions Inc.,</p>
                        <br>
                        <p>Tôi viết thư này để bày tỏ sự quan tâm của mình đối với vị trí Lập trình viên Front-end mà quý công ty đang tuyển dụng. Với hơn 5 năm kinh nghiệm trong việc phát triển giao diện người dùng và 3 năm làm việc chuyên sâu với các công nghệ như React, Angular và Vue.js, tôi tin rằng mình có thể đóng góp tích cực cho đội ngũ của quý công ty.</p>
                        <br>
                        <p>Trong vai trò Front-end Developer tại công ty hiện tại, tôi đã phát triển nhiều dự án thành công với giao diện người dùng thân thiện, đáp ứng và hiệu suất cao. Tôi cũng có kinh nghiệm làm việc với RESTful APIs, GraphQL và có hiểu biết về các framework back-end như Node.js và Laravel.</p>
                        <br>
                        <p>Tôi đặc biệt ấn tượng với sản phẩm của Tech Solutions và tin rằng kỹ năng của tôi sẽ phù hợp với các dự án sắp tới của công ty. Tôi được biết đến là một người có tinh thần đội nhóm tốt, luôn học hỏi công nghệ mới và giải quyết vấn đề một cách sáng tạo.</p>
                        <br>
                        <p>Kính mong Quý công ty xem xét ứng tuyển của tôi và mong nhận được phản hồi tích cực. Tôi sẵn sàng cho buổi phỏng vấn để thảo luận thêm về cách tôi có thể đóng góp cho thành công của Tech Solutions.</p>
                        <br>
                        <p>Trân trọng,<br>Nguyễn Thanh</p>
                    </div>
                </div>

                <div class="greeting-section">
                    <div class="section-title">
                        <i class="fas fa-paperclip"></i>
                        <span>Tài liệu đính kèm</span>
                    </div>
                    <div class="attachments-list">
                        <div class="attachment-item">
                            <div class="attachment-icon">
                                <i class="fas fa-file-pdf"></i>
                            </div>
                            <div class="attachment-info">
                                <div class="attachment-title">Front-end Developer CV.pdf</div>
                                <div class="attachment-size">2.4 MB</div>
                            </div>
                            <div class="attachment-actions">
                                <div class="attachment-action">
                                    <i class="fas fa-eye"></i>
                                </div>
                                <div class="attachment-action">
                                    <i class="fas fa-download"></i>
                                </div>
                            </div>
                        </div>
                        <div class="attachment-item">
                            <div class="attachment-icon">
                                <i class="fas fa-file-word"></i>
                            </div>
                            <div class="attachment-info">
                                <div class="attachment-title">Thư giới thiệu.docx</div>
                                <div class="attachment-size">568 KB</div>
                            </div>
                            <div class="attachment-actions">
                                <div class="attachment-action">
                                    <i class="fas fa-eye"></i>
                                </div>
                                <div class="attachment-action">
                                    <i class="fas fa-download"></i>
                                </div>
                            </div>
                        </div>
                        <div class="attachment-item">
                            <div class="attachment-icon">
                                <i class="fas fa-file-image"></i>
                            </div>
                            <div class="attachment-info">
                                <div class="attachment-title">Portfolio Screenshot.png</div>
                                <div class="attachment-size">1.2 MB</div>
                            </div>
                            <div class="attachment-actions">
                                <div class="attachment-action">
                                    <i class="fas fa-eye"></i>
                                </div>
                                <div class="attachment-action">
                                    <i class="fas fa-download"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="greeting-sidebar">
            <div class="sidebar-card fade-in-up">
                <div class="sidebar-card-header">
                    <div class="sidebar-card-title">
                        <i class="fas fa-user-circle"></i>
                        <span>Thông tin ứng viên</span>
                    </div>
                </div>
                <div class="sidebar-card-content">
                    <div class="seeker-profile">
                        <div class="seeker-avatar">NT</div>
                        <div class="seeker-info">
                            <div class="seeker-name">Nguyễn Thanh</div>
                            <div class="seeker-role">Front-end Developer</div>
                        </div>
                    </div>
                    <div class="profile-stats">
                        <div class="stat-item">
                            <div class="stat-value">25</div>
                            <div class="stat-label">Công việc đã ứng tuyển</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-value">18</div>
                            <div class="stat-label">Công việc đã nhận</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-value">4.8</div>
                            <div class="stat-label">Đánh giá (5 sao)</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-value">5</div>
                            <div class="stat-label">Năm kinh nghiệm</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="sidebar-card fade-in-up">
                <div class="sidebar-card-header">
                    <div class="sidebar-card-title">
                        <i class="fas fa-file-alt"></i>
                        <span>CV của ứng viên</span>
                    </div>
                </div>
                <div class="sidebar-card-content">
                    <div class="cv-preview">
                        <img src="/api/placeholder/400/300" alt="CV Preview">
                        <div class="cv-preview-overlay">
                            <button class="preview-button">Xem chi tiết</button>
                        </div>
                    </div>
                    <div class="action-buttons">
                        <div class="action-button accept-button pulse">
                            <i class="fas fa-check"></i> Chấp nhận
                        </div>
                        <div class="action-button reject-button">
                            <i class="fas fa-times"></i> Từ chối
                        </div>
                    </div>
                </div>
            </div>

            <div class="sidebar-card fade-in-up">
                <div class="sidebar-card-header">
                    <div class="sidebar-card-title">
                        <i class="fas fa-history"></i>
                        <span>Tiến trình xử lý</span>
                    </div>
                </div>
                <div class="sidebar-card-content">
                    <div class="timeline">
                        <div class="timeline-item">
                            <div class="timeline-dot active"></div>
                            <div class="timeline-content">
                                <div class="timeline-date">15/04/2025, 09:45</div>
                                <div class="timeline-title">Đã gửi lời chào</div>
                                <div class="timeline-description">Ứng viên đã gửi lời chào cho công việc này</div>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="timeline-dot active"></div>
                            <div class="timeline-content">
                                <div class="timeline-date">16/04/2025, 14:30</div>
                                <div class="timeline-title">Đã đọc</div>
                                <div class="timeline-description">Nhà tuyển dụng đã đọc lời chào của bạn</div>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="timeline-dot active"></div>
                            <div class="timeline-content">
                                <div class="timeline-date">17/04/2025, 10:15</div>
                                <div class="timeline-title">Chờ phỏng vấn</div>
                                <div class="timeline-description">Bạn đã được chọn để phỏng vấn cho vị trí này</div>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="timeline-dot"></div>
                            <div class="timeline-content">
                                <div class="timeline-date">--/--/----, --:--</div>
                                <div class="timeline-title">Kết quả phỏng vấn</div>
                                <div class="timeline-description">Chưa có kết quả</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Animation for back button
    const backButton = document.querySelector('.back-button');
    backButton.addEventListener('click', function() {
        window.history.back();
    });

    // Animation for attachment items
    const attachmentItems = document.querySelectorAll('.attachment-item');
    attachmentItems.forEach(item => {
        item.addEventListener('mouseenter', function() {
            this.style.transition = 'all 0.3s ease';
        });
    });

    // Animation for action buttons
    const actionButtons = document.querySelectorAll('.action-button');
    actionButtons.forEach(button => {
        button.addEventListener('click', function() {
            if (this.classList.contains('accept-button')) {
                this.innerHTML = '<i class="fas fa-check-circle"></i> Đã chấp nhận';
                this.style.background = '#00C853';

                // Update status badge
                const statusBadge = document.querySelector('.greeting-status-badge');
                statusBadge.className = 'greeting-status-badge status-accepted';
                statusBadge.textContent = 'Được nhận';

                // Update timeline
                const lastTimelineDot = document.querySelector('.timeline-item:last-child .timeline-dot');
                lastTimelineDot.classList.add('active');

                const lastTimelineDate = document.querySelector('.timeline-item:last-child .timeline-date');
                const lastTimelineDescription = document.querySelector('.timeline-item:last-child .timeline-description');

                const today = new Date();
                const formattedDate = `${today.getDate().toString().padStart(2, '0')}/${(today.getMonth() + 1).toString().padStart(2, '0')}/${today.getFullYear()}, ${today.getHours().toString().padStart(2, '0')}:${today.getMinutes().toString().padStart(2, '0')}`;

                lastTimelineDate.textContent = formattedDate;
                lastTimelineDescription.textContent = 'Ứng viên đã được chấp nhận cho vị trí này';
            } else if (this.classList.contains('reject-button')) {
                this.innerHTML = '<i class="fas fa-times-circle"></i> Đã từ chối';
                this.style.background = '#FF4D4F';
                this.style.color = 'white';

                // Update status badge
                const statusBadge = document.querySelector('.greeting-status-badge');
                statusBadge.className = 'greeting-status-badge status-rejected';
                statusBadge.textContent = 'Bị từ chối';

                // Update timeline
                const lastTimelineDot = document.querySelector('.timeline-item:last-child .timeline-dot');
                lastTimelineDot.classList.add('active');

                const lastTimelineDate = document.querySelector('.timeline-item:last-child .timeline-date');
                const lastTimelineDescription = document.querySelector('.timeline-item:last-child .timeline-description');

                const today = new Date();
                const formattedDate = `${today.getDate().toString().padStart(2, '0')}/${(today.getMonth() + 1).toString().padStart(2, '0')}/${today.getFullYear()}, ${today.getHours().toString().padStart(2, '0')}:${today.getMinutes().toString().padStart(2, '0')}`;

                lastTimelineDate.textContent = formattedDate;
                lastTimelineDescription.textContent = 'Ứng viên đã bị từ chối cho vị trí này';
            }
        });
    });

    // Preview CV functionality
    const previewButton = document.querySelector('.preview-button');
    previewButton.addEventListener('click', function() {
        alert('Xem CV chi tiết của ứng viên');
        // Ở đây có thể thêm code để mở modal hoặc trang mới hiển thị CV đầy đủ
    });

    // Attachment actions
    const viewButtons = document.querySelectorAll('.attachment-action:first-child');
    viewButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            const fileName = this.parentElement.previousElementSibling.querySelector('.attachment-title').textContent;
            alert(`Đang mở tài liệu: ${fileName}`);
        });
    });

    const downloadButtons = document.querySelectorAll('.attachment-action:last-child');
    downloadButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            const fileName = this.parentElement.previousElementSibling.querySelector('.attachment-title').textContent;
            alert(`Đang tải xuống: ${fileName}`);
        });
    });
</script>
</body>
</html>
