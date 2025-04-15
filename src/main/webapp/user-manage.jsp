<%--
    Document   : post_list
    Created on : Mar 13, 2025, 10:45:02 AM
    Author     : ADM
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="./css/user-manage.css" rel="stylesheet"/>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>

<body style="font-family: Inter,sans-serif;">
<%--<%@include file="includes/header-01.jsp" %>--%>

<div class="py-4 banner_title">
    <h1 class="text-white font-weight-bold" style="padding-left: 50px;">Danh sách người dùng</h1>
</div>

<main class="container mx-auto mt-8 mb-5" style="width: 1400px;">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
        <section class="col-span-3">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-12">
                        <p class="text-center" style="font-size: 32px; font-weight: bold">Danh sách người dùng</p>
                        <div id="account-list">
                            <c:forEach items="${list}" var="o" varStatus="status">
                                <div class="post-box account_in4 mt-3 mb-3 p-3 rounded"
                                     data-type="${o.type == 'Cá nhân' ? 'canhan' : 'nhom'}"
                                     data-status="${o.status == 'Đang hoạt động' ? 'active' : 'banned'}" style="background-color: #6787FE10; border-radius: 30px;">
                                    <div class="row">
                                        <div class="col-2">
                                            <a class="d-flex flex-row justify-content-center"
                                               href="acc-manage?action=viewAccountDetails&accId=${o.accountId}">
                                                <img src="${o.avatar}"
                                                     alt="User_avatar"
                                                     style="width: 80%; height: auto; border-radius: 50%; object-fit: cover;"/>
                                            </a>
                                        </div>
                                        <div class="col-7">
                                            <div class="seller-content">
                                                <h4 class="mb-2 d-flex align-items-center" style="font-weight: bold; font-size: 24px;">
                                                    <a href="#" style="color: black; text-decoration: none;" class="name_value">${o.accountName}</a>
                                                    <c:if test="${o.verifiedAccount}">
                                                        <i class="fas fa-check-circle verified text-primary ms-2"
                                                           title="Verified"></i>
                                                    </c:if>
                                                </h4>
                                                <div class="flex items-center gap-2">
                                                    <p style="margin: 0; font-size: 18px;">${o.specialist}</p>
                                                    <c:choose>
                                                        <c:when test="${o.status == 'Đang hoạt động'}">
                                                            <span style="border: solid 2px limegreen; border-radius: 5px; color: limegreen; padding: 5px 10px 5px 10px">
                                                                    ${o.status}
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span style="border: solid 2px #FF0000; border-radius: 5px; color: red; padding: 5px 10px 5px 10px">${o.status}</span> <!-- fallback nếu có giá trị khác -->
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <ul class="list-inline mb-lg-0 mt-2">
                                                    <li class="list-inline-item mb-2">
                                                        <i class="fas fa-users"></i>  ${o.type}
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <i class="fas fa-map-marked-alt"></i>  ${o.address}
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-3 text-center d-flex flex-column justify-content-center">
                                            <div class="mx-auto mb-2">
                                                <span style="font-weight: bold; font-size: 18px;">Điểm: </span> <span style="font-size: 18px;" class="point_value">${o.point}</span>
                                            </div>
                                            <a style="font-size: 18px; background-color: #6787FE; border-radius: 30px; color: white; padding: 10px;"
                                               href="acc-manage?action=viewAccountDetails&accId=${o.accountId}">
                                                Xem chi tiết
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div id="pagination" class="mt-4 d-flex justify-content-center">
                            <div class="mt-4 d-flex justify-content-center">
                                <nav>
                                    <ul class="pagination">
                                        <c:if test="${currentPage > 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="?page=${currentPage - 1}">Trang trước</a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                <a class="page-link" href="?page=${i}">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <c:if test="${currentPage < totalPages}">
                                            <li class="page-item">
                                                <a class="page-link" href="?page=${currentPage + 1}">Trang sau</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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

