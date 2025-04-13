<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Danh sách công việc đã đăng &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large'/>
    <link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
    <style>
        .banner_title {
            background-image: url(./img/anh1/anh1.png);
            background-size: 100%;
            font-size: 40px;
            height: 200px;
            display: flex;
            align-items: center;
        }

        .post-box {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .post-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        .page_item{
            background-color: #fff;
            color: #000;
        }
        .page_item:hover {
            background-color: #6787FE;
            color: #fff;
        }
    </style>
</head>

<body style="font-family: Inter, sans-serif">
<div class="py-4 banner_title">
    <h1 class="text-white font-weight-bold" style="padding-left: 50px;">Danh sách công việc</h1>
</div>
<section class="section-padding">
    <div class="row mt-4 mb-4">
        <div class="col-8"></div>
        <div class="row col-4 px-4">
            <input class="col-4 mr-4"
                   style="color: white; background-color: red; border-radius: 15px; padding: 5px 10px 5px 10px; width: 100px"
                   type="button" value="Hết hạn"/>
            <input class="col-4"
                   style="color: white; background-color: #0F1B63; border-radius: 15px; padding: 5px 10px 5px 10px; width: 120px"
                   type="button" value="Đang tuyển"/>
            <div class="col-4 dropdown">
                <button class="btn btn-light dropdown-toggle w-100" type="button" id="sortDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border-radius: 15px;">
                    Sắp xếp <i class="fas fa-filter"></i>
                </button>
                <div class="dropdown-menu mt-2" aria-labelledby="sortDropdown">
                    <a class="dropdown-item" href="#">Mới nhất</a>
                    <a class="dropdown-item" href="#">A - Z</a>
                    <a class="dropdown-item" href="#">Z - A</a>
                    <a class="dropdown-item" href="#">Lương tăng dần</a>
                    <a class="dropdown-item" href="#">Lương giảm dần</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container mb-4">
        <div class="row justify-content-center ">
            <div class="search-result col-lg-8 space-y-4">
                <div class="post-box bg-white rounded-lg shadow-md items-center justify-between"
                     style="border-radius: 30px; border: 2px solid #6787FE50">
                    <p style="background-color: #6787FE50; width: 120px; padding: 5px 10px 5px 10px; border-bottom-right-radius: 15px;">
                        5 Chào giá <i class="fas fa-bolt"></i></p>
                    <div class="row m-3">
                        <div class="col-md-9 my-auto">
                            <a class="project-title" href="#"><h3 style="font-size: 20px; font-weight: 400;">Swift /
                                SwiftUI Developer for B2B iOS apps</h3></a>
                            <ul class="list-inline" style="color: darkgray">
                                <li class="list-inline-item"><i class="fas fa-clock"></i></li>
                                Hạn tuyển: 15- 03 -2024
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <h2 style="text-align: center;">
                                <span class="woocommerce-Price-amount amount">
                                    <bdi>
                                        <span class="woocommerce-Price-currencySymbol">&#36;</span>10 Triệu - 15 Triệu
                                    </bdi>
                                </span>
                            </h2>
                            <div class="d-flex flex-row justify-content-center">
                                <button class="text-white mt-3" style="border-radius: 30px; background-color: #6787FE; padding: 5px 10px 5px 10px;">
                                    Chi tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="post-box bg-white rounded-lg shadow-md items-center justify-between"
                     style="border-radius: 30px; border: 2px solid #6787FE50">
                    <p style="background-color: #6787FE50; width: 120px; padding: 5px 10px 5px 10px; border-bottom-right-radius: 15px;">
                        5 Chào giá <i class="fas fa-bolt"></i></p>
                    <div class="row m-3">
                        <div class="col-md-9 my-auto">
                            <a class="project-title" href="#"><h3 style="font-size: 20px; font-weight: 400;">Swift /
                                SwiftUI Developer for B2B iOS apps</h3></a>
                            <ul class="list-inline" style="color: darkgray">
                                <li class="list-inline-item"><i class="fas fa-clock"></i></li>
                                Hạn tuyển: 15- 03 -2024
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <h2 style="text-align: center;">
                                <span class="woocommerce-Price-amount amount">
                                    <bdi>
                                        <span class="woocommerce-Price-currencySymbol">&#36;</span>10 Triệu - 15 Triệu
                                    </bdi>
                                </span>
                            </h2>
                            <div class="d-flex flex-row justify-content-center">
                                <button class="text-white mt-3" style="border-radius: 30px; background-color: #6787FE; padding: 5px 10px 5px 10px;">
                                    Chi tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="post-box bg-white rounded-lg shadow-md items-center justify-between"
                     style="border-radius: 30px; border: 2px solid #6787FE50">
                    <p style="background-color: #6787FE50; width: 120px; padding: 5px 10px 5px 10px; border-bottom-right-radius: 15px;">
                        5 Chào giá <i class="fas fa-bolt"></i></p>
                    <div class="row m-3">
                        <div class="col-md-9 my-auto">
                            <a class="project-title" href="#"><h3 style="font-size: 20px; font-weight: 400;">Swift /
                                SwiftUI Developer for B2B iOS apps</h3></a>
                            <ul class="list-inline" style="color: darkgray">
                                <li class="list-inline-item"><i class="fas fa-clock"></i></li>
                                Hạn tuyển: 15- 03 -2024
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <h2 style="text-align: center;">
                                <span class="woocommerce-Price-amount amount">
                                    <bdi>
                                        <span class="woocommerce-Price-currencySymbol">&#36;</span>10 Triệu - 15 Triệu
                                    </bdi>
                                </span>
                            </h2>
                            <div class="d-flex flex-row justify-content-center">
                                <button class="text-white mt-3" style="border-radius: 30px; background-color: #6787FE; padding: 5px 10px 5px 10px;">
                                    Chi tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="post-box bg-white rounded-lg shadow-md items-center justify-between"
                     style="border-radius: 30px; border: 2px solid #6787FE50">
                    <p style="background-color: #6787FE50; width: 120px; padding: 5px 10px 5px 10px; border-bottom-right-radius: 15px;">
                        5 Chào giá <i class="fas fa-bolt"></i></p>
                    <div class="row m-3">
                        <div class="col-md-9 my-auto">
                            <a class="project-title" href="#"><h3 style="font-size: 20px; font-weight: 400;">Swift /
                                SwiftUI Developer for B2B iOS apps</h3></a>
                            <ul class="list-inline" style="color: darkgray">
                                <li class="list-inline-item"><i class="fas fa-clock"></i></li>
                                Hạn tuyển: 15- 03 -2024
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <h2 style="text-align: center;">
                                <span class="woocommerce-Price-amount amount">
                                    <bdi>
                                        <span class="woocommerce-Price-currencySymbol">&#36;</span>10 Triệu - 15 Triệu
                                    </bdi>
                                </span>
                            </h2>
                            <div class="d-flex flex-row justify-content-center">
                                <button class="text-white mt-3" style="border-radius: 30px; background-color: #6787FE; padding: 5px 10px 5px 10px;">
                                    Chi tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="pagination" class="mt-4 d-flex justify-content-center">
                <div class="mt-4 d-flex justify-content-center">
                    <nav>
                        <ul class="pagination">
<%--                            <c:if test="${currentPage > 1}">--%>
<%--                                <li class="page-item">--%>
<%--                                    <a class="page-link" href="?page=${currentPage - 1}">Trang trước</a>--%>
<%--                                </li>--%>
<%--                            </c:if>--%>
<%--                            <c:forEach begin="1" end="${totalPages}" var="i">--%>
<%--                                <li class="page-item ${i == currentPage ? 'active' : ''}">--%>
<%--                                    <a class="page-link" href="?page=${i}">${i}</a>--%>
<%--                                </li>--%>
<%--                            </c:forEach>--%>
<%--                            <c:if test="${currentPage < totalPages}">--%>
<%--                                <li class="page-item">--%>
<%--                                    <a class="page-link" href="?page=${currentPage + 1}">Trang sau</a>--%>
<%--                                </li>--%>
<%--                            </c:if>--%>
                            <li class="page_item mx-1 px-3 py-1 border rounded">Trang Trước</li>
                            <li class="page_item mx-1 px-3 py-1 border rounded">1</li>
                            <li class="page_item mx-1 px-3 py-1 border rounded">2</li>
                            <li class="page_item mx-1 px-3 py-1 border rounded">3</li>
                            <li class="page_item mx-1 px-3 py-1 border rounded">4</li>
                            <li class="page_item mx-1 px-3 py-1 border rounded">Trang sau</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
