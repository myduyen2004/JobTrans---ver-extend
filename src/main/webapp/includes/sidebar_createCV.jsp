<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV Builder Pro</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary: #4F46E5;
            --primary-light: #EEF2FF;
            --primary-dark: #4338CA;
            --secondary: #10B981;
            --dark: #1F2937;
            --light: #F9FAFB;
            --gray: #6B7280;
            --gray-light: #E5E7EB;
            --border: #D1D5DB;
            --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.1);
            --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 10px 25px rgba(0, 0, 0, 0.1);
            --transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--light);
            color: var(--dark);
            line-height: 1.5;
        }

        /* Layout Structure */
        .app-container {
            display: flex;

        }

        /* Sidebar Styles */
        .sidebar {
            border-radius: 30px;
            width: 280px;
            margin-top: 120px;
            margin-left: 10px;
            /*border: #0F1B63;*/
            /*border: 2px solid #0F1B63;*/
            background-color: whitesmoke;
            display: flex;
            flex-direction: column;
            transition: var(--transition);
            /*position: fixed;*/
            z-index: 50;
            margin-bottom: 20px;

        }

        .sidebar-collapsed {
            width: 80px;
        }

        .sidebar-header {
            padding: 20px;
            border-bottom: 1px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 700;
            font-size: 20px;
            color: var(--primary);
            white-space: nowrap;
        }

        .logo-icon {
            font-size: 24px;
            color: var(--primary);
        }

        .sidebar-menu {
            flex: 1;
            padding: 16px 0;
            overflow-y: auto;
        }

        .menu-section {
            margin-bottom: 24px;
        }

        .menu-title {
            padding: 8px 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: var(--gray);
            display: flex;
            align-items: center;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            margin: 0 8px;
            border-radius: 8px;
            cursor: pointer;
            transition: var(--transition);
            color: var(--gray);
            text-decoration: none;
            white-space: nowrap;
        }

        .menu-item:hover {
            background-color: var(--primary-light);
            color: var(--primary);
        }

        .menu-item.active {
            background-color: var(--primary-light);
            color: var(--primary);
            font-weight: 500;
        }

        .menu-icon {
            width: 24px;
            font-size: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 16px;
            transition: var(--transition);
        }

        .menu-text {
            font-size: 14px;
            font-weight: 500;
            transition: var(--transition);
        }

        .sidebar-collapsed .menu-text,
        .sidebar-collapsed .menu-title span {
            opacity: 0;
            width: 0;
            height: 0;
            overflow: hidden;
            display: none;
        }

        .sidebar-collapsed .menu-item {
            justify-content: center;
            padding: 12px 0;
            margin: 0 12px;
        }

        .sidebar-collapsed .menu-icon {
            margin-right: 0;
            font-size: 20px;
        }

        .hsidebar-footer {
            padding: 16px;
            border-top: 1px solid var(--border);
        }

        .htoggle-btn {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 12px;
            border-radius: 8px;
            background: transparent;
            border: none;
            cursor: pointer;
            color: var(--gray);
            transition: var(--transition);
        }

        .toggle-btn:hover {
            background: var(--primary-light);
            color: var(--primary);
        }

        .toggle-icon {
            font-size: 16px;
            transition: var(--transition);
        }

        .sidebar-collapsed .toggle-icon {
            transform: rotate(180deg);
        }

        /* Main Content Area */
        .main-content {
            /*flex: 1;*/
            /*margin-left: 280px;*/
            /*padding: 24px;*/
            /*transition: var(--transition);*/

        }

        .sidebar-collapsed ~ .main-content {
            margin-left: 80px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
                z-index: 100;
            }

            .sidebar-open {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
            }

            .mobile-menu-btn {
                display: block;
                position: fixed;
                top: 16px;
                left: 16px;
                z-index: 90;
                background: white;
                border: 1px solid var(--border);
                border-radius: 8px;
                padding: 8px;
                box-shadow: var(--shadow-sm);
            }
        }

        /* Badge for new features */
        .badge {
            margin-left: auto;
            background: var(--secondary);
            color: white;
            font-size: 10px;
            font-weight: 600;
            padding: 2px 6px;
            border-radius: 999px;
        }

    </style>
</head>
<body>
<div class="app-container">
    <!-- Sidebar Navigation -->
    <aside class="sidebar" id="sidebar">

        <nav class="sidebar-menu">
            <div class="menu-section">

            </div>

            <div class="menu-section">
                <div class="menu-title">
                    <span>Thiết kế CV</span>
                </div>

                <a href="#" class="menu-item">
                    <i class="fas fa-palette menu-icon"></i>
                    <span class="menu-text">Mẩu CV</span>

                </a>
                <a href="#" class="menu-item">
                    <i class="fas fa-pen-fancy menu-icon"></i>
                    <span class="menu-text">Thiết kế</span>
                </a>
                <a href="#" class="menu-item">
                    <i class="fas fa-layer-group menu-icon"></i>
                    <span class="menu-text">AI</span>
                </a>
                <a href="#" class="menu-item">
                    <i class="fas fa-language menu-icon"></i>
                    <span class="menu-text">Ngôn ngữ</span>
                </a>

            </div>

            <div class="menu-section">
                <div class="menu-title">
                    <span>In CV</span>
                </div>
                <a href="#" class="menu-item">
                    <i class="fas fa-file-pdf menu-icon"></i>
                    <span class="menu-text">PDF In</span>
                </a>
                <a href="#" class="menu-item">
                    <i class="fas fa-file-word menu-icon"></i>
                    <span class="menu-text">Word In</span>
                </a>

<%--                <div class="hsidebar-footer">--%>
                    <button class="htoggle-btn" onclick="toggleSidebar()">
             <div style="margin-right: 60px" class="menu-title">
                    <span>Thu gọn</span>
<%--                </div>--%>


                    </button>
                </div>


        </nav>




        <button class="mobile-menu-btn" id="mobileMenuBtn" style="display: none;">
            <i class="fas fa-bars"></i>
        </button>

    </aside>

    <!-- Main Content Area -->
    <main class="main-content" id="mainContent">

    </main>
</div>

<!-- Mobile Menu Button (hidden on desktop) -->


<script>
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        sidebar.classList.toggle('sidebar-collapsed');

        const icon = document.querySelector('#toggle-icon i');
        if (icon) {
            icon.classList.toggle('fa-chevron-left');
            icon.classList.toggle('fa-chevron-right');
        }

        // Đổi chữ "Thu gọn" ↔ "Mở rộng" nếu muốn
        const toggleText = document.getElementById('toggle-icon');
        if (toggleText) {
            toggleText.innerHTML = icon.classList.contains('fa-chevron-left')
                ? '<i class="fa fa-chevron-left"></i> Thu gọn'
                : '<i class="fa fa-chevron-right"></i> Mở rộng';
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        const mobileMenuBtn = document.getElementById('mobileMenuBtn');
        const sidebar = document.getElementById('sidebar');

        function checkScreenSize() {
            if (window.innerWidth <= 768) {
                if (mobileMenuBtn) mobileMenuBtn.style.display = 'block';
                if (sidebar) sidebar.classList.add('sidebar-collapsed');
            } else {
                if (mobileMenuBtn) mobileMenuBtn.style.display = 'none';
                if (sidebar) sidebar.classList.remove('sidebar-collapsed');
            }
        }

        checkScreenSize();
        window.addEventListener('resize', checkScreenSize);

        if (mobileMenuBtn) {
            mobileMenuBtn.addEventListener('click', function () {
                if (sidebar) sidebar.classList.toggle('sidebar-open');
            });
        }
    });
</script>
</body>
</html>