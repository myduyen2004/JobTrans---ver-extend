<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/services/?services-layout=services_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:48 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">

    <title>Báo cáo công việc - đối tác &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large'/>
    <link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">

</head>

<body class="archive post-type-archive post-type-archive-services wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">

<!-- Preloading -->
<div id="preloader">
    <div class="spinner">
        <div class="uil-ripple-css">
            <div></div>
            <div></div>
        </div>
    </div>
</div>

<a class="skip-link screen-reader-text" href="#content">Skip to content</a>

<%@include file="includes/header-login-01.jsp" %>

<!--Mobile Navigation Toggler-->
<div class="off-canvas-menu-bar">
    <div class="container">
        <div class="row">
            <div class="col-6 my-auto">
                <a href="../index.html" class="custom-logo-link" rel="home"><img width="500" height="71"
                                                                                 src="../wp-content/uploads/2021/09/logo.png"
                                                                                 class="custom-logo" alt="ProLancer"
                                                                                 decoding="async"
                                                                                 srcset="https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo.png 500w, https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo-300x43.png 300w"
                                                                                 sizes="(max-width: 500px) 100vw, 500px"/></a>
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
                                                                             src="../wp-content/uploads/2021/09/logo.png"
                                                                             class="custom-logo" alt="ProLancer"
                                                                             decoding="async"
                                                                             srcset="https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo.png 500w, https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo-300x43.png 300w"
                                                                             sizes="(max-width: 500px) 100vw, 500px"/></a>
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

                    <ul class="trail-items" itemscope itemtype="http://schema.org/BreadcrumbList">
                        <li class="trail-item trail-begin"><a href="../index.html"><span itemprop="name">Home</span></a>
                            <meta itemprop="position" content="1"/>
                        </li>
                        <li class="trail-item trail-end"><span itemprop="item"><span
                                itemprop="name">Services</span></span>
                            <meta itemprop="position" content="2"/>
                        </li>
                    </ul>
                </div>
                <h1>
                    Báo cáo đối tác </h1>
            </div>

        </div>
    </div>
</section>


<section class="section-padding">
    <div class="container">
        <div class="row justify-content-center flex-row-reverse">
            <div class="search-result col-xl-9">
                <h1>BÁO CÁO CÔNG VIỆC</h1>
                <div class="row">
                    <div style="margin-top: auto; font-weight: bolder;" class="col-xl-3">Nội dung báo cáo</div>
                    <div class="col-xl-9">
                        <select id="hoi-dong">
                            <option value="">Tùy chọn</option>
                            <option value="thai-do">Thái độ làm việc</option>
                            <option value="dao-van">Đạo văn</option>
                            <option value="qua-han">Quá hạn làm việc</option>
                            <option value="tiet-lo">Tiết lộ thông tin</option>
                            <option value="kem-chat-luong">Sản phẩm kém chất lượng</option>
                        </select>
                    </div>
                </div>
                <div style="margin-top: 20px;" class="row">
                    <div style="margin-top: auto; font-weight: bolder;" class="col-xl-3">Nội dung chi tiết</div>
                    <div class="col-xl-9">
                        <textarea id="noi-dung"></textarea>
                    </div>
                </div>
                <div style="margin-top: 30px;" class="row">
                    <div class="row">
                        <div style="margin-top: auto; font-weight: bolder;" class="col-xl-3 form-label">Tập chứng minh
                            đính kèm
                        </div>
                        <div class="form-input col-xl-9">
                            <div class="file-upload">
                                <input type="file" id="file-upload" multiple class="file-input">

                            </div>
                            <div class="file-list" id="file-list">
                                <!-- Danh sách file sẽ hiển thị ở đây -->
                            </div>
                        </div>
                    </div>
                </div>
                <div style="display: flex; justify-content: center; margin-top: 20px;">
                    <button style="background-color: #E93115;" class="btn-submit">Gửi báo cáo</button>
                </div>

            </div>
            <div class="col-xl-3 position-relative">

                <div class="filter-box">
                    <label>Taskbar</label>
                </div>
                </form>

            </div>
            </aside>
        </div>
    </div>
    </div>
</section>

<%@include file="includes/footer.jsp" %>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

</html>


