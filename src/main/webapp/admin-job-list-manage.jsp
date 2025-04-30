<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <ul class="filter-list">
                        <li>
                            <label class="switch">
                                <input name="loai_cv" id="filterFulltime" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Toàn thời gian</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="loai_cv" id="filterParttime" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Bán thời gian</span>
                        </li>
                    </ul>
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
                                <input name="status" id="filterPendingContract" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Chờ kí hợp đồng</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="status" id="filterWorking" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Đang làm việc</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="status" id="filterDisputed" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Có khiếu nại</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="status" id="filterPendingPayment" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Chờ thanh toán</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="status" id="filterCompleted" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Hoàn thành</span>
                        </li>
                        <li>
                            <label class="switch">
                                <input name="status" id="filterCancelled" type="checkbox"/>
                                <span class="slider"></span>
                            </label>
                            <span class="filter-label">Đã hủy</span>
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
                            <!-- Job 1 -->
                            <div class="post-box account_in4 user-card" data-type="fulltime" data-status="recruiting" data-speciality="it">
                                <div class="row">
                                    <div class="col-md-2">
                                        <a class="d-flex justify-content-center" href="job-details.html?jobId=1">
                                            <img src="https://via.placeholder.com/100" alt="Company_logo" class="user-avatar"/>
                                        </a>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="seller-content">
                                            <h4 class="mb-2 d-flex align-items-center user-name-01">
                                                <a href="job-details.html?jobId=1" class="name_value">Chuyên viên phát triển phần mềm</a>
                                                <i class="fas fa-check-circle verified text-primary ms-2" title="Verified"></i>
                                            </h4>
                                            <div class="d-flex align-items-center gap-2">
                                                <p class="user-speciality">Lập trình Web</p>
                                                <span class="status-badge recruiting-status">Đang tuyển</span>
                                            </div>
                                            <ul class="list-inline mb-lg-0 mt-2">
                                                <li class="list-inline-item mb-2">
                                                    <i class="fas fa-clock"></i> Toàn thời gian
                                                </li>
                                                <li class="list-inline-item">
                                                    <i class="fas fa-map-marked-alt"></i> TP. Hồ Chí Minh
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 text-center d-flex flex-column justify-content-center">
                                        <div class="mx-auto mb-2">
                                            <span class="user-point-label">Lương: </span>
                                            <span class="point_value">15-20 triệu</span>
                                        </div>
                                        <a class="detail-link" href="job-details.html?jobId=1">
                                            Xem chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Job 2 -->
                            <div class="post-box account_in4 user-card" data-type="parttime" data-status="working" data-speciality="design">
                                <div class="row">
                                    <div class="col-md-2">
                                        <a class="d-flex justify-content-center" href="job-details.html?jobId=2">
                                            <img src="https://via.placeholder.com/100" alt="Company_logo" class="user-avatar"/>
                                        </a>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="seller-content">
                                            <h4 class="mb-2 d-flex align-items-center user-name-01">
                                                <a href="job-details.html?jobId=2" class="name_value">Thiết kế đồ họa</a>
                                                <i class="fas fa-check-circle verified text-primary ms-2" title="Verified"></i>
                                            </h4>
                                            <div class="d-flex align-items-center gap-2">
                                                <p class="user-speciality">UI/UX Designer</p>
                                                <span class="status-badge working-status">Đang làm việc</span>
                                            </div>
                                            <ul class="list-inline mb-lg-0 mt-2">
                                                <li class="list-inline-item mb-2">
                                                    <i class="fas fa-clock"></i> Bán thời gian
                                                </li>
                                                <li class="list-inline-item">
                                                    <i class="fas fa-map-marked-alt"></i> Hà Nội
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 text-center d-flex flex-column justify-content-center">
                                        <div class="mx-auto mb-2">
                                            <span class="user-point-label">Lương: </span>
                                            <span class="point_value">8-10 triệu</span>
                                        </div>
                                        <a class="detail-link" href="job-details.html?jobId=2">
                                            Xem chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Job 3 -->
                            <div class="post-box account_in4 user-card" data-type="fulltime" data-status="completed" data-speciality="it">
                                <div class="row">
                                    <div class="col-md-2">
                                        <a class="d-flex justify-content-center" href="job-details.html?jobId=3">
                                            <img src="https://via.placeholder.com/100" alt="Company_logo" class="user-avatar"/>
                                        </a>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="seller-content">
                                            <h4 class="mb-2 d-flex align-items-center user-name-01">
                                                <a href="job-details.html?jobId=3" class="name_value">Kỹ sư DevOps</a>
                                            </h4>
                                            <div class="d-flex align-items-center gap-2">
                                                <p class="user-speciality">Cloud Infrastructure</p>
                                                <span class="status-badge completed-status">Hoàn thành</span>
                                            </div>
                                            <ul class="list-inline mb-lg-0 mt-2">
                                                <li class="list-inline-item mb-2">
                                                    <i class="fas fa-clock"></i> Toàn thời gian
                                                </li>
                                                <li class="list-inline-item">
                                                    <i class="fas fa-map-marked-alt"></i> Đà Nẵng
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 text-center d-flex flex-column justify-content-center">
                                        <div class="mx-auto mb-2">
                                            <span class="user-point-label">Lương: </span>
                                            <span class="point_value">25-30 triệu</span>
                                        </div>
                                        <a class="detail-link" href="job-details.html?jobId=3">
                                            Xem chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Job 4 -->
                            <div class="post-box account_in4 user-card" data-type="parttime" data-status="disputed" data-speciality="marketing">
                                <div class="row">
                                    <div class="col-md-2">
                                        <a class="d-flex justify-content-center" href="job-details.html?jobId=4">
                                            <img src="https://via.placeholder.com/100" alt="Company_logo" class="user-avatar"/>
                                        </a>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="seller-content">
                                            <h4 class="mb-2 d-flex align-items-center user-name-01">
                                                <a href="job-details.html?jobId=4" class="name_value">Content Creator</a>
                                                <i class="fas fa-check-circle verified text-primary ms-2" title="Verified"></i>
                                            </h4>
                                            <div class="d-flex align-items-center gap-2">
                                                <p class="user-speciality">Digital Marketing</p>
                                                <span class="status-badge disputed-status">Có khiếu nại</span>
                                            </div>
                                            <ul class="list-inline mb-lg-0 mt-2">
                                                <li class="list-inline-item mb-2">
                                                    <i class="fas fa-clock"></i> Bán thời gian
                                                </li>
                                                <li class="list-inline-item">
                                                    <i class="fas fa-map-marked-alt"></i> TP. Hồ Chí Minh
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 text-center d-flex flex-column justify-content-center">
                                        <div class="mx-auto mb-2">
                                            <span class="user-point-label">Lương: </span>
                                            <span class="point_value">7-12 triệu</span>
                                        </div>
                                        <a class="detail-link" href="job-details.html?jobId=4">
                                            Xem chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Job 5 -->
                            <div class="post-box account_in4 user-card" data-type="fulltime" data-status="pendingContract" data-speciality="it">
                                <div class="row">
                                    <div class="col-md-2">
                                        <a class="d-flex justify-content-center" href="job-details.html?jobId=5">
                                            <img src="https://via.placeholder.com/100" alt="Company_logo" class="user-avatar"/>
                                        </a>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="seller-content">
                                            <h4 class="mb-2 d-flex align-items-center user-name-01">
                                                <a href="job-details.html?jobId=5" class="name_value">Kỹ sư Machine Learning</a>
                                                <i class="fas fa-check-circle verified text-primary ms-2" title="Verified"></i>
                                            </h4>
                                            <div class="d-flex align-items-center gap-2">
                                                <p class="user-speciality">Artificial Intelligence</p>
                                                <span class="status-badge pending-contract-status">Chờ kí hợp đồng</span>
                                            </div>
                                            <ul class="list-inline mb-lg-0 mt-2">
                                                <li class="list-inline-item mb-2">
                                                    <i class="fas fa-clock"></i> Toàn thời gian
                                                </li>
                                                <li class="list-inline-item">
                                                    <i class="fas fa-map-marked-alt"></i> Hà Nội
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 text-center d-flex flex-column justify-content-center">
                                        <div class="mx-auto mb-2">
                                            <span class="user-point-label">Lương: </span>
                                            <span class="point_value">30-40 triệu</span>
                                        </div>
                                        <a class="detail-link" href="job-details.html?jobId=5">
                                            Xem chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Job 6 -->
                            <div class="post-box account_in4 user-card" data-type="fulltime" data-status="pendingPayment" data-speciality="translation">
                                <div class="row">
                                    <div class="col-md-2">
                                        <a class="d-flex justify-content-center" href="job-details.html?jobId=6">
                                            <img src="https://via.placeholder.com/100" alt="Company_logo" class="user-avatar"/>
                                        </a>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="seller-content">
                                            <h4 class="mb-2 d-flex align-items-center user-name-01">
                                                <a href="job-details.html?jobId=6" class="name_value">Biên dịch viên Nhật - Việt</a>
                                                <i class="fas fa-check-circle verified text-primary ms-2" title="Verified"></i>
                                            </h4>
                                            <div class="d-flex align-items-center gap-2">
                                                <p class="user-speciality">Dịch thuật</p>
                                                <span class="status-badge pending-payment-status">Chờ thanh toán</span>
                                            </div>
                                            <ul class="list-inline mb-lg-0 mt-2">
                                                <li class="list-inline-item mb-2">
                                                    <i class="fas fa-clock"></i> Toàn thời gian
                                                </li>
                                                <li class="list-inline-item">
                                                    <i class="fas fa-map-marked-alt"></i> Hà Nội
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 text-center d-flex flex-column justify-content-center">
                                        <div class="mx-auto mb-2">
                                            <span class="user-point-label">Lương: </span>
                                            <span class="point_value">15-20 triệu</span>
                                        </div>
                                        <a class="detail-link" href="job-details.html?jobId=6">
                                            Xem chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Job 7 -->
                            <div class="post-box account_in4 user-card" data-type="parttime" data-status="cancelled" data-speciality="coaching">
                                <div class="row">
                                    <div class="col-md-2">
                                        <a class="d-flex justify-content-center" href="job-details.html?jobId=7">
                                            <img src="https://via.placeholder.com/100" alt="Company_logo" class="user-avatar"/>
                                        </a>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="seller-content">
                                            <h4 class="mb-2 d-flex align-items-center user-name-01">
                                                <a href="job-details.html?jobId=7" class="name_value">Tư vấn tài chính cá nhân</a>
                                            </h4>
                                            <div class="d-flex align-items-center gap-2">
                                                <p class="user-speciality">Tư vấn tài chính</p>
                                                <span class="status-badge cancelled-status">Đã hủy</span>
                                            </div>
                                            <ul class="list-inline mb-lg-0 mt-2">
                                                <li class="list-inline-item mb-2">
                                                    <i class="fas fa-clock"></i> Bán thời gian
                                                </li>
                                                <li class="list-inline-item">
                                                    <i class="fas fa-map-marked-alt"></i> TP. Hồ Chí Minh
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 text-center d-flex flex-column justify-content-center">
                                        <div class="mx-auto mb-2">
                                            <span class="user-point-label">Lương: </span>
                                            <span class="point_value">5-8 triệu</span>
                                        </div>
                                        <a class="detail-link" href="job-details.html?jobId=7">
                                            Xem chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>
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
            pendingContract: document.getElementById('filterPendingContract'),
            working: document.getElementById('filterWorking'),
            disputed: document.getElementById('filterDisputed'),
            pendingPayment: document.getElementById('filterPendingPayment'),
            completed: document.getElementById('filterCompleted'),
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
            if (typeCheckboxes.fulltime.checked) selectedTypes.push('fulltime');
            if (typeCheckboxes.parttime.checked) selectedTypes.push('parttime');

            // Lấy chuyên môn đã chọn
            const selectedSpecialities = [];
            if (specialityCheckboxes.marketing.checked) selectedSpecialities.push('marketing');
            if (specialityCheckboxes.it.checked) selectedSpecialities.push('it');
            if (specialityCheckboxes.design.checked) selectedSpecialities.push('design');
            if (specialityCheckboxes.translation.checked) selectedSpecialities.push('translation');
            if (specialityCheckboxes.coaching.checked) selectedSpecialities.push('coaching');
            if (specialityCheckboxes.other.checked) selectedSpecialities.push('other');

            // Lấy trạng thái đã chọn
            const selectedStatuses = [];
            if (statusCheckboxes.recruiting.checked) selectedStatuses.push('recruiting');
            if (statusCheckboxes.pendingContract.checked) selectedStatuses.push('pendingContract');
            if (statusCheckboxes.working.checked) selectedStatuses.push('working');
            if (statusCheckboxes.disputed.checked) selectedStatuses.push('disputed');
            if (statusCheckboxes.pendingPayment.checked) selectedStatuses.push('pendingPayment');
            if (statusCheckboxes.completed.checked) selectedStatuses.push('completed');
            if (statusCheckboxes.cancelled.checked) selectedStatuses.push('cancelled');

            // Lọc theo tất cả tiêu chí
            let filteredItems = items.filter(item => {
                const type = item.dataset.type;
                const status = item.dataset.status;
                const speciality = item.dataset.speciality;

                const matchType = selectedTypes.length === 0 || selectedTypes.includes(type);
                const matchStatus = selectedStatuses.length === 0 || selectedStatuses.includes(status);
                const matchSpeciality = selectedSpecialities.length === 0 || selectedSpecialities.includes(speciality);

                return matchType && matchStatus && matchSpeciality;
            });

            // Sắp xếp kết quả
            currentFilteredItems = sortItems(filteredItems);

            // Hiển thị trang hiện tại và phân trang
            renderPage(currentFilteredItems, currentPage);
            setupPagination(currentFilteredItems);
        }

        function sortItems(items) {
            if (sortCheckboxes.az.checked) {
                items.sort((a, b) => {
                    const nameA = a.querySelector('.name_value').innerText.toLowerCase();
                    const nameB = b.querySelector('.name_value').innerText.toLowerCase();
                    return nameA.localeCompare(nameB);
                });
            } else if (sortCheckboxes.za.checked) {
                items.sort((a, b) => {
                    const nameA = a.querySelector('.name_value').innerText.toLowerCase();
                    const nameB = b.querySelector('.name_value').innerText.toLowerCase();
                    return nameB.localeCompare(nameA);
                });
            } else if (sortCheckboxes.salary.checked){
                items.sort((a, b) => {
                    const salaryA = parseSalary(a.querySelector('.point_value').innerText);
                    const salaryB = parseSalary(b.querySelector('.point_value').innerText);
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
                listContainer.appendChild(item);
            });
        }

        function setupPagination(currentFilteredItems) {
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
        const searchInput = searchForm.querySelector('.search-input');

        searchForm.addEventListener('submit', function(e) {
            e.preventDefault();
            const searchTerm = searchInput.value.toLowerCase().trim();

            if (searchTerm) {
                // Lọc theo từ khóa tìm kiếm
                const searchResults = items.filter(item => {
                    const jobTitle = item.querySelector('.name_value').textContent.toLowerCase();
                    const jobType = item.querySelector('.user-speciality').textContent.toLowerCase();
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

        // Xử lý khi người dùng thay đổi các checkbox loại công việc
        Object.values(typeCheckboxes).forEach(cb => {
            cb.addEventListener('change', () => {
                currentPage = 1; // Reset về trang đầu tiên
                filterList();
            });
        });

        // Xử lý khi người dùng thay đổi các checkbox chuyên môn
        Object.values(specialityCheckboxes).forEach(cb => {
            cb.addEventListener('change', () => {
                currentPage = 1;
                filterList();
            });
        });

        // Xử lý khi người dùng thay đổi các checkbox trạng thái
        Object.values(statusCheckboxes).forEach(cb => {
            cb.addEventListener('change', () => {
                currentPage = 1;
                filterList();
            });
        });

        // Xử lý khi người dùng thay đổi các checkbox sắp xếp
        Object.values(sortCheckboxes).forEach(cb => {
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

        // Khởi tạo khi trang tải xong
        filterList();
    });
</script>