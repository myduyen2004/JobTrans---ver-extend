<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 13/4/25
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    /* ===== Reset và font chung ===== */
    body {
        font-family: 'Inter', sans-serif;
        margin: 0;
        padding: 0;
    }

    /* ===== Header Off-canvas ===== */
    .off-canvas-menu-bar {
        background-color: #ffffff;
        border-bottom: 1px solid #eee;
        padding: 10px 0;
    }

    .off-canvas-menu-bar .custom-logo {
        max-width: 180px;
        height: auto;
    }

    .mobile-nav-toggler {
        font-size: 24px;
        cursor: pointer;
        color: #333;
    }

    .mobile-nav-toggler:hover {
        color: #007bff;
    }

    /* ===== Mobile Menu ===== */
    .off-canvas-menu {
        position: fixed;
        top: 0;
        right: -100%;
        width: 280px;
        height: 100%;
        background-color: #fff;
        box-shadow: -2px 0 10px rgba(0,0,0,0.2);
        z-index: 1000;
        transition: right 0.3s ease;
        padding-top: 20px;
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
        background-color: rgba(0,0,0,0.4);
        display: none;
        z-index: 999;
    }

    .menu-backdrop.active {
        display: block;
    }

    .mobile-nav {
        padding: 0 20px;
    }

    .mobile-nav .custom-logo {
        max-width: 150px;
        height: auto;
        margin-bottom: 20px;
    }

    .mobile-nav .navigation {
        list-style: none;
        padding-left: 0;
    }

    .mobile-nav .prolancer-btn {
        background-color: #007bff;
        color: white;
        display: inline-block;
        padding: 10px 20px;
        border-radius: 30px;
        text-decoration: none;
        transition: background 0.3s ease;
    }

    .mobile-nav .prolancer-btn:hover {
        background-color: #0056b3;
    }

    .close-btn {
        position: absolute;
        top: 15px;
        right: 20px;
        font-size: 24px;
        cursor: pointer;
        color: #333;
    }

    /* ===== Breadcrumb Section ===== */
    .breadcrumbs {
        background-color: #f8f9fa;
        padding: 20px 0;
        border-bottom: 1px solid #ddd;
    }

    .trail-items {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        flex-wrap: wrap;
        gap: 5px;
    }

    .trail-items li {
        font-size: 14px;
    }

    .trail-items li a {
        text-decoration: none;
        color: #007bff;
    }

    .trail-items li span {
        color: #555;
    }

    /* ===== Title Section ===== */
    h1 {
        font-size: 28px;
        font-weight: 600;
        margin-top: 10px;
        color: #333;
    }

    /* ===== Responsive ===== */
    @media (max-width: 768px) {
        .custom-logo {
            max-width: 130px;
        }

        h1 {
            font-size: 22px;
            text-align: center;
        }

        .mobile-nav-toggler {
            font-size: 20px;
        }
    }

</style>
<body>



<!-- Mobile Menu -->
<div class="off-canvas-menu">
    <div class="menu-backdrop"></div>
    <i class="close-btn fa fa-close"></i>
    <nav class="mobile-nav">
        <div class="text-center pt-3 pb-3">
            <a href="../index.html" class="custom-logo-link" rel="home">
                <img width="500" height="71" src="../wp-content/uploads/2021/09/logo.png" class="custom-logo" alt="ProLancer" decoding="async"/>
            </a>
        </div>
        <ul class="navigation"><!--Keep This Empty / Menu will come through Javascript--></ul>
        <div class="text-center">
            <a href="../frontend-dashboard/index6f28.html?fed=dashboard" class="prolancer-btn mt-4">Dashboard</a>
        </div>
    </nav>
</div>

<section>
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-md-12 my-auto">
                    <ul class="trail-items">
                        <li class="trail-item trail-begin">
                            <a href="../index.html"><span style="font-family: 'Inter', sans-serif;">Công việc của tôi</span></a>
                            <meta itemprop="position" content="1"/>
                        </li>
                        <li class="trail-item trail-end">
                            <span itemprop="item"><span itemprop="name">Công việc đã đăng</span></span>
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
