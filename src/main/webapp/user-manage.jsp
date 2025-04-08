<%--
    Document   : post_list
    Created on : Mar 13, 2025, 10:45:02 AM
    Author     : ADM
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/ by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:30:18 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--<link rel="profile" href="https://gmpg.org/xfn/11">-->

    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large'/>

    <!--new css -->
    <script src="https://cdn.tailwindcss.com"></script>
    <%--    <link href="css/post_list.css" rel="stylesheet">--%>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

    <style>
        .banner_title {
            background-image: url(./wp-content/uploads/2021/09/breadcrumb-bg.jpg);
            background-size: 100%;
            font-family: 'Poppins', sans-serif;
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
    </style>
</head>

<body>
<%@include file="includes/header-01.jsp" %>

<div class="py-4 banner_title">
    <h1 class="text-white font-weight-bold" style="padding-left: 50px;">Danh sách người dùng</h1>
</div>

<main class="container mx-auto mt-8 mb-5" style="width: 1400px;">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
        <section class="col-span-3">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="search-result col-xl-12">
                        <h4 class="text-center">Danh sách người dùng</h4>
                        <c:forEach items="${list}" var="o" varStatus="status">
                            <div class="prolancer-seller-item style-2"
                                 data-type="${o.type == 'Cá nhân' ? 'canhan' : 'nhom'}"
                                 data-status="${o.status == 'Đang hoạt động' ? 'active' : 'banned'}">
                                <div class="row">
                                    <div class="col-3 my-auto">
                                        <a class="d-flex flex-row justify-content-center"
                                           href="acc-manage?action=viewAccountDetails&accId=${o.accountId}">
                                            <img src="${o.avatar}"
                                                 alt="User_avatar"
                                                 style="width: 50%; height: auto; border-radius: 50%; object-fit: cover;"/>
                                        </a>
                                    </div>
                                    <div class="col-6 my-auto">
                                        <div class="seller-content">
                                            <h4 class="mb-2 d-flex align-items-center">
                                                <a href="#" style="color: black">${o.accountName}</a>
                                                <c:if test="${o.verifiedAccount}">
                                                    <i class="fas fa-check-circle verified text-primary ms-2"
                                                       title="Verified"></i>
                                                </c:if>
                                            </h4>
                                            <div class="flex items-center gap-2">
                                                <h5 style="margin: 0">${o.specialist}</h5>
                                                <c:choose>
                                                    <c:when test="${o.status == 'Đang hoạt động'}">
                                                        <span class="custom-badge green">${o.status}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="custom-badge danger">${o.status}</span> <!-- fallback nếu có giá trị khác -->
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <ul class="list-inline mb-lg-0 mt-2">
                                                <li class="list-inline-item mb-2"><i
                                                        class="fad fa-users-medical"></i>${o.type}
                                                </li>
                                                <li class="list-inline-item"><i
                                                        class="fas fa-map-marked-alt"></i>${o.address}
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-3 text-center d-flex flex-column justify-content-center">
                                        <div class="mx-auto mb-2">
                                            <p style="font-weight: bold;">Điểm: ${o.point}</p>
                                        </div>
                                        <a style="font-size: 15px; background-color: #6787FE; border-radius: 30px; color: white; padding: 10px;"
                                           href="acc-manage?action=viewAccountDetails&accId=${o.accountId}">
                                            Xem chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
<%--            Paging--%>
<%--            <div class="mt-4 d-flex justify-content-center">--%>
<%--                <nav>--%>
<%--                    <ul class="pagination">--%>
<%--                        <c:if test="${currentPage > 1}">--%>
<%--                            <li class="page-item">--%>
<%--                                <a class="page-link" href="?page=${currentPage - 1}">Trang trước</a>--%>
<%--                            </li>--%>
<%--                        </c:if>--%>
<%--                        <c:forEach begin="1" end="${totalPages}" var="i">--%>
<%--                            <li class="page-item ${i == currentPage ? 'active' : ''}">--%>
<%--                                <a class="page-link" href="?page=${i}">${i}</a>--%>
<%--                            </li>--%>
<%--                        </c:forEach>--%>
<%--                        <c:if test="${currentPage < totalPages}">--%>
<%--                            <li class="page-item">--%>
<%--                                <a class="page-link" href="?page=${currentPage + 1}">Trang sau</a>--%>
<%--                            </li>--%>
<%--                        </c:if>--%>
<%--                    </ul>--%>
<%--                </nav>--%>
<%--            </div>--%>
        </section>
        <aside>
            <div class="bg-white p-6 rounded-lg shadow-md" style="border: solid 1px #6787FE; border-radius: 15px;">
                <h2 class="text-xl font-bold mb-4">
                    Phân loại
                </h2>
                <div class="mb-4">
                    <h4 class="font-semibold mb-2">
                        Thành viên
                    </h4>
                    <ul>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="thanh_vien" id="filterCanhan" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Cá nhân</span>
                        </li>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="thanh_vien" id="filterNhom" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Nhóm dự án</span>
                        </li>
                    </ul>
                </div>
                <div class="mb-4">
                    <h4 class="font-semibold mb-2">
                        Trạng thái
                    </h4>
                    <ul>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="active" id="filterActive" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Đang hoạt động</span>
                        </li>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="banned" id="filterBanned" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Bị Chặn</span>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-md mt-2" style="border: solid 1px #6787FE; border-radius: 15px;">
                <h2 class="text-xl font-bold mb-4">
                    Sắp xếp
                </h2>
                <div class="">
                    <h4 class="font-semibold mb-2">
                        Thành viên
                    </h4>
                    <ul>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="A_Z" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">A ↓ Z</span>
                        </li>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="Z_A" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Z ↓ A</span>
                        </li>
                        <li class="mb-2">
                            <label class="switch">
                                <input class="" name="point" type="checkbox"/>
                                <span class="slider">
                                    </span>
                            </label>
                            <span class="ml-2">Điểm số</span>
                        </li>
                    </ul>
                </div>
            </div>
        </aside>
    </div>
</main>

<%@include file="includes/footer.jsp" %>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const checkboxes = {
            canhan: document.getElementById('filterCanhan'),
            nhom: document.getElementById('filterNhom'),
            active: document.getElementById('filterActive'),
            banned: document.getElementById('filterBanned')
        };

        const items = document.querySelectorAll('.prolancer-seller-item');

        function filterList() {
            const selectedTypes = [];
            const selectedStatuses = [];

            if (checkboxes.canhan.checked) selectedTypes.push('canhan');
            if (checkboxes.nhom.checked) selectedTypes.push('nhom');

            if (checkboxes.active.checked) selectedStatuses.push('active');
            if (checkboxes.banned.checked) selectedStatuses.push('banned');

            items.forEach(item => {
                const type = item.dataset.type;
                const status = item.dataset.status;

                const matchType = selectedTypes.length === 0 || selectedTypes.includes(type);
                const matchStatus = selectedStatuses.length === 0 || selectedStatuses.includes(status);

                if (matchType && matchStatus) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        }

        // Gắn sự kiện cho tất cả checkbox
        Object.values(checkboxes).forEach(cb => cb.addEventListener('change', filterList));

        // Lọc lần đầu nếu muốn
        filterList();
    });
</script>

</body>
</html>
