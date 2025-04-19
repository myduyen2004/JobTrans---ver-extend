<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/services/?services-layout=services_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:48 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Báo cáo người dùng - đối tác &#8211; JobTrans</title>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Inter, sans-serif;

            color: #333;
            background-color: #f8f9fa;
        }

        /* Header styles based on the image */
        .banner {
            background: linear-gradient(rgba(4, 10, 60, 0.9), rgba(4, 10, 60, 0.9)), url('./img/anh1/anh1.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            position: relative;
            color: white;
            padding: 20px 0;
            overflow: hidden;
        }

        .banner::after {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: url('./img/anh1/anh1.png');
            background-size: cover;
            opacity: 0.2;
            z-index: 0;
        }

        .banner .container {
            position: relative;
            z-index: 1;
        }

        .banner h1 {
            font-size: 32px;
            font-weight: 700;
            text-align: center;
            margin:  0;
        }

        .contentBanner {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 0px;
            padding-bottom: 0px;

        }

        .inforDetail {
            font-size: 18px;
            align-self: flex-start;
        }


        /* Breadcrumb navigation */
        .breadcrumb-nav {
            background-color: #040A3C;
            color: white;
            padding: 15px 0;
        }

        .breadcrumb-container {
            max-width: 1200px;
            padding: 0 15px;
            display: flex;
            align-items: center;
            margin-top: 25px;
            margin-left: 150px;
        }

        .breadcrumb {
            list-style: none;
            display: flex;
            flex-wrap: wrap;
        }

        .breadcrumb-item {
            display: inline-flex;
            align-items: center;
            margin-right: 5px;
        }

        .breadcrumb-item a {
            color: #bbb;
            text-decoration: none;
            transition: color 0.3s;
        }

        .breadcrumb-item a:hover {
            color: white;
        }

        .breadcrumb-item + .breadcrumb-item:before {
            content: ">>";
            margin: 0 10px;
            color: #6787FE;
        }

        .breadcrumb-item.active {
            color: #6787FE;
            font-weight: 600;
        }

        /* Container and layout */
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -15px;
        }

        .justify-content-center {
            justify-content: center;
        }

        .flex-row-reverse {
            flex-direction: row-reverse;
        }

        .col-xl-3 {
            flex: 0 0 25%;
            max-width: 25%;
            padding: 0 15px;
        }

        .col-xl-9 {
            flex: 0 0 75%;
            max-width: 75%;
            padding: 0 15px;
        }

        /* Section styles */
        .section-padding {
            padding: 40px 0;
        }

        .search-result {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
            padding: 30px;
        }

        .search-result h1 {
            color: #040A3C;
            text-align: center;
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 40px;
        }

        /* Form Elements */
        select, textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 15px;
            outline: none;
            transition: border-color 0.3s;
        }

        select:focus, textarea:focus {
            border-color: #6787FE;
            box-shadow: 0 0 0 3px rgba(103, 135, 254, 0.1);
        }

        textarea {
            min-height: 150px;
            resize: vertical;
        }

        /* Radio buttons styled like in the image */
        .radio-group {
            margin: 15px 0;
        }

        .radio-option {
            display: flex;
            align-items: flex-start;
            margin-bottom: 12px;
        }

        .radio-option input[type="radio"] {
            margin-right: 10px;
            margin-top: 3px;
            cursor: pointer;
        }

        .radio-option label {
            font-size: 14px;
            cursor: pointer;
        }

        /* File upload section */
        .evidence-section {
            margin-top: 20px;
        }

        .d-flex {
            display: flex;
        }

        .align-items-start {
            align-items: flex-start;
        }

        .evidence {
            padding-top: 10px;
        }

        .file-upload {
            margin-bottom: 15px;
        }

        .upload-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 12px 20px;
            background-color: #6787FE;
            border: none;
            border-radius: 30px;
            color: white;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s;
        }

        .upload-btn:hover {
            background-color: #5470dc;
        }

        .material-symbols--upload {
            margin-right: 5px;
        }

        .file-list {
            margin-top: 15px;
        }

        .file-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 5px;
            margin-bottom: 8px;
        }

        .file-item .file-name {
            flex-grow: 1;
            margin-right: 10px;
        }

        .remove-file {
            color: #dc3545;
            cursor: pointer;
            background: none;
            border: none;
        }

        /* Submit Button */
        .btn-submit {
            background-color: #6787FE;
            color: white;
            border: none;
            padding: 12px 40px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
            box-shadow: 0 4px 6px rgba(103, 135, 254, 0.2);
        }

        .btn-submit:hover {
            background-color: #040A3C;
        }

        /* Back to top button */
        #backtotop {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background-color: #6787FE;
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            opacity: 0;
            transition: opacity 0.3s;
            z-index: 1000;
        }

        #backtotop.visible {
            opacity: 1;
        }

        /* Responsive */
        @media (max-width: 1200px) {
            .col-xl-3, .col-xl-9 {
                flex: 0 0 100%;
                max-width: 100%;
                margin-bottom: 20px;
            }

            .flex-row-reverse {
                flex-direction: column;
            }

            .upload-btn {
                width: 100% !important;
            }

            .banner h1 {
                margin-right: 0;
                font-size: 28px;
            }
        }

        @media (max-width: 768px) {
            .banner h1 {
                font-size: 24px;
            }

            .breadcrumb-item {
                font-size: 14px;
            }
        }
    </style>
