<%-- 
    Document   : reportUser
    Created on : Mar 4, 2025, 10:23:19 AM
    Author     : qn407
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">

    <title>Báo cáo người dùng</title>
    <meta name='robots' content='max-image-preview:large' />

    <style>
        .banner {
            background-image: url('./img/anh1/anh1.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            text-align: center;
            width: 100%; /* Chiều rộng 100% (tương đương 12 cột trên layout full-width) */
            padding-top: 50px; /* Giảm padding trên */
            padding-bottom: 50px; /* Giảm padding dưới */
            color: white; /* Đặt màu chữ */

            /* max-height: 300px; */
        }

        .banner h1 {
            margin: 0; /* Loại bỏ margin mặc định của h1 */
        }
        /* Popup Styles */

        /* Phần chung */
        .section-padding {
            padding: 60px 0; /* Khoảng cách trên và dưới section */
        }

        .container {
            max-width: 1200px; /* Độ rộng tối đa của container */
            margin: 0 auto; /* Căn giữa container theo chiều ngang */
            padding: 0 20px; /* Khoảng cách lề trái và phải container */
        }

        .row {
            display: flex;
            flex-wrap: wrap; /* Cho phép các cột xuống dòng khi không đủ không gian */
            margin-left: -15px; /* Tạo khoảng âm để bù lại padding của cột */
            margin-right: -15px;
        }

        .col-xl-3,
        .col-xl-9,
        .col-xl-12 {
            padding-left: 15px; /* Khoảng cách lề trái của cột */
            padding-right: 15px; /* Khoảng cách lề phải của cột */
            box-sizing: border-box; /* Tính padding và border vào chiều rộng */
        }

        .col-xl-3 {
            flex: 0 0 auto;
            width: 25%; /* Chiều rộng 3/12 */
        }

        .col-xl-9 {
            flex: 0 0 auto;
            width: 75%; /* Chiều rộng 9/12 */
        }

        .col-xl-12 {
            flex: 0 0 auto;
            width: 100%; /* Chiều rộng 12/12 */
        }

        .justify-content-center {
            justify-content: center; /* Căn giữa các phần tử con theo chiều ngang */
        }

        .flex-row-reverse {
            flex-direction: row-reverse; /* Đảo ngược thứ tự các phần tử con */
        }

        /* Report Container */
        .report-container {
            background-color: #f9f9f9; /* Màu nền container báo cáo */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;

        }

        .report-container h2 {
            color: #333;
            margin-bottom: 25px;
        }

        /* Reason Section */
        .reason-section {
            margin-bottom: 25px;
        }

        .reason-section label {
            display: block;
            margin-bottom: 10px;
            font-size: 1.1em;
            color: #555;
        }

        .reason {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
        }

        .reason input[type="radio"] {
            margin-right: 10px;
        }

        .reason label {
            font-weight: normal;
            font-size: 1em;
            color: #666;
        }

        /* Nội dung chi tiết */
        #noi-dung {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1em;
            line-height: 1.5;
            resize: vertical; /* Cho phép kéo dọc textarea */
        }

        #noi-dung::placeholder {
            color: #999;
        }

        /* Bằng chứng */
        .evidence-section {
            margin-top: 25px;
            margin-bottom: 25px;
        }

        .evidence-section label.evidence {
            margin-top: 0; /* Reset margin-top cho label bằng chứng */
            margin-bottom: 10px;
            font-size: 1.1em;
            color: #555;
        }

        .form-input {
            flex-grow: 1; /* Cho phép phần input chiếm không gian còn lại */
            display: flex;
            flex-direction: column;
            align-items: flex-start; /* Căn trái nội dung bên trong */
        }

        .file-upload {
            margin-bottom: 15px;
        }

        .upload-btn {
            background-color: #007bff; /* Màu nút upload */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease;
            display: flex;
            align-items: center;
        }

        .upload-btn:hover {
            background-color: #0056b3;
        }

        .material-symbols--upload {
            font-size: 1.2em;
            margin-right: 8px;
            /* Bạn có thể cần стили bổ sung tùy thuộc vào cách bạn import icon */
        }

        .file-list {
            margin-top: 10px;
            font-size: 0.9em;
            color: #777;
        }

        /* Submit Section */
        .submit-section {
            text-align: right; /* Căn phải nút gửi báo cáo */
        }

        .report-btn {
            background-color: #dc3545; /* Màu nút gửi báo cáo */
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        .report-btn:hover {
            background-color: #c82333;
        }

        /* Responsive (tùy chỉnh theo nhu cầu) */
        @media (max-width: 991.98px) {
            .col-xl-3 {
                width: 100%;
                margin-bottom: 20px;
            }

            .col-xl-9 {
                width: 100%;
            }

            .evidence-section {
                flex-direction: column;
                align-items: flex-start;
            }

            .evidence-section label.evidence {
                margin-bottom: 5px;
            }

            .form-input .upload-btn {
                margin-left: 0;
                margin-top: 10px;
            }
        }

        .report-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            height: fit-content;
        }

        .reason-section, .evidence-section {
            margin-top: 15px;
        }

        .reason {
            display: flex;
            align-items: center;
            margin: 8px 0;
            margin-left: 80px;
        }

        .reason input {
            margin-right: 10px;
        }

        .upload-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #5A67D8;
            color: white;
            font-size: 14px;
            border-radius: 8px;
            cursor: pointer;
        }

        .upload-btn:hover {
            background-color: #4C51BF;
        }

        .material-symbols--upload {
            display: inline-block;
            width: 23px;
            height: 23px;
            --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23000' d='M11 16V7.85l-2.6 2.6L7 9l5-5l5 5l-1.4 1.45l-2.6-2.6V16zm-5 4q-.825 0-1.412-.587T4 18v-3h2v3h12v-3h2v3q0 .825-.587 1.413T18 20z'/%3E%3C/svg%3E");
            background-color: currentColor;
            -webkit-mask-image: var(--svg);
            mask-image: var(--svg);
            -webkit-mask-repeat: no-repeat;
            mask-repeat: no-repeat;
            -webkit-mask-size: 100% 100%;
            mask-size: 100% 100%;
        }

        .submit-section {
            text-align: center;
            margin-top: 100px;
        }
    </style>
