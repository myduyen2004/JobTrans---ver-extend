<%--
    Document   : update_job_post
    Created on : Mar 12, 2025, 9:08:51 AM
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
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="css/update_job_post.css" rel="stylesheet">
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
<div class="py-4 banner_title">
    <h1 class="text-white font-weight-bold" style="padding-left: 50px;">CẬP NHẬT TIN TUYỂN DỤNG</h1>
</div>

<div class="mt-3 mb-3" style="border: solid 1px #6787FE; border-radius: 20px; margin-left: 90px; margin-right: 90px;">
    <form class="p-6">
        <div style="padding-left: 20px; padding-right: 20px">
            <div class="mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2">
                    Tiêu đề:
                </label>
                <input class="px-2 py-2" type="text" value="Tiêu đề cũ"/>
            </div>
            <div class="mb-4 flex space-x-4">
                <div class="d-flex w-1/2 form-group">
                    <label class="block text-gray-700 font-bold mb-2">
                        Phân loại:
                    </label>
                    <select class="px-2 py-2">
                        <option>
                            Lập trình
                        </option>
                    </select>
                </div>
                <div class="d-flex w-1/2 form-group">
                    <label class="block text-gray-700 font-bold mb-2">
                        Tag:
                    </label>
                    <select class="px-2 py-2">
                        <option>
                            Lập Trình web
                        </option>
                    </select>
                </div>
            </div>
            <div class="d-flex  mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2">
                    Số người tuyển dụng:
                </label>
                <input class="px-2 py-2" type="number" value="3"/>
            </div>
            <div class="d-flex mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2">
                    Mô tả:
                </label>
                <textarea class="px-2 py-2h-32">
                    - Xây dựng quy trình làm việc, quy trình phát triển phần mềm, quy trình quản lý chất lượng phần mềm trong công ty.
                    - Tham gia dự án dự án xây dựng sản phẩm riêng của công ty.
                    - Tiến hành estimate, review source code và quản lý tiến độ dự án.
                    - Đánh giá năng lực, phân công công việc của các member trong dự án.
                    - Báo cáo tiến độ dự án, đề xuất giải pháp với PM.
                        </textarea>
            </div>
            <div class="mb-4 flex space-x-4">
                <div class="d-flex form-group">
                    <label class="block text-gray-700 font-bold mb-2">
                        Ngân sách:
                    </label>
                    <div class="flex space-x-2">
                        <input class="px-2 py-2 min text-center" placeholder="MIN" type="text" value="MIN"/>
                        <input class="px-2 py-2 text-center" style="margin-right: 50px;" type="text" value="2000000 đ"/>
                        <input class="px-2 py-2 max text-center" placeholder="MAX" type="text" value="MAX"/>
                        <input class="px-2 py-2 text-center" type="text" value="5000000 đ"/>
                    </div>
                </div>
            </div>
            <div class="d-flex mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2">
                    Kiểm tra:
                </label>
                <div class="flex items-center space-x-4">
                    <label class="flex items-center">
                        <input class="mr-2" name="kiemtra" type="radio"/>
                        Có
                    </label>
                    <label class="flex items-center">
                        <input class="mr-2" name="kiemtra" type="radio"/>
                        Không
                    </label>
                    <button class="px-4 py-2 text-blue-700 rounded-lg" style="border: solid 1px #6787FE; background-color: #6787FE50;">
                        <i class="fas fa-upload mr-2"></i>
                        Tải lên bài kiểm tra
                    </button>
                </div>
            </div>
            <div class="d-flex mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2">
                    Tệp đính kèm:
                </label>
                <button class="px-4 py-2 text-blue-700 rounded-lg" style="border: solid 1px #6787FE; background-color: #6787FE50;">
                    <i class="fas fa-upload mr-2"></i>
                    Tải lên tệp đính kèm
                </button>
            </div>
            <div class="d-flex w-1/2 form-group">
                <label class="block text-gray-700 font-bold mb-2">
                    Ngày phỏng vấn:
                </label>
                <input class="px-2 py-2" type="date" value="2025-02-10"/>
            </div>
            <div class="d-flex form-group">
                <label class="block text-gray-700 font-bold mb-2">
                    Đường dẫn phỏng vấn:
                </label>
                <input class="px-2 py-2" type="text"/>
            </div>
            <div class="d-flex w-1/2 mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2">
                    Ngày hết hạn:
                </label>
                <input class="px-2 py-2" type="date" value="2025-02-07"/>
            </div>
            <div class="flex space-x-4 justify-content-center">
                <button class="w-1/4 px-4 py-2 text-white" style="background-color: #6787FE; border: solid 1px #6787FE; border-radius: 50px;">
                    <i class="fas fa-save mr-2">
                    </i>
                    Cập nhật tin tuyển dụng
                </button>
                <button class="w-1/4 px-4 py-2 text-white" style="background-color: #6787FE; border: solid 1px #6787FE; border-radius: 50px;">
                    <i class="fas fa-redo mr-2">
                    </i>
                    Làm mới
                </button>
            </div>
        </div>
    </form>
</div>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

<%@include file="includes/footer.jsp"%>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
</body>
</html>
