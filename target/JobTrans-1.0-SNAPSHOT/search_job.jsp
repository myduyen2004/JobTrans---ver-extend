<%--
    Document   : search_job
    Created on : Mar 12, 2025, 11:13:46 AM
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
    <link href="css/search_job.css" rel="stylesheet">
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
    <h1 class="text-white font-weight-bold" style="padding-left: 50px;">Home -> Danh sách công việc</h1>
</div>

<main class="container mx-auto mt-8 mb-5">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <aside class="bg-white p-6 rounded-lg shadow-md" style="border: solid 1px #6787FE; border-radius: 15px;">
            <h2 class="text-xl font-bold mb-4">
                Đặc điểm công việc
            </h2>
            <div class="mb-4">
                <h3 class="font-semibold mb-2">
                    Chuyên ngành
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
                        <span class="text-center" style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px;  ">2000</span>
                        <span class="text-center" style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px;  ">6000</span>
                    </div>
                </div>
            </div>
            <div >
                <h3 class="font-semibold mb-2">
                    Địa điểm
                </h3>
                <div class="flex flex-col items-center">
                    <select class="form-select" style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; width: 250px; height: 50px;">
                        <option>
                            Địa điểm
                        </option>
                    </select>
                </div>
            </div>
        </aside>
        <section class="col-span-2">
            <div class="space-y-4">
                <div class="bg-white p-4 rounded-lg shadow-md flex items-center justify-between" style="border: solid 2px #6787FE50; border-radius: 15px;">
                    <div class="flex items-center space-x-4">
                        <img alt="Profile picture of the job poster" class="rounded-full" height="80" src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg" width="80"/>
                        <div>
                            <h3 class="font-semibold mb-3">
                                Viết nội dung Tiếng Anh
                            </h3>
                            <div class="flex items-center space-x-2 text-gray-500">
                                <i class="fas fa-user">
                                </i>

                                <i class="fas fa-users">
                                </i>
                            </div>
                        </div>
                    </div>
                    <div class="text-right">
                                <span class="text-lg font-bold mr-3">
                                    300.00 $
                                </span>
                        <button class="text-white px-4 py-2" style="border: solid 2px #6787FE; border-radius: 15px; background-color: #6787FE">
                            Detail
                        </button>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-lg shadow-md flex items-center justify-between" style="border: solid 2px #6787FE50; border-radius: 15px;">
                    <div class="flex items-center space-x-4">
                        <img alt="Profile picture of the job poster" class="rounded-full" height="80" src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg" width="80"/>
                        <div>
                            <h3 class="font-semibold mb-3">
                                Viết nội dung Tiếng Anh
                            </h3>
                            <div class="flex items-center space-x-2 text-gray-500">
                                <i class="fas fa-user">
                                </i>

                                <i class="fas fa-users">
                                </i>
                            </div>
                        </div>
                    </div>
                    <div class="text-right">
                                <span class="text-lg font-bold mr-3">
                                    300.00 $
                                </span>
                        <button class="text-white px-4 py-2" style="border: solid 2px #6787FE; border-radius: 15px; background-color: #6787FE">
                            Detail
                        </button>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-lg shadow-md flex items-center justify-between" style="border: solid 2px #6787FE50; border-radius: 15px;">
                    <div class="flex items-center space-x-4">
                        <img alt="Profile picture of the job poster" class="rounded-full" height="80" src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg" width="80"/>
                        <div>
                            <h3 class="font-semibold mb-3">
                                Viết nội dung Tiếng Anh
                            </h3>
                            <div class="flex items-center space-x-2 text-gray-500">
                                <i class="fas fa-user">
                                </i>

                                <i class="fas fa-users">
                                </i>
                            </div>
                        </div>
                    </div>
                    <div class="text-right">
                                <span class="text-lg font-bold mr-3">
                                    300.00 $
                                </span>
                        <button class="text-white px-4 py-2" style="border: solid 2px #6787FE; border-radius: 15px; background-color: #6787FE">
                            Detail
                        </button>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-lg shadow-md flex items-center justify-between" style="border: solid 2px #6787FE50; border-radius: 15px;">
                    <div class="flex items-center space-x-4">
                        <img alt="Profile picture of the job poster" class="rounded-full" height="80" src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg" width="80"/>
                        <div>
                            <h3 class="font-semibold mb-3">
                                Viết nội dung Tiếng Anh
                            </h3>
                            <div class="flex items-center space-x-2 text-gray-500">
                                <i class="fas fa-user">
                                </i>

                                <i class="fas fa-users">
                                </i>
                            </div>
                        </div>
                    </div>
                    <div class="text-right">
                                <span class="text-lg font-bold mr-3">
                                    300.00 $
                                </span>
                        <button class="text-white px-4 py-2" style="border: solid 2px #6787FE; border-radius: 15px; background-color: #6787FE">
                            Detail
                        </button>
                    </div>
                </div>
            </div>
        </section>
    </div>
</main>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

<%@include file="includes/footer.jsp"%>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
</body>
</html>