</head>
<body>


<section>
    <div class="breadcrumbs banner" >
        <div class="container">
            <div class="row">
                <div class="col-md-12 my-auto">
                    <h1 style="text-align: center">Báo cáo người dùng</h1>
                </div>
            </div>

        </div>
    </div>

</section>

    <section class="section-padding">
        <div class="container">
            <div class="row justify-content-center flex-row-reverse">

                    <div class="report-container col-xl-12">

                        <form action="#" method="post">
                            <div class="reason-section">
                                <label style="font-weight: bolder;">Lý do báo cáo:</label>
                                <div class="reason">
                                    <input type="radio" name="reason" id="reason1">
                                    <label for="reason1">Dùng từ ngữ thô thiển, vi phạm chuẩn mực cộng đồng</label>
                                </div>
                                <div class="reason">
                                    <input type="radio" name="reason" id="reason2">
                                    <label for="reason2">Giả mạo, mạo danh người dùng khác</label>
                                </div>
                                <div class="reason">
                                    <input type="radio" name="reason" id="reason3">
                                    <label for="reason3">Spam, quấy rối</label>
                                </div>
                                <div class="reason">
                                    <input type="radio" name="reason" id="reason4">
                                    <label for="reason4">Bán, tiết lộ thông tin khách hàng trái phép</label>
                                </div>
                                <div class="reason">
                                    <input type="radio" name="reason" id="reason5">
                                    <label for="reason5">Khác</label>
                                </div>
                            </div>
                            <div style="margin-top: 20px;" class="row">
                                <div style="font-weight: bolder;margin-bottom: 30px" class="col-xl-3">Nội dung chi tiết: </div>
                                <div class="col-xl-12">
                                    <textarea id="noi-dung" placeholder="Chi tiết về nội dung vi phạm"></textarea>
                                </div>
                            </div>
                            <!-- HTML -->
                            <div class="evidence-section d-flex align-items-start">

                                <label class="evidence col-xl-3" style="font-weight: bold;margin-top: 65px;">
                                    Bằng chứng <span style="font-weight: normal;">(Nếu có): </span>
                                </label>

                                <div class="form-input row">
                                    <div class="file-upload">
                                        <input type="file" id="file-upload" multiple class="file-input" hidden>
                                        <button type="button" class="upload-btn" style="margin-top: 50px"
                                                onclick="document.getElementById('file-upload').click();">
                                            <span class="material-symbols--upload"></span> Upload bằng chứng cụ thể
                                        </button>
                                    </div>
                                    <div class="file-list" id="file-list">
                                        <!-- Danh sách file sẽ hiển thị ở đây -->
                                    </div>
                                </div>
                            </div>


                            <div class="submit-section">
                                <button type="submit" class="report-btn"> Gửi báo cáo</button>
                            </div>
                        </form>
                    </div>
                </div>


                <div class="col-xl-3 position-relative">

                </div>
            </div>



    </section>



    <!--======= Back to Top =======-->
    <div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

</body>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

</html>