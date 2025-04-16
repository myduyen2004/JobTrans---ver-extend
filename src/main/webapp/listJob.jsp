<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="jobtrans.model.Job" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="session"></jsp:useBean>
    <meta charset="UTF-8">
    <title>JobTrans-Danh sách công việc</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: bold;
            border: none;
            margin-left: 10px;
            cursor: pointer;
        }

        .btn-expired {
            background-color: #e74c3c;
            color: white;
        }

        .btn-hiring {
            background-color: #192a56;
            color: white;
        }

        .filter-btn {
            background-color: white;
            border: 1px solid #ddd;
            display: flex;
            align-items: center;
        }

        .filter-icon {
            width: 20px;
            height: 20px;
        }

        .card {
            transition: background-color 0.3s ease; /* Hiệu ứng chuyển màu mượt mà */
            cursor: pointer; /* Hiển thị con trỏ chuột để gợi ý có thể click */
            display: flex; /* Sử dụng flexbox cho card-body */
            flex-direction: column; /* Sắp xếp nội dung theo chiều dọc */
        }
/*comment*/
        .card:hover {
            background-color: #6787FE; /* Màu nền xanh nhạt khi hover */
        }

        /* Tùy chọn: để nội dung dễ đọc hơn khi hover */
        .card:hover .card-title,
        .card:hover .card-text,
        .card:hover .job-salary,
        .card:hover .details-link {
            color: white; /* Đổi màu chữ thành trắng khi hover để dễ đọc trên nền xanh */
        }

        .card-body {
            display: flex;
            justify-content: space-between; /* Đẩy tiêu đề và phần còn lại ra hai bên */
            align-items: flex-start; /* Căn chỉnh các item theo top */
            flex-grow: 1; /* Cho phần bên trái (tiêu đề, hạn tuyển) mở rộng */
        }

        .job-info-left {
            flex-grow: 1; /* Cho phần thông tin bên trái chiếm không gian */
        }

        .job-info-right {
            display: flex;
            flex-direction: column; /* Sắp xếp ngân sách và nút chi tiết theo chiều dọc */
            align-items: flex-end; /* Căn chỉnh các item về bên phải */
        }

        .job-card { /* Các style hiện tại của bạn cho job-card */
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .job-badge {
            background-color: #c8d6f5;
            color: #4a69bd;
            padding: 5px 15px;
            border-radius: 15px;
            display: inline-block;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .card-title { /* Sử dụng .card-title thay vì .job-title để thống nhất với Bootstrap */
            font-size: 22px;
            font-weight: bold;
            margin: 0 0 5px 0; /* Giảm margin dưới tiêu đề */
        }

        .card-text { /* Sử dụng .card-text thay vì .job-info */
            color: #7f8c8d;
            margin-bottom: 3px; /* Giảm margin dưới các dòng thông tin */
            font-size: 14px;
        }

        .card-text strong {
            font-weight: bold;
            color: #333;
        }

        .job-date { /* Style riêng cho hạn tuyển nếu cần */
            font-size: 14px;
        }

        .job-salary {
            font-size: 18px;
            font-weight: bold;
            color: #000;
            margin-bottom: 5px; /* Thêm margin dưới ngân sách */
            text-align: right; /* Căn phải cho ngân sách */
        }

        .job-details { /* Không cần style đặc biệt, flexbox sẽ xử lý */
            margin-top: 5px; /* Thêm margin phía trên nút chi tiết */
        }

        .details-link { /* Style cho nút chi tiết */
            color: #8c9eff;
            text-decoration: none;
            font-size: 16px;
            display: inline-block; /* Để có thể căn phải bằng flexbox */
        }

        .hidden {
            display: none;
        }
    </style>
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
            text-align: center;
            font-size: 40px;


        }

        .inforDetail {
            font-size: 20px;
            align-self: flex-start
        }

        .contentBanner {
            display: flex;
            flex-direction: column; /* Sắp xếp các phần tử con theo cột */
            align-items: center; /* Căn giữa các phần tử con theo chiều ngang */
            /* Các стили khác cho contentBanner */
        }

    </style>
    <style>
        .pagination {
            margin-top: 20px;
            display: flex;
            justify-content: center;

            margin-left: 240px;

        }

        .pagination a {
            color: #0F1B63;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
            margin: 0 4px;
            border-radius: 5px;
        }

        .pagination a.active {
            background-color: #6787FE;
            color: white;
            border: 1px solid #6787FE;
        }
    </style>
    <style>
        .filter-container {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 15px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
            width: 250px; /* Điều chỉnh độ rộng theo ý muốn */
        }

        .filter-header {
            padding: 15px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: bold;
            color: #333;
            cursor: pointer; /* Thêm cursor để biết có thể tương tác */
        }

        .filter-header svg {
            width: 16px;
            height: 16px;
            fill: #777;
            transition: transform 0.3s ease-in-out; /* Hiệu ứng xoay mượt mà */
        }

        .filter-list {
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .filter-item {
            padding: 10px 15px;
            color: #555;
            cursor: pointer;
        }

        .filter-item:hover {
            background-color: #f9f9f9;
        }

        .filter-more {
            padding: 10px 15px;
            color: #007bff;
            cursor: pointer;
            display: flex;
            align-items: center;
        }

        .filter-more svg {
            width: 14px;
            height: 14px;
            fill: #007bff;
            margin-left: 5px;
        }

        .collapsed .filter-list,
        .collapsed .filter-more {
            display: none; /* Ẩn danh sách và "Xem thêm" khi thu gọn */
        }

        .collapsed .filter-header svg {
            transform: rotate(180deg); /* Xoay icon mũi tên xuống khi thu gọn */
        }
    </style>
    <style>
        .hamburger-menu {
            position: relative;
            display: inline-block;
        }

        .hamburger-button {
            background: none;
            border: none;
            cursor: pointer;
            padding: 10px;
        }

        .hamburger-icon {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 24px;
            width: 30px;
        }

        .hamburger-icon span {
            height: 3px;
            width: 100%;
            background-color: #333;
            border-radius: 3px;
            transition: all 0.3s ease;
        }

        .dropdown-menu {
            position: absolute;
            right: 0;
            background-color: white;
            min-width: 200px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 4px;
            display: none;
        }

        .dropdown-menu a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.2s;
        }

        .dropdown-menu a:hover {
            background-color: #6787FE;
            color: white;
        }

        .show {
            display: block;
        }
    </style>
    <script>
        function toggleFilter() {
            const filterContainer = document.querySelector('.filter-container');
            filterContainer.classList.toggle('collapsed');
        }

        document.addEventListener("DOMContentLoaded", function () {
            // Xử lý Lọc theo giá
            const priceFilterList = document.querySelector('.filter-list.price');
            const priceFilterItems = document.querySelectorAll('.filter-list.price .filter-item');
            const filterMorePrices = document.querySelector('.filter-more.price');
            const filterHeaderPrices = document.querySelector('.filter-header.price');
            const priceFilterContainer = document.querySelector('.filter-container.price');

            function toggleFilterPrice() {
                priceFilterContainer.classList.toggle('collapsed');
            }

            function showMorePrices() {
                priceFilterItems.forEach(item => {
                    item.classList.remove('hidden');
                });
                filterMorePrices.style.display = 'none';
            }

// Gán sự kiện cho phần tiêu đề lọc giá
            if (filterHeaderPrices) {
                filterHeaderPrices.addEventListener('click', toggleFilterPrice);
            }
            if (filterMorePrices) {
                filterMorePrices.addEventListener('click', showMorePrices);
            }

// Ẩn các mục giá vượt quá 3 mục đầu tiên
            if (priceFilterItems) {
                priceFilterItems.forEach((item, index) => {
                    if (index > 0 && index > 3) { // Bỏ qua tiêu đề (index 0) và hiển thị 3 mục đầu
                        item.classList.add('hidden');
                    }
                });

                // Ẩn nút "Xem thêm" nếu không có mục nào bị ẩn
                let hiddenPriceCount = 0;
                priceFilterItems.forEach((item, index) => {
                    if (index > 3 && item.classList.contains('hidden')) {
                        hiddenPriceCount++;
                    }
                });
                if (filterMorePrices && hiddenPriceCount === 0) {
                    filterMorePrices.style.display = 'none';
                }
            }


            // Xử lý Lọc theo công việc
            const jobFilterList = document.querySelector('.filter-list.job');
            const jobFilterItems = document.querySelectorAll('.filter-list.job .filter-item');
            const filterMoreCViec = document.querySelector('.filter-more.job');
            const filterHeaderCViec = document.querySelector('.filter-header.job');
            const jobFilterContainer = document.querySelector('.filter-container.job');

            function toggleFilterCViec() {
                jobFilterContainer.classList.toggle('collapsed');
            }

            function showMoreCViec() {
                jobFilterItems.forEach(item => {
                    item.classList.remove('hidden');
                });
                filterMoreCViec.style.display = 'none';
            }

            // Gán sự kiện cho phần tiêu đề lọc công việc
            if (filterHeaderCViec) {
                filterHeaderCViec.addEventListener('click', toggleFilterCViec);
            }
            if (filterMoreCViec) {
                filterMoreCViec.addEventListener('click', showMoreCViec);
            }

            // Ẩn các mục công việc vượt quá 3 mục đầu tiên
            if (jobFilterItems) {
                jobFilterItems.forEach((item, index) => {
                    if (index > 0 && index > 3) { // Bỏ qua tiêu đề (index 0) và hiển thị 3 mục đầu
                        item.classList.add('hidden');
                    }
                });

                // Ẩn nút "Xem thêm" nếu không có mục nào bị ẩn
                let hiddenJobCount = 0;
                jobFilterItems.forEach((item, index) => {
                    if (index > 3 && item.classList.contains('hidden')) {
                        hiddenJobCount++;
                    }
                });
                if (filterMoreCViec && hiddenJobCount === 0) {
                    filterMoreCViec.style.display = 'none';
                }
            }
        });
    </script>
    <script>
        function toggleMenu() {
            document.getElementById("sortMenu").classList.toggle("show");
        }

        // Đóng dropdown khi click ra ngoài
        window.onclick = function (event) {
            if (!event.target.matches('.hamburger-button') &&
                !event.target.matches('.hamburger-icon') &&
                !event.target.matches('.hamburger-icon span')) {
                var dropdown = document.getElementById("sortMenu");
                if (dropdown.classList.contains('show')) {
                    dropdown.classList.remove('show');
                }
            }
        }
    </script>
</head>
<body>
<section>

    <div class="breadcrumbs banner"
         style="padding-bottom: 30px;padding-top: 10px;padding-top: 20px;margin-bottom: 50px;">
        <div class="container" style="right: 80px;">
            <div class="contentBanner">

                <div class="inforDetail"></div>
                <h1>Danh sách công việc</h1>

            </div>

        </div>
    </div>

</section>

<%
    int pageSize = 3;
    int currentPage = 1;
    String pageParam = request.getParameter("page");
    if (pageParam != null) {
        currentPage = Integer.parseInt(pageParam);
    }
//xử lý logic phần lấy qua hàm DAO không qua hàm servlet
    List<Job> allJobs = jobDAO.getAllJob();
    int totalJobs = allJobs != null ? allJobs.size() : 0;
    int totalPages = (int) Math.ceil((double) totalJobs / pageSize);
    int start = (currentPage - 1) * pageSize;
    int end = Math.min(start + pageSize, totalJobs);
    request.setAttribute("start", Integer.valueOf(start));
    request.setAttribute("end", Integer.valueOf(end));
    request.setAttribute("currentPage", Integer.valueOf(currentPage));
    request.setAttribute("totalPages", Integer.valueOf(totalPages));
    request.setAttribute("totalJobs", Integer.valueOf(totalJobs));

%>
<section class="section-padding">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="row">
                    <div class="col-xl-3">
                        <div class="filter-container price">
                            <div class="filter-header price">
                                Lọc theo giá
                                <svg viewBox="0 0 24 24">
                                    <path d="M7 14l5-5 5 5H7z"/>
                                </svg>
                            </div>
                            <ul class="filter-list price">
                                <li class="filter-item visible">Phân loại theo giá</li>
                                <li class="filter-item visible">Giá dưới 1 triệu</li>
                                <li class="filter-item visible">Giá từ 1-2 triệu</li>
                                <li class="filter-item visible">Giá từ 3-4 triệu</li>
                                <li class="filter-item hidden">Giá từ 4-5 triệu</li>
                                <li class="filter-item hidden">Giá từ 5-10 triệu</li>
                                <li class="filter-item hidden">Giá từ 10-20 triệu</li>
                                <li class="filter-item hidden">Giá từ 20-30 triệu</li>
                                <li class="filter-item hidden">Giá từ 30-50 triệu</li>
                                <li class="filter-item hidden">Giá trên 50 triệu</li>
                            </ul>
                            <div class="filter-more price" onclick="showMorePrices()">
                                Xem thêm
                                <svg viewBox="0 0 24 24">
                                    <path d="M7 10l5 5 5-5H7z"/>
                                </svg>
                            </div>
                        </div>

                        <div class="filter-container job">
                            <div class="filter-header job">
                                Lọc theo công việc
                                <svg viewBox="0 0 24 24">
                                    <path d="M7 14l5-5 5 5H7z"/>
                                </svg>
                            </div>
                            <ul class="filter-list job">
                                <li class="filter-item visible">Tất cả công việc</li>
                                <li class="filter-item visible">CV1</li>
                                <li class="filter-item visible">CV2</li>
                                <li class="filter-item visible">CV3</li>
                                <li class="filter-item hidden">CV4</li>
                                <li class="filter-item hidden">CV5</li>
                                <li class="filter-item hidden">CV6</li>
                                <li class="filter-item hidden">CV7</li>
                                <li class="filter-item hidden">CV8</li>
                                <li class="filter-item hidden">CV9</li>
                            </ul>
                            <div class="filter-more job" onclick="showMoreCViec()">
                                Xem thêm
                                <svg viewBox="0 0 24 24">
                                    <path d="M7 10l5 5 5-5H7z"/>
                                </svg>
                            </div>
                        </div>
                    </div>



                    <div class="col-xl-7">
            <c:if test="${totalJobs > 0}">
                <c:forEach var="i" begin="${start}" end="${end - 1}">
                    <c:set var="job" value="${jobDAO.allJob[i]}"/>
                    <div class="card mb-3" onclick="window.location.href='helloservlet'">
                        <div class="card-body">
                            <div class="job-info-left">
                                <h5 class="card-title">${job.jobTitle}</h5>
                                <p class="card-text"><strong>Hạn tuyển:</strong> ${job.dueDate}</p>
                            </div>
                            <div class="job-info-right">
                                <p class="job-salary">${job.budgetMax}</p>
                                <div class="job-details">
                                    <a href="helloservlet"
                                       class="details-link btn btn-sm btn-outline-primary">Chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${totalJobs == 0}">
                <div class="alert alert-info text-center">Không có công việc nào để hiển thị.</div>
            </c:if>
                    </div>
        <div class="hamburger-menu col-xl-2">
            <button class="hamburger-button" onclick="toggleMenu()">
                <div class="hamburger-icon">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </button>
            <div id="sortMenu" class="dropdown-menu">
                <a href="?sort=recent">Sắp xếp theo đăng gần nhất</a>
                <a href="?sort=price-desc">Giá giảm dần</a>
                <a href="?sort=price-asc">Giá tăng dần</a>
            </div>
        </div>


            </div>




            </div>
        </div>
    </div>
</section>


<%--phân trang--%>
<div class="pagination">
    <c:if test="${currentPage > 1}">
        <a href="?page=${currentPage - 1}">&laquo;</a>
    </c:if>
    <c:forEach var="i" begin="1" end="${totalPages}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <a href="?page=${i}" class="active">${i}</a>
            </c:when>
            <c:otherwise>
                <a href="?page=${i}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${currentPage < totalPages}">
        <a href="?page=${currentPage + 1}">&raquo;</a>
    </c:if>
</div>
</body>
</html>