<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jobtrans.model.Account" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    /* Sidebar styles */
    .sidebar {
        height: 100%;
        width: 300px;
        position: fixed;
        top: 0;
        left: 0;
        background: linear-gradient(to right, rgb(21, 42, 105), rgb(54, 75, 140));
        padding-top: 20px;
        transition: 0.3s;
        z-index: 999;
        overflow-x: hidden;
        margin-top: 90px;

    }

    .sidebar-collapsed {
        left: -300px;
    }

    .sidebar a {
        padding: 12px 20px;
        text-decoration: none;
        font-size: 16px;
        color: #f8f9fa;
        display: block;
        transition: 0.2s;
        border-left: 4px solid transparent;
    }

    .sidebar a:hover {
        background-color: rgba(255, 255, 255, 0.1);
        border-left: 4px solid #6584fa;
    }

    .sidebar a.active {
        background-color: rgba(255, 255, 255, 0.1);
        border-left: 4px solid #6584fa;
    }

    .sidebar-header {
        padding: 15px 20px;
        color: white;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        margin-bottom: 15px;
    }

    .content {
        transition: margin-left 0.3s;
        margin-left: 300px;
        padding: 15px;
    }

    .content-expanded {
        margin-left: 0;
    }

    .toggle-btn {
        position: fixed;
        top: 15px;
        left: 15px;
        z-index: 1000;
        cursor: pointer;
        background-color: #6584fa;
        color: white;
        border: none;
        border-radius: 4px;
        padding: 8px 12px;
        transition: 0.3s;
        margin-top: 86px;
    }

    .toggle-btn-shifted {
        left: 265px;
    }

    .main-content {
        max-width: 1440px;
        margin: 2rem auto;
        padding: 0 15px;
        transition: 0.3s;
    }
    /* Menu category in sidebar */
    .sidebar-category {
        color: #adb5bd;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 1px;
        padding: 20px 20px 10px;
    }

    /* Brand logo */
    .brand-logo {
        display: flex;
        align-items: center;
        padding: 0 20px 20px;
        color: white;
        font-size: 22px;
        font-weight: bold;
    }

    .brand-logo i {
        margin-right: 10px;
        color: #6584fa;
    }

    /* User info in sidebar */
    .user-info {
        display: flex;
        align-items: center;
        padding: 20px;
        margin-top: auto;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
    }

    .user-avatar {
        width: 20px;
        height: 20px;
        border-radius: 50%;
        background-color: #6584fa;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 10px;
        color: white;
        font-weight: bold;
    }

    .user-details {
        color: white;
    }

    .user-name {
        font-size: 14px;
        font-weight: 600;
    }

    .user-email {
        font-size: 12px;
        color: #adb5bd;
    }
</style>
<button class="toggle-btn toggle-btn-shifted" id="toggleSidebar">
    <i class="fas fa-times"></i>
</button>
<div class="sidebar" id="sidebar">
    <div class="brand-logo">
        <i class="fas fa-briefcase"></i>
        <span>JobTrans</span>
    </div>

    <div class="sidebar-category">Tổng quan</div>
    <a href="#"><i class="fas fa-tachometer-alt me-2"></i> Bảng điều khiển</a>
    <a href="#"><i class="fas fa-chart-line me-2"></i> Thống kê</a>

    <div class="sidebar-category">Quản lý</div>
    <a href="#"><i class="fas fa-tasks me-2"></i> Công việc</a>
    <a href="#"><i class="fas fa-users me-2"></i> Ứng viên</a>
    <a class="active" href="#"><i class="fas fa-money-bill-wave me-2"></i> Giao dịch</a>

    <div class="sidebar-category">Hệ thống</div>
    <a href="#"><i class="fas fa-cog me-2"></i> Cài đặt</a>
    <a href="#"><i class="fas fa-question-circle me-2"></i> Trợ giúp</a>

    <div class="user-info mt-auto">
        <div class="user-avatar">
            NT
        </div>
        <div class="user-details">
            <div class="user-name">Nguyễn Tuấn</div>
            <div class="user-email">nguyentuan@example.com</div>
        </div>
    </div>
</div>>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const sidebar = document.getElementById('sidebar');
        const content = document.getElementById('content');
        const toggleBtn = document.getElementById('toggleSidebar');
        const fromDateInput = document.getElementById('fromDate');
        const toDateInput = document.getElementById('toDate');
        const typeSelect = document.getElementById('transactionType');
        const statusSelect = document.getElementById('status');
        const filterBtn = document.getElementById('filterBtn');
        const resetBtn = document.getElementById('resetFilters');

        // Mặc định sidebar mở, và hiển thị icon X
        let sidebarOpen = true;

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
            } else {
                icon.className = 'fas fa-bars'; // Sidebar đóng -> hiển thị icon 3 dòng
            }
        })

    });
</script>