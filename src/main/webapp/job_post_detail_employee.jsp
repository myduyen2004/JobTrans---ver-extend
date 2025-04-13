<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large'/>

    <!--new css -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="css/job_post_detail_employee.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        .banner_title {
            background-image: url(./img/anh1/anh1.png);
            background-size: 100%;
            height: 200px;
            align-items: center;
        }

        .content {
            width: 65%;
        }

        .header-title {
            font-weight: bold;
            font-size: 28px;
        }

        .content-list {
            padding-left: 20px;
        }

        .content-list li {
            font-size: 18px;
            color: #4A6375;
        }

        .file-attachment {
            background-color: lightgrey;
            padding: 10px;
            border-radius: 5px;
            width: 330px;
        }

        .post-box {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .post-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body style="font-family: Inter,serif">
<div class="row py-4 banner_title">
    <div class="col-10">
        <p style="font-size: 40px; font-weight: 700; color: white; padding-left: 50px;">Lập trình web bán hàng</p>
    </div>
</div>

<%--Main--%>
<main class="container mx-auto mt-8 mb-5" style="width: 1280px;">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
        <section class="col-span-3">
            <div class="container">
                <div class="row">
                    <h2 class="text-center col-11" style="font-size: 32px; font-weight: bold;">Thông tin công việc</h2>
                    <a class="col-1" href="#" onclick="toggleHeart(this)">
                        <span class="text-end" style="font-size:32px;">
                            <i class="far fa-heart"></i>
                        </span>
                    </a>
                </div>
                <div class="content">
                    <h2 class="header-title">Mô tả chi tiết công việc</h2>
                    <ul class="content-list mb-4">
                        <li>Xây dựng quy trình làm việc, phát triển phần mềm...</li>
                        <li>Tham gia dự án xây dựng sản phẩm riêng của công ty.</li>
                        <li>Tiến hành estimate, review code, quản lý tiến độ dự án.</li>
                        <li>Đánh giá năng lực, phân công công việc.</li>
                        <li>Báo cáo tiến độ dự án, đề xuất giải pháp.</li>
                    </ul>
                    <h2 class="header-title">Yêu cầu ứng viên</h2>
                    <ul class="content-list mb-4">
                        <li>Yêu thích phát triển sản phẩm công nghệ.</li>
                        <li>Tối thiểu 2 năm kinh nghiệm phát triển dự án CNTT.</li>
                        <li>Ưu tiên có chứng chỉ PMP.</li>
                        <li>Kỹ năng teamwork, giải quyết vấn đề.</li>
                    </ul>
                    <h2 class="header-title">Quyền lợi</h2>
                    <ul class="content-list mb-4">
                        <li>Mức lương: Upto 50 triệu.</li>
                        <li>Thưởng KPI, thưởng năm.</li>
                        <li>Môi trường làm việc chuyên nghiệp.</li>
                    </ul>
                    <h2 class="header-title mb-3">Tệp đính kèm</h2>
                    <div class="file-attachment mb-4 ml-3 d-flex row">
                        <div class="col-2 d-flex flex-row align-items-center">
                            <i class="fas fa-file" style="font-size: 40px;"></i>
                        </div>
                        <div class="col-10 space-y-4">
                            <p>Tệp đính kèm</p>
                            <p style="color: blue;">Kích thước:45MB</p>
                        </div>
                    </div>
                </div>
            </div>
            <h2 class="text-center mb-3 mt-3" style="font-size: 32px; font-weight: bold;">Các chào giá nhận được</h2>
            <div class="post-box bg-white p-4 rounded-lg shadow-md flex items-center justify-between"
                 style="width: 860px; height: 135px; margin-bottom: 10px;">
                <div class="flex items-center space-x-4">
                    <img alt="Profile picture of the job poster" class="rounded-full" height="80"
                         src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg"
                         width="80"/>
                    <div class="space-y-2" style="width: 480px;">
                        <div>
                            <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">Daniel - CEO WEB bán hàng</span>
                        </div>
                        <div style="font-size: 16px; font-weight: bold;">
                            Điểm số: 1000
                        </div>
                        <p>
                            <span style="font-size: 16px; font-weight: bold;">Giá đề xuất: </span>
                            <span style="font-size: 16px;">1000000 VND</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="post-box bg-white p-4 rounded-lg shadow-md flex items-center justify-between"
                 style="width: 860px; height: 135px; margin-bottom: 10px;">
                <div class="flex items-center space-x-4">
                    <img alt="Profile picture of the job poster" class="rounded-full" height="80"
                         src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg"
                         width="80"/>
                    <div class="space-y-2" style="width: 480px;">
                        <div>
                            <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">Daniel - CEO WEB bán hàng</span>
                        </div>
                        <div style="font-size: 16px; font-weight: bold;">
                            Điểm số: 1000
                        </div>
                        <p>
                            <span style="font-size: 16px; font-weight: bold;">Giá đề xuất: </span>
                            <span style="font-size: 16px;">1000000 VND</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="post-box bg-white p-4 rounded-lg shadow-md flex items-center justify-between"
                 style="width: 860px; height: 135px; margin-bottom: 10px;">
                <div class="flex items-center space-x-4">
                    <img alt="Profile picture of the job poster" class="rounded-full" height="80"
                         src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg"
                         width="80"/>
                    <div class="space-y-2" style="width: 480px;">
                        <div>
                            <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">Daniel - CEO WEB bán hàng</span>
                        </div>
                        <div style="font-size: 16px; font-weight: bold;">
                            Điểm số: 1000
                        </div>
                        <p>
                            <span style="font-size: 16px; font-weight: bold;">Giá đề xuất: </span>
                            <span style="font-size: 16px;">1000000 VND</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="post-box bg-white p-4 rounded-lg shadow-md flex items-center justify-between"
                 style="width: 860px; height: 135px; margin-bottom: 10px;">
                <div class="flex items-center space-x-4">
                    <img alt="Profile picture of the job poster" class="rounded-full" height="80"
                         src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg"
                         width="80"/>
                    <div class="space-y-2" style="width: 480px;">
                        <div>
                            <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">Daniel - CEO WEB bán hàng</span>
                        </div>
                        <div style="font-size: 16px; font-weight: bold;">
                            Điểm số: 1000
                        </div>
                        <p>
                            <span style="font-size: 16px; font-weight: bold;">Giá đề xuất: </span>
                            <span style="font-size: 16px;">1000000 VND</span>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <aside>
            <div style="background-color: #6787FE; color: white; border-radius: 15px;">
                <h2 class="header-title text-center" style="font-weight: normal">Ngân sách</h2>
                <p class="text-center" style="font-size: 30px;"><strong>1.000.000 VND</strong></p>
                <p class="text-center" style="font-size: 24px;"><strong>-</strong></p>
                <p class="text-center" style="font-size: 30px;"><strong>5.000.000 VND</strong></p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-md mt-3" style="border: solid 1px #6787FE; border-radius: 15px;">
                <ul style="font-size: 20px;">
                    <li class="mb-2"><strong>Trạng thái:</strong> Đang tuyển</li>
                    <li class="mb-2"><strong>Nhà tuyển dụng:</strong> Công ty A</li>
                    <li class="mb-2"><strong>Phân loại:</strong> Lập trình</li>
                    <li class="mb-2"><strong>Tag:</strong> Lập trình web</li>
                    <li class="mb-2"><strong>Kiểm tra:</strong> Có</li>
                    <li class="mb-2"><strong>Phỏng vấn:</strong> Chưa phòng vấn</li>
                    <li class="mb-2"><strong>Ngày đăng:</strong> 10-01-2025</li>
                    <li class="mb-2"><strong>Ngày hết hạn:</strong> 20-01-2025</li>
                </ul>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-md mt-3" style="border: solid 1px #6787FE; border-radius: 15px;">
                <h2 style="font-size: 24px; font-weight: bold;" class="text-center">Chào giá</h2>
                <form>
                    <label style="font-weight: bold">Mức giá</label>
                    <input style="border-radius: 10px; border: 1px solid #6787FE; font-weight: bold" type="text"/>
                    <label style="font-weight: bold">Giới thiệu chung</label>
                    <input style="border-radius: 10px; border: 1px solid #6787FE; font-weight: bold" type="text"/>
                    <label style="font-weight: bold">Chọn CV</label>
                    <input style="border-radius: 10px; border: 1px solid #6787FE; font-weight: bold" type="text"/>
                    <label style="font-weight: bold">Thời gian dự kiến hoàn thành:</label>
                    <input style="border-radius: 10px; border: 1px solid #6787FE; font-weight: bold" type="text"/><span> Ngày</span>
                    <label style="font-weight: bold">Chọn tệp đính kèm</label>
                    <input type="file"/>
                    <div class="d-flex flex-col justify-content-between">
                        <input class="mt-3"
                               style="background-color: #6787FE; padding: 5px 10px 5px 10px; color: white; border-radius: 5px;"
                               type="submit" value="Gửi"/>
                    </div>
                </form>
            </div>

        </aside>
    </div>
</main>

<script>
    function toggleHeart(element) {
        const icon = element.querySelector('i');
        if (icon.classList.contains('far')) {
            // Chuyển sang trái tim đầy màu đỏ
            icon.classList.remove('far');
            icon.classList.add('fas');
            icon.style.color = '#fa0000';
        } else {
            // Chuyển lại trái tim viền
            icon.classList.remove('fas');
            icon.classList.add('far');
            icon.style.color = ''; // Hoặc set lại màu ban đầu nếu có
        }
    }
</script>

</body>
</html>
