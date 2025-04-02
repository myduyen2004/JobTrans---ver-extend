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
    </head>
    <style>
    /* CSS for Dashboard Sidebar */
    .dashboard-sidebar {
        margin-top: 30px;
        width: 240px;
        background: #ffffff;
        border-radius: 12px;
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        font-family: Arial, sans-serif;
        margin: 0 40px;
        padding: 15px;
    }

    /* Sidebar Header */
    .dashboard-sidebar-header {
        text-align: center;
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .dashboard-sidebar-header strong {
        font-style: italic;
        color: #6787FE;
    }

    .dashboard-sidebar ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    
    .dashboard-sidebar ul li {
        padding: 12px 15px;
        font-weight: 500;
        cursor: pointer;
        /*transition: background 0.3s ease, color 0.3s ease;*/
        border-radius: 6px;
    }

    .dashboard-sidebar ul li:hover {
        background: #6787FE;
        color: white;
    }

    .dashboard-sidebar ul li a {
        text-decoration: none;
        color: black;
        display: flex;
        align-items: center;
        gap: 8px;
        transition: color 0.3s ease;
    }

    .dashboard-sidebar ul li:hover a {
        color: white;
    }

    .dropdown {
        position: relative;
        color: black;
    }

    .dropdown ul {
        display: none;
        padding-left: 20px;
    }

    .dropdown.active ul {
        display: block;
    }
    
    .dropdown.active a{
color: black;
    }

    .logout {
        color: red;
        font-weight: bold;
    }

    .logout a {
        color: red;
    }

    .logout:hover {
        background: #ffdddd;
    }
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<div class="col-xl-2 dashboard-sidebar">
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

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".dropdown").forEach(function (item) {
            item.addEventListener("click", function () {
                this.classList.toggle("active");
            });
        });
    });
</script>
</html>
