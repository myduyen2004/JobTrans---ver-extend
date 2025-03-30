<%-- 
    Document   : vnpay
    Created on : Mar 4, 2025, 10:23:53 AM
    Author     : qn407
--%>

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


    <style>
        h1 {
    text-align: center;
    color: #2c3e50;
}

.profile {
    display: flex;
    background: #f4f4f4;
    padding: 20px;
    border-radius: 10px;
}

.avatar {
    text-align: center;
    width: 30%;
}

.avatar img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    margin-bottom: 10px;
}

.rating {
    color: gold;
    font-size: 20px;
}

.cv-button {
    background: #007bff;
    color: white;
    border: none;
    padding: 8px 12px;
    cursor: pointer;
    border-radius: 5px;
    margin-top: 10px;
}

.cv-button:hover {
    background: #0056b3;
}

.info {
    width: 70%;
    padding-left: 20px;
}

.info h2 {
    border-bottom: 2px solid #007bff;
    display: inline-block;
    padding-bottom: 5px;
}

.section {
    margin-top: 20px;
}

.section h2 {
    color: #2c3e50;
    border-bottom: 2px solid #007bff;
    display: inline-block;
    padding-bottom: 5px;
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
    

    <a class="skip-link screen-reader-text" href="#content">Skip to content</a>

        <%@include file="includes/header-login-01.jsp" %>

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

    <section class="section-padding">
        <div class="container">
            <div class="row justify-content-center flex-row-reverse">
                <div class="search-result col-xl-9">
                    <div class="report-container col-xl-12">
                        <div class="header clearfix">
                            <h3 class="" style="color: #6787FE;font-weight: 800;">Thanh toán qua cổng điện tử</h3>
                        </div>
                        <h4>Nạp thêm tiền</h4>
                        <div class="table-responsive">
                            <form action="./payment" id="frmCreateOrder" method="post">        
                                <div class="form-group">
                                    <label for="amount">Số tiền</label>
                                    <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="10000" />
                                </div>
                                <h4>Chọn phương thức thanh toán</h4>
<%--                                <div class="form-group">--%>
<%--                                    <h5 style="font-weight:500;">Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>--%>
<%--                                    <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">--%>
<%--                                    <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>--%>
<%--    --%>
<%--                                    <h5 style="font-weight:500;">Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>--%>
<%--                                    <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">--%>
<%--                                    <label for="bankCode">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>--%>
<%--    --%>
<%--                                    <input type="radio" id="bankCode" name="bankCode" value="VNBANK">--%>
<%--                                    <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>--%>
<%--    --%>
<%--                                    <input type="radio" id="bankCode" name="bankCode" value="INTCARD">--%>
<%--                                    <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>--%>
<%--    --%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <h5 style="font-weight:500;">Chọn ngôn ngữ giao diện thanh toán:</h5>--%>
<%--                                    <input type="radio" id="language" Checked="True" name="language" value="vn">--%>
<%--                                    <label for="language">Tiếng việt</label><br>--%>
<%--                                    <input type="radio" id="language" name="language" value="en">--%>
<%--                                    <label for="language">Tiếng anh</label><br>--%>
<%--    --%>
<%--                                </div>--%>
                                <button type="submit" class="btn btn-default" href>Thanh toán</button>
                            </form>
                        </div>
    
                    </div>
                </div>


                <div class="col-xl-3 position-relative">
                                      <%@include file="includes/task-bar.jsp" %>

                </div>
            </div>
        </div>
        </aside>
        </div>
        </div>
        </div>
    </section>    
    <%@include file="includes/footer.jsp" %>

    <!--======= Back to Top =======-->
    <div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
    
</body>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

</html>
