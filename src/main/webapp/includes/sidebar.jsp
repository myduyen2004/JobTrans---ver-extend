<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jobtrans.model.Account" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    /* Taskbar Styles */
    .dashboard-sidebar {
        width: 270px;
        background: #ffffff;
        border-radius: 12px;
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        font-family: Arial, sans-serif;
        padding: 15px;
        transition: all 0.3s ease;
        position: fixed;
        left: 0;
        top: 100px;
        z-index: 1000;
        height: calc(100vh - 150px);
        overflow-y: auto; /* Thêm thanh cuộn dọc khi nội dung vượt quá chiều cao */
    }

    /* Tùy chỉnh thanh cuộn cho sidebar */
    .dashboard-sidebar::-webkit-scrollbar {
        width: 6px;
    }

    .dashboard-sidebar::-webkit-scrollbar-track {
        background: #f1f1f1;
        border-radius: 10px;
    }

    .dashboard-sidebar::-webkit-scrollbar-thumb {
        background: #c1c1c1;
        border-radius: 10px;
    }

    .dashboard-sidebar::-webkit-scrollbar-thumb:hover {
        background: #a1a1a1;
    }

    .dashboard-sidebar.collapsed {
        transform: translateX(-100%);
    }

    /* Header cải tiến */
    .dashboard-sidebar-header {
        text-align: center;
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 30px;
        padding: 15px 0;
        border-bottom: 1px solid #eaeaea;
        position: sticky;
        top: 0;
        background: #ffffff;
        z-index: 10;
        margin-left: -15px;
        width: calc(100% + 30px);
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    }

    .dashboard-sidebar ul {
        list-style: none;
        padding: 0;
        margin: 0 0 20px 0;
    }

    .dashboard-sidebar ul li {
        padding: 12px 15px;
        font-weight: 500;
        cursor: pointer;
        border-radius: 8px;
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 5px;
        transition: all 0.2s ease;
    }

    .dashboard-sidebar ul li:hover {
        background: #6787FE;
        color: white;
    }

    .dashboard-sidebar ul li a {
        text-decoration: none;
        color: #333;
        display: flex;
        align-items: center;
        gap: 10px;
        width: 100%;
        transition: color 0.3s ease;
    }

    .dashboard-sidebar ul li:hover a {
        color: white;
    }

    .dashboard-sidebar ul li i {
        width: 20px;
        text-align: center;
        font-size: 16px;
    }


    /* CSS cải tiến cho nút toggle */
    .toggle-btn {
        position: fixed;
        top: 110px;
        left: 10px;
        cursor: pointer;
        font-size: 18px;
        background: #0b1741 !important;
        border: none !important;
        color: white !important;
        z-index: 1001;
        width: 40px !important;
        height: 40px !important;
        border-radius: 50% !important;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2) !important;
        transition: all 0.3s ease;
        padding: 0 !important;
        margin: 0 !important;
        outline: none !important;
        text-align: center !important;
        min-width: 40px !important;
        min-height: 40px !important;
        max-width: 40px !important;
        max-height: 40px !important;
        line-height: 1 !important;
        overflow: hidden !important;
    }

    .toggle-btn:hover {
        background: #5070e0 !important;
        transform: scale(1.05);
    }

    .toggle-btn i {
        margin: 0 !important;
        padding: 0 !important;
        line-height: 1 !important;
        display: inline-block !important;
        font-size: 18px !important;
    }

    [data-submenu-title] {
        margin-top: 20px;
        position: relative;
    }

    [data-submenu-title]::before {
        content: attr(data-submenu-title);
        display: block;
        font-size: 12px;
        font-weight: 600;
        color: #6787FE;
        text-transform: uppercase;
        margin-bottom: 15px;
        padding-left: 15px;
    }

    .logout a {
        color: #e74c3c !important;
    }

    .logout:hover {
        background-color: #ffeeee !important;
    }

    .logout:hover a {
        color: #e74c3c !important;
    }

    /* Main content adjustment for sidebar */
    .main-content {
        margin-left: 0;
        transition: margin 0.3s ease;
    }

    .main-content.with-sidebar {
        margin-left: 240px;
    }
    /* Định dạng chung */
    .dashboard-sidebar ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .dashboard-sidebar ul li {
        padding: 12px 15px;
        font-weight: 500;
        cursor: pointer;
        border-radius: 8px;
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 5px;
        transition: all 0.2s ease;
        position: relative;
    }

    /* Định dạng dropdown */
    .dropdown {
        position: relative;
        display: block;
        width: 100%;
    }

    /* Tùy chỉnh danh sách con */
    .dropdown ul {
        display: none;
        flex-direction: column; /* Hiển thị dọc */
        padding-left: 0;
        margin: 5px 0 0 15px; /* Canh lề để nằm dưới mục chính */
        background: rgba(245, 247, 255, 0.5);
        border-radius: 6px;
        overflow: hidden;
        transition: max-height 0.3s ease-in-out;
        max-height: 0;
    }

    .dropdown.active ul {
        display: flex;
        max-height: 300px;
        animation: slideDown 0.3s ease-in-out;
    }

    /* Định dạng mục con để thụt lề dưới "Quản Lí Công Việc" */
    .dropdown ul li {
        padding: 10px 15px;
        position: relative;
        border-radius: 6px;
        transition: all 0.2s ease;
    }

    .dropdown ul li i {
        margin-right: 8px;
    }

    /* Mũi tên xoay khi mở dropdown */
    .dropdown i.fa-chevron-down {
        position: absolute;
        right: 15px;
        transition: transform 0.3s ease;
    }

    .dropdown.active i.fa-chevron-down {
        transform: rotate(180deg);
    }

    /* Sidebar mở rộng khi click */
    .dashboard-sidebar {
        width: 270px;
        transform: translateX(-100%);
        transition: transform 0.3s ease-in-out;
    }

    .dashboard-sidebar.expanded {
        transform: translateX(0);
    }

    /* Điều chỉnh nội dung chính khi sidebar mở */
    .main-content {
        transition: margin 0.3s ease;
    }

    .main-content.with-sidebar {
        margin-left: 270px;
    }


