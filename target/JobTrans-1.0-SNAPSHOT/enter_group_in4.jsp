<%--
    Document   : enter_user_in4
    Created on : Mar 13, 2025, 8:19:45 AM
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
    <link href="css/enter_group_in4.css" rel="stylesheet">
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
<%@include file="includes/header-login-01.jsp"%>

<!--banner-->
<div class="py-4 banner_title" style="position: relative">
</div>

<!<!-- Account in4 -->
<div class="d-flex flex-col items-center account_card">
    <div class="row d-flex flex-row align-content-center" style="width: 1222px; height: 298px; border: solid 2px #6787FE; border-radius: 30px;">
        <div class="col-3 d-flex flex-col items-center flex-row align-content-center">
            <img style="border: solid 1px black; border-radius: 25px; margin-left: 25px;" src="https://storage.googleapis.com/a1aa/image/NPYlNKmC-VJSl10UxySKpVC70bL9VoeCVAcVGTivweE.jpg" width="225" height="225" alt="Group_Avatar"/>
        </div>
        <div class="col-6 space-y-4" >
            <h2 style="font-size: 28px; font-weight: bold;">TEAM ACCOUNT 1 <i class="fas fa-check-circle text-blue-500"></i></h2>
            <button class="ml-auto px-4 py-2" style="background-color: #6787FE50; border: solid 1px #6787FE; border-radius: 20px; color: #6787FE;">
                <i class="fas fa-user-plus"></i>
                Follow
            </button>
            <p style="font-size: 19px; font-weight: bold;">
                Web Design Team
            </p>
            <p style="font-size: 19px;">
                Member since Jan 2025
            </p>
            <div class="flex space-x-5 mt-2">
                <div style="background-color: #6787FE50; border: solid 1px #6787FE; border-radius: 20px; color: #6787FE;">
                            <span style="color: #6787FE; margin: 15px;">
                                <i class="fas fa-map-marker-alt"></i>
                                Đà Nẵng
                            </span>
                </div>
                <div style="background-color: #6787FE50; border: solid 1px #6787FE; border-radius: 20px; color: #6787FE;">
                            <span style="color: #6787FE; margin: 15px;">
                                <i class="fas fa-users"></i>
                                2
                            </span>
                </div>
                <div style="background-color: #6787FE50; border: solid 1px #6787FE; border-radius: 20px; color: #6787FE;">
                            <span style="color: #6787FE; margin: 15px;">
                                <i class="fas fa-tag"></i>
                                Graphical Design
                            </span>
                </div>
            </div>
        </div>
        <div class="col-3 space-y-5 px-4">
            <div class="row flex flex-row align-content-center" style="background-color: #6787FE50; border-radius: 20px; height: 58px;">
                <div class="col-10">Proposal:</div>
                <div class="col-2">0</div>
            </div>
            <div class="row flex flex-row align-content-center" style="background-color: #6787FE50; border-radius: 20px; height: 58px;">
                <div class="col-10">Ongoing Project:</div>
                <div class="col-2">1</div>
            </div>
            <div class="row flex flex-row align-content-center" style="background-color: #6787FE50; border-radius: 20px; height: 58px;">
                <div class="col-10">Completed Project:</div>
                <div class="col-2">0</div>
            </div>
        </div>
    </div>
</div>

<!<!-- Enter in4 -->
<div class="bg-white rounded-lg shadow-lg p-6 mt-6" style="width: 1222px; margin: 120px auto;">
    <h2 class="text-xl font-bold text-blue-900 mb-4">
        THÔNG TIN THÀNH VIÊN
    </h2>
    <div class="flex space-x-4 mb-4">
        <button id="leaderBtn" class="bt px-4 py-2 leader-active">
            <i class="fas fa-user"></i>
            Leader
        </button>
        <button class="bt px-4 py-2 member-active member-btn">
            <i class="fas fa-user"></i>
            Member 1
        </button>
        <button class="bt px-4 py-2 member-active member-btn">
            <i class="fas fa-user"></i>
            Member 2
        </button>
        <button class="bt px-4 py-2 member-active member-btn">
            <i class="fas fa-user"></i>
            Member 3
        </button>
    </div>
    <form class="d-flex flex-col justify-content-center">
        <div style="border: solid 2px #6787FE; border-radius: 15px;" class="d-flex flex-col justify-content-center">
            <div class="grid grid-cols-1 gap-4" style="padding: 20px;">
                <div>
                    <label class="block text-gray-700">
                        Họ &amp; Tên:
                    </label>
                    <input class="w-full border border-blue-300 rounded-lg p-2" type="text" value="Nguyễn Văn A"/>
                </div>
                <div>
                    <label class="block text-gray-700">
                        Ngày sinh:
                    </label>
                    <input class="w-full border border-blue-300 rounded-lg p-2" type="text" value="20-08-2003"/>
                </div>
                <div>
                    <label class="block text-gray-700">
                        Giới tính:
                    </label>
                    <div class="flex items-center space-x-4">
                        <label class="flex items-center">
                            <input checked="" class="form-radio text-blue-500" name="gender" type="radio"/>
                            <span class="ml-2">
                                        Nam
                                    </span>
                        </label>
                        <label class="flex items-center">
                            <input class="form-radio text-blue-500" name="gender" type="radio"/>
                            <span class="ml-2">
                                        Nữ
                                    </span>
                        </label>
                    </div>
                </div>
                <div>
                    <label class="block text-gray-700">
                        Năm kinh nghiệm:
                    </label>
                    <input class="w-full border border-blue-300 rounded-lg p-2" type="text" value="5"/>
                </div>
                <div>
                    <label class="block text-gray-700">
                        Học Vấn:
                    </label>
                    <input class="w-full border border-blue-300 rounded-lg p-2" type="text" value="Cử nhân - Đại học FPT"/>
                </div>
                <div>
                    <label class="block text-gray-700">
                        Giới thiệu chung:
                    </label>
                    <input class="w-full border border-blue-300 rounded-lg p-2" type="text"/>
                </div>
                <div>
                    <label class="block text-gray-700">
                        Chuyên môn:
                    </label>
                    <input class="w-full border border-blue-300 rounded-lg p-2" type="text"/>
                </div>
            </div>
        </div>
        <button class="text-white px-4 py-2" type="submit" style="margin:10px auto; border: solid 2px #6787FE; border-radius: 15px;">
            <i class="fas fa-edit"></i>
            Cập nhật
        </button>
    </form>
</div>

<%--Footer--%>
<%@include file="includes/footer.jsp"%>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
<%--JS--%>
<script>
    const buttons = document.querySelectorAll('.bt');

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            // Xóa class leader-active khỏi tất cả các nút
            buttons.forEach(btn => btn.classList.remove('leader-active'));
            buttons.forEach(btn => btn.classList.add('member-active'));

            // Thêm class leader-active cho nút được nhấn
            button.classList.add('leader-active');
            button.classList.remove('member-active');
        });
    });
</script>
</body>
</html>
