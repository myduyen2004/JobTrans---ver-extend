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
    height: 100vh;
    padding: 10px;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    align-items: center;
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
                <span>CV mẫu</span>
            </li>
            <li>
                <i class="fas fa-language"></i>
                <span>Đổi ngôn ngữ</span>
            </li>
            <li class="shrink">
                <i class="fas fa-chevron-up"></i>
                <span>Rút gọn</span>
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
</html>
