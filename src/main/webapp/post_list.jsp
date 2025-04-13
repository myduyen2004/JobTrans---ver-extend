<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en-US">

<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large'/>

    <!--new css -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

    <style>
        .banner_title {
            background-image: url(./img/anh1/anh1.png);
            background-size: 100%;
            font-size: 40px;
            height: 200px;
            display: flex;
            align-items: center;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 33px;
            height: 18px;
            margin: 0 10px;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 34px;
        }

        .switch input {
            display: none
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 15px;
            width: 15px;
            left: 1.5px;
            bottom: 1.5px;
            background-color: white;
            transition: .4s;
            border-radius: 50px;
        }

        input:checked + .slider {
            background-color: #6787FE;
        }

        input:checked + .slider:before {
            transform: translateX(15px);
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

<body style="font-family: Inter, serif">
<!-- Tố cáo ngườu dùng -->
<div class="py-4 banner_title">
    <h1 class="text-white font-weight-bold" style="padding-left: 50px;">Danh sách dự án</h1>
</div>

<main class="container mx-auto mt-8 mb-5" style="width: 1400px;">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <section class="col-span-2">
            <div class="space-y-4">
                <div class="post-box bg-white p-4 rounded-lg shadow-md flex items-center justify-between"
                     style="border: solid 2px #6787FE; border-radius: 15px;" style="width: 860px; height: 135px;">
                    <div class="flex items-center space-x-4">
                        <img alt="Profile picture of the job poster" class="rounded-full" height="80"
                             src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg"
                             width="80"/>
                        <div class="space-y-2" style="width: 480px;">
                            <div>
                                <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">Thiết kế giao diện bán hàng</span>
                                <span style="background-color: green; border-radius: 20px; padding: 5px 10px 5px 10px; color: white;">Đã hoàn thành</span>
                            </div>
                            <div class="flex items-center space-x-3">
                                <p>
                                    <i class="fas fa-user"></i>
                                    Công ty A
                                    <i class="fas fa-check-circle" style="color: blue;"></i>
                                </p>
                            </div>
                            <div class="flex items-center space-x-2">
                                <p style="background-color: #6787fe; border-radius: 20px; padding: 2px 10px 2px 10px; color: white;">
                                    <i class="fas fa-user-check"></i>
                                    Đã kiểm tra
                                </p>

                                <p style="background-color: #6787fe; border-radius: 20px; padding: 2px 10px 2px 10px; color: white;">
                                    <i class="fas fa-video"></i>
                                    Đã phỏng vấn
                                </p>
                            </div>
                            <div class="flex items-center space-x-6 text-gray-500">
                                <p><i class="fas fa-list"></i> Thiết kế đồ họa</p>
                                <p><i class="fas fa-calendar-alt"></i> 10-01-2025</p>
                                <p><i class="fas fa-tag"></i> Thiết kế web</p>
                                <p><i class="fas fa-users"></i> 1</p>
                            </div>
                        </div>
                        <div class="text-center space-y-4" style="margin: 0;">
                            <div style="border: solid 1px #6787FE; border-radius: 15px; height: 60px; width: 200px;">
                                <span class="text-center mt-4"
                                      style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">200000</span>
                                <i class="fas fa-long-arrow-alt-right mt-4"></i>
                                <span class="text-center mt-4"
                                      style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">6000000</span>
                            </div>
                            <div class="d-flex space-x-2 ml-3">
                                <button class="text-white"
                                        style="border-radius: 30px; background-color: #6787FE; padding: 5px 10px 5px 10px;">
                                    Chi tiết
                                </button>
                                <button class="text-white"
                                        style="border-radius: 30px; background-color: #6787FE; padding: 5px 10px 5px 10px;">
                                    Chào giá
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="post-box bg-white p-4 rounded-lg shadow-md flex items-center justify-between"
                     style="border: solid 2px #6787FE; border-radius: 15px;" style="width: 860px; height: 135px;">
                    <div class="flex items-center space-x-4">
                        <img alt="Profile picture of the job poster" class="rounded-full" height="80"
                             src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg"
                             width="80"/>
                        <div class="space-y-2" style="width: 480px;">
                            <div>
                                <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">Thiết kế giao diện bán hàng</span>
                                <span style="background-color: green; border-radius: 20px; padding: 5px 10px 5px 10px; color: white;">Đã hoàn thành</span>
                            </div>
                            <div class="flex items-center space-x-3">
                                <p>
                                    <i class="fas fa-user"></i>
                                    Công ty A
                                    <i class="fas fa-check-circle" style="color: blue;"></i>
                                </p>
                            </div>
                            <div class="flex items-center space-x-2">
                                <p style="background-color: #6787fe; border-radius: 20px; padding: 2px 10px 2px 10px; color: white;">
                                    <i class="fas fa-user-check"></i>
                                    Đã kiểm tra
                                </p>

                                <p style="background-color: #6787fe; border-radius: 20px; padding: 2px 10px 2px 10px; color: white;">
                                    <i class="fas fa-video"></i>
                                    Đã phỏng vấn
                                </p>
                            </div>
                            <div class="flex items-center space-x-6 text-gray-500">
                                <p><i class="fas fa-list"></i> Thiết kế đồ họa</p>
                                <p><i class="fas fa-calendar-alt"></i> 10-01-2025</p>
                                <p><i class="fas fa-tag"></i> Thiết kế web</p>
                                <p><i class="fas fa-users"></i> 1</p>
                            </div>
                        </div>
                        <div class="text-center space-y-4" style="margin: 0;">
                            <div style="border: solid 1px #6787FE; border-radius: 15px; height: 60px; width: 200px;">
                                <span class="text-center mt-4"
                                      style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">200000</span>
                                <i class="fas fa-long-arrow-alt-right mt-4"></i>
                                <span class="text-center mt-4"
                                      style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">6000000</span>
                            </div>
                            <div class="d-flex space-x-2 ml-3">
                                <button class="text-white"
                                        style="border-radius: 30px; background-color: #6787FE; padding: 5px 10px 5px 10px;">
                                    Chi tiết
                                </button>
                                <button class="text-white"
                                        style="border-radius: 30px; background-color: #6787FE; padding: 5px 10px 5px 10px;">
                                    Chào giá
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="post-box bg-white p-4 rounded-lg shadow-md flex items-center justify-between"
                     style="border: solid 2px #6787FE; border-radius: 15px;" style="width: 860px; height: 135px;">
                    <div class="flex items-center space-x-4">
                        <img alt="Profile picture of the job poster" class="rounded-full" height="80"
                             src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg"
                             width="80"/>
                        <div class="space-y-2" style="width: 480px;">
                            <div>
                                <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">Thiết kế giao diện bán hàng</span>
                                <span style="background-color: green; border-radius: 20px; padding: 5px 10px 5px 10px; color: white;">Đã hoàn thành</span>
                            </div>
                            <div class="flex items-center space-x-3">
                                <p>
                                    <i class="fas fa-user"></i>
                                    Công ty A
                                    <i class="fas fa-check-circle" style="color: blue;"></i>
                                </p>
                            </div>
                            <div class="flex items-center space-x-2">
                                <p style="background-color: #6787fe; border-radius: 20px; padding: 2px 10px 2px 10px; color: white;">
                                    <i class="fas fa-user-check"></i>
                                    Đã kiểm tra
                                </p>

                                <p style="background-color: #6787fe; border-radius: 20px; padding: 2px 10px 2px 10px; color: white;">
                                    <i class="fas fa-video"></i>
                                    Đã phỏng vấn
                                </p>
                            </div>
                            <div class="flex items-center space-x-6 text-gray-500">
                                <p><i class="fas fa-list"></i> Thiết kế đồ họa</p>
                                <p><i class="fas fa-calendar-alt"></i> 10-01-2025</p>
                                <p><i class="fas fa-tag"></i> Thiết kế web</p>
                                <p><i class="fas fa-users"></i> 1</p>
                            </div>
                        </div>
                        <div class="text-center space-y-4" style="margin: 0;">
                            <div style="border: solid 1px #6787FE; border-radius: 15px; height: 60px; width: 200px;">
                                <span class="text-center mt-4"
                                      style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">200000</span>
                                <i class="fas fa-long-arrow-alt-right mt-4"></i>
                                <span class="text-center mt-4"
                                      style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">6000000</span>
                            </div>
                            <div class="d-flex space-x-2 ml-3">
                                <button class="text-white"
                                        style="border-radius: 30px; background-color: #6787FE; padding: 5px 10px 5px 10px;">
                                    Chi tiết
                                </button>
                                <button class="text-white"
                                        style="border-radius: 30px; background-color: #6787FE; padding: 5px 10px 5px 10px;">
                                    Chào giá
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <aside>
            <div class="bg-white p-6 rounded-lg shadow-md" style="border: solid 1px #6787FE; border-radius: 15px;">
                <h2 class="text-xl font-bold mb-4">
                    <i class="fas fa-filter"></i>
                    Lọc
                </h2>
                <div class="mb-4">
                    <h3 class="font-semibold mb-2">
                        Category
                    </h3>
                    <ul>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="chuyen_nganh" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Bien dich</span>
                        </li>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="chuyen_nganh" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Bien dich</span>
                        </li>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="chuyen_nganh" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Bien dich</span>
                        </li>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="chuyen_nganh" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Bien dich</span>
                        </li>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="chuyen_nganh" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Bien dich</span>
                        </li>
                    </ul>
                </div>
                <div class="mb-4">
                    <h3 class="font-semibold mb-2">
                        Thành viên
                    </h3>
                    <ul>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="thanh_vien" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Cá nhân</span>
                        </li>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="thanh_vien" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Nhóm</span>
                        </li>
                    </ul>
                </div>
                <div class="mb-4">
                    <h3 class="font-semibold mb-2">
                        Số tiền
                    </h3>
                    <div class="flex flex-col items-center">
                        <input max="10000" min="0" type="range" class="w-72"/>
                        <div class="flex justify-between w-72">
                            <span class="text-center"
                                  style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">2000</span>
                            <span class="text-center"
                                  style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">6000</span>
                        </div>
                    </div>
                </div>
                <div class="mb-4">
                    <h3 class="font-semibold mb-2">
                        Kỹ Năng
                    </h3>
                    <ul>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="chuyen_nganh" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Bien dich</span>
                        </li>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="chuyen_nganh" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Bien dich</span>
                        </li>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="chuyen_nganh" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Bien dich</span>
                        </li>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="chuyen_nganh" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Bien dich</span>
                        </li>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="chuyen_nganh" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Bien dich</span>
                        </li>
                    </ul>
                </div>
            </div>
        </aside>
    </div>
</main>
</body>
</html>
