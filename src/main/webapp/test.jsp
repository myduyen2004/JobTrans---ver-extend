<%--
    Document   : sidebar
    Created on : 17 thg 3, 2025, 22:37:15
    Author     : mac
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            display: flex;
        }

        .dashboard-container {
            display: flex;
            width: 100%;
        }

        .dashboard-sidebar {
            width: 240px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif;
            padding: 15px;
            transition: width 0.3s ease;
            overflow: hidden;
        }

        .dashboard-sidebar.collapsed {
            width: 0;
            padding: 0;
            overflow: hidden;
        }

        .dashboard-content {
            flex-grow: 1;
            padding: 20px;
            transition: margin-left 0.3s ease;
        }

        .toggle-btn {
            position: fixed;
            top: 10px;
            left: 10px;
            cursor: pointer;
            font-size: 18px;
            background: none;
            border: none;
            color: #6787FE;
        }
    </style>
</head>
<body>
<button class="toggle-btn"><i class="fas fa-bars"></i></button>
<div class="dashboard-container">
    <div class="dashboard-sidebar">
        <div class="dashboard-sidebar-inner" data-simplebar>
            <div class="dashboard-nav-container">
                <div class="dashboard-sidebar-header">
                    <strong>Job</strong><span style="font-style: normal; color: black;">Trans</span>
                </div>
                <div class="dashboard-nav">
                    <div class="dashboard-nav-inner">
                        <ul data-submenu-title="Quản lí công việc">
                            <li class="dropdown">Quản Lí Công Việc
                                <ul>
                                    <li><a href="">Danh Sách Các Việc Đã Ứng Tuyển</a></li>
                                    <li><a href="">Công Việc Của Tôi</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul data-submenu-title="Quản lí CV">
                            <li class="dropdown">Quản Lí CV <i class="fa fa-chevron-down"></i>
                                <ul>
                                    <li><a href="">Quản lý CV</a></li>
                                    <li><a href="">Tải CV</a></li>
                                </ul>
                            </li>
                            <li><a href=""><i class="icon-line-awesome-dollar"></i> Danh sách nhà tuyển dụng</a></li>
                        </ul>
                        <ul data-submenu-title="Tài khoản">
                            <li><a href=""><i class="icon-line-awesome-dollar"></i> Nạp tiền vào ví</a></li>
                            <li><a href=""><i class="icon-line-awesome-dollar"></i> Sửa thông tin</a></li>
                            <li><a href=""><i class="icon-material-outline-settings"></i> Đổi mật khẩu</a></li>
                            <li class="logout"><a href=""><i class="icon-material-outline-power-settings-new"></i> Đăng Xuất</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="dashboard-content">
        <h2>Trang chính</h2>
        <p>Nội dung chính của trang sẽ hiển thị ở đây.</p>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".dropdown").forEach(function (item) {
            item.addEventListener("click", function () {
                this.classList.toggle("active");
            });
        });

        document.querySelector(".toggle-btn").addEventListener("click", function () {
            document.querySelector(".dashboard-sidebar").classList.toggle("collapsed");
        });
    });
</script>
</body>
</html>