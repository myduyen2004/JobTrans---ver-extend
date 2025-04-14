<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CV Builder</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            /*--primary: #4361ee;*/
            /*--primary-light: #e0e7ff;*/
            /*--secondary: #3f37c9;*/
            /*--dark: #1e1e1e;*/
            /*--light: #f8f9fa;*/
            /*--gray: #6c757d;*/
            /*--border: #dee2e6;*/
            /*--shadow: 0 4px 20px rgba(0, 0, 0, 0.08);*/
        }

        #cv-container {
            position: relative;
            margin-left: 250px; /* Bằng với width của sidebar */
            margin-top: 70px; /* Bằng với height của header */
            padding: 20px;
            transition: margin-left 0.3s;
            width: calc(100% - 250px);
            min-height: calc(100vh - 70px);
            background-color: #f5f7fb;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }



        /* Header Styles */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 70px;
            background: white;
            box-shadow: var(--shadow);
            display: flex;
            align-items: center;
            padding: 0 30px;
            z-index: 1000;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            font-size: 22px;
            color: var(--primary);
        }

        .logo-icon {
            font-size: 26px;
        }

        .header-actions {
            margin-left: auto;
            display: flex;
            gap: 20px;
            align-items: center;
            margin-right: 60px;
        }

        .btn {
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-outline {
            border: 1px solid var(--primary);
            color: var(--primary);
            background: transparent;
        }

        .btn-outline:hover {
            background: var(--primary-light);
        }



        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--primary);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            cursor: pointer;
        }

        /* Sidebar Styles */
        .sidebar {
            position: fixed;
            top: 70px;
            left: 0;
            width: 250px;
            height: calc(100vh - 70px);
            background: white;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.05);
            padding: 20px 0;
            transition: all 0.3s;
            z-index: 900;
        }

        .sidebar.collapsed {
            width: 80px;
        }

        .sidebar-menu {
            list-style: none;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            margin: 5px 0;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.2s;
            color: var(--gray);
            text-decoration: none;
        }

        .menu-item:hover {
            background: var(--primary-light);
            color: var(--primary);
        }

        .menu-item.active {
            background: var(--primary-light);
            color: var(--primary);
            font-weight: 500;
        }

        .menu-icon {
            font-size: 20px;
            width: 24px;
            text-align: center;
            margin-right: 15px;
        }

        .menu-text {
            font-size: 15px;
            transition: opacity 0.3s;
        }

        .sidebar.collapsed .menu-text {
            opacity: 0;
            width: 0;
            overflow: hidden;
        }

        .sidebar.collapsed .menu-item {
            justify-content: center;
            padding: 12px 0;
        }

        .sidebar.collapsed .menu-icon {
            margin-right: 0;
            font-size: 22px;
        }

        .divider {
            height: 1px;
            background: var(--border);
            margin: 15px 20px;
        }

        /* Main Content Area */
        .main-content {
            margin-left: 250px;
            margin-top: 70px;
            padding: 30px;
            transition: all 0.3s;
        }

        .sidebar.collapsed ~ .main-content {
            margin-left: 80px;
        }
        @media (max-width: 992px) {
            .cv-box {
                flex-direction: column;
            }

            .cv-sidebar {
                width: 100%;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
            }


            .menu-text {
                display: none;
            }

            .menu-icon {
                margin-right: 0;
                font-size: 20px;
            }
        }
    </style>


</head>
<body>
<!-- Header Section -->
<header class="header">
    <div class="logo">
        <i class="fas fa-file-alt logo-icon"></i>
        <span>CV Builder Pro</span>
    </div>

    <div class="header-actions">
        <button class="btn btn-outline">
            <i class="fas fa-eye"></i> Preview
        </button>
        <button class="btn btn-primary">
            <i class="fas fa-download"></i> Download

        </button>




    </div>
    <%@include file="./gpt_sidebar.jsp" %>
</header>

<!-- Sidebar Navigation -->
<nav class="sidebar">
    <ul class="sidebar-menu">
        <li>
            <a href="#" class="menu-item active">
                <i class="fas fa-home menu-icon"></i>
                <span class="menu-text">Dashboard</span>
            </a>
        </li>
        <li>
            <a href="#" class="menu-item">
                <i class="fas fa-file-alt menu-icon"></i>
                <span class="menu-text">CV Templates</span>
            </a>
        </li>
        <li>
            <a href="#" class="menu-item">
                <i class="fas fa-pen-fancy menu-icon"></i>
                <span class="menu-text">Design</span>
            </a>
        </li>
        <li>
            <a href="#" class="menu-item">
                <i class="fas fa-plus-circle menu-icon"></i>
                <span class="menu-text">Add Section</span>
            </a>
        </li>
        <li>
            <a href="#" class="menu-item">
                <i class="fas fa-language menu-icon"></i>
                <span class="menu-text">Language</span>
            </a>
        </li>

        <li class="divider"></li>

        <li>
            <a href="#" class="menu-item">
                <i class="fas fa-file-export menu-icon"></i>
                <span class="menu-text">Export Options</span>
            </a>
        </li>
        <li>
            <a href="#" class="menu-item">
                <i class="fas fa-cog menu-icon"></i>
                <span class="menu-text">Settings</span>
            </a>
        </li>
    </ul>

    <div style="position: absolute; bottom: 20px; left: 0; right: 0; text-align: center;">
        <button onclick="toggleSidebar()" class="menu-item" style="background: transparent; justify-content: center;">
            <i class="fas fa-chevron-left menu-icon"></i>
            <span class="menu-text">Collapse</span>
        </button>
    </div>
</nav>

<!-- Main Content Area -->
<main class="main-content">
    <!-- Your CV content will go here -->
</main>

<script>
    function toggleSidebar() {
        const sidebar = document.querySelector('.sidebar');
        sidebar.classList.toggle('collapsed');

        const icon = document.querySelector('.sidebar .menu-item:last-child i');
        if (sidebar.classList.contains('collapsed')) {
            icon.classList.remove('fa-chevron-left');
            icon.classList.add('fa-chevron-right');
        } else {
            icon.classList.remove('fa-chevron-right');
            icon.classList.add('fa-chevron-left');
        }
    }
</script>
</body>
</html>