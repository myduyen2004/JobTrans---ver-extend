<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">

    <title>Projects &#8211; ProLancer</title>
    <meta name='robots' content='max-image-preview:large' />
    <link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">
    <style>
        .col-xl-9 {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            max-width: 30%;
        }

        .job-card {
            width: 300px;
            height: fit-content;
            background: white;
            padding: 15px;
            border-radius: 20px;
            box-shadow: 0 0 10px #FF5353;
            position: relative;
            margin-bottom: 20px;
            margin-top: 10px;
        }

        .job-card .el--heart-alt {
            display: inline-block;
            width: 35px;
            height: 35px;
            --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1200 1200'%3E%3Cpath fill='%23000' d='M600 0C268.629 0 0 268.629 0 600s268.629 600 600 600s600-268.629 600-600S931.371 0 600 0m132.789 343.503c71.295-1.114 135.772 37.646 166.337 103.724c28.273 87.356 4.612 176.225-45.251 243.199c-32.912 45.417-72.247 84.584-112.462 118.807c-36.997 34.439-119.808 102.591-141.755 104.483c-19.397-3.708-41.173-25.678-56.573-36.968c-86.534-65.781-179.667-145.742-226.899-233.207c-39.601-83.97-39.673-187.864 21.96-252.241c79.917-72.048 200.39-57.946 261.512 17.325c16.415-21.295 36.605-38.066 60.562-50.267c24.279-9.69 48.803-14.483 72.569-14.855'/%3E%3C/svg%3E");
            background-color: #FF5353;
            -webkit-mask-image: var(--svg);
            mask-image: var(--svg);
            -webkit-mask-repeat: no-repeat;
            mask-repeat: no-repeat;
            -webkit-mask-size: 100% 100%;
            mask-size: 100% 100%;
            position: absolute;
            top: -18px;
            right: 20px;
        }

        .el--heart-alt:hover {
            background-color: #6787FE;
        }

        .el--heart-alt:hover ~ .job-card {
            box-shadow: 0 0 10px #6787FE;
        }

        .job-card.active-effect {
            box-shadow: 0 0 15px black !important;
        }

        .el--heart-alt.active-icon {
            background-color: black !important;
        }

        .el--heart-alt:hover {
            background-color: #6787FE;
        }

        .job-header {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .avatar-wrapper {
            position: relative;
            display: inline-block;
        }

        .avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
        }

        .verified-icon {
            position: absolute;
            bottom: 0;
            right: 0;
            width: 20px;
            height: 20px;
            background-color: #4a7ff5;
            --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23fff' fill-rule='evenodd' d='M12 21a9 9 0 1 0 0-18a9 9 0 0 0 0 18m-.232-5.36l5-6l-1.536-1.28l-4.3 5.159l-2.225-2.226l-1.414 1.414l3 3l.774.774z' clip-rule='evenodd'/%3E%3C/svg%3E");
            -webkit-mask-image: var(--svg);
            mask-image: var(--svg);
            -webkit-mask-repeat: no-repeat;
            mask-repeat: no-repeat;
            -webkit-mask-size: 100% 100%;
            mask-size: 100% 100%;
            border-radius: 50%;
            padding: 2px;
        }


        .user-info h4 {
            margin: 0;
            font-size: 14px;
            color: #4a7ff5;
            display: flex;
            align-items: center;
        }


        .user-info p {
            margin: 0;
            font-size: 12px;
            color: gray;
        }

        .favorite {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #eaf0ff;
            color: #4a7ff5;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 16px;
        }

        .job-title {
            font-size: 16px;
            font-weight: bold;
            color: black;
            margin: 10px 0;
        }

        .category {
            font-size: 12px;
            color: gray;
            margin-bottom: 10px;
        }

        .duration {
            font-size: 14px;
            margin-bottom: 10px;
        }

        .time-left {
            background: #eaf0ff;
            color: #4a7ff5;
            padding: 2px 8px;
            border-radius: 10px;
            font-size: 12px;
        }

        .salary {
            font-size: 16px;
            font-weight: bold;
            color: #4a7ff5;
            text-align: center;

        }

        .price {
            background: #eaf0ff;
            padding: 3px 6px;
            border-radius: 10px;
        }

    </style>
</head>

