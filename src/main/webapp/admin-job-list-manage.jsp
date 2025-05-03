<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large'/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="./css/user-manage.css" rel="stylesheet"/>

</head>

<body style="font-family: Inter, sans-serif;">
<%@include file="includes/header-01.jsp"%>
<main class="container-fluid main-container">
    <div class="row gx-4">
        <!-- Phần tiêu chí lọc (2 cột) -->
        <aside class="col-md-2">
            <div class="filter-card mb-4">
                <h2 class="filter-title">Phân loại</h2>
                <div class="mb-3">
                    <h4 class="filter-subtitle">Loại công việc</h4>
                </div>

                <div class="mb-3">
                    <h4 class="filter-subtitle">Chuyên môn</h4>
                    <ul class="filter-list">
                        <li>
                            <label class="switch">
                                <input name="speciality" id="filterMarketing" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Marketing</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="speciality" id="filterIT" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Công nghệ & IT</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="speciality" id="filterDesign" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Design</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="speciality" id="filterTranslation" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Dịch thuật</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="speciality" id="filterCoaching" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Tư vấn, Coaching</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="speciality" id="filterOther" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Khác</span>
                        </li>
                    </ul>
                </div>

                <div>
                    <h4 class="filter-subtitle">Trạng thái</h4>
                    <ul class="filter-list">
                        <li>
                            <label class="switch">
                                <input name="status" id="filterRecruiting" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Đang tuyển</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="status" id="filterCancelled" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Hết hạn</span>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="filter-card">
                <h2 class="filter-title">Sắp xếp</h2>
                <div>
                    <h4 class="filter-subtitle">Công việc</h4>
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
                                <input name="salary" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Mức lương</span>
                        </li>
                    </ul>
                </div>
            </div>
        </aside>
        <!-- Nội dung chính - danh sách công việc (10 cột) -->
        <section class="col-md-10">
            <div class="container-fluid px-0">
                <div class="row justify-content-center">
                    <div class="col-10">
                        <h1 class="user-list-title text-center">Danh sách công việc</h1>
                        <div class="search-container">
                            <h3 class="search-title">Tìm kiếm công việc</h3>
                            <form class="search-form" id="jobSearchForm">
                                <input type="text" class="search-input" placeholder="Nhập tên công việc...">
                                <button type="submit" class="search-button">
                                    <i class="fas fa-search"></i> Tìm kiếm
                                </button>
                            </form>
                        </div>


                        <div id="account-list">
                            

                            <c:if test="${not empty job && fn:length(job) > 0}">


                                <c:forEach var="job" items="${job}">
                                    <div class="post-box account_in4 user-card" data-type="${job.jobCategory.categoryName}" data-status="${job.statusPost}" data-speciality="${job.jobCategory.categoryName}">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <a class="d-flex justify-content-center" href="${pageContext.request.contextPath}/job?action=details-job-posted&jobId=${job.jobId}">
                                                    <c:choose>
                                                        <c:when test="${not empty AccountDAO.getAccountById(job.postAccountId).avatar}">
                                                            <img src="${pageContext.request.contextPath}/${AccountDAO.getAccountById(job.postAccountId).avatar}" alt="Avatar" class="user-avatar"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="${pageContext.request.contextPath}/img/default-avatar.jpg" alt="Default Avatar" class="user-avatar"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </a>
                                            </div>
                                            <div class="col-md-7">
                                                <div class="seller-content">
                                                    <h4 class="mb-2 d-flex align-items-center user-name-01">
                                                        <a href="${pageContext.request.contextPath}/job?action=details-job-posted&jobId=${job.jobId}" class="name_value">${job.jobTitle}</a>
                                                        <i class="fas fa-check-circle verified text-primary ms-2" title="Verified"></i>
                                                    </h4>
                                                    <div class="d-flex align-items-center gap-2">


                                                        <c:choose>
                                                            <c:when test="${job.statusPost == 'Đang tuyển'}">
                                                                <span class="status-badge recruiting-status">Đang tuyển</span>
                                                            </c:when>
                                                            <c:when test="${job.statusPost == 'Hết hạn'}">
                                                                <span class="status-badge completed-status">Hết hạn</span>
                                                            </c:when>
                                                            <%-- Thêm các trạng thái khác nếu cần --%>
                                                        </c:choose>
                                                    </div>
                                                    <ul class="list-inline mb-lg-0 mt-2">
                                                        <li class="list-inline-item mb-2">
                                                            <i class="fas fa-tags"></i> <span class="user-speciality">${job.jobCategory.categoryName}</span>
                                                        </li>

                                                        <li class="list-inline-item mb-2">
                                                            <i class="fas fa-calendar-alt"></i> Ngày đăng:
                                                            <span>
                                                            <fmt:formatDate value="${job.postDate}" pattern="HH:mm:ss dd/MM/yyyy"/>
                                                            </span>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-md-3 text-center d-flex flex-column justify-content-center">
                                                <div class="mx-auto mb-2">
                                                    <span class="user-point-label">Lương: </span>
                                                    <span class="point_value">${job.getFormattedBudgetMin()}-${job.getFormattedBudgetMax()}</span>
                                                </div>
                                                <a class="detail-link" href="${pageContext.request.contextPath}/job?action=details-job-posted&jobId=${job.jobId}">
                                                    Xem chi tiết
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty job || fn:length(job) == 0}">
                                <div class="post-box account_in4 user-card">
                                    <div class="alert alert-info text-center">Không có công việc nào để hiển thị.</div>
                                </div>
                            </c:if>
                        </div>

                        <!-- Phân trang -->
                        <div id="pagination" class="mt-4 d-flex justify-content-center">
                            <!-- Phân trang sẽ được tạo bằng JavaScript -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</main>

