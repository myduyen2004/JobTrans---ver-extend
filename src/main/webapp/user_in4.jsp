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
    <link href="css/employee_in4.jsp.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>


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

<%--Main_in4--%>
<main class="container mx-auto" style="margin-top: 230px;">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <section class="col-span-2">
            <h2 class="text-center mb-3" style="font-size: 32px; font-weight: bold;">Các công việc gần đây</h2>
            <div class="space-y-4">
                <div class="bg-white p-4 rounded-lg shadow-md flex items-center justify-between" style="border: solid 2px #6787FE50; border-radius: 15px;" style="width: 860px; height: 135px;">
                    <div class="flex items-center space-x-4">
                        <img alt="Profile picture of the job poster" class="rounded-full" height="80" src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg" width="80"/>
                        <div class="space-y-2" style="width: 480px;">
                            <div>
                                <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">Thiết kế giao diện bán hàng</span>
                                <span style="background-color: #8BF6AD; border-radius: 20px; padding: 5px 10px 5px 10px;">Đã hoàn thành</span>
                            </div>
                            <div class="flex items-center space-x-3">
                                <p>
                                    <i class="fas fa-user"></i>
                                    Công ty A
                                    <i class="fas fa-check-circle" style="color: blue;"></i>
                                </p>
                            </div>
                            <div class="flex items-center space-x-2">
                                <p style="background-color: #8BF6AD; border-radius: 20px; padding: 2px 10px 2px 10px;">
                                    <i class="fas fa-user-check"></i>
                                    Đã kiểm tra
                                </p>

                                <p style="background-color: #8BF6AD; border-radius: 20px; padding: 2px 10px 2px 10px;">
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
                                <span class="text-center mt-4" style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">200000</span>
                                <i class="fas fa-long-arrow-alt-right mt-4"></i>
                                <span class="text-center mt-4" style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">6000000</span>
                            </div>
                            <div class="d-flex space-x-2 ml-3 flex-col items-center">
                                <button class="text-white" style="border: solid 2px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px;">
                                    Chi tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-lg shadow-md flex items-center justify-between" style="border: solid 2px #6787FE50; border-radius: 15px;" style="width: 860px; height: 135px;">
                    <div class="flex items-center space-x-4">
                        <img alt="Profile picture of the job poster" class="rounded-full" height="80" src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg" width="80"/>
                        <div class="space-y-2" style="width: 480px;">
                            <div>
                                <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">Thiết kế giao diện bán hàng</span>
                                <span style="background-color: #8BF6AD; border-radius: 20px; padding: 5px 10px 5px 10px;">Đã hoàn thành</span>
                            </div>
                            <div class="flex items-center space-x-3">
                                <p>
                                    <i class="fas fa-user"></i>
                                    Công ty A
                                    <i class="fas fa-check-circle" style="color: blue;"></i>
                                </p>
                            </div>
                            <div class="flex items-center space-x-2">
                                <p style="background-color: #8BF6AD; border-radius: 20px; padding: 2px 10px 2px 10px;">
                                    <i class="fas fa-user-check"></i>
                                    Đã kiểm tra
                                </p>

                                <p style="background-color: #8BF6AD; border-radius: 20px; padding: 2px 10px 2px 10px;">
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
                                <span class="text-center mt-4" style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">200000</span>
                                <i class="fas fa-long-arrow-alt-right mt-4"></i>
                                <span class="text-center mt-4" style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">6000000</span>
                            </div>
                            <div class="d-flex space-x-2 ml-3 flex-col items-center">
                                <button class="text-white" style="border: solid 2px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px;">
                                    Chi tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-lg shadow-md flex items-center justify-between" style="border: solid 2px #6787FE50; border-radius: 15px;" style="width: 860px; height: 135px;">
                    <div class="flex items-center space-x-4">
                        <img alt="Profile picture of the job poster" class="rounded-full" height="80" src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg" width="80"/>
                        <div class="space-y-2" style="width: 480px;">
                            <div>
                                <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">Thiết kế giao diện bán hàng</span>
                                <span style="background-color: #8BF6AD; border-radius: 20px; padding: 5px 10px 5px 10px;">Đã hoàn thành</span>
                            </div>
                            <div class="flex items-center space-x-3">
                                <p>
                                    <i class="fas fa-user"></i>
                                    Công ty A
                                    <i class="fas fa-check-circle" style="color: blue;"></i>
                                </p>
                            </div>
                            <div class="flex items-center space-x-2">
                                <p style="background-color: #8BF6AD; border-radius: 20px; padding: 2px 10px 2px 10px;">
                                    <i class="fas fa-user-check"></i>
                                    Đã kiểm tra
                                </p>

                                <p style="background-color: #8BF6AD; border-radius: 20px; padding: 2px 10px 2px 10px;">
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
                                <span class="text-center mt-4" style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">200000</span>
                                <i class="fas fa-long-arrow-alt-right mt-4"></i>
                                <span class="text-center mt-4" style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px; ">6000000</span>
                            </div>
                            <div class="d-flex space-x-2 ml-3 flex-col items-center">
                                <button class="text-white" style="border: solid 2px #6787FE; border-radius: 15px; background-color: #6787FE50; padding: 5px 10px 5px 10px;">
                                    Chi tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <h2 class="text-center mb-3 mt-3" style="font-size: 32px; font-weight: bold;">Các đánh giá đã nhận được</h2>

            <div class="bg-white p-4 rounded-lg shadow-md flex items-center justify-between" style="width: 860px; height: 135px; margin-bottom: 10px;">
                <div class="flex items-center space-x-4">
                    <img alt="Profile picture of the job poster" class="rounded-full" height="80" src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg" width="80"/>
                    <div class="space-y-2" style="width: 480px;">
                        <div>
                            <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">Daniel - CEO WEB bán hàng</span>
                        </div>
                        <div class="d-flex align-items-center star">
                                    <span class="text-warning">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </span>
                        </div>
                        <p>I loved the design that was made will come back for more!! you should get your designs for her super great!!!</p>
                    </div>
                </div>
            </div>
            <div class="bg-white p-4 rounded-lg shadow-md flex items-center justify-between" style="width: 860px; height: 135px; margin-bottom: 10px;">
                <div class="flex items-center space-x-4">
                    <img alt="Profile picture of the job poster" class="rounded-full" height="80" src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg" width="80"/>
                    <div class="space-y-2" style="width: 480px;">
                        <div>
                            <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">Daniel - CEO WEB bán hàng</span>
                        </div>
                        <div class="d-flex align-items-center star">
                                    <span class="text-warning">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </span>
                        </div>
                        <p>I loved the design that was made will come back for more!! you should get your designs for her super great!!!</p>
                    </div>
                </div>
            </div>
            <div class="bg-white p-4 rounded-lg shadow-md flex items-center justify-between" style="width: 860px; height: 135px; margin-bottom: 10px;">
                <div class="flex items-center space-x-4">
                    <img alt="Profile picture of the job poster" class="rounded-full" height="80" src="https://storage.googleapis.com/a1aa/image/15zRoNwPlQBZI8UMPXXOJmk3pv1alIU0cs-do2NsH3g.jpg" width="80"/>
                    <div class="space-y-2" style="width: 480px;">
                        <div>
                            <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">Daniel - CEO WEB bán hàng</span>
                        </div>
                        <div class="d-flex align-items-center star">
                                    <span class="text-warning">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </span>
                        </div>
                        <p>I loved the design that was made will come back for more!! you should get your designs for her super great!!!</p>
                    </div>
                </div>
            </div>
        </section>
        <aside class="bg-white rounded-lg shadow-md">
            <div class="p-6 space-y-4 mb-3" style="border: solid 1px #6787FE; border-radius: 15px; background-color: #6787FE40;">
                <h2 class="font-bold mb-4" style="font-size:28px; text-align: center;">
                    Thông tin
                </h2>
                <p style="font-weight: bold; font-size: 40px; text-align: center;">5000000 đ</p>
            </div>
            <div class="p-6 space-y-4" style="border: solid 1px #6787FE; border-radius: 15px;">
                <h2 class="font-bold mb-4" style="font-size:28px;">
                    Thông tin
                </h2>
                <div class="row ml-4">
                    <div class="col-2 d-flex flex-row align-items-center" style="background-color: #6787FE20; text-align: center; font-size: 28px;">
                        <i class="fas fa-layer-group"></i>
                    </div>
                    <div class="col-10">
                        <strong>Chuyên môn</strong>
                        <p>Lập trình</p>
                    </div>
                </div>
                <div class="row ml-4">
                    <div class="col-2 d-flex flex-row align-items-center" style="background-color: #6787FE20; text-align: center; font-size: 28px;">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div class="col-10">
                        <strong>Email</strong>
                        <p>nguyenvana@gmail.com</p>
                    </div>
                </div>
                <div class="row ml-4">
                    <div class="col-2 d-flex flex-row align-items-center" style="background-color: #6787FE20; text-align: center; font-size: 28px;">
                        <i class="fas fa-phone"></i>
                    </div>
                    <div class="col-10">
                        <strong>Điện thoại</strong>
                        <p>0529851322</p>
                    </div>
                </div>
                <div class="row ml-4">
                    <div class="col-2 d-flex flex-row align-items-center" style="background-color: #6787FE20; text-align: center; font-size: 28px;">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <div class="col-10">
                        <strong>Địa chỉ</strong>
                        <p>Đà Nẵng</p>
                    </div>
                </div>
                <div class="row ml-4">
                    <div class="col-2 d-flex flex-row align-items-center" style="background-color: #6787FE20; text-align: center; font-size: 28px;">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <div class="col-10">
                        <strong>Ngày Sinh</strong>
                        <p>20/03/2003</p>
                    </div>
                </div>
                <div class="row ml-4">
                    <div class="col-2 d-flex flex-row align-items-center" style="background-color: #6787FE20; text-align: center; font-size: 28px;">
                        <i class="fas fa-venus-mars"></i>
                    </div>
                    <div class="col-10">
                        <strong>Giới tính</strong>
                        <p>Nam</p>
                    </div>
                </div>
                <div class="row ml-4">
                    <div class="col-2 d-flex flex-row align-items-center" style="background-color: #6787FE20; text-align: center; font-size: 28px;">
                        <i class="fas fa-file"></i>
                    </div>
                    <div class="col-10">
                        <strong>CV</strong>
                        <a href="#"><p>Xem CV>></p></a>
                    </div>
                </div>
            </div>
        </aside>
    </div>
</main>

</body>
</html>