<body
    class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">

    <!-- Preloading -->
    <div id="preloader">
        <div class="spinner">
            <div class="uil-ripple-css">
                <div></div>
                <div></div>
            </div>
        </div>
    </div>
    
    <%@include file="includes/header-01.jsp" %>

    <a class="skip-link screen-reader-text" href="#content">Skip to content</a>

    <!--Mobile Navigation Toggler-->
    <div class="off-canvas-menu-bar">
        <div class="container">
            <div class="row">
                <div class="col-6 my-auto">
                    <a href="../index.html" class="custom-logo-link" rel="home"><img width="500" height="71"
                            src="../wp-content/uploads/2021/09/logo.png" class="custom-logo" alt="ProLancer"
                            decoding="async"
                            srcset="https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo.png 500w, https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo-300x43.png 300w"
                            sizes="(max-width: 500px) 100vw, 500px" /></a>
                </div>
                <div class="col-6">
                    <div class="mobile-nav-toggler float-end"><span class="fal fa-bars"></span></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Mobile Menu  -->
    <div class="off-canvas-menu">
        <div class="menu-backdrop"></div>
        <i class="close-btn fa fa-close"></i>
        <nav class="mobile-nav">
            <div class="text-center pt-3 pb-3">
                <a href="../index.html" class="custom-logo-link" rel="home"><img width="500" height="71"
                        src="../wp-content/uploads/2021/09/logo.png" class="custom-logo" alt="ProLancer"
                        decoding="async"
                        srcset="https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo.png 500w, https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo-300x43.png 300w"
                        sizes="(max-width: 500px) 100vw, 500px" /></a>
            </div>

            <ul class="navigation"><!--Keep This Empty / Menu will come through Javascript--></ul>
            <div class="text-center">
                <a href="../frontend-dashboard/index6f28.html?fed=dashboard" class="prolancer-btn mt-4">
                    Dashboard </a>
            </div>
        </nav>
    </div>


    <section>
        <div class="breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 my-auto">
                        <h1>
                            Projects </h1>
                        <ul class="trail-items" itemscope itemtype="http://schema.org/BreadcrumbList">
                            <li class="trail-item trail-begin"><a href="../index.html"><span
                                        itemprop="name">Home</span></a>
                                <meta itemprop="position" content="1" />
                            </li>
                            <li class="trail-item trail-end"><span itemprop="item"><span
                                        itemprop="name">Projects</span></span>
                                <meta itemprop="position" content="2" />
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>


    <section>
        <div class="container section-padding">
            <div class="row justify-content-center flex-row-reverse">
                <div class="search-result col-xl-9">

                    <div class="job-card">
                        <div class="el--heart-alt"></div>
                        <div class="job-header">
                            <div class="avatar-wrapper">
                                <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg" alt="User Avatar" class="avatar">
                                <div class="verified-icon"></div>
                            </div>
                            <div class="user-info">
                                <h4>Nguyễn Văn User</h4>
                                <p>1735 điểm</p>
                            </div>
                        </div>
                        <h3 class="job-title">Design trang web</h3>
                        <p class="category">Công nghệ thông tin</p>
                        <p class="duration">Thời hạn: 2-3 tháng <span class="time-left">Còn 20 ngày</span></p>
                        <hr>
                        <div class="salary">
                            <span class="price">10.000.000</span> - <span class="price">18.000.000</span>
                        </div>
                    </div>

                    <div class="job-card">
                        <div class="el--heart-alt"></div>
                        <div class="job-header">
                            <div class="avatar-wrapper">
                                <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg" alt="User Avatar" class="avatar">
                                <div class="verified-icon"></div>
                            </div>
                            <div class="user-info">
                                <h4>Nguyễn Văn User</h4>
                                <p>1735 điểm</p>
                            </div>
                        </div>
                        <h3 class="job-title">Design trang web</h3>
                        <p class="category">Công nghệ thông tin</p>
                        <p class="duration">Thời hạn: 2-3 tháng <span class="time-left">Còn 20 ngày</span></p>
                        <hr>
                        <div class="salary">
                            <span class="price">10.000.000</span> - <span class="price">18.000.000</span>
                        </div>
                    </div>

                    <div class="job-card">
                        <div class="el--heart-alt"></div>
                        <div class="job-header">
                            <div class="avatar-wrapper">
                                <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg" alt="User Avatar" class="avatar">
                                
                            </div>
                            <div class="user-info">
                                <h4>Nguyễn Văn User</h4>
                                <p>1735 điểm</p>
                            </div>

                        </div>
                        <h3 class="job-title">Design trang web</h3>
                        <p class="category">Công nghệ thông tin</p>
                        <p class="duration">Thời hạn: 2-3 tháng <span class="time-left">Còn 20 ngày</span></p>
                        <hr>
                        <div class="salary">
                            <span class="price">10.000.000</span> - <span class="price">18.000.000</span>
                        </div>
                    </div>

                    <div class="job-card">
                        <div class="el--heart-alt"></div>
                        <div class="job-header">
                            <div class="avatar-wrapper">
                                <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg" alt="User Avatar" class="avatar">
                                <div class="verified-icon"></div>
                            </div>
                            <div class="user-info">
                                <h4>Nguyễn Văn User</h4>
                                <p>1735 điểm</p>
                            </div>
                        </div>
                        <h3 class="job-title">Design trang web</h3>
                        <p class="category">Công nghệ thông tin</p>
                        <p class="duration">Thời hạn: 2-3 tháng <span class="time-left">Còn 20 ngày</span></p>
                        <hr>
                        <div class="salary">
                            <span class="price">10.000.000</span> - <span class="price">18.000.000</span>
                        </div>
                    </div>

                    <div class="job-card">
                        <div class="el--heart-alt"></div>
                        <div class="job-header">
                            <div class="avatar-wrapper">
                                <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg" alt="User Avatar" class="avatar">
                                <div class="verified-icon"></div>
                            </div>
                            <div class="user-info">
                                <h4>Nguyễn Văn User</h4>
                                <p>1735 điểm</p>
                            </div>
                        </div>
                        <h3 class="job-title">Design trang web</h3>
                        <p class="category">Công nghệ thông tin</p>
                        <p class="duration">Thời hạn: 2-3 tháng <span class="time-left">Còn 20 ngày</span></p>
                        <hr>
                        <div class="salary">
                            <span class="price">10.000.000</span> - <span class="price">18.000.000</span>
                        </div>
                    </div>

                    <div class="job-card">
                        <div class="el--heart-alt"></div>
                        <div class="job-header">
                            <div class="avatar-wrapper">
                                <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg" alt="User Avatar" class="avatar">
                                <span class="verified-icon"></span>
                            </div>
                            <div class="user-info">
                                <h4>Nguyễn Văn User</h4>
                                <p>1735 điểm</p>
                            </div>

                        </div>
                        <h3 class="job-title">Design trang web</h3>
                        <p class="category">Công nghệ thông tin</p>
                        <p class="duration">Thời hạn: 2-3 tháng <span class="time-left">Còn 20 ngày</span></p>
                        <hr>
                        <div class="salary">
                            <span class="price">10.000.000</span> - <span class="price">18.000.000</span>
                        </div>
                    </div>
                    <div class="job-card">
                        <div class="el--heart-alt"></div>
                        <div class="job-header">
                            <div class="avatar-wrapper">
                                <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg" alt="User Avatar" class="avatar">
                                <div class="verified-icon"></div>
                            </div>
                            <div class="user-info">
                                <h4>Nguyễn Văn User</h4>
                                <p>1735 điểm</p>
                            </div>
                        </div>
                        <h3 class="job-title">Design trang web</h3>
                        <p class="category">Công nghệ thông tin</p>
                        <p class="duration">Thời hạn: 2-3 tháng <span class="time-left">Còn 20 ngày</span></p>
                        <hr>
                        <div class="salary">
                            <span class="price">10.000.000</span> - <span class="price">18.000.000</span>
                        </div>
                    </div>

                    <div class="job-card">
                        <div class="el--heart-alt"></div>
                        <div class="job-header">
                            <div class="avatar-wrapper">
                                <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg" alt="User Avatar" class="avatar">
                                <div class="verified-icon"></div>
                            </div>
                            <div class="user-info">
                                <h4>Nguyễn Văn User</h4>
                                <p>1735 điểm</p>
                            </div>
                        </div>
                        <h3 class="job-title">Design trang web</h3>
                        <p class="category">Công nghệ thông tin</p>
                        <p class="duration">Thời hạn: 2-3 tháng <span class="time-left">Còn 20 ngày</span></p>
                        <hr>
                        <div class="salary">
                            <span class="price">10.000.000</span> - <span class="price">18.000.000</span>
                        </div>
                    </div>

                    <div class="job-card">
                        <div class="el--heart-alt"></div>
                        <div class="job-header">
                            <div class="avatar-wrapper">
                                <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg" alt="User Avatar" class="avatar">
                                <span class="verified-icon"></span>
                            </div>
                            <div class="user-info">
                                <h4>Nguyễn Văn User</h4>
                                <p>1735 điểm</p>
                            </div>

                        </div>
                        <h3 class="job-title">Design trang web</h3>
                        <p class="category">Công nghệ thông tin</p>
                        <p class="duration">Thời hạn: 2-3 tháng <span class="time-left">Còn 20 ngày</span></p>
                        <hr>
                        <div class="salary">
                            <span class="price">10.000.000</span> - <span class="price">18.000.000</span>
                        </div>
                    </div>
                    <div class="job-card">
                        <div class="el--heart-alt"></div>
                        <div class="job-header">
                            <div class="avatar-wrapper">
                                <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg" alt="User Avatar" class="avatar">
                                <div class="verified-icon"></div>
                            </div>
                            <div class="user-info">
                                <h4>Nguyễn Văn User</h4>
                                <p>1735 điểm</p>
                            </div>
                        </div>
                        <h3 class="job-title">Design trang web</h3>
                        <p class="category">Công nghệ thông tin</p>
                        <p class="duration">Thời hạn: 2-3 tháng <span class="time-left">Còn 20 ngày</span></p>
                        <hr>
                        <div class="salary">
                            <span class="price">10.000.000</span> - <span class="price">18.000.000</span>
                        </div>
                    </div>

                    <div class="job-card">
                        <div class="el--heart-alt"></div>
                        <div class="job-header">
                            <div class="avatar-wrapper">
                                <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg" alt="User Avatar" class="avatar">
                                <div class="verified-icon"></div>
                            </div>
                            <div class="user-info">
                                <h4>Nguyễn Văn User</h4>
                                <p>1735 điểm</p>
                            </div>
                        </div>
                        <h3 class="job-title">Design trang web</h3>
                        <p class="category">Công nghệ thông tin</p>
                        <p class="duration">Thời hạn: 2-3 tháng <span class="time-left">Còn 20 ngày</span></p>
                        <hr>
                        <div class="salary">
                            <span class="price">10.000.000</span> - <span class="price">18.000.000</span>
                        </div>
                    </div>

                    <div class="job-card">
                        <div class="el--heart-alt"></div>
                        <div class="job-header">
                            <div class="avatar-wrapper">
                                <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg" alt="User Avatar" class="avatar">
                                <span class="verified-icon"></span>
                            </div>
                            <div class="user-info">
                                <h4>Nguyễn Văn User</h4>
                                <p>1735 điểm</p>
                            </div>

                        </div>
                        <h3 class="job-title">Design trang web</h3>
                        <p class="category">Công nghệ thông tin</p>
                        <p class="duration">Thời hạn: 2-3 tháng <span class="time-left">Còn 20 ngày</span></p>
                        <hr>
                        <div class="salary">
                            <span class="price">10.000.000</span> - <span class="price">18.000.000</span>
                        </div>
                    </div>

                    

                </div>
                <div class="col-xl-3">
                    <%@include file="includes/task-bar.jsp" %>
                </div>
            </div>
        </div>
    </section>

    <%@include file="includes/footer.jsp" %>
    <!--======= Back to Top =======-->
    <div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>


    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const heartIcons = document.querySelectorAll(".el--heart-alt");

            heartIcons.forEach((icon) => {
                const jobCard = icon.closest(".job-card"); // Tìm phần tử .job-card chứa icon

                icon.addEventListener("mouseenter", function () {
                    jobCard.style.boxShadow = "0px 0px 15px #6787FE"; // Thay đổi box-shadow khi hover
                });

                icon.addEventListener("mouseleave", function () {
                    jobCard.style.boxShadow = "0px 0px 10px #FF5353";
                });
            });
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const heartIcons = document.querySelectorAll(".el--heart-alt");

            heartIcons.forEach((icon) => {
                icon.addEventListener("click", function () {
                    const jobCard = icon.closest(".job-card");

                    // Thêm class hiệu ứng
                    jobCard.classList.add("active-effect");
                    icon.classList.add("active-icon");

                    // Sau 1 giây, xóa class để trở lại bình thường
                    setTimeout(() => {
                        jobCard.classList.remove("active-effect");
                        icon.classList.remove("active-icon");
                    }, 100);
                });
            });
        });
    </script>
</body>
</html>