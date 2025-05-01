<%--
    Document   : sidebar_cv
    Created on : 17 thg 3, 2025, 23:46:42
    Author     : mac
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sidebar Menu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="styles.css">

    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    body {
        margin-top: 100px;
        background-color: #f4f4f4;
    }

    .sidebar {
        width: 100px;
        background: #fff;
        height: 80vh;
        padding: 10px;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-left: -80px;
        margin-top: 20px;

    }

    .sidebar ul {
        list-style: none;
        padding: 0;
        width: 100%;
    }

    .sidebar ul li {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        padding: 15px 0;
        cursor: pointer;
        color: #888;
        transition: all 0.3s;
    }

    .sidebar ul li i {
        font-size: 24px;
        margin-bottom: 5px;
    }

    .sidebar ul li:hover {
        color: #000;
    }

    .shrink {
        margin-top: auto;
    }
    ul li {
        text-align: left;
        cursor: pointer; /* hiện bàn tay khi hover */
        padding: 5px;
    }

    ul li:hover {
        background-color: #f2f2f2; /* hiệu ứng hover */
    }


    .menu {
        list-style: none;
    }

    .dropdown-content {
        display: none;
        list-style: none;
        padding: 0;
        margin: 0;
        border: 1px solid #ccc;
    }

    .dropdown-content li {
        padding: 5px 10px;
        cursor: pointer;
    }

    .dropdown-content li:hover {
        background-color: #f2f2f2;
    }
</style>
<body>
<div class="sidebar">
    <ul>
        <li>
            <i class="fas fa-file-alt"></i>
            <span>Hướng dẫn viết CV</span>
        </li>
        <li>
            <i class="fas fa-file"></i>
            <span>Đổi mẫu CV</span>
        </li>
        <li>
            <i class="fas fa-plus-square"></i>
            <span>Thêm mục</span>
        </li>
        <li>

            <i class="fas fa-file-invoice"></i>
            <a><span>Tạo CV</span></a>

        </li>




        <ul class="menu">
            <li class="dropdown">
                <i class="fas fa-file-export menu-icon"></i>
                <span onclick="toggleMenu()">Đổi Background
            <i class="fas fa-caret-down"></i>
        </span>

            <li>
                <ul id="colorMenu" class="dropdown-content">
                    <li  onclick="changeBg('blue')">Xanh</li>
                    <li onclick="changeBg('red')">Đỏ</li>
                    <li onclick="changeBg('var(--primary)')">Nguyên bản</li>
                </ul>
            </li>
        </ul>
        <li>
            <i class="fas fa-arrow-left"></i>
            <a href="cv?action=type"><span>Quay lại</span></a>
        </li>

    </ul>
</div>
</body>
<script>
    function toggleSidebar() {
        const sidebar = document.querySelector('.sidebar');
        const texts = document.querySelectorAll('.text');
        sidebar.classList.toggle('collapsed');

        texts.forEach(text => {
            text.classList.toggle('hidden');
        });
    }
</script>
<script>
    function changeBg(color) {
        document.body.style.backgroundColor = color;
    }
</script>
<script>
    function toggleMenu() {
        var menu = document.getElementById("colorMenu");
        menu.style.display = (menu.style.display === "block") ? "none" : "block";
    }

    function changeBg(color) {
        document.querySelector('.cv-sidebar').style.background = color;
    }
</script>

</html>