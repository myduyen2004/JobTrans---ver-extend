<%--
    Document   : job_post_detail_employee
    Created on : Mar 13, 2025, 8:41:38 PM
    Author     : ADM
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--<link rel="profile" href="https://gmpg.org/xfn/11">-->

    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large' />

    <!--new css -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="css/job_post_detail_employee.css" rel="stylesheet">
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

<%--Header--%>
<%@include file="includes/header-01.jsp"%>

<!--banner-->
<div class="py-4 banner_title">
    <p style="font-size: 40px; font-weight: 700; color: white; margin-left: 80px;">Lập trình web bán hàng</p>
</div>

<%--Main--%>
<div class="container_main_employee">
    <div class="content">
        <h2 class="header-title">Mô tả chi tiết công việc</h2>
        <ul class="content-list mt-3">
            <li>Xây dựng quy trình làm việc, phát triển phần mềm...</li>
            <li>Tham gia dự án xây dựng sản phẩm riêng của công ty.</li>
            <li>Tiến hành estimate, review code, quản lý tiến độ dự án.</li>
            <li>Đánh giá năng lực, phân công công việc.</li>
            <li>Báo cáo tiến độ dự án, đề xuất giải pháp.</li>
        </ul>
        <h2 class="header-title">Yêu cầu ứng viên</h2>
        <ul class="content-list mt-3">
            <li>Yêu thích phát triển sản phẩm công nghệ.</li>
            <li>Tối thiểu 2 năm kinh nghiệm phát triển dự án CNTT.</li>
            <li>Ưu tiên có chứng chỉ PMP.</li>
            <li>Kỹ năng teamwork, giải quyết vấn đề.</li>
        </ul>
        <h2 class="header-title">Quyền lợi</h2>
        <ul class="content-list mt-3">
            <li>Mức lương: Upto 50 triệu.</li>
            <li>Thưởng KPI, thưởng năm.</li>
            <li>Môi trường làm việc chuyên nghiệp.</li>
        </ul>
        <h2 class="header-title">Tệp đính kèm</h2>
        <div class="file-attachment mt-3 d-flex row">
            <div class="col-2">
                <i class="fas fa-file" style="font-size: 60px;"></i>
            </div>
            <div class="col-10 space-y-4">
                <p>Tệp đính kèm</p>
                <p style="color: blue;">Kích thước:45MB</p>
            </div>
        </div>
    </div>
    <div class="sidebar">
        <h2 class="header-title text-center" style="font-weight: normal">Ngân sách</h2>
        <p class="text-center" style="font-size: 35px;"><strong>1.000.000 đ</strong></p>
        <p class="text-center" style="font-size: 28px;"><strong>-</strong></p>
        <p class="text-center" style="font-size: 35px;"><strong>5.000.000 đ</strong></p>
        <a href="#" style="display: block; background-color: #6787FE50; border: solid 2px #6787FE; font-size: 20px; text-decoration: none;
                   border-radius: 50px; color: #6787FE; text-align: center; padding: 10px; margin: 10px 60px 10px 60px;">Chào giá</a>
        <a href="#" style="display: block; background-color: #6787FE50; border: solid 2px #6787FE; font-size: 20px; text-decoration: none;
                   border-radius: 50px; color: #6787FE; text-align: center; padding: 10px; margin: 10px 20px 10px 20px;">Thêm công việc yêu thích</a>
        <p><strong>Trạng thái:</strong> Đang tuyển</p>
        <p><strong>Nhà tuyển dụng:</strong> Công ty A</p>
        <p><strong>Phân loại:</strong> Lập trình</p>
        <p><strong>Tag:</strong> Lập trình web</p>
        <p><strong>Kiểm tra:</strong> Có</p>
        <p><strong>Phỏng vấn:</strong> Chưa phòng vấn</p>
        <p><strong>Ngày đăng:</strong> 10-01-2025</p>
        <p><strong>Ngày hết hạn:</strong> 20-01-2025</p>
        <a href="#" style="display: block; background-color: #6787FE50; border: solid 2px #6787FE; font-size: 20px; text-decoration: none;
                   border-radius: 50px; color: #6787FE; text-align: center; padding: 10px; margin: 20px 0;">Xem Danh Sách Ứng Viên >></a>
    </div>
</div>

<%--Footer--%>
<%@include file="includes/footer.jsp"%>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
</body>
</html>
