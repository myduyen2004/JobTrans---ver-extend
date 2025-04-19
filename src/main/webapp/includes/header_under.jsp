<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 13/4/25
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Quản lý công việc</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<style>
    /* ===== Global Styles ===== */
    :root {
        --primary-color: #4361ee;
        --primary-hover: #3a56d4;
        --secondary-color: #3f37c9;
        --text-color: #2b2d42;
        --light-gray: #f8f9fa;
        --medium-gray: #e9ecef;
        --dark-gray: #6c757d;
        --white: #ffffff;
        --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        --transition: all 0.3s ease;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Inter', sans-serif;
        color: var(--text-color);
        line-height: 1.6;
        background-color: var(--light-gray);
    }

    .container {
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 15px;
    }

    .row {
        display: flex;
        flex-wrap: wrap;
        margin: 0 -15px;
    }

    .col-md-12 {
        width: 100%;
        padding: 0 15px;
    }

    /* ===== Header Styles ===== */
    .off-canvas-menu-bar {
        background-color: var(--white);
        box-shadow: var(--box-shadow);
        padding: 15px 0;
        position: sticky;
        top: 0;
        z-index: 1000;
    }

    .custom-logo {
        max-width: 180px;
        height: auto;
        transition: var(--transition);
    }

    .custom-logo:hover {
        opacity: 0.9;
    }

    .mobile-nav-toggler {
        font-size: 1.5rem;
        color: var(--text-color);
        cursor: pointer;
        transition: var(--transition);
    }

    .mobile-nav-toggler:hover {
        color: var(--primary-color);
    }

    /* ===== Mobile Menu ===== */
    .off-canvas-menu {
        position: fixed;
        top: 0;
        right: -100%;
        width: 320px;
        height: 100vh;
        background-color: var(--white);
        box-shadow: -5px 0 15px rgba(0, 0, 0, 0.1);
        z-index: 1050;
        transition: var(--transition);
        padding: 30px;
        overflow-y: auto;
    }

    .off-canvas-menu.active {
        right: 0;
    }

    .menu-backdrop {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 1040;
        opacity: 0;
        visibility: hidden;
        transition: var(--transition);
    }

    .menu-backdrop.active {
        opacity: 1;
        visibility: visible;
    }

    .close-btn {
        position: absolute;
        top: 20px;
        right: 20px;
        font-size: 1.5rem;
        color: var(--dark-gray);
        cursor: pointer;
        transition: var(--transition);
    }

    .close-btn:hover {
        color: var(--primary-color);
        transform: rotate(90deg);
    }

    /* ===== Breadcrumb Section ===== */
    .breadcrumbs {
        background: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
        padding: 40px 0 80px;
        color: var(--white);
        margin-bottom: 30px;
        position: relative;
        overflow: hidden;
    }

    .breadcrumbs::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-image: url('https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/breadcrumb-bg.jpg');
        background-size: cover;
        background-position: center;
        opacity: 0.2;
        z-index: 0;
    }

    .breadcrumbs .container {
        position: relative;
        z-index: 1;
    }

    .trail-items {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        list-style: none;
        padding: 0;
        margin: 0 0 15px 0;
        font-size: 0.9rem;
    }

    .trail-item {
        display: flex;
        align-items: center;
    }

    .trail-item:not(:last-child)::after {
        content: '/';
        margin: 0 8px;
        color: rgba(255, 255, 255, 0.7);
    }

    .trail-item a {
        color: var(--white);
        text-decoration: none;
        transition: var(--transition);
    }

    .trail-item a:hover {
        text-decoration: underline;
        opacity: 0.9;
    }

    .trail-end span {
        color: rgba(255, 255, 255, 0.9);
    }

    /* ===== Title Section ===== */
    h1 {
        font-size: 2.2rem;
        font-weight: 700;
        margin: 10px 0 0;
        color: var(--white);
        line-height: 1.3;
    }

    /* ===== Button Styles ===== */
    .btn {
        display: inline-block;
        padding: 10px 24px;
        border-radius: 30px;
        font-weight: 500;
        text-align: center;
        text-decoration: none;
        transition: var(--transition);
        cursor: pointer;
        border: none;
    }

    .btn-primary {
        background-color: var(--primary-color);
        color: var(--white);
    }

    .btn-primary:hover {
        background-color: var(--primary-hover);
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(67, 97, 238, 0.3);
    }

    /* ===== Responsive Styles ===== */
    @media (max-width: 992px) {
        h1 {
            font-size: 1.8rem;
        }
    }

    @media (max-width: 768px) {
        .custom-logo {
            max-width: 140px;
        }

        .breadcrumbs {
            padding: 30px 0 25px;
            text-align: center;
        }

        .trail-items {
            justify-content: center;
        }

        h1 {
            font-size: 1.6rem;
            margin-top: 15px;
        }
    }

    @media (max-width: 576px) {
        .off-canvas-menu {
            width: 280px;
            padding: 20px;
        }

        h1 {
            font-size: 1.4rem;
        }
    }
</style>
<body>

<section>
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-md-12 my-auto">
                    <ul class="trail-items">
                        <li class="trail-item trail-begin">
                            <a href="../index.html"><span>Công việc của tôi</span></a>
                            <meta itemprop="position" content="1"/>
                        </li>
                        <li class="trail-item trail-end">
                            <span itemprop="item"><span>Công việc đã đăng</span></span>
                            <meta itemprop="position" content="2"/>
                        </li>
                    </ul>
                </div>
                <h1>QUẢN LÍ CÔNG VIỆC</h1>
            </div>
        </div>
    </div>
</section>
</body>
</html>