</style>

<button class="toggle-btn" id="sidebarToggle"><i class="fas fa-bars"></i></button>
<div class="dashboard-sidebar collapsed" id="dashboardSidebar">
    <div class="dashboard-sidebar-inner">
        <div class="dashboard-nav-container">
            <div class="dashboard-sidebar-header">
                <strong style="color: #6787FE;">Job</strong><span style="font-style: normal; color: black;">Trans</span>
            </div>
            <div class="dashboard-nav">
                <div class="dashboard-nav-inner">
                    <ul data-submenu-title="Tài khoản">
<%--                        <%--%>
<%--                            if (account.getType().equals("Individual")){%>--%>
                        <li><a href="acc-manage?action=viewAdminAccount"><i class="fas fa-user"></i> Thông tin tài khoản</a></li>
                        <li><a href="profile?action=loadUpdateProfile"><i class="fas fa-user-edit"></i> Sửa thông tin</a></li>
<%--                        <%}else{%>--%>
                        <li><a href="acc-manage?action=viewAdminAccount"><i class="fas fa-user"></i> Thông tin nhóm</a></li>
                        <li><a href="group?action=showUpdateGroup"><i class="fas fa-user-edit"></i> Sửa thông tin nhóm</a></li>
<%--                        <%}%>--%>
                        <li><a href=""><i class="fas fa-wallet"></i> Nạp tiền vào ví</a></li>

                        <li><a href=""><i class="fas fa-key"></i> Đổi mật khẩu</a></li>
                        <li><a href=""><i class="fas fa-building"></i> Danh sách nhà tuyển dụng</a></li>
                        <div class="dropdown" style="padding: 12px 15px">
                            <a href="#"><i class="fas fa-briefcase"></i> Quản Lí Công Việc <i class="fa fa-chevron-down"></i></a>
                            <ul>
                                <li><a href=""><i class="fas fa-list"></i> Danh Sách Các Việc Đã Ứng Tuyển</a></li>
                                <li><a href=""><i class="fas fa-tasks"></i> Công Việc Của Tôi</a></li>
                            </ul>
                        </div>
                        <div class="dropdown" style="padding: 12px 15px">
                            <a href="#"><i class="fas fa-file-alt"></i> Quản Lí CV <i class="fa fa-chevron-down"></i></a>
                            <ul>
                                <li><a href=""><i class="fas fa-cog"></i> Quản lý CV</a></li>
                                <li><a href=""><i class="fas fa-download"></i> Tải CV</a></li>
                            </ul>
                        </div>
                        <li class="logout"><a href="logout"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a></li>
                    </ul>



                    </ul>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Toggle sidebar khi click nút
        const toggleBtn = document.getElementById("sidebarToggle");
        const sidebar = document.getElementById("dashboardSidebar");
        const mainContent = document.getElementById("mainContent");

        toggleBtn.addEventListener("click", function () {
            sidebar.classList.toggle("expanded");
            mainContent.classList.toggle("with-sidebar");
        });

        // Xử lý dropdown
        document.querySelectorAll(".dropdown > a").forEach(function (dropdownToggle) {
            dropdownToggle.addEventListener("click", function (e) {
                e.preventDefault();
                let parentDropdown = this.parentElement;
                parentDropdown.classList.toggle("active");

                // Đóng các dropdown khác khi mở dropdown mới
                document.querySelectorAll(".dropdown").forEach(function (item) {
                    if (item !== parentDropdown) {
                        item.classList.remove("active");
                    }
                });
            });
        });
    });
</script>