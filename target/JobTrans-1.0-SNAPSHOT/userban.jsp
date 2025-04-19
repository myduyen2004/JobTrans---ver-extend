<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/buyers/harry-olson/ by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:34:54 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết người dùng bị chặn</title>
    <style>
        /* styles.css */
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
        .popup {
            display: none; /* Ẩn mặc định */
            position: fixed; /* Cố định trên màn hình */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Nền mờ */
            justify-content: center;
            align-items: center;
            z-index: 1000; /* Đảm bảo hiển thị trên các phần tử khác */
        }

        .popup-content {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        .popup-buttons {
            margin-top: 15px;
        }

        .popup-button {
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .popup-button.confirm {
            background-color: #4CAF50;
            color: white;
        }

        .popup-button.cancel {
            background-color: #f44336;
            color: white;
        }

        /* Profile Styles */
        .profile {
            display: flex;
            align-items: center;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0px 7px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            margin-top: 30px;
        }

        .avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            margin-right: 15px;
        }

        .user-info {
            border-right: 1px solid black;
            width: 300px;
            text-align: center;

        }

        .user-info h2 {
            margin: 0;
        }

        .rating {
            width: fit-content; /* Hoặc một giá trị cố định/tương đối */
            margin-left: auto;
            margin-right: auto;
        }

        .rating img {
            width: 16px;
            height: 16px;
            margin-left: 5px;
        }

        .devicon--linkedin {
            display: inline-block;
            width: 24px;
            height: 24px;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 128 128'%3E%3Cpath fill='%230076b2' d='M116 3H12a8.91 8.91 0 0 0-9 8.8v104.42a8.91 8.91 0 0 0 9 8.78h104a8.93 8.93 0 0 0 9-8.81V11.77A8.93 8.93 0 0 0 116 3'/%3E%3Cpath fill='%23fff' d='M21.06 48.73h18.11V107H21.06zm9.06-29a10.5 10.5 0 1 1-10.5 10.49a10.5 10.5 0 0 1 10.5-10.49m20.41 29h17.36v8h.24c2.42-4.58 8.32-9.41 17.13-9.41C103.6 47.28 107 59.35 107 75v32H88.89V78.65c0-6.75-.12-15.44-9.41-15.44s-10.87 7.36-10.87 15V107H50.53z'/%3E%3C/svg%3E");
            margin-left: 10px;
        }

        .material-symbols--star {
            display: inline-block;
            width: 24px;
            height: 24px;
            --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23000' d='m5.825 21l1.625-7.025L2 9.25l7.2-.625L12 2l2.8 6.625l7.2.625l-5.45 4.725L18.175 21L12 17.275z'/%3E%3C/svg%3E");
            background-color: currentColor;
            -webkit-mask-image: var(--svg);
            mask-image: var(--svg);
            -webkit-mask-repeat: no-repeat;
            mask-repeat: no-repeat;
            -webkit-mask-size: 100% 100%;
            mask-size: 100% 100%;
            color: #FFDB5B;
        }

        .user-info hr {
            width: 2px;
            height: fit-content;
            margin: 0 10px;
        }

        .user-stats {
            display: flex;
            justify-content: space-between;
            gap: 40px;
            text-align: center;
            max-width: 500px;
            margin: auto;
        }

        .user-stats div {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 80px;
        }

        body {
            overflow-x: hidden;
        }

        .content-report {
            /* Cần có chiều rộng để margin có tác dụng */
            margin-left: auto;
            margin-right: auto;
            width: 1062px;
            height: 508px;
            position: relative
        }
    </style>

</head>

<body>
<section>
    <div class="breadcrumbs banner">
        <div class="container">
            <div class="row">
                <div class="col-md-12 my-auto">
                    <h1 style="text-align: center">Chi tiết người dùng bị chặn </h1>
                </div>
            </div>

        </div>
    </div>

</section>
<div class="container">
    <div class=" col-xl-12">

        <div class="profile">
            <img class="ml-3 mr-3"
                 src="https://storage.googleapis.com/a1aa/image/sX8CUlUjHpUHRTsZKSJxqG5Ld1jAN6SdOYfhwDwA0w0.jpg"
                 alt="User profile picture" width="100" height="100">

            <div class="user-info">
                <h3>Nguyễn Văn User</h3>
                <div class="rating">
                    <span class="material-symbols--star"></span>
                    <span class="material-symbols--star"></span>
                    <span class="material-symbols--star"></span>
                    <span class="material-symbols--star"></span>
                    <span class="material-symbols--star"></span>
                    <span class="devicon--linkedin"></span>
                </div>
            </div>


            <div class="user-stats ">
                <div>
                    <p><strong>Số điểm</strong></p>
                    <p>1200</p>
                </div>
                <div>
                    <p><strong>Đang theo dõi</strong></p>
                    <p>50</p>
                </div>
                <div>
                    <p><strong>Người theo dõi</strong></p>
                    <p>200</p>
                </div>
            </div>
        </div>


    </div>
</div>
<div class="row justify-content-center">
    <div class="col-xl-9">
        <div class="white-padding">
            <ul class="nav nav-tabs mb-3">
                <li class="nav-item">
                    <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#about-me" role="tab"
                       aria-selected="true">Về tôi</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" data-bs-target="#project" role="tab"
                       aria-selected="false">Xem đánh giá</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade active show" id="about-me" role="tabpanel">


                    <!-- Headline -->


                    <div class="content-report">
                        <div style="width: 943px; height: 406px; left: 0px; top: 0px; position: absolute; background: white; border-radius: 14px; border: 2px #D9D9D9 solid"></div>

                        <div style="left: 348px; top: 154px; position: absolute; color: black; font-size: 20px; font-family: Inter; font-weight: 600; line-height: 20px;">
                            Nội dung chi tiết báo cáo
                        </div>

                        <!-- Vùng nội dung dài được cuộn -->
                        <div style="
        position: absolute;
        top: 194px;
        left: 0px;
        width: 943px;
        height: 150px;
        font-size: 16px;

        overflow-y: auto;
        word-wrap: break-word;
        padding: 10px;


        border-radius: 8px;

                               ">
                            Đây là nội dung chi tiết rất dài, ví dụ như người tố cáo đưa ra lý do tố cáo, bằng
                            chứng, các thông tin liên quan tới hành vi vi phạm mà người bị tố cáo đã thực hiện...
                            (bạn có thể thay thế bằng dữ liệu động).
                        </div>

                        <div style="left: 357px; top: 89px; position: absolute; color: black; font-size: 20px;  font-weight: 400; line-height: 20px;">
                            Vi phạm nội dung:
                        </div>

                        <div style="left: 73px; top: 89px; position: absolute; color: black; font-size: 20px; font-family: Inter; font-weight: 400; line-height: 20px;">
                            Người tố cáo : Vũ
                        </div>

                        <div style="width: 250px; height: 20px; left: 343px; top: 21px; position: absolute; color: black; font-size: 20px; font-family: Inter; font-weight: 600; line-height: 20px;">
                            Tên dự án: Dịch tiếng Hàn
                        </div>

                        <!-- Các đường kẻ -->
                        <div style="width: 943px; height: 0px; left: 0px; top: 63px; position: absolute; outline: 2px #D9D9D9 solid; outline-offset: -1px"></div>
                        <div style="width: 941px; height: 0px; left: 1px; top: 135px; position: absolute; outline: 2px #D9D9D9 solid; outline-offset: -1px"></div>
                        <div style="width: 72px; height: 0px; left: 306px; top: 63px; position: absolute; transform: rotate(90deg); transform-origin: top left; outline: 2px #D9D9D9 solid; outline-offset: -1px"></div>
                        <div style="width: 941px; height: 0px; left: 0px; top: 193px; position: absolute; outline: 2px #D9D9D9 solid; outline-offset: -1px"></div>

                        <!-- Nút xác nhận -->
                        <div style="width: 220px; height: 45px; left: 600px; top: 463px; position: absolute">
                            <div style="width: 220px; height: 45px; left: 0px; top: 0px; position: absolute; background: #E22529; border-radius: 15px"></div>

                            <div style="width: 462px; height: 45px; position: relative">
                                <button type="button" onclick="hienThiPopupToCao()"
                                        style="position: absolute; left: 242px; top: 0px; width: 220px; height: 45px; background: #6787FE; border-radius: 15px; border: none; cursor: pointer;">
                                    <div style="position: absolute; left: 26px; top: 13px; color: black; font-size: 20px; font-family: Inter; font-weight: 400; line-height: 20px;">
                                        Xác nhận báo cáo
                                    </div>
                                </button>
                                <button type="submit"
                                        style="position: absolute; left: 0px; top: 0px; width: 220px; height: 45px; background: #E22529; border-radius: 15px; border: none; cursor: pointer;">
                                    <div style="position: absolute; left: 22px; top: 13px; color: black; font-size: 20px; font-family: Inter; font-weight: 400; line-height: 20px;">
                                        Từ chối báo cáo
                                    </div>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>




                <div class="tab-pane fade mt-5" id="project" role="tabpanel">
                    <div class="row">
                        <div class="mt-4">
                            <!-- Header -->
                            <table class="table m-0"
                                   style="border: 1px solid;
                          border-bottom: none;
                          border-top-left-radius: 15px;
                          border-top-right-radius: 15px;
                          overflow: hidden;">
                                <tr>
                                    <td class="font-weight-bold" style="font-size: 24px; border: none;">Dự án gần
                                        đây
                                    </td>
                                    <td style="border: none;"></td>
                                    <td class="font-weight-light text-right" style="border: none;">
                                        <div style="text-align: right;">
                                            <a href="#" style="border-left-width: 48px;">Xem thêm &gt;&gt;</a>
                                        </div>
                                    </td>
                                </tr>
                            </table>

                            <!-- Column Titles -->
                            <table class="table m-0"
                                   style="border-left: 1px solid ;
                          border-right: 1px solid #6787FE;">
                                <tr class="row m-0">
                                    <td class="text-center col-3" style="font-size: 18px;">Tên dự án</td>
                                    <td class="text-center col-3" style="font-size: 18px;">Trạng thái</td>
                                    <td class="text-center col-6" style="font-size: 18px;">Đánh giá từ nhà tuyển
                                        dụng
                                    </td>
                                </tr>
                            </table>

                            <!-- Project Rows -->
                            <table class="table m-0"
                                   style="border-left: 1px solid;
                          border-right: 1px solid ;">
                                <tr class="row m-0">
                                    <td class="col-3 text-center" style="font-size: 16px;">Tạo web tiếng Hàn</td>
                                    <td class="col-3 text-center" style="font-size: 16px;">Thành công</td>
                                    <td class="col-6 text-center" style="font-size: 16px;">
                        <span class="text-warning">
                            <i class="fas fa-star"></i><i class="fas fa-star"></i>
                            <i class="fas fa-star"></i><i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </span>
                                    </td>
                                </tr>
                                <tr class="row m-0">
                                    <td class="col-3 text-center" style="font-size: 16px;">Tạo web tiếng Hàn</td>
                                    <td class="col-3 text-center" style="font-size: 16px;">Thất bại</td>
                                    <td class="col-6 text-center" style="font-size: 16px;">
                        <span class="text-warning">
                            <i class="fas fa-star"></i><i class="fas fa-star"></i>
                            <i class="fas fa-star"></i><i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </span>
                                    </td>
                                </tr>
                            </table>

                            <!-- Footer -->
                            <table class="table m-0"
                                   style="border: 1px solid;
                          border-top: none;
                          border-bottom-left-radius: 15px;
                          border-bottom-right-radius: 15px;
                          overflow: hidden;">
                                <tr>
                                    <td style="border: none;"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>

</div>


<div id="reportPopup" class="popup">
    <div class="popup-content">
        <p>Bạn có chắc chắn báo cáo người dùng này không?</p>
        <div class="popup-buttons">
            <button class="popup-button confirm" onclick="handleConfirmReport()">Có</button>
            <button class="popup-button cancel" onclick="handleCancelReport()">Không</button>
        </div>
    </div>
</div>
<script>
    function hienThiPopupToCao() {
        document.getElementById('reportPopup').style.display = 'flex';
    }

    function handleConfirmReport() {
        // Chuyển sang trang JSP reportUser
        window.location.href = '/reportUser.jsp'; // Thay '/reportUser.jsp' bằng đường dẫn thực tế
    }

    function handleCancelReport() {
        document.getElementById('reportPopup').style.display = 'none'; // Ẩn popup sau khi xử lý
    }

    // Để hiển thị pop-up khi cần, bạn sẽ gọi hàm hienThiPopupToCao()
    // Ví dụ, khi người dùng nhấp vào nút "Tố cáo người dùng":
    // <button onclick="hienThiPopupToCao()">Tố cáo người dùng</button>
</script>


<%--<!-- CSS -->--%>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/backtotop.css">--%>

<%--<!-- HTML trong body -->--%>
<%--<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>--%>

<%--<!-- JS -->--%>
<%--<script src="${pageContext.request.contextPath}/js/backtotop.js"></script>--%>
</body>

</html>
