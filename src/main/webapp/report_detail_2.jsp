<%--
    Document   : report_detail_2
    Created on : Mar 4, 2025, 1:23:06 PM
    Author     : ADM
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/ by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:30:18 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--<link rel="profile" href="https://gmpg.org/xfn/11">-->

    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large' />

    <!--new css -->
    <link href="css/report_detail_2.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>

<body>

<!-- Preloading -->
<div id="preloader">
    <div class="spinner">
        <div class="uil-ripple-css"><div></div><div></div></div>
    </div>
</div>

<%@include file="includes/header-login-01.jsp"%>

<!-- Tố cáo ngườu dùng -->
<div class="text-center py-4 banner_title">
    <h1 class="h2 text-white font-weight-medium">Thông tin người dùng</h1>
</div>

<div class="container mt-5 p-4 ">
    <div class="d-flex align-items-center user-in4">
        <img class="ml-3 mr-3" src="https://storage.googleapis.com/a1aa/image/sX8CUlUjHpUHRTsZKSJxqG5Ld1jAN6SdOYfhwDwA0w0.jpg" alt="User profile picture" width="100" height="100">
        <div class="ml-3">
            <h4 class="name">Nguyễn Văn User</h4>
            <div class="d-flex align-items-center star">
                        <span class="text-warning">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </span>
                <a href="#" class="ml-2">
                    <i class="fab fa-linkedin"></i>
                </a>
            </div>
        </div>
        <span class="vertical-line"></span>
        <div class="d-flex p-3 rounded text-center in4-system">
            <div>Số điểm: <span class="font-weight-bold">1735 điểm</span></div>
            <div>Đang theo giỏi: <span class="font-weight-bold">132</span></div>
            <div>Người theo giỏi: <span class="font-weight-bold">67</span></div>
        </div>
    </div>
    <div class="mt-4 d-flex ">
        <a href="#" class="mr-2 about-me text-center pt-1">Về tôi</a>
        <a href="#" class="ml-2 judge text-center pt-1">Xem đánh giá</a>
    </div>
    <div class="mt-4">
        <table class="table tb-header m-0" style="border-top: solid 1px #6787FE;
    border-left: solid 1px #6787FE;
    border-right: solid 1px #6787FE;
    border-collapse: unset;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;">
            <tr>
                <td class="font-weight-bold" style="font-size: 24px; font-weight: bold; border: none;">Dự án gần đây</td>
                <td style="border: none"></td>
                <a href="#"><td class="font-weight-light text-right" style="border: none">Xem thêm >></td></a>
            </tr>
        </table>
        <table class="table m-0 tb-mid">
            <tr class="row m-0 tb-list">
                <td class="text-center col-3" style="font-size: 18px">Tên dự án</td>
                <td class="text-center col-3" style="font-size: 18px">Trạng thái</td>
                <td class="text-center col-6" style="font-size: 18px">Đánh giá từ nhà tuyển dụng</td>
            </tr>
        </table>
        <table class="table m-0 tb-mid" style="border-top: solid 1px #6787FE;">
            <tr class="row m-0 tb-list">
                <td class="col-3 text-center" style="font-size: 16px">Tạo web tiếng Hàn</td>
                <td class="col-3 text-center" style="font-size: 16px">Thành công</td>
                <td class="col-6 text-center" style="font-size: 16px">
                            <span class="text-warning">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </span>
                </td>
            </tr>
            <tr class="row m-0 tb-list">
                <td class="col-3 text-center" style="font-size: 16px">Tạo web tiếng Hàn</td>
                <td class="col-3 text-center" style="font-size: 16px">Thất bại</td>
                <td class="col-6 text-center" style="font-size: 16px">
                            <span class="text-warning">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </span>
                </td>
            </tr>
        </table>

        <table class="table m-0 tb-end" style="border-collapse: unset;
    border-left: solid 1px #6787FE;
    border-right: solid 1px #6787FE;
    border-bottom: solid 1px #6787FE;
    border-bottom-left-radius: 15px;
    border-bottom-right-radius: 15px;">
            <tr>
                <td style="border: none"></td>
            </tr>
        </table>
    </div>
    <div class="mt-5 d-flex justify-content-end">
        <a href="#" class="mr-4 report-user text-center pt-1">Từ chối báo cáo</a>
        <a href="#" class="confirm text-center pt-1">Xác nhận báo cáo</a>
    </div>
</div>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

<%@include file="includes/footer.jsp"%>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
</body>
</html>

