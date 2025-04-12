<%-- Document : favoriteListJob Created on : Mar 2, 2025, 4:13:55 PM Author : qn407 --%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">

    <title>Thông tin cơ bản &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large'/>
    <style id="prolancer_opt-dynamic-css" title="dynamic-css" class="redux-options-output">
        .profile {
            width: 350px;
            text-align: center;
        }

        .avatar {
            width: 220px;
            height: 220px;
            border-radius: 50%;
            margin: 20px auto;
        }

        .stars {
            color: #FFDB5B;
            font-size: 20px;
        }

        .avatar-btn {
            background: #0B1741;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 10px;
            width: 120px;
            height: fit-content;
            margin-top: 10px;
            cursor: pointer;
        }

        .member-since {
            color: #7F7A7A;
            font-size: 14px;
            margin-top: 10px;
        }

        .info {
            flex: 1;
            padding: 20px;
        }

        h2 {
            font-size: 32px;
            color: #0B1741;
            margin-left: 24%;
            margin-bottom: 40px;
        }

        .details {
            margin-top: 20px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: auto auto;
            gap: 10px 20px;
            align-items: center;
            margin-left: 30px;
        }

        .info-grid p {
            font-size: 20px;
            margin: 5px 0;
        }

        .info-grid p:nth-child(odd) {
            font-weight: bold;
        }


        .buttons {
            margin-top: 0;
        }

        .edit-btn {
            float: right;
            background: #0B1741;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 5px;
            cursor: pointer;
            width: 150px;
            height: fit-content;
        }

        .detail-btn,
        .wallet-btn {
            float: left;
            background: #6787FE;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 5px;
            width: 150px;
            height: fit-content;
            cursor: pointer;
        }

        .detail-btn:hover,
        .wallet-btn:hover {
            background: #6787FE;
            color: white;

        }

        .intro-container {
            margin-top: 70px;
            width: 100%;
            height: fit-content;
            position: relative;
            background: #E8E6E6;
            border-radius: 30px;
            padding: 50px 79px;
        }

        .intro-title {
            text-align: center;
            color: #0B1741;
            font-size: 32px;
            font-family: Inter, sans-serif;
            font-weight: 900;
        }

        .intro-text {
            color: black;
            font-size: 24px;
            font-family: Inter, sans-serif;
            font-weight: 300;
            line-height: 35px;
            word-wrap: break-word;
            margin-top: 30px;
        }

        .reviews-container {
            width: 100%;
            max-width: 1208px;
            padding: 20px;
            border-radius: 10px;
            margin-top: 70px;
        }

        .reviews-title {
            text-align: center;
            color: #0B1741;
            font-size: 32px;
            font-family: Inter, sans-serif;
            font-weight: 900;
            margin-bottom: 40px;
            margin-left: 100px;
        }

        .review-item {
            display: flex;
            align-items: center;
            gap: 20px;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .review-avatar {
            width: 106px;
            height: 106px;
            border-radius: 50%;
        }

        .review-content {
            flex: 1;
        }

        .review-name {
            font-size: 24px;
            font-weight: 600;
            color: #0B1741;
        }

        .review-stars {
            color: #FFDB5B;
            font-size: 20px;
            margin: 5px 0;
        }

        .review-text {
            font-size: 20px;
            font-weight: 300;
            color: black;
            line-height: 1.5;
        }

        .view-more-btn {
            width: 194px;
            height: 54px;
            background: #D9D9D9;
            border-radius: 20px;
            justify-content: center;
            align-items: center;
            font-size: 20px;
            font-family: Inter, sans-serif;
            font-weight: 300;
            color: black;
            cursor: pointer;
            transition: background 0.3s ease;
            padding: 0;
            text-align: center;
            margin-top: 20px;
        }

        .view-more-btn:hover {
            background: #c4c4c4;
        }

        .report-title {
            text-align: center;
            color: #0B1741;
            font-size: 32px;
            font-family: Inter, sans-serif;
            font-weight: 900;
            margin-bottom: 50px;
        }

        .report-content {
            display: flex;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 20px;
        }

        .report-icon {
            flex-shrink: 0;
            /* Giữ kích thước cố định */
            width: 60px;
            height: 60px;
        }

        .report-text {
            color: black;
            font-size: 20px;
            font-family: Inter, sans-serif;
            font-weight: 300;
            flex-grow: 1;
            line-height: 1.5;
        }

        .material-symbols--report-outline,
        .teenyicons--tick-circle-outline {
            display: inline-block;
            width: 60px;
            height: 60px;
            background-color: currentColor;
            -webkit-mask-repeat: no-repeat;
            mask-repeat: no-repeat;
            -webkit-mask-size: 100% 100%;
            mask-size: 100% 100%;
            --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23000' d='M12 17q.425 0 .713-.288T13 16t-.288-.712T12 15t-.712.288T11 16t.288.713T12 17m-1-4h2V7h-2zm-2.75 8L3 15.75v-7.5L8.25 3h7.5L21 8.25v7.5L15.75 21zm.85-2h5.8l4.1-4.1V9.1L14.9 5H9.1L5 9.1v5.8zm2.9-7'/%3E%3C/svg%3E");
            -webkit-mask-image: var(--svg);
            mask-image: var(--svg);
        }

        body {
            overflow-x: hidden;
        }
        .container {
            max-width: 100%;
        }

    </style>
</head>
<div
        class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">
    <div id="preloader">
        <div class="spinner">
            <div class="uil-ripple-css">
                <div></div>
                <div></div>
            </div>
        </div>
    </div>
    <%@include file="includes/header-01.jsp" %>

    <%@include file="includes/sidebar.jsp" %>

    <a class="skip-link screen-reader-text" href="#content">Skip to content</a>
    <%--            Lưu ý khi chèn taskbar nhớ chèn theo thẻ này--%>
    <div class="row main-content" id="mainContent">
        <section>
            <div class="breadcrumbs">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 my-auto">
                            <h1>
                                Thông tin cơ bản </h1>
                            <ul class="trail-items" itemscope itemtype="http://schema.org/BreadcrumbList">
                                <li class="trail-item trail-begin"><a href="../index.html"><span
                                        itemprop="name">Tài khoản</span></a>
                                    <meta itemprop="position" content="1"/>
                                </li>
                                <li class="trail-item trail-end"><span itemprop="item"><span
                                        itemprop="name">Thông tin cơ bản</span></span>
                                    <meta itemprop="position" content="2"/>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </section>


        <section class="section-padding">
            <div class="container">
                <div class="justify-content-center col-xl-12" style="display: flex;">
                    <div class="profile col-xl-4">
                        <img class="avatar"
                             src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg"
                             alt="Avatar">
                        <div class="stars">
                            <span>★★★★★</span>
                        </div>
                        <button class="avatar-btn">Thay avatar</button>
                        <p class="member-since">Thành viên từ 6/2024</p>
                    </div>
                    <div class="info col-xl-6">
                        <h2 style="margin-bottom: 20px;">Thông tin cơ bản</h2>
                        <div class="info-grid">
                            <p>Họ và tên</p>
                            <p>Nguyễn Văn A</p>
                            <p>Ngày, tháng, năm sinh</p>
                            <p>22-02-2002</p>
                            <p>Loại tài khoản</p>
                            <p>Cá nhân</p>
                            <p>Giới tính</p>
                            <p>Nam</p>
                            <p>Chuyên môn</p>
                            <p>IT, CNTT</p>
                            <p>Điểm uy tín</p>
                            <p>100</p>
                            <p>Số dư</p>
                            <p>3.000.000 VNĐ</p>
                            <p>Email</p>
                            <p>ngva@gmail.com</p>
                            <p>SĐT</p>
                            <p>099999999</p>
                        </div>
                    </div>
                    <div class="buttons col-xl-2">
                        <button class="edit-btn">Sửa thông tin</button>
                        <button class="detail-btn" style="margin-top: 290px;">Xem chi tiết</button>
                        <button class="wallet-btn" style="margin-top: 11px;">Quản lí ví tiền</button>
                    </div>
                </div>
            </div>
            <div class="intro-container">
                <div class="intro-title">Giới thiệu chung</div>
                <div class="intro-text">
                    Xin chào! Tôi là Nguyễn Văn A, một freelancer IT chuyên về phát triển web và backend.
                    Với 5 năm kinh nghiệm, tôi giúp khách hàng xây dựng hệ thống hiệu quả, tối ưu hiệu suất và
                    bảo mật.
                    Nếu bạn cần một freelancer chuyên nghiệp, hãy liên hệ với tôi!
                </div>
            </div>

            <div class="container">
                <div class="justify-content-center" style="padding: 0 20px;">
                    <div class="reviews-container">
                        <div class="reviews-title">Các đánh giá đã nhận được</div>
                        <div class="review-item">
                            <img class="review-avatar"
                                 src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg"
                                 alt="Avatar">
                            <div class="review-content">
                                <div class="review-name">Daniel - Tạo Web SEO</div>
                                <div class="review-stars">★★★★★</div>
                                <div class="review-text">I loved the design that was made will come back for
                                    more!!
                                    You should get your designs from her, super great!!!
                                </div>
                            </div>
                        </div>

                        <div class="review-item">
                            <img class="review-avatar"
                                 src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg"
                                 alt="Avatar">
                            <div class="review-content">
                                <div class="review-name">Daniel - Tạo Web SEO</div>
                                <div class="review-stars">★★★★★</div>
                                <div class="review-text">I loved the design that was made will come back for
                                    more!!
                                    You should get your designs from her, super great!!!
                                </div>
                            </div>
                        </div>

                        <div class="review-item">
                            <img class="review-avatar"
                                 src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg"
                                 alt="Avatar">
                            <div class="review-content">
                                <div class="review-name">Daniel - Tạo Web SEO</div>
                                <div class="review-stars">★★★★★</div>
                                <div class="review-text">I loved the design that was made will come back for
                                    more!!
                                    You should get your designs from her, super great!!!
                                </div>
                            </div>
                        </div>
                        <div class="reviews-title">
                            <button class="view-more-btn">Xem thêm</button>
                        </div>
                    </div>

                    <div style="margin-left: 30px;">
                        <div class="report-title">Thông tin báo cáo</div>

                        <div class="report-content">
                            <div class="report-icon material-symbols--report-outline"></div>
                            <p class="report-text">
                                I loved the design that was made will come back for more!! You should get your
                                designs from her, super great!!!
                                I loved the design that was made will come back for more!! You should get your
                                designs from her, super great!!!
                                I loved the design that was made will come back for more!! You should get your
                                designs from her, super great!!!
                            </p>
                        </div>

                        <div class="report-content">
                            <div class="report-icon material-symbols--report-outline"></div>
                            <p class="report-text">
                                I loved the design that was made will come back for more!! You should get your
                                designs from her, super great!!!
                            </p>
                        </div>

                        <div class="report-content">
                            <div class="report-icon material-symbols--report-outline"></div>
                            <p class="report-text">
                                I loved the design that was made will come back for more!! You should get your
                                designs from her, super great!!!
                                I loved the design that was made will come back for more!! You should get your
                                designs from her, super great!!!
                                I loved the design that was made will come back for more!! You should get your
                                designs from her, super great!!!
                            </p>
                        </div>
                        <div class="reviews-title" style="margin-right: 60px;">
                            <button class="view-more-btn">Xem thêm</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="includes/footer.jsp" %>
    </div>
</div>


<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
</body>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

</html>