</head>

<body>
<!-- Breadcrumb Navigation based on image -->
<div class="breadcrumb-nav">
    <div class="breadcrumb-container">
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Công việc của tôi</a></li>
            <li class="breadcrumb-item"><a href="#">Công việc đã đăng</a></li>
            <li class="breadcrumb-item"><a href="#">Lập trình web bán hàng</a></li>
            <li class="breadcrumb-item"><a href="#">Quản lí công việc</a></li>
        </ul>
    </div>
</div>

<section>
    <div class="breadcrumbs banner" style="padding-bottom: 30px;padding-top: 20px;margin-bottom: 50px;">
        <div class="container">
            <div class="contentBanner">
                <div class="inforDetail"></div>
                <h1 >Báo cáo công việc</h1>
            </div>
        </div>
    </div>
</section>

<section class="section-padding">
    <div class="container">
        <div class="row justify-content-center">
            <div class="search-result col-xl-9">
                <h1 style="margin-bottom: 40px">BÁO CÁO CÔNG VIỆC</h1>

                <!-- Nội dung báo cáo -->
                <div class="row">
                    <div style="font-weight: bolder;" class="col-xl-3">Lý do báo cáo:</div>
                    <div class="col-xl-9">
                        <!-- Radio buttons styled like in the image -->
                        <div class="radio-group">
                            <div class="radio-option">
                                <input type="radio" id="reason-1" name="reason" value="thien-vi">
                                <label for="reason-1">Dùng từ ngữ thô thiển, vi phạm chuẩn mực cộng đồng</label>
                            </div>
                            <div class="radio-option">
                                <input type="radio" id="reason-2" name="reason" value="gia-mao">
                                <label for="reason-2">Giả mạo, mạo danh người dùng khác</label>
                            </div>
                            <div class="radio-option">
                                <input type="radio" id="reason-3" name="reason" value="spam">
                                <label for="reason-3">Spam, quấy rối</label>
                            </div>
                            <div class="radio-option">
                                <input type="radio" id="reason-4" name="reason" value="tiet-lo">
                                <label for="reason-4">Bán, tiết lộ thông tin khách hàng trái phép</label>
                            </div>
                            <div class="radio-option">
                                <input type="radio" id="reason-5" name="reason" value="tiet-lo">
                                <label for="reason-4">Khác</label>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Nội dung chi tiết -->
                <div style="margin-top: 20px;" class="row">
                    <div style="font-weight: bolder;" class="col-xl-3">Nội dung chi tiết</div>
                    <div class="col-xl-9">
                        <textarea id="noi-dung" placeholder="Chi tiết về nội dung vi phạm"></textarea>
                    </div>
                </div>

                <!-- Bằng chứng -->
                <div style="margin-top: 30px;" class="row">
                    <div class="row">
                        <div class="evidence-section d-flex align-items-start">
                            <label class="evidence col-xl-3" style="font-weight: bold;">Bằng chứng:</label>
                            <div class="form-input col-xl-9">
                                <div class="file-upload">
                                    <input type="file" id="file-upload" multiple class="file-input" hidden>
                                    <button type="button" style="margin-left: 100px;width: 540px;" class="upload-btn" onclick="document.getElementById('file-upload').click();">
                                        <span class="material-symbols--upload">⬆</span> Upload bằng chứng cụ thể
                                    </button>
                                </div>
                                <div class="file-list" id="file-list">
                                    <!-- Danh sách file sẽ hiển thị ở đây -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Nút gửi báo cáo -->
                <div style="display: flex; justify-content: center; margin-top: 20px;">
                    <button class="btn-submit" style="margin-top: 30px;">Báo cáo</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up">↑</i></div>

<script>
    // JavaScript for file upload functionality
    document.getElementById('file-upload').addEventListener('change', function(e) {
        const fileList = document.getElementById('file-list');

        for(let i = 0; i < this.files.length; i++) {
            const file = this.files[i];
            const fileItem = document.createElement('div');
            fileItem.classList.add('file-item');

            const fileName = document.createElement('div');
            fileName.classList.add('file-name');
            fileName.textContent = file.name;

            const removeButton = document.createElement('button');
            removeButton.classList.add('remove-file');
            removeButton.textContent = '×';
            removeButton.addEventListener('click', function() {
                fileItem.remove();
            });

            fileItem.appendChild(fileName);
            fileItem.appendChild(removeButton);
            fileList.appendChild(fileItem);
        }
    });

    // Back to top button functionality
    window.addEventListener('scroll', function() {
        const backToTop = document.getElementById('backtotop');
        if (window.pageYOffset > 300) {
            backToTop.classList.add('visible');
        } else {
            backToTop.classList.remove('visible');
        }
    });

    document.getElementById('backtotop').addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
</script>
</body>
</html>