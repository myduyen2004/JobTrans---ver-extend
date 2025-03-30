<%-- 
    Document   : vnpay-return
    Created on : Mar 4, 2025, 10:23:46 AM
    Author     : qn407
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="jobtrans.controller.web.payment.Config"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">

    <title>Nạp tiền vào ví &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large' />

    <style>
        .return {
            display: inline-block;
            padding: 10px 20px;
            background-color: #0f1b63; /* Màu xanh dương */
            color: #fff; /* Màu chữ trắng */
            text-decoration: none;
            border-radius: 5px; /* Bo góc */
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.2s, box-shadow 0.2s, color 0.3s;
            box-shadow: 0 5px 15px rgba(42, 65, 232, 0.3); /* Hiệu ứng bóng */
            margin-top: 20px; /* Khoảng cách phía trên */
        }

        .return:hover {
            background-color: #0f1b63; /* Màu khi hover */
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(42, 65, 232, 0.4); /* Hiệu ứng bóng khi hover */
            text-decoration: none; /* Bỏ gạch chân khi hover */
            color: #fff; /* Chữ chuyển sang màu trắng */
        }
        body {
            overflow-x: hidden;
        }
        .container {
            max-width: 100%;
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

    <%@include file="includes/header-login-01.jsp" %>
    <%@include file="includes/sidebar.jsp" %>

    <a class="skip-link screen-reader-text" href="#content">Skip to content</a>
    <div class="row main-content" id="mainContent">

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
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>
        <!--Begin display -->
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
            </div>
            <div class="">
                <div class="form-group">
                    <label >Mã giao dịch thanh toán:</label>
                    <label><%=request.getParameter("vnp_TxnRef")%></label>
                </div>
                <div class="form-group">
                    <label >Số tiền:</label>
                    <label><%=request.getParameter("vnp_Amount")%></label>
                </div>
                <div class="form-group">
                    <label >Mô tả giao dịch:</label>
                    <label><%=request.getParameter("vnp_OrderInfo")%></label>
                </div>
                <div class="form-group">
                    <label >Mã lỗi thanh toán:</label>
                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                </div>
                <div class="form-group">
                    <label >Mã giao dịch tại CTT VNPAY-QR:</label>
                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                </div>
                <div class="form-group">
                    <label >Mã ngân hàng thanh toán:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div>
                <div class="form-group">
                    <label >Thời gian thanh toán:</label>
                    <label><%=request.getParameter("vnp_PayDate")%></label>
                </div>
                <div class="form-group">
                    <label >Tình trạng giao dịch:</label>
                    <label>
                        <%
                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                    out.print("Thành công");
                                } else {
                                    out.print("Không thành công");
                                }

                            } else {
                                out.print("invalid signature");
                            }
                        %></label>
                </div>

                <br><br>

                <%
                    if (signValue.equals(vnp_SecureHash)) {
                        if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {%>
                <a href="./profile?action=addWallet" class="return" >Quay về ví của bạn</a>
                <%                } else {%>
                <a href="./home" class="return" >Quay về trang chủ</a>
                <%                }%>

                <%            } else {%>
                <a href="./home" class="return" >Quay về trang chủ</a>
                <%            }
                %>

            </div>
            <p>
                &nbsp;
            </p>
    </section>
                                <%@include file="includes/footer.jsp" %>
    </div>

    <!--======= Back to Top =======-->
    <div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

</body>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

</html>