<%--<%@include file="includes/footer.jsp" %>--%>

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

        const sortCheckboxes = {
            az: document.querySelector('input[name="A_Z"]'),
            za: document.querySelector('input[name="Z_A"]'),
            point: document.querySelector('input[name="point"]')
        };

        const items = Array.from(document.querySelectorAll('.account_in4'));
        const paginationContainer = document.getElementById('pagination');
        const itemsPerPage = 5;
        let currentPage = 1;
        let currentFilteredItems = [];

        function filterList() {

            const selectedTypes = [];
            const selectedStatuses = [];

            if (checkboxes.canhan.checked) selectedTypes.push('canhan');
            if (checkboxes.nhom.checked) selectedTypes.push('nhom');
            if (checkboxes.active.checked) selectedStatuses.push('active');
            if (checkboxes.banned.checked) selectedStatuses.push('banned');

            let filteredItems = items.filter(item => {
                const type = item.dataset.type;
                const status = item.dataset.status;

                const matchType = selectedTypes.length === 0 || selectedTypes.includes(type);
                const matchStatus = selectedStatuses.length === 0 || selectedStatuses.includes(status);

                return matchType && matchStatus;
            });

            currentFilteredItems = sortItems(filteredItems);
            renderPage(currentFilteredItems , currentPage);
            setupPagination(currentFilteredItems);
        }

        function sortItems(items) {
            const getLastWord = (fullName) => {
                const words = fullName.trim().split(/\s+/);
                return words.length > 0 ? words[words.length - 1].toLowerCase() : '';
            };

            if (sortCheckboxes.az.checked) {
                items.sort((a, b) => {
                    const nameA = getLastWord(a.querySelector('.name_value').innerText);
                    const nameB = getLastWord(b.querySelector('.name_value').innerText);
                    return nameA.localeCompare(nameB);
                });
            } else if (sortCheckboxes.za.checked) {
                items.sort((a, b) => {
                    const nameA = getLastWord(a.querySelector('.name_value').innerText);
                    const nameB = getLastWord(b.querySelector('.name_value').innerText);
                    return nameB.localeCompare(nameA);
                });
            } else if (sortCheckboxes.point.checked) {
                items.sort((a, b) => {
                    const pointA = parseFloat(a.querySelector('.point_value').innerText);
                    const pointB = parseFloat(b.querySelector('.point_value').innerText);
                    return pointB - pointA;
                });
            }
            return items;
        }

        function renderPage(filteredItems, page) {
            const start = (page - 1) * itemsPerPage;
            const end = start + itemsPerPage;

            const listContainer = document.getElementById('account-list');

            // Xóa các item hiện tại
            listContainer.innerHTML = '';

            filteredItems.slice(start, end).forEach(item => {
                listContainer.appendChild(item);
            });

        }

        function setupPagination(currentFilteredItems ) {
            const totalPages = Math.ceil(currentFilteredItems .length / itemsPerPage);
            paginationContainer.innerHTML = '';

            // Nếu chỉ có 1 trang, ẩn luôn
            if (totalPages <= 1) return;

            // Trang trước
            if (currentPage > 1) {
                const prevBtn = document.createElement('button');
                prevBtn.innerText = '← Trang trước';
                prevBtn.className = 'mx-1 px-3 py-1 border rounded bg-white text-black hover:bg-blue-100';
                prevBtn.addEventListener('click', () => {
                    if (currentPage > 1) {
                        currentPage--;
                        renderPage(currentFilteredItems , currentPage);
                        setupPagination(currentFilteredItems);
                    }
                });
                paginationContainer.appendChild(prevBtn);
            }

            // Các nút số trang
            for (let i = 1; i <= totalPages; i++) {
                const btn = document.createElement('button');
                btn.innerText = i;
                btn.className = 'mx-1 px-3 py-1 border rounded ' + (i === currentPage
                    ? 'bg-blue-500 text-white font-bold'
                    : 'bg-white text-black hover:bg-blue-100');
                btn.addEventListener('click', () => {
                    currentPage = i;
                    renderPage(currentFilteredItems , currentPage);
                    setupPagination(currentFilteredItems );
                });
                paginationContainer.appendChild(btn);
            }

            // Trang sau
            if (currentPage < totalPages) {
                const nextBtn = document.createElement('button');
                nextBtn.innerText = 'Trang sau →';
                nextBtn.className = 'mx-1 px-3 py-1 border rounded bg-white text-black hover:bg-blue-100';
                nextBtn.addEventListener('click', () => {
                    if (currentPage < totalPages) {
                        currentPage++;
                        renderPage(currentFilteredItems , currentPage);
                        setupPagination(currentFilteredItems );
                    }
                });
                paginationContainer.appendChild(nextBtn);
            }
        }

        // Gắn sự kiện thay đổi checkbox
        Object.values(checkboxes).forEach(cb => cb.addEventListener('change', () => {
            currentPage = 1; // Reset lại trang đầu
            filterList();
        }));

        Object.values(sortCheckboxes).forEach(cb => {
            cb.addEventListener('change', () => {
                // Tắt các checkbox khác để chỉ có một loại sắp xếp
                Object.entries(sortCheckboxes).forEach(([key, checkbox]) => {
                    if (checkbox !== cb) checkbox.checked = false;
                });

                currentPage = 1;
                filterList();
            });
        });

        // Gọi lần đầu
        filterList();
    });
</script>
</body>
</html>
