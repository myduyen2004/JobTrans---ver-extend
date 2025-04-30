<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jobtrans.model.Account" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    /* Reset và Base styles */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
        background-color: #f9fafc;
    }

    /* Sidebar styles */
    .sidebar {
        height: 100vh;
        width: 280px;
        position: fixed;
        top: 0;
        left: 0;
        background: linear-gradient(135deg, rgb(21, 42, 105) 0%, rgb(54, 75, 140) 100%);
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        z-index: 999;
        margin-top: 90px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        display: flex;
        flex-direction: column;
        overflow: hidden;
    }

    .sidebar-collapsed {
        left: -280px;
    }

    /* Sidebar scrollable container */
    .sidebar-content {
        flex: 1;
        overflow-y: auto;
        overflow-x: hidden;
        padding-bottom: 20px;
        /* Scrollbar for Webkit browsers */
        &::-webkit-scrollbar {
            width: 6px;
        }

        &::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 3px;
        }

        &::-webkit-scrollbar-thumb {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 3px;
        }

        &::-webkit-scrollbar-thumb:hover {
            background: rgba(255, 255, 255, 0.3);
        }
    }

    .sidebar a {
        padding: 14px 20px;
        text-decoration: none;
        font-size: 15px;
        color: rgba(255, 255, 255, 0.85);
        display: flex;
        align-items: center;
        transition: all 0.3s ease;
        border-left: 4px solid transparent;
        margin: 5px 8px;
        border-radius: 0 6px 6px 0;
    }

    .sidebar a i {
        margin-right: 12px;
        width: 20px;
        text-align: center;
        font-size: 16px;
        color: rgba(255, 255, 255, 0.7);
    }

    .sidebar a:hover {
        background-color: rgba(255, 255, 255, 0.15);
        border-left: 4px solid #6584fa;
        transform: translateX(5px);
        color: #ffffff;
    }

    .sidebar a:hover i {
        color: #6584fa;
    }

    .sidebar a.active {
        background-color: rgba(255, 255, 255, 0.15);
        border-left: 4px solid #6584fa;
        color: #ffffff;
        font-weight: 500;
    }

    .sidebar a.active i {
        color: #6584fa;
    }

    /* Menu category in sidebar */
    .sidebar-category {
        color: rgba(255, 255, 255, 0.5);
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 1.5px;
        padding: 24px 20px 8px;
        font-weight: 600;
    }

    /* Brand logo */
    .brand-logo {
        display: flex;
        align-items: center;
        padding: 15px 20px 20px;
        color: white;
        font-size: 22px;
        font-weight: bold;
        background: rgba(0, 0, 0, 0.1);
        border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        margin-bottom: 5px;
    }

    .brand-logo i {
        margin-right: 12px;
        color: #6584fa;
        font-size: 24px;
        filter: drop-shadow(0 2px 3px rgba(0, 0, 0, 0.2));
    }

    /* User info in sidebar */
    .user-info {
        display: flex;
        align-items: center;
        /*padding: 18px 20px;*/
        border-top: 1px solid rgba(255, 255, 255, 0.08);
        background: rgba(0, 0, 0, 0.15);
    }

    .user-avatar {
        width: 45px;
        height: 45px;
        border-radius: 50%;
        background: linear-gradient(45deg, #6584fa, #8373e6);
        display: flex;
        /*align-items: center;*/
        /*justify-content: center;*/
        /*margin-right: 12px;*/
        color: white;
        font-weight: bold;
        box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
        font-size: 15px;
    }

    .user-details {
        color: white;
    }

    .user-name {
        font-size: 14px;
        font-weight: 600;
        margin-bottom: 3px;
    }

    .user-email {
        font-size: 12px;
        color: rgba(255, 255, 255, 0.7);
    }

    .toggle-btn {
        position: fixed;
        top: 105px;
        left: 15px;
        z-index: 1000;
        cursor: pointer;
        background: linear-gradient(45deg, #6584fa, #7e70e3);
        color: white;
        border: none;
        border-radius: 50%;
        width: 42px;
        height: 42px;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.4s ease;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.3);
    }

    .toggle-btn:hover {
        transform: scale(1.05);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
    }

    .toggle-btn i {
        font-size: 16px;
    }

    .toggle-btn-shifted {
        left: 245px;
    }

    .content {
        transition: margin-left 0.4s ease;
        margin-left: 280px;
        padding: 25px;
    }

    .content-expanded {
        margin-left: 0;
    }

    /* Animation effects */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateX(-10px); }
        to { opacity: 1; transform: translateX(0); }
    }

    .sidebar a {
        animation: fadeIn 0.5s ease forwards;
        opacity: 0;
        animation-delay: calc(var(--i) * 0.05s);
    }

    /* Media Queries */
    @media (max-width: 768px) {
        .sidebar {
            width: 260px;
            left: -260px;
        }

        .content {
            margin-left: 0;
        }

        .toggle-btn-shifted {
            left: 225px;
        }
    }
    .sidebar-dropdown {
        position: relative;
    }

    .sidebar-dropdown > a {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .sidebar-dropdown .dropdown-arrow {
        transition: transform 0.3s ease;
        margin-left: auto;
        font-size: 12px;
    }

    .sidebar-dropdown.active .dropdown-arrow {
        transform: rotate(90deg);
    }

    .sidebar-dropdown-content {
        display: none;
        background-color: rgba(0, 0, 0, 0.1);
        border-left: 4px solid #6584fa;
        margin-left: 44px;
        border-radius: 0 0 6px 0;
        overflow: hidden;
    }

    .sidebar-dropdown.active .sidebar-dropdown-content {
        display: block;
    }

    .sidebar-dropdown-content a {
        padding: 12px 20px 12px 44px;
        margin: 0;
        border-left: none;
        font-size: 14px;
        color: rgba(255, 255, 255, 0.8);
        position: relative;
    }

    .sidebar-dropdown-content a:hover {
        background-color: rgba(255, 255, 255, 0.1);
        transform: none;
    }

    .sidebar-dropdown-content a i {
        position: absolute;
        left: 20px;
    }

    .sidebar-dropdown-content a.active {
        color: white;
        font-weight: 500;
    }
</style>

<button class="toggle-btn" id="toggleSidebar">
    <i class="fas fa-bars"></i>
</button>

<div class="sidebar sidebar-collapsed" id="sidebar">
    <div class="brand-logo">
        <i class="fas fa-briefcase"></i>
        <span>JobTrans</span>
    </div>

    <div class="sidebar-content">
        <div class="sidebar-category">Tổng quan</div>
        <a href="#" style="--i:1"><i class="fas fa-tachometer-alt"></i> Tài khoản</a>
        <a href="#" style="--i:9"><i class="fas fa-cog"></i> Chỉnh sửa tài khoản</a>
        <a href="#" style="--i:2"><i class="fas fa-money-bill-wave"></i> Ví của tôi</a>
        <a href="#" style="--i:13"><i class="fas fa-question-circle"></i> Đổi mật khẩu</a>

        <div class="sidebar-category">Quản lý công việc</div>
        <a href="#" style="--i:3"><i class="fas fa-tasks"></i> Công việc đã đăng</a>
        <div class="sidebar-dropdown" id="jobDropdown">
            <a href="#" style="--i:4" onclick="toggleJobDropdown(event)">
                <div>
                    <i class="fas fa-file-invoice"></i> Công việc của tôi
                </div>
                <i class="fas fa-chevron-right dropdown-arrow"></i>
            </a>
            <div class="sidebar-dropdown-content">
                <a href="job?action=view-applied"><i class="fas fa-file-export"></i> Công việc đã ứng tuyển</a>
                <a href="#"><i class="fas fa-hourglass-half"></i> Công việc đang làm</a>
                <a href="#"><i class="fas fa-check-circle"></i> Công việc đã hoàn thành</a>
                <a href="#"><i class="fas fa-bookmark"></i> Công việc đã thích</a>
            </div>
        </div>

        <div class="sidebar-category">Nâng cao</div>
        <a href="cv?action=list" style="--i:7"><i class="fas fa-calendar-alt"></i> Quản lí CV</a>
        <a href="#" style="--i:10"><i class="fas fa-comments"></i> Tin nhắn</a>
        <a href="#" style="--i:11"><i class="fas fa-bell"></i> Thông báo</a>


        <div class="sidebar-category">Hệ thống</div>
        <a href="logout" style="--i:14"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
    </div>
</div>

<script>
    function toggleJobDropdown(event) {
        event.preventDefault();
        const dropdown = document.getElementById("jobDropdown");
        dropdown.classList.toggle("active");
    }

    // Đóng dropdown khi click ra ngoài
    document.addEventListener('click', function(event) {
        const dropdown = document.getElementById("jobDropdown");
        if (!dropdown.contains(event.target)) {
            dropdown.classList.remove("active");
        }
    });

    document.addEventListener('DOMContentLoaded', function() {
        const sidebar = document.getElementById('sidebar');
        const content = document.getElementById('content');
        const toggleBtn = document.getElementById('toggleSidebar');

        // Mặc định sidebar đóng khi mới mở trang
        let sidebarOpen = false;

        // Đảm bảo sidebar ở trạng thái đóng khi tải trang
        sidebar.classList.add('sidebar-collapsed');
        content.classList.add('content-expanded');
        toggleBtn.classList.remove('toggle-btn-shifted');

        // Icon mặc định là "bars" (biểu tượng 3 gạch)
        toggleBtn.querySelector('i').className = 'fas fa-bars';

        // Xử lý đóng/mở sidebar
        toggleBtn.addEventListener('click', function() {
            sidebar.classList.toggle('sidebar-collapsed');
            content.classList.toggle('content-expanded');
            toggleBtn.classList.toggle('toggle-btn-shifted');

            // Thay đổi trạng thái sidebar
            sidebarOpen = !sidebarOpen;

            // Thay đổi icon dựa vào trạng thái
            const icon = toggleBtn.querySelector('i');
            if (sidebarOpen) {
                icon.className = 'fas fa-times'; // Sidebar mở -> hiển thị icon X

                // Reset animation của các menu items
                const menuItems = document.querySelectorAll('.sidebar a');
                menuItems.forEach(item => {
                    item.style.animation = 'none';
                    item.offsetHeight; // Trigger reflow
                    item.style.animation = null;
                });
            } else {
                icon.className = 'fas fa-bars';  // Sidebar đóng -> hiển thị icon 3 gạch
            }
        });

        // Xử lý responsive cho sidebar trên màn hình nhỏ
        function checkScreenSize() {
            if (window.innerWidth < 768) {
                sidebar.classList.add('sidebar-collapsed');
                content.classList.add('content-expanded');
                toggleBtn.classList.remove('toggle-btn-shifted');
                toggleBtn.querySelector('i').className = 'fas fa-bars';
                sidebarOpen = false;
            }
        }

        // Kiểm tra kích thước màn hình khi tải trang
        checkScreenSize();

        // Kiểm tra kích thước màn hình khi thay đổi kích thước cửa sổ
        window.addEventListener('resize', checkScreenSize);
    });
</script>