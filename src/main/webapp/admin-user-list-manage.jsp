<%--
    Document   : post_list
    Created on : Mar 13, 2025, 10:45:02 AM
    Author     : ADM
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link href="./css/user-manage.css" rel="stylesheet"/>
</head>

<body style="font-family: Inter,sans-serif;">
<%@include file="includes/header-01.jsp" %>

<main class="container-fluid main-container" >
    <div class="row gx-4">
        <!-- Phần tiêu chí lọc (2 cột) -->
        <aside class="col-md-2">
            <div class="filter-card mb-4">
                <h2 class="filter-title">Phân loại</h2>
                <div class="mb-3">
                    <h4 class="filter-subtitle">Thành viên</h4>
                    <ul class="filter-list">
                        <li>
                            <label class="switch">
                                <input name="thanh_vien" id="filterCanhan" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Cá nhân (${numPrivate})</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="thanh_vien" id="filterNhom" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Nhóm dự án(${numGroup})</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <h4 class="filter-subtitle">Trạng thái</h4>
                    <ul class="filter-list">
                        <li>
                            <label class="switch">
                                <input name="active" id="filterActive" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Đang hoạt động (${numActive})</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="banned" id="filterBanned" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Bị Chặn (${numBanned})</span>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="filter-card">
                <h2 class="filter-title">Sắp xếp</h2>
                <div>
                    <h4 class="filter-subtitle">Thành viên</h4>
                    <ul class="filter-list">
                        <li>
                            <label class="switch">
                                <input name="A_Z" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">A ↓ Z</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="Z_A" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Z ↓ A</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="point" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Điểm số</span>
                        </li>
                    </ul>
                </div>
            </div>
        </aside>
        <!-- Nội dung chính - danh sách người dùng (10 cột) -->
        <section class="col-md-10">
            <div class="container-fluid px-0">
                <div class="row justify-content-center">
                    <div class="col-10">
                        <h1 class="user-list-title text-center">Danh sách người dùng</h1>
                        <div class="search-container">
                            <h3 class="search-title">Tìm kiếm thành viên</h3>
                            <form class="search-form" id="memberSearchForm">
                                <input type="text" class="search-input" placeholder="Nhập tên người dùng....">
                                <button type="submit" class="search-button">
                                    <i class="fas fa-search"></i> Tìm kiếm
                                </button>
                            </form>
                        </div>
                        <div id="account-list">
                            <c:forEach items="${list}" var="o" varStatus="status">
                                <div class="post-box account_in4 user-card"
                                     data-type="${o.typeAccount == 'Cá nhân' ? 'canhan' : 'nhom'}"
                                     data-status="${o.status == 'Đang hoạt động' ? 'active' : 'banned'}">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <a class="d-flex justify-content-center"
                                               href="acc-manage?action=viewAccountDetails&accId=${o.accountId}">
                                                <img src="${o.avatar}" alt="User_avatar" class="user-avatar"/>
                                            </a>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="seller-content">
                                                <h4 class="mb-2 d-flex align-items-center user-name-01">
                                                    <a href="acc-manage?action=viewAccountDetails&accId=${o.accountId}" class="name_value">${o.accountName}</a>
                                                    <c:if test="${o.verifiedAccount}">
                                                        <i class="fas fa-check-circle verified text-primary ms-2"
                                                           title="Verified"></i>
                                                    </c:if>
                                                </h4>
                                                <div class="d-flex align-items-center gap-2">
                                                    <p class="user-speciality">${o.speciality}</p>
                                                    <c:choose>
                                                        <c:when test="${o.status == 'Đang hoạt động'}">
                                                                <span class="status-badge active-status">
                                                                        ${o.status}
                                                                </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="status-badge banned-status">${o.status}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <ul class="list-inline mb-lg-0 mt-2">
                                                    <li class="list-inline-item mb-2">
                                                        <i class="fas fa-users"></i> ${o.typeAccount}
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <i class="fas fa-map-marked-alt"></i> ${o.address}
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-md-3 text-center d-flex flex-column justify-content-center">
                                            <div class="mx-auto mb-2">
                                                <span class="user-point-label">Điểm: </span>
                                                <span class="point_value">${o.point}</span>
                                            </div>
                                            <a class="detail-link"
                                               href="acc-manage?action=viewAccountDetails&accId=${o.accountId}">
                                                Xem chi tiết
                                            </a>
                                            <c:if test="${o.status == 'Bị cấm'}">
                                                <a class="detail-link"
                                                   href="acc-manage?action=unbanUser&accId=${o.accountId}">
                                                    Bỏ chặn
                                                </a>
                                            </c:if>
                                            <c:if test="${o.status != 'Bị cấm'}">
                                                <a class="detail-link"
                                                   href="acc-manage?action=banUser&accId=${o.accountId}">
                                                    Chặn
                                                </a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Phân trang -->
                        <div id="pagination" class="mt-4 d-flex justify-content-center">
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
        </section>


    </div>
</main>

<%@include file="includes/footer.jsp" %>
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
