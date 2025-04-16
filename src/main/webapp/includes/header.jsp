<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<!-- Inter Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">


    <style>
        /* Custom styles to enhance Bootstrap navbar */


        body {
            padding-top: 10000px; /* Tăng giá trị nếu muốn header cao hơn */
        }
        .navbar-custom {
            background: linear-gradient(300deg, rgba(103, 135, 254, 0.4) 0%, #2B3D9F 20%);
            position: fixed;
            top: 0;
            left: 0;
            width: 99%;
            z-index: 1000;
            transition: all 0.4s ease;
            height: 100px; /* Tăng chiều cao tổng thể */
            padding: 10px 0; /* Tăng khoảng cách bên trong */
            margin-bottom: 20px;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            padding: 0;
        }

        .navbar-brand img {
            height: 60px;
            margin-right: 10px;
        }

        .navbar-brand span {
            color: #fff;
            font-weight: 800;
            font-size: 26px;
            font-family: 'Arial', sans-serif;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            letter-spacing: 0.5px;
        }

        .navbar-container {
            padding: 0 30px;
            max-width: 1400px;
            margin: 0 auto;
        }

        .navbar-nav .nav-item {
            margin: 0 8px;
        }

        .navbar-nav .nav-link {
            color: rgba(255, 255, 255, 0.95);
            font-weight: 600;
            font-size: 17px;
            font-family: 'Arial', sans-serif;
            padding: 12px 18px;
            border-radius: 8px;
            white-space: nowrap;
            letter-spacing: 0.3px;
            transition: all 0.3s ease;
        }

        .navbar-nav .nav-link:hover {
            color: #fff;
            background-color: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
        }

        .navbar-nav .nav-link.active {
            color: #fff;
            background-color: rgba(255, 255, 255, 0.2);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* Style cho menu dropdown */
        /* CSS nâng cao cho dropdown menu hiện đại với tone màu #6584fa */


        /* Container menu dropdown */
        .dropdown-menu {
            border: none;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(74, 102, 216, 0.15),
            0 2px 10px rgba(74, 102, 216, 0.12);
            padding: 12px;
            margin-top: 12px;
            min-width: 220px;
            background: #ffffff;
            backdrop-filter: blur(10px);
            transform-origin: top center;
        }

        /* Hiệu ứng khi hiển thị dropdown */
        @keyframes scaleIn {
            from { opacity: 0; transform: scale(0.95) translateY(-10px); }
            to { opacity: 1; transform: scale(1) translateY(0); }
        }

        .dropdown-menu.show {
            animation: scaleIn 0.25s cubic-bezier(0.19, 1, 0.22, 1) forwards;
        }

        /* Style cho các item trong dropdown */
        .dropdown-item {
            padding: 10px 14px;
            border-radius: 8px;
            margin-bottom: 4px;
            font-weight: 500;
            display: flex;
            align-items: center;
            color: #444;
            transition: all 0.2s;
        }

        .dropdown-item i {
            color: #6584fa;
            margin-right: 10px;
            font-size: 16px;
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 6px;
            transition: all 0.3s;
        }

        .dropdown-item:hover {
            background-color: rgba(101, 132, 250, 0.1);
            color: #6584fa;
        }

        .dropdown-item:hover i {
            transform: scale(1.1);
            background-color: rgba(101, 132, 250, 0.15);
        }

        .dropdown-item:active,
        .dropdown-item:focus {
            background-color: rgba(101, 132, 250, 0.15);
            color: #4a66d8;
        }

        /* Style cho divider */
        .dropdown-divider {
            border-top: 1px solid rgba(101, 132, 250, 0.15);
            margin: 10px 0;
        }

        /* Style đặc biệt cho item cuối cùng (công cụ tạo CV) */
        .dropdown-menu li:last-child .dropdown-item {
            font-weight: 600;
            background: linear-gradient(135deg, rgba(101, 132, 250, 0.1), rgba(101, 132, 250, 0.2));
            border-left: 3px solid #6584fa;
        }

        .dropdown-menu li:last-child .dropdown-item:hover {
            background: linear-gradient(135deg, rgba(101, 132, 250, 0.15), rgba(101, 132, 250, 0.25));
            transform: translateX(2px);
        }

        .dropdown-menu li:last-child .dropdown-item i {
            color: #fff;
            background-color: #6584fa;
        }

        /* Thêm hiệu ứng pseudo-element tạo điểm nhấn cho dropdown menu */
        .dropdown-menu::before {
            content: '';
            position: absolute;
            top: -8px;
            left: 20px;
            width: 16px;
            height: 16px;
            background: white;
            transform: rotate(45deg);
            border-radius: 2px;
            box-shadow: -2px -2px 5px rgba(74, 102, 216, 0.04);
        }

        /* Hiệu ứng hover cho toàn bộ dropdown */
        .nav-item.dropdown:hover .nav-link {
            box-shadow: 0 2px 8px rgba(101, 132, 250, 0.12);
        }

        /* Thêm hiệu ứng viền khi focus cho vấn đề accessibility */
        .dropdown-item:focus-visible {
            outline: 2px solid #6584fa;
            outline-offset: 1px;
        }


        /* Custom buttons */
        .btn-login {
            border: 2px solid rgba(255, 255, 255, 0.9);
            color: #fff;
            border-radius: 30px;
            padding: 10px 24px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            margin-left: 15px;
            font-family: 'Arial', sans-serif;
            font-size: 16px;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            background: transparent;
        }

        .btn-signup {
            background: #fff;
            color: #2B3D9F;
            border-radius: 30px;
            padding: 12px 28px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.3s ease;
            margin-left: 15px;
            font-family: 'Arial', sans-serif;
            font-size: 16px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border: none;
        }

        .btn-login:hover {
            background: rgba(255, 255, 255, 0.15);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(255, 255, 255, 0.2);
            color: #fff;
        }

        .btn-signup:hover {
            background: #f8f9ff;
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
            color: #2B3D9F;
        }

        /* Animation */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .navbar-custom {
            animation: fadeInDown 0.5s ease forwards;
        }

        /* Burger menu color */
        .navbar-toggler {
            border: none;
            padding: 8px 12px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            transition: all 0.3s;
        }

        .navbar-toggler:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%28255, 255, 255, 0.9%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }

        /* Body padding to account for fixed navbar */
        body {
            padding-top: 85px;
        }

        /* Responsive adjustments for small screens */
        @media (max-width: 480px) {
            .navbar-brand span {
                font-size: 22px;
            }

            .navbar-brand img {
                height: 50px;
            }
        }
    </style>
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
    <div class="container-fluid navbar-container">
        <a class="navbar-brand" href="index.jsp">
            <img src="img/logo/logo.png" alt="JobTrans Logo" class="d-inline-block align-text-top">
            <span>JobTrans</span>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">Trang chủ</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Công việc
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="jobs.jsp"><i class="fas fa-list-ul"></i>Tất cả công việc</a></li>
                        <li><a class="dropdown-item" href="jobs-by-category.jsp"><i class="fas fa-th-large"></i>Theo danh mục</a></li>
                        <li><a class="dropdown-item" href="jobs-by-location.jsp"><i class="fas fa-map-marker-alt"></i>Theo địa điểm</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="saved-jobs.jsp"><i class="fas fa-heart"></i>Công việc đã lưu</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Tạo CV
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="cv-template-1.jsp"><i class="fas fa-file-alt"></i>Mẫu CV 1</a></li>
                        <li><a class="dropdown-item" href="cv-template-2.jsp"><i class="fas fa-file-alt"></i>Mẫu CV 2</a></li>
                        <li><a class="dropdown-item" href="cv-template-3.jsp"><i class="fas fa-file-alt"></i>Mẫu CV 3</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="cv-builder.jsp"><i class="fas fa-tools"></i>Công cụ tạo CV</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="employer.jsp">Nhà tuyển dụng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about-me.jsp">Về chúng tôi</a>
                </li>
            </ul>
            <div class="d-flex align-items-center">
                <a href="login.jsp" class="btn btn-login">Đăng nhập</a>
                <a href="register.jsp" class="btn btn-signup">Đăng ký</a>
            </div>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