<%@include file="includes/footer.jsp"%>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Các checkbox loại công việc
        const typeCheckboxes = {
            fulltime: document.getElementById('filterFulltime'),
            parttime: document.getElementById('filterParttime'),
        };

        // Các checkbox chuyên môn
        const specialityCheckboxes = {
            marketing: document.getElementById('filterMarketing'),
            it: document.getElementById('filterIT'),
            design: document.getElementById('filterDesign'),
            translation: document.getElementById('filterTranslation'),
            coaching: document.getElementById('filterCoaching'),
            other: document.getElementById('filterOther'),
        };

        // Các checkbox trạng thái
        const statusCheckboxes = {
            recruiting: document.getElementById('filterRecruiting'),
            cancelled: document.getElementById('filterCancelled'),
        };

        // Các checkbox sắp xếp
        const sortCheckboxes = {
            az: document.querySelector('input[name="A_Z"]'),
            za: document.querySelector('input[name="Z_A"]'),
            salary: document.querySelector('input[name="salary"]')
        };

        const items = Array.from(document.querySelectorAll('.account_in4'));
        const paginationContainer = document.getElementById('pagination');
        const itemsPerPage = 5;
        let currentPage = 1;
        let currentFilteredItems = [];

        function filterList() {
            // Lấy loại công việc đã chọn
            const selectedTypes = [];
            if (typeCheckboxes.fulltime && typeCheckboxes.fulltime.checked) selectedTypes.push('fulltime');
            if (typeCheckboxes.parttime && typeCheckboxes.parttime.checked) selectedTypes.push('parttime');

            // Lấy chuyên môn đã chọn
            const selectedSpecialities = [];
            if (specialityCheckboxes.marketing && specialityCheckboxes.marketing.checked) selectedSpecialities.push('marketing');
            if (specialityCheckboxes.it && specialityCheckboxes.it.checked) selectedSpecialities.push('congnghe&it');
            if (specialityCheckboxes.design && specialityCheckboxes.design.checked) selectedSpecialities.push('design');
            if (specialityCheckboxes.translation && specialityCheckboxes.translation.checked) selectedSpecialities.push('dichthuat');
            if (specialityCheckboxes.coaching && specialityCheckboxes.coaching.checked) selectedSpecialities.push('tuvan,coaching');
            if (specialityCheckboxes.other && specialityCheckboxes.other.checked) selectedSpecialities.push('khac');

            // Lấy trạng thái đã chọn
            const selectedStatuses = [];
            if (statusCheckboxes.recruiting && statusCheckboxes.recruiting.checked) selectedStatuses.push('đangtuyen');
            if (statusCheckboxes.cancelled && statusCheckboxes.cancelled.checked) selectedStatuses.push('hethan');

            let filteredItems = items.filter(item => {
                let type = (item.dataset.type || '').toLowerCase().replace(/\s+/g, '').normalize("NFD").replace(/[\u0300-\u036f]/g, "");
                let status = (item.dataset.status || '').toLowerCase().replace(/\s+/g, '').normalize("NFD").replace(/[\u0300-\u036f]/g, "");
                let speciality = (item.dataset.speciality || '').toLowerCase().replace(/\s+/g, '').normalize("NFD").replace(/[\u0300-\u036f]/g, "");
                const selectedTypesLowerTrimmed = selectedTypes.map(type => type.toLowerCase().trim().normalize("NFD").replace(/[\u0300-\u036f]/g, ""));
                const selectedStatusesLowerTrimmed = selectedStatuses.map(status => status.toLowerCase().trim().normalize("NFD").replace(/[\u0300-\u036f]/g, ""));
                const selectedSpecialitiesLowerTrimmed = selectedSpecialities.map(speciality => speciality.toLowerCase().trim().normalize("NFD").replace(/[\u0300-\u036f]/g, ""));
console.log(status);
                const matchType = selectedTypesLowerTrimmed.length === 0 || selectedTypesLowerTrimmed.includes(type);
                const matchStatus = selectedStatusesLowerTrimmed.length === 0 || selectedStatusesLowerTrimmed.includes(status);
                const matchSpeciality = selectedSpecialitiesLowerTrimmed.length === 0 || selectedSpecialitiesLowerTrimmed.includes(speciality);

                return matchType && matchStatus && matchSpeciality;
            });

            // Sắp xếp kết quả
            currentFilteredItems = sortItems(filteredItems);

            // Hiển thị trang hiện tại và phân trang
            renderPage(currentFilteredItems, currentPage);
            setupPagination(currentFilteredItems);
        }

        function sortItems(items) {
            if (sortCheckboxes.az && sortCheckboxes.az.checked) {
                items.sort((a, b) => {
                    const nameA = a.querySelector('.name_value')?.innerText.toLowerCase() || '';
                    const nameB = b.querySelector('.name_value')?.innerText.toLowerCase() || '';
                    return nameA.localeCompare(nameB);
                });
            } else if (sortCheckboxes.za && sortCheckboxes.za.checked) {
                items.sort((a, b) => {
                    const nameA = a.querySelector('.name_value')?.innerText.toLowerCase() || '';
                    const nameB = b.querySelector('.name_value')?.innerText.toLowerCase() || '';
                    return nameB.localeCompare(nameA);
                });
            } else if (sortCheckboxes.salary && sortCheckboxes.salary.checked){
                items.sort((a, b) => {
                    const salaryA = parseSalary(a.querySelector('.point_value')?.innerText || '0');
                    const salaryB = parseSalary(b.querySelector('.point_value')?.innerText || '0');
                    return salaryB - salaryA;
                });
            }
            return items;
        }

        function parseSalary(salaryText) {
            // Extract the first number from salary range (e.g. "15-20 triệu" becomes 15)
            const match = salaryText.match(/(\d+)/);
            return match ? parseInt(match[1]) : 0;
        }

        function renderPage(filteredItems, page) {
            const start = (page - 1) * itemsPerPage;
            const end = start + itemsPerPage;

            const listContainer = document.getElementById('account-list');
            if (!listContainer) return;

            // Xóa các item hiện tại
            listContainer.innerHTML = '';

            // Nếu không có kết quả hiển thị thông báo
            if (filteredItems.length === 0) {
                const noResultDiv = document.createElement('div');
                noResultDiv.classList.add('alert', 'alert-info', 'text-center', 'my-4');
                noResultDiv.textContent = 'Không tìm thấy công việc phù hợp với tiêu chí lọc';
                listContainer.appendChild(noResultDiv);
                return;
            }

            // Hiển thị các item của trang hiện tại
            filteredItems.slice(start, end).forEach(item => {
                listContainer.appendChild(item.cloneNode(true));
            });
        }

        function setupPagination(currentFilteredItems) {
            if (!paginationContainer) return;

            const totalPages = Math.ceil(currentFilteredItems.length / itemsPerPage);
            paginationContainer.innerHTML = '';

            // Nếu chỉ có 1 trang hoặc không có item nào, ẩn phân trang
            if (totalPages <= 1) return;

            const paginationNav = document.createElement('nav');
            const paginationUl = document.createElement('ul');
            paginationUl.className = 'pagination';

            // Nút Trang trước
            if (currentPage > 1) {
                const prevItem = document.createElement('li');
                prevItem.className = 'page-item';
                const prevLink = document.createElement('a');
                prevLink.className = 'page-link';
                prevLink.href = '#';
                prevLink.textContent = 'Trang trước';
                prevLink.addEventListener('click', function(e) {
                    e.preventDefault();
                    if (currentPage > 1) {
                        currentPage--;
                        renderPage(currentFilteredItems, currentPage);
                        setupPagination(currentFilteredItems);
                    }
                });
                prevItem.appendChild(prevLink);
                paginationUl.appendChild(prevItem);
            }

            // Hiển thị tối đa 5 nút trang
            const startPage = Math.max(1, currentPage - 2);
            const endPage = Math.min(totalPages, startPage + 4);

            for (let i = startPage; i <= endPage; i++) {
                const pageItem = document.createElement('li');
                pageItem.className = 'page-item' + (i === currentPage ? ' active' : '');

                const pageLink = document.createElement('a');
                pageLink.className = 'page-link';
                pageLink.href = '#';
                pageLink.textContent = i;

                pageLink.addEventListener('click', function(e) {
                    e.preventDefault();
                    currentPage = i;
                    renderPage(currentFilteredItems, currentPage);
                    setupPagination(currentFilteredItems);
                });

                pageItem.appendChild(pageLink);
                paginationUl.appendChild(pageItem);
            }

            // Nút Trang sau
            if (currentPage < totalPages) {
                const nextItem = document.createElement('li');
                nextItem.className = 'page-item';
                const nextLink = document.createElement('a');
                nextLink.className = 'page-link';
                nextLink.href = '#';
                nextLink.textContent = 'Trang sau';
                nextLink.addEventListener('click', function(e) {
                    e.preventDefault();
                    if (currentPage < totalPages) {
                        currentPage++;
                        renderPage(currentFilteredItems, currentPage);
                        setupPagination(currentFilteredItems);
                    }
                });
                nextItem.appendChild(nextLink);
                paginationUl.appendChild(nextItem);
            }

            paginationNav.appendChild(paginationUl);
            paginationContainer.appendChild(paginationNav);
        }

        // Xử lý tìm kiếm
        const searchForm = document.getElementById('jobSearchForm');
        if (searchForm) {
            const searchInput = searchForm.querySelector('.search-input');

            searchForm.addEventListener('submit', function(e) {
                e.preventDefault();
                const searchTerm = searchInput.value.toLowerCase().trim();

                if (searchTerm) {
                    // Lọc theo từ khóa tìm kiếm
                    const searchResults = items.filter(item => {
                        const jobTitle = item.querySelector('.name_value')?.textContent.toLowerCase() || '';
                        const jobType = item.querySelector('.user-speciality')?.textContent.toLowerCase() || '';
                        return jobTitle.includes(searchTerm) || jobType.includes(searchTerm);
                    });

                    currentFilteredItems = searchResults;
                    currentPage = 1;
                    renderPage(currentFilteredItems, currentPage);
                    setupPagination(currentFilteredItems);
                } else {
                    // Nếu không có từ khóa, hiển thị tất cả (hoặc theo bộ lọc hiện tại)
                    filterList();
                }
            });
        }

        // Xử lý khi người dùng thay đổi các checkbox loại công việc
        Object.values(typeCheckboxes).forEach(cb => {
            if (cb) {
                cb.addEventListener('change', () => {
                    currentPage = 1; // Reset về trang đầu tiên
                    filterList();
                });
            }
        });

        // Xử lý khi người dùng thay đổi các checkbox chuyên môn
        Object.values(specialityCheckboxes).forEach(cb => {
            if (cb) {
                cb.addEventListener('change', () => {
                    currentPage = 1;
                    filterList();
                });
            }
        });

        // Xử lý khi người dùng thay đổi các checkbox trạng thái
        Object.values(statusCheckboxes).forEach(cb => {
            if (cb) {
                cb.addEventListener('change', () => {
                    currentPage = 1;
                    filterList();
                });
            }
        });

        // Xử lý khi người dùng thay đổi các checkbox sắp xếp
        Object.values(sortCheckboxes).forEach(cb => {
            if (cb) {
                cb.addEventListener('change', () => {
                    // Đảm bảo chỉ chọn một loại sắp xếp
                    if (cb.checked) {
                        Object.values(sortCheckboxes).forEach(checkbox => {
                            if (checkbox !== cb) checkbox.checked = false;
                        });
                    }

                    currentPage = 1;
                    filterList();
                });
            }
        });

        // CSS để hiển thị màu sắc cho các trạng thái khác nhau
        const styleElement = document.createElement('style');
        styleElement.textContent = `
        .recruiting-status {
            background-color: #28a745;
            color: white;
        }
        .pending-contract-status {
            background-color: #17a2b8;
            color: white;
        }
        .working-status {
            background-color: #007bff;
            color: white;
        }
        .disputed-status {
            background-color: #dc3545;
            color: white;
        }
        .pending-payment-status {
            background-color: #ffc107;
            color: black;
        }
        .completed-status {
            background-color: #6c757d;
            color: white;
        }
        .cancelled-status {
            background-color: #343a40;
            color: white;
        }
    `;
        document.head.appendChild(styleElement);

        // Kiểm tra console để debug
        console.log("Speciality checkboxes:", specialityCheckboxes);
        console.log("Items data:", items.map(item => ({
            type: item.dataset.type,
            status: item.dataset.status,
            speciality: item.dataset.speciality
        })));

        // Khởi tạo khi trang tải xong
        filterList();
    });
</script>