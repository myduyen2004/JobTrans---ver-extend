<%-- 
    Document   : sortTransaction
    Created on : Mar 4, 2025, 10:23:34 AM
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
            .filters {
                display: flex;
                align-items: center;
                gap: 20px;
                margin-bottom: 10px;
            }

            .filter-group {
                display: flex;
                align-items: center;
                gap: 5px;
                background: #f8f9fa;
                border: 1px solid #ddd;
                border-radius: 20px;
                padding: 5px 10px;
                white-space: nowrap;
                height: 40px;
            }

            .filter-group span {
                font-size: 14px;
                font-weight: 500;
                color: #333;
            }

            .filter-group select {
                border: none;
                background: transparent;
                font-size: 14px;
                cursor: pointer;
                padding: 5px;
                color: #6787FE;
                font-weight: 700;
            }

            .filter-group select:focus {
                outline: none;
            }

            .note {
                color: #000000;
            }

            .note:hover {
                text-decoration: underline;
            }

            .reset-btn {
                background: none;
                border: none;
                font-size: 14px;
                font-weight: 500;
                color: black;
                cursor: pointer;
                padding: 5px 10px;
            }

            .reset-btn:hover {
                text-decoration: underline;
            }


            .transactions {
                padding: 20px;
            }

            .transactions table {
                width: 100%;
                margin-top: 10px;
                border: none;

            }

            .transactions th,
            .transactions td {
                border: none;
                padding: 10px;
                text-align: left;
            }

            .transactions th {
                border-bottom: 2px solid black
            }

            .success {
                color: green;
                font-weight: 400;
            }

            .failed {
                color: red;
                font-weight: 400;
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

        <section class="section-padding">
            <div class="container">
                <div class="row justify-content-center flex-row-reverse col-xl-12">
                    <div class="search-result col-xl-9">
                        <div class=" col-xl-12">

                            <div class="transactions">
                                <h2>Giao dịch</h2>

                                <!-- Bộ lọc -->
                                <div class="filters">
                                    <div class="filter-group">
                                        <span>Hình thức</span>
                                        <select>
                                            <option selected>Nạp</option>
                                            <option>Rút</option>
                                        </select>
                                    </div>

                                    <div class="filter-group">
                                        <span>Giờ</span>
                                        <select>
                                            <option selected>30 ngày qua</option>
                                            <option>Hôm nay</option>
                                            <option>7 ngày qua</option>
                                        </select>
                                    </div>

                                    <div class="filter-group">
                                        <span>Trạng thái</span>
                                        <select>
                                            <option selected>Tất cả</option>
                                            <option>Thành công</option>
                                            <option>Thất bại</option>
                                        </select>
                                    </div>

                                    <button class="reset-btn">Đặt lại</button>
                                </div>

                                <a href="" class="note" style="font-weight: bold;">Tiền đã nạp chưa vào tài khoản?</a>

                                <!-- Bảng giao dịch -->
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Giờ</th>
                                            <th>Số tiền</th>
                                            <th>Hình thức</th>
                                            <th>Trạng thái</th>
                                            <th>Nội dung</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>16:00:41 15/01/2025</td>
                                            <td>500.000</td>
                                            <td>Nạp tiền</td>
                                            <td class="success">Thành công</td>
                                            <td>Nạp tiền vào JobTrans</td>
                                        </tr>
                                        <tr>
                                            <td>20:56:23 15/01/2025</td>
                                            <td>200.000</td>
                                            <td>Rút tiền</td>
                                            <td class="failed">Thất bại</td>
                                            <td>Rút tiền vào ví cá nhân</td>
                                        </tr>
                                        <tr>
                                            <td>21:01:36 15/01/2025</td>
                                            <td>200.000</td>
                                            <td>Rút tiền</td>
                                            <td class="success">Thành công</td>
                                            <td>Rút tiền vào ví cá nhân</td>
                                        </tr>
                                        <tr>
                                            <td>16:00:41 15/01/2025</td>
                                            <td>500.000</td>
                                            <td>Nạp tiền</td>
                                            <td class="success">Thành công</td>
                                            <td>Nạp tiền vào JobTrans</td>
                                        </tr>
                                        <tr>
                                            <td>20:56:23 15/01/2025</td>
                                            <td>200.000</td>
                                            <td>Rút tiền</td>
                                            <td class="failed">Thất bại</td>
                                            <td>Rút tiền vào ví cá nhân</td>
                                        </tr>
                                        <tr>
                                            <td>21:01:36 15/01/2025</td>
                                            <td>200.000</td>
                                            <td>Rút tiền</td>
                                            <td class="success">Thành công</td>
                                            <td>Rút tiền vào ví cá nhân</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>



                        </div>

                    </div>

                    <div class="col-xl-3 position-relative">
                        <%@include file="includes/task-bar.jsp" %>

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
</html>
