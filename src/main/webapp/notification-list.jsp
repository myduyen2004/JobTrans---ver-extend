<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/21/2025
  Time: 12:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Thông Báo</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(to right, rgba(15, 27, 99, 0.95), rgba(25, 37, 109, 0.88));
            --accent-color: #4f6af5;
            --text-light: #f8f9fa;
            --text-dark: #333;
            --gray-light: #f1f3f9;
            --gray-mid: #e2e6f3;
            --shadow-color: rgba(9, 16, 58, 0.2);
            --notification-read: rgba(255, 255, 255, 0.85);
            --notification-unread: rgba(235, 240, 255, 0.95);
            --badge-color: #ff3e6c;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            /*background: var(--primary-gradient);*/
            min-height: 100vh;
            color: var(--text-dark);
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        .container {
            width: 100%;
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            flex-grow: 1;
            animation: fadeIn 0.8s ease-out;
        }

        header {
            padding: 30px 0 15px;
            margin-bottom: 25px;
            position: relative;
            overflow: hidden;
        }

        header::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -10%;
            width: 120%;
            height: 200%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
            z-index: 0;
            animation: pulse 8s infinite alternate;
        }

        @keyframes pulse {
            0% { transform: scale(1); opacity: 0.5; }
            100% { transform: scale(1.2); opacity: 0.2; }
        }

        .header-content {
            position: relative;
            z-index: 2;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        h1 {
            /*color: var(--text-light);*/
            font-size: 2.2rem;
            font-weight: 700;
            letter-spacing: 0.5px;
            position: relative;
            animation: slideInLeft 0.6s ease-out;
        }

        h1 .notification-icon {
            margin-right: 12px;
            font-size: 1.8rem;
            vertical-align: middle;
            animation: bellRing 2s ease-in-out 1s;
        }

        @keyframes bellRing {
            0%, 100% { transform: rotate(0); }
            20%, 60% { transform: rotate(-10deg); }
            40%, 80% { transform: rotate(10deg); }
        }

        .controls {
            display: flex;
            gap: 15px;
            animation: slideInRight 0.6s ease-out;
        }

        .btn {
            /*background: rgba(255, 255, 255, 0.15);*/
            border: none;
            color: var(--text-light);
            padding: 10px 16px;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
            backdrop-filter: blur(5px);
        }

        .btn:hover {
            /*background: rgba(255, 255, 255, 0.25);*/
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .btn-mark-all {
            background: var(--accent-color);
        }

        .btn-mark-all:hover {
            background: #3a55e0;
        }

        .filter-wrapper {
            margin-bottom: 20px;
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            animation: slideInUp 0.5s ease-out;
        }

        .filter-btn {
            background: rgba(255, 255, 255, 0.2);
            color: var(--text-light);
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .filter-btn:hover, .filter-btn.active {
            background: var(--accent-color);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .filter-btn.active {
            position: relative;
        }

        .filter-btn.active::after {
            content: "";
            position: absolute;
            bottom: -5px;
            left: 50%;
            transform: translateX(-50%);
            width: 6px;
            height: 6px;
            background: white;
            border-radius: 50%;
        }

        .notification-list {
            list-style: none;
            margin-bottom: 30px;
        }

        .notification-item {
            background: var(--notification-read);
            border-radius: 12px;
            margin-bottom: 15px;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px var(--shadow-color);
            position: relative;
            transform: translateY(20px);
            opacity: 0;
            animation: fadeInUp 0.5s forwards;
        }

        .notification-item.unread {
            background: var(--notification-unread);
        }

        .notification-item:hover {
            transform: translateY(-3px) !important;
            box-shadow: 0 10px 25px var(--shadow-color);
        }

        .notification-content {
            display: flex;
            padding: 20px;
            align-items: center;
            gap: 20px;
        }

        .notification-icon-wrapper {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: var(--accent-color);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            color: white;
            font-size: 1.2rem;
        }

        .icon-promotion {
            background: linear-gradient(45deg, #ff7043, #f4511e);
        }

        .icon-update {
            background: linear-gradient(45deg, #42a5f5, #1e88e5);
        }

        .icon-system {
            background: linear-gradient(45deg, #ab47bc, #7b1fa2);
        }

        .icon-payment {
            background: linear-gradient(45deg, #66bb6a, #43a047);
        }

        .notification-details {
            flex-grow: 1;
        }

        .notification-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }

        .notification-title {
            font-weight: 600;
            font-size: 1.1rem;
            color: var(--text-dark);
        }

        .notification-time {
            color: #6b7280;
            font-size: 0.85rem;
        }

        .notification-message {
            color: #4b5563;
            font-size: 0.95rem;
            margin-bottom: 12px;
            line-height: 1.5;
        }

        .notification-actions {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }

        .action-btn {
            background: transparent;
            border: none;
            color: #6b7280;
            font-size: 0.9rem;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: all 0.3s ease;
            padding: 5px 10px;
            border-radius: 15px;
        }

        .action-btn:hover {
            color: var(--accent-color);
            background: rgba(79, 106, 245, 0.1);
        }

        .unread-indicator {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 10px;
            height: 10px;
            background: var(--badge-color);
            border-radius: 50%;
            animation: pulse-dot 1.5s cubic-bezier(0.455, 0.03, 0.515, 0.955) infinite;
        }

        @keyframes pulse-dot {
            0% { transform: scale(0.8); }
            50% { transform: scale(1.2); }
            100% { transform: scale(0.8); }
        }

        .empty-state {
            text-align: center;
            padding: 50px 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 12px;
            margin-top: 20px;
            animation: fadeIn 0.5s ease-out;
            display: none;
        }

        .empty-icon {
            font-size: 3rem;
            color: #cbd5e1;
            margin-bottom: 20px;
        }

        .empty-title {
            font-size: 1.5rem;
            color: #475569;
            margin-bottom: 10px;
        }

        .empty-description {
            color: #6b7280;
            max-width: 400px;
            margin: 0 auto;
        }

        .pagination {
            display: flex;
            justify-content: center;
            gap: 8px;
            margin-top: 30px;
            animation: fadeIn 0.8s ease-out;
        }

        .page-item {
            background: rgba(255, 255, 255, 0.2);
            color: var(--text-light);
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .page-item:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }

        .page-item.active {
            background: var(--accent-color);
            box-shadow: 0 5px 15px rgba(79, 106, 245, 0.3);
        }

        .page-item.disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideInLeft {
            from { opacity: 0; transform: translateX(-30px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes slideInRight {
            from { opacity: 0; transform: translateX(30px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes slideInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Animation delays for staggered appearance */
        .notification-item:nth-child(1) { animation-delay: 0.1s; }
        .notification-item:nth-child(2) { animation-delay: 0.2s; }
        .notification-item:nth-child(3) { animation-delay: 0.3s; }
        .notification-item:nth-child(4) { animation-delay: 0.4s; }
        .notification-item:nth-child(5) { animation-delay: 0.5s; }
        .notification-item:nth-child(6) { animation-delay: 0.6s; }

        /* Responsive styles */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .controls {
                width: 100%;
                justify-content: space-between;
            }

            .notification-content {
                flex-direction: column;
                align-items: flex-start;
            }

            .notification-icon-wrapper {
                margin-bottom: 10px;
            }

            .notification-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 5px;
            }
        }

        footer {
            text-align: center;
            color: rgba(255, 255, 255, 0.7);
            padding: 20px;
            font-size: 0.85rem;
            margin-top: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <div class="header-content">
            <h1><i class="fas fa-bell notification-icon"></i>Danh Sách Thông Báo</h1>
            <div class="controls">
                <button class="btn">
                    <i class="fas fa-filter"></i>
                    Bộ Lọc
                </button>
                <button class="btn btn-mark-all">
                    <i class="fas fa-check-double"></i>
                    Đánh Dấu Đã Đọc
                </button>
            </div>
        </div>
    </header>

    <div class="filter-wrapper">
        <button class="filter-btn active">Tất Cả</button>
        <button class="filter-btn">Chưa Đọc</button>
        <button class="filter-btn">Khuyến Mãi</button>
        <button class="filter-btn">Cập Nhật</button>
        <button class="filter-btn">Hệ Thống</button>
        <button class="filter-btn">Thanh Toán</button>
    </div>

    <ul class="notification-list">
        <li class="notification-item unread">
            <div class="notification-content">
                <div class="notification-icon-wrapper icon-promotion">
                    <i class="fas fa-tag"></i>
                </div>
                <div class="notification-details">
                    <div class="notification-header">
                        <h3 class="notification-title">Khuyến mãi đặc biệt tháng 4</h3>
                        <span class="notification-time">1 giờ trước</span>
                    </div>
                    <p class="notification-message">
                        Ưu đãi đặc biệt dành riêng cho bạn! Giảm 25% cho tất cả các giao dịch trong 48 giờ tới. Sử dụng mã: SPECIAL25.
                    </p>
                    <div class="notification-actions">
                        <button class="action-btn">
                            <i class="fas fa-eye"></i> Xem chi tiết
                        </button>
                        <button class="action-btn">
                            <i class="fas fa-check"></i> Đánh dấu đã đọc
                        </button>
                    </div>
                </div>
            </div>
            <span class="unread-indicator"></span>
        </li>

        <li class="notification-item unread">
            <div class="notification-content">
                <div class="notification-icon-wrapper icon-system">
                    <i class="fas fa-cog"></i>
                </div>
                <div class="notification-details">
                    <div class="notification-header">
                        <h3 class="notification-title">Cập nhật bảo mật quan trọng</h3>
                        <span class="notification-time">3 giờ trước</span>
                    </div>
                    <p class="notification-message">
                        Chúng tôi đã cập nhật các biện pháp bảo mật cho tài khoản của bạn. Vui lòng xác minh thông tin và đảm bảo mọi thứ đều chính xác.
                    </p>
                    <div class="notification-actions">
                        <button class="action-btn">
                            <i class="fas fa-shield-alt"></i> Kiểm tra bảo mật
                        </button>
                        <button class="action-btn">
                            <i class="fas fa-check"></i> Đánh dấu đã đọc
                        </button>
                    </div>
                </div>
            </div>
            <span class="unread-indicator"></span>
        </li>

        <li class="notification-item">
            <div class="notification-content">
                <div class="notification-icon-wrapper icon-payment">
                    <i class="fas fa-money-bill-wave"></i>
                </div>
                <div class="notification-details">
                    <div class="notification-header">
                        <h3 class="notification-title">Giao dịch thành công</h3>
                        <span class="notification-time">Hôm qua</span>
                    </div>
                    <p class="notification-message">
                        Giao dịch #58293 của bạn đã được xử lý thành công. Số tiền 2.500.000 VNĐ đã được chuyển vào tài khoản của bạn.
                    </p>
                    <div class="notification-actions">
                        <button class="action-btn">
                            <i class="fas fa-receipt"></i> Xem biên lai
                        </button>
                        <button class="action-btn">
                            <i class="fas fa-trash-alt"></i> Xóa
                        </button>
                    </div>
                </div>
            </div>
        </li>

        <li class="notification-item">
            <div class="notification-content">
                <div class="notification-icon-wrapper icon-update">
                    <i class="fas fa-sync-alt"></i>
                </div>
                <div class="notification-details">
                    <div class="notification-header">
                        <h3 class="notification-title">Cập nhật ứng dụng mới</h3>
                        <span class="notification-time">2 ngày trước</span>
                    </div>
                    <p class="notification-message">
                        Phiên bản mới của ứng dụng đã có sẵn với nhiều tính năng hấp dẫn. Hãy cập nhật ngay để trải nghiệm những tính năng tuyệt vời.
                    </p>
                    <div class="notification-actions">
                        <button class="action-btn">
                            <i class="fas fa-download"></i> Cập nhật ngay
                        </button>
                        <button class="action-btn">
                            <i class="fas fa-trash-alt"></i> Xóa
                        </button>
                    </div>
                </div>
            </div>
        </li>

        <li class="notification-item">
            <div class="notification-content">
                <div class="notification-icon-wrapper icon-promotion">
                    <i class="fas fa-gift"></i>
                </div>
                <div class="notification-details">
                    <div class="notification-header">
                        <h3 class="notification-title">Quà tặng sinh nhật</h3>
                        <span class="notification-time">1 tuần trước</span>
                    </div>
                    <p class="notification-message">
                        Chúc mừng sinh nhật! Chúng tôi có một món quà đặc biệt dành cho bạn. Hãy mở để xem điều bất ngờ đang chờ đón bạn.
                    </p>
                    <div class="notification-actions">
                        <button class="action-btn">
                            <i class="fas fa-gift"></i> Mở quà
                        </button>
                        <button class="action-btn">
                            <i class="fas fa-trash-alt"></i> Xóa
                        </button>
                    </div>
                </div>
            </div>
        </li>

        <li class="notification-item">
            <div class="notification-content">
                <div class="notification-icon-wrapper icon-system">
                    <i class="fas fa-user-shield"></i>
                </div>
                <div class="notification-details">
                    <div class="notification-header">
                        <h3 class="notification-title">Đăng nhập từ thiết bị mới</h3>
                        <span class="notification-time">1 tuần trước</span>
                    </div>
                    <p class="notification-message">
                        Chúng tôi phát hiện một lần đăng nhập mới vào tài khoản của bạn từ thiết bị tại Hà Nội. Nếu đó không phải là bạn, hãy liên hệ với chúng tôi ngay.
                    </p>
                    <div class="notification-actions">
                        <button class="action-btn">
                            <i class="fas fa-shield-alt"></i> Kiểm tra bảo mật
                        </button>
                        <button class="action-btn">
                            <i class="fas fa-trash-alt"></i> Xóa
                        </button>
                    </div>
                </div>
            </div>
        </li>
    </ul>

    <div class="empty-state" id="emptyState">
        <i class="fas fa-bell-slash empty-icon"></i>
        <h3 class="empty-title">Không có thông báo</h3>
        <p class="empty-description">Bạn không có thông báo nào vào lúc này. Chúng tôi sẽ thông báo khi có tin mới.</p>
    </div>

    <div class="pagination">
        <button class="page-item disabled">
            <i class="fas fa-chevron-left"></i>
        </button>
        <button class="page-item active">1</button>
        <button class="page-item">2</button>
        <button class="page-item">3</button>
        <button class="page-item">
            <i class="fas fa-chevron-right"></i>
        </button>
    </div>
</div>

<footer>
    © 2025 Hệ Thống Thông Báo | Tất cả các quyền được bảo lưu
</footer>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Filter buttons functionality
        const filterButtons = document.querySelectorAll('.filter-btn');
        const notificationItems = document.querySelectorAll('.notification-item');
        const emptyState = document.getElementById('emptyState');

        filterButtons.forEach(button => {
            button.addEventListener('click', function() {
                // Remove active class from all buttons
                filterButtons.forEach(btn => btn.classList.remove('active'));

                // Add active class to clicked button
                this.classList.add('active');

                // Filter logic
                const filterType = this.textContent.trim();
                let visibleCount = 0;

                notificationItems.forEach(item => {
                    if (filterType === 'Tất Cả') {
                        item.style.display = 'block';
                        visibleCount++;
                    } else if (filterType === 'Chưa Đọc') {
                        if (item.classList.contains('unread')) {
                            item.style.display = 'block';
                            visibleCount++;
                        } else {
                            item.style.display = 'none';
                        }
                    } else {
                        // Filter by notification type
                        const iconClass = item.querySelector('.notification-icon-wrapper').classList;
                        const isMatch =
                            (filterType === 'Khuyến Mãi' && iconClass.contains('icon-promotion')) ||
                            (filterType === 'Cập Nhật' && iconClass.contains('icon-update')) ||
                            (filterType === 'Hệ Thống' && iconClass.contains('icon-system')) ||
                            (filterType === 'Thanh Toán' && iconClass.contains('icon-payment'));

                        if (isMatch) {
                            item.style.display = 'block';
                            visibleCount++;
                        } else {
                            item.style.display = 'none';
                        }
                    }
                });

                // Show empty state if no notifications match filter
                emptyState.style.display = visibleCount === 0 ? 'block' : 'none';
            });
        });

        // Mark all as read button
        const markAllButton = document.querySelector('.btn-mark-all');
        markAllButton.addEventListener('click', function() {
            const unreadItems = document.querySelectorAll('.notification-item.unread');
            unreadItems.forEach(item => {
                item.classList.remove('unread');
                const indicator = item.querySelector('.unread-indicator');
                if (indicator) {
                    indicator.remove();
                }
            });
        });

        // Individual mark as read buttons
        const markReadButtons = document.querySelectorAll('.action-btn:nth-child(2)');
        markReadButtons.forEach(button => {
            button.addEventListener('click', function() {
                const notificationItem = this.closest('.notification-item');
                if (notificationItem.classList.contains('unread')) {
                    notificationItem.classList.remove('unread');
                    const indicator = notificationItem.querySelector('.unread-indicator');
                    if (indicator) {
                        indicator.remove();
                    }
                }
            });
        });

        // Animation on scroll
        const animateOnScroll = () => {
            const items = document.querySelectorAll('.notification-item');

            items.forEach(item => {
                const itemPosition = item.getBoundingClientRect().top;
                const screenPosition = window.innerHeight / 1.2;

                if (itemPosition < screenPosition) {
                    item.style.opacity = '1';
                    item.style.transform = 'translateY(0)';
                }
            });
        };

        // Initial check for items in viewport
        animateOnScroll();

        // Add animation on scroll
        window.addEventListener('scroll', animateOnScroll);
    });
</script>
</body>
</html>
