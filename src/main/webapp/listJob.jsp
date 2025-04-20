<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<%@ page import="jobtrans.model.Job" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="session"></jsp:useBean>
    <jsp:useBean id="JobCategoryDAO" class="jobtrans.dal.JobCategoryDAO" scope="session"></jsp:useBean>
    <meta charset="UTF-8">
    <title>JobTrans-Danh sách công việc</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listJob.css">

</head>

<body>
<%@include file="includes/header-01.jsp"%>
    <div class="container" style="margin-top: 50px; margin-bottom: 50px">
        <div class="search-bar">
            <form action="viec-lam/" method="GET"> <input type="text" id="searchInput" name="keyword"  placeholder="Nhập từ khóa tìm kiếm...">
                <button type="submit" id="searchButton">Tìm kiếm</button>
            </form>
        </div>

        <div id="searchResults">
        </div>


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
                                <li class="filter-item visible"><a href="viec-lam/?price=under1m&page=1">Giá dưới 1 triệu</a></li>
                                <li class="filter-item visible"><a href="viec-lam/?price=1-2m&sort=${sortType}&page=1">Giá từ 1-2 triệu</a></li>
                                <li class="filter-item visible"><a href="viec-lam/?price=3-4m&sort=${sortType}&page=1">Giá từ 3-4 triệu</a></li>
                                <li class="filter-item visible"><a href="viec-lam/?price=4-5m&sort=${sortType}&page=1">Giá từ 4-5 triệu</a></li>
                                <li class="filter-item visible"><a href="viec-lam/?price=5-10m&sort=${sortType}&page=1">Giá từ 5-10 triệu</a></li>
                                <li class="filter-item visible"><a href="viec-lam/?price=10-20m&sort=${sortType}&page=1">Giá từ 10-20 triệu</a></li>
                                <li class="filter-item visible"><a href="viec-lam/?price=20-30m&sort=${sortType}&page=1">Giá từ 20-30 triệu</a></li>
                                <li class="filter-item visible"><a href="viec-lam/?price=30-50m&sort=${sortType}&page=1">Giá từ 30-50 triệu</a></li>
                                <li class="filter-item visible"><a href="viec-lam/?price=above50m&sort=${sortType}&page=1">Giá trên 50 triệu</a></li>
                                <li class="filter-item visible"><a href="viec-lam/?price=tat-ca&sort=${sortType}&page=1">Tất cả giá</a></li>
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
                                <li class="filter-item visible"><a href="viec-lam/?jobType=tuvan-coaching&sort=${sortType}&page=1">Tư vấn-Coaching</a></li>
                                <li class="filter-item visible"><a href="viec-lam/?jobType=dichthuat&sort=${sortType}&page=1">Dịch thuật</a></li>
                                <li class="filter-item visible"><a href="viec-lam/?jobType=congnghe-it&sort=${sortType}&page=1">Công nghệ & IT</a></li>
                                <li class="filter-item visible"><a href="viec-lam/?jobType=marketing&sort=${sortType}&page=1">Marketing</a></li>
                                <li class="filter-item visible"><a href="viec-lam/?jobType=khac&sort=${sortType}&page=1">Khác</a></li>
                            </ul>
                            <div class="filter-more job" onclick="showMoreCViec()">
                                Xem thêm
                                <svg viewBox="0 0 24 24">
                                    <path d="M7 10l5 5 5-5H7z"/>
                                </svg>
                            </div>
                        </div>
                    </div>



                    <div class="col-xl-8">
                        <!-- Danh sách công việc -->

                        <c:if test="${not empty jobList && fn:length(jobList) > 0}">
                            <c:forEach var="job" items="${jobList}">
                                <div class="card mb-3" onclick="window.location.href='jobDetail?id=${job.jobId}'">
                                    <div class="card-body">
                                        <div class="job-info-left">
                                            <h5 class="card-title">${job.jobTitle}</h5>
                                            <p class="card-category"><strong>Phân loại:</strong> ${job.jobCategory.categoryName}</p>
                                            <p class="card-text"><strong>Hạn tuyển:</strong> ${job.dueDatePost}</p>
                                        </div>
                                        <div class="job-info-right">
                                            <p class="job-salary">${job.getFormattedBudgetMax()}</p>
                                            <div class="job-details">
                                                <a href="jobDetail?id=${job.jobId}"
                                                   class="details-link btn btn-sm btn-outline-primary">Chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty jobList || fn:length(jobList) == 0}">
                            <div class="alert alert-info text-center">Không có công việc nào để hiển thị.</div>
                        </c:if>
                    </div>
        <div class="hamburger-menu col-xl-1">
            <button class="hamburger-button" onclick="toggleMenu()">
                <div class="hamburger-icon">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </button>

<%--            //xét url động--%>
            <c:set var="encodedPriceFilter" value="${fn:replace(priceFilter, '-', '-den-')}"/>
            <c:set var="encodedPriceFilter" value="${fn:replace(encodedPriceFilter, 'm', '-trieu')}"/>
            <c:if test="${empty priceFilter}">
                <c:set var="encodedPriceFilter" value="tat-ca"/>
            </c:if>

            <div id="sortMenu" style="left: 40px" class="dropdown-menu">
                <c:url var="sortByRecentUrl" value="/viec-lam/sap-xep-theo-moi-nhat/gia-${encodedPriceFilter}/trang-1"/>
                <a href="${sortByRecentUrl}">Sắp xếp theo đăng gần nhất</a>

                <c:url var="sortByPriceDescUrl" value="/viec-lam/sap-xep-theo-gia-giam/gia-${encodedPriceFilter}/trang-1"/>
                <a href="${sortByPriceDescUrl}">Giá giảm dần</a>

                <c:url var="sortByPriceAscUrl" value="/viec-lam/sap-xep-theo-gia-tang/gia-${encodedPriceFilter}/trang-1"/>
                <a href="${sortByPriceAscUrl}">Giá tăng dần</a>
            </div>
        </div>


            </div>




            </div>
        </div>
    </div>
<c:if test="${totalPages > 1}">
        <div class="pagination" style="margin-bottom: 50px">
            <c:forEach begin="1" end="${totalPages}" var="i">
                <c:choose>
                    <c:when test="${currentPage == i}">
                        <a href="#" class="active">${i}</a>
                    </c:when>
                    <c:otherwise>
                    <c:url var="pageUrl" value="/viec-lam/trang-${i}">
                        <c:if test="${not empty keyword}">
                            <c:param name="keyword" value="${keyword}"/>
                        </c:if>
                        <c:if test="${not empty sortType}">
                            <c:param name="sort" value="${sortType}"/>
                        </c:if>
                        <c:if test="${not empty jobTypeFilter}">
                            <c:param name="jobType" value="${jobTypeFilter}"/>
                        </c:if>
                        <c:if test="${not empty priceFilter}">
                            <c:param name="price" value="${priceFilter.replace('-', '-den-')}"/>
                        </c:if>
                    </c:url>
                    <a href="${pageUrl}">${i}</a>
                </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </c:if>
<%@include file="includes/footer.jsp"%>
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

</body>
</html>