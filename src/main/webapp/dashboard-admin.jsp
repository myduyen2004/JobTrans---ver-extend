<%@ page import="jobtrans.dal.DashboardDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobTrans Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/dashboard-admin.css">

</head>
<jsp:useBean id="dashboard" class="jobtrans.dal.DashboardDAO" scope="session"></jsp:useBean>
<%@include file="includes/header-01.jsp"%>
<%@include file="includes/sidebar.jsp"%>
<script src="./js/dashboard-admin.js"></script>
<body class="g-sidenav-show bg-gray-100">
<div class="content" id="content">
    <div class="main-content">
<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
    <div class="container-fluid py-4">
        <!-- Stats Cards -->
        <div class="row">
            <div class="col-lg-6 col-12" style="margin-top: 10px;">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="card stats-card">
                            <div class="card-body p-3 position-relative">
                                <div class="row">
                                    <div class="col-8 text-start">
                                        <div class="icon icon-shape bg-white shadow text-center border-radius-2xl">
                                            <i class="fas fa-users text-black text-lg opacity-10" aria-hidden="true"></i>
                                        </div>
                                        <h5 class="text-white font-weight-bolder mb-0 mt-3">
                                            ${dashboard.dashboardStats.totalUsers}
                                        </h5>
                                        <span class="text-white text-sm">Người dùng</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12 mt-4 mt-md-0">
                        <div class="card stats-card">
                            <div class="card-body p-3 position-relative">
                                <div class="row">
                                    <div class="col-8 text-start">
                                        <div class="icon icon-shape bg-white shadow text-center border-radius-2xl">
                                            <i class="fa-solid fa-file text-dark text-lg opacity-10" aria-hidden="true"></i>
                                        </div>
                                        <h5 class="text-white font-weight-bolder mb-0 mt-3">
                                            ${dashboard.dashboardStats.totalJobs}
                                        </h5>
                                        <span class="text-white text-sm">Công việc</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="card stats-card">
                            <div class="card-body p-3 position-relative">
                                <div class="row">
                                    <div class="col-8 text-start">
                                        <div class="icon icon-shape bg-white shadow text-center border-radius-2xl">
                                            <i class="fa-solid fa-sack-dollar text-dark text-lg opacity-10" aria-hidden="true"></i>
                                        </div>
                                        <h5 class="text-white font-weight-bolder mb-0 mt-3">
                                            ${dashboard.dashboardStats.totalTransactions}
                                        </h5>
                                        <span class="text-white text-sm">Tổng giao dịch</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12 mt-4 mt-md-0">
                        <div class="card stats-card">
                            <div class="card-body p-3 position-relative">
                                <div class="row">
                                    <div class="col-8 text-start">
                                        <div class="icon icon-shape bg-white shadow text-center border-radius-2xl">
                                            <i class="fa-solid fa-money-bill text-dark text-lg opacity-10" aria-hidden="true"></i>
                                        </div>
                                        <h5 class="text-white font-weight-bolder mb-0 mt-3" >
                                            <fmt:formatNumber value="${dashboard.dashboardStats.totalCommission}" pattern="#,###.00" /> VND
                                        </h5>
                                        <span class="text-white text-sm">Tiền hoa hồng</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card z-index-2">
                    <div class="card-header pb-0 p-3 bg-white">
                        <h6 class="mb-0 text-jobtrans">Thống kê công việc</h6>
                        <p class="text-sm">
                            <i class="fa fa-arrow-up text-success"></i>
                            <span class="font-weight-bold">4% tăng</span> trong năm 2025
                        </p>
                    </div>
                    <div class="card-body p-3">
                        <div class="chart">
                            <canvas id="jobsByYearsChart" width="400" height="200"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Daily Revenue Chart -->
            <div class="col-lg-6">
                <div class="card z-index-2">
                    <div class="card-header pb-0 p-3 bg-white d-flex justify-content-between align-items-center">
                        <h6 class="mb-0 text-jobtrans">Doanh thu</h6>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-sm btn-outline-primary active" id="viewDailyRevenue">Theo ngày</button>
                            <button type="button" class="btn btn-sm btn-outline-primary" id="viewMonthlyRevenue">Theo tháng</button>
                        </div>
                    </div>
                    <div class="card-body p-3">
                        <div class="chart-container">
                            <canvas id="revenueChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mb-lg-0 mb-4">
                <div class="card z-index-2">
                    <div class="card-header pb-0 p-3 bg-white d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="mb-0 text-jobtrans">Thống kê công việc</h6>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-sm btn-outline-primary active" id="viewDaily">Theo ngày</button>
                            <button type="button" class="btn btn-sm btn-outline-primary" id="viewMonthly">Theo tháng</button>
                        </div>
                    </div>
                    <div class="card-body p-3">

                        <div class="chart-container">
                            <canvas id="jobStatsChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>


        </div>

        <!-- Charts -->
        <div class="row mt-4">
            <!-- Daily Jobs Chart -->

            <div class="col-lg-6 mb-lg-0 mb-4">
                <div class="card">
                    <div class="card-header pb-0 p-3 bg-white">
                        <div class="d-flex justify-content-between">
                            <h6 class="mb-0 text-jobtrans">Thống kê giao dịch</h6>
                            <div class="dropdown">
                                <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button"
                                        id="transactionFilterDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    Lọc theo ngày
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="transactionFilterDropdown">
                                    <li><a class="dropdown-item" href="#">Hôm nay</a></li>
                                    <li><a class="dropdown-item" href="#">Hôm qua</a></li>
                                    <li><a class="dropdown-item" href="#">Tuần này</a></li>
                                    <li><a class="dropdown-item" href="#">Tất cả</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-3">
                        <div class="table-responsive">
                            <table class="table align-items-center mb-0">
                                <thead>
                                <tr>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Số thứ tự</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Người gửi</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Ngày</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Số tiền</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Trạng thái</th>
                                </tr>
                                </thead>
                                <tbody id="transactionTableBody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <p class="mb-0 text-sm"><span id="transactionCount"></span></p>
                            <nav aria-label="Transaction pagination">
                                <ul class="pagination pagination-sm mb-0" id="paginationControls">
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <!-- Jobs Table -->
        <%
            String jobPageParam = request.getParameter("jobPage");
            int currentJobPage = 1;
            int pageSize = 5; // You can configure this

            if (jobPageParam != null && !jobPageParam.isEmpty()) {
                try {
                    currentJobPage = Integer.parseInt(jobPageParam);
                    if (currentJobPage <= 0) {
                        currentJobPage = 1;
                    }
                } catch (NumberFormatException e) {
                    currentJobPage = 1;
                }
            }

            Map<String, Object> paginatedJobsResult = dashboard.getJobsForCurrentMonthPaginated(currentJobPage, pageSize);
            List<Map<String, Object>> jobs = (List<Map<String, Object>>) paginatedJobsResult.get("jobs");
            int totalPages = (Integer) paginatedJobsResult.get("totalPages");

            // Đặt currentJobPage vào request attributes
            request.setAttribute("currentPage", currentJobPage);

            request.setAttribute("jobs", jobs);
        %>

        <div class="row my-4">
            <div class="col-lg-12 col-md-6 mb-md-0 mb-4">

                <div class="card">
                    <div class="card-header pb-0 p-3 bg-white">
                        <div class="row">
                            <div class="col-lg-6 col-7">
                                <h6 class="mb-0 text-jobtrans">Công việc trong tháng</h6>
                                <p class="text-sm mb-0">
                                    <i class="fa fa-check text-jobtrans" aria-hidden="true"></i>
                                    <span class="font-weight-bold ms-1">Công việc</span> hoàn thành trong tháng này
                                </p>
                            </div>
                            <div class="col-lg-6 col-5 my-auto text-end">
                            </div>
                        </div>
                    </div>
                    <div class="card-body px-0 pb-2">
                        <div class="table-responsive">
                            <table class="table align-items-center mb-0">
                                <thead>
                                <tr>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Công việc</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" style="padding-left: 160px; padding-right: 0px;">Thời gian</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Chi phí</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Tiến độ</th>
                                </tr>
                                </thead>a
                                <tbody>
                                <c:forEach items="${jobs}" var="job">

                                    <tr style="cursor: pointer; transition: background-color 0.3s;">
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">${job.name}</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span class="text-xs font-weight-bold">${job.due_date_job}</span>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span class="text-xs font-weight-bold">${job.secureWallet} VND</span>
                                        </td>

                                        <td class="align-middle text-center text-sm">
                                            <c:choose>
                                                <c:when test="${job.progress == -1}">
                                                    <span class="badge bg-danger">${job.progressText}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="progress-wrapper w-75 mx-auto">
                                                        <div class="progress-info">
                                                            <div class="progress-percentage">
                                                                <span class="text-xs font-weight-bold">${job.progressText}</span>
                                                            </div>
                                                        </div>
                                                        <div class="progress">
                                                            <div class="progress-bar bg-gradient-jobtrans" role="progressbar"
                                                                 style="width: ${job.progress}%;"
                                                                 aria-valuenow="${job.progress}" aria-valuemin="0" aria-valuemax="100">
                                                                    ${job.progressText}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-12">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link" href="?jobPage=${currentPage - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <% for (int i = 1; i <= totalPages; i++) { %>
                        <li class="page-item ${currentPage == i ? 'active' : ""}">
                            <a class="page-link" href="?jobPage=<%= i %>"><%= i %></a>
                        </li>
                        <% } %>
                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ""}">
                            <a class="page-link" href="?jobPage=${currentPage + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</main>
</div>
    <%@include file="includes/footer.jsp"%>
</div>


<!-- Core JS Files -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%--xử lý biểu đồ cuối cùng--%>
<script>// Lấy các phần tử DOM
const transactionTableBody = document.getElementById('transactionTableBody');
const paginationControls = document.getElementById('paginationControls');
const transactionCountElement = document.getElementById('transactionCount');
const filterDropdownButton = document.getElementById('transactionFilterDropdown');
const dropdownItems = document.querySelectorAll('.dropdown-menu .dropdown-item');
const itemsPerPage = 5;
let currentPage = 1;
let currentPeriod = 'all'; // Giá trị mặc định phù hợp với backend

// Hàm để tải dữ liệu giao dịch từ Servlet
async function loadTransactions(page, period) {
    // Kiểm tra và đảm bảo period không bị null hoặc undefined
    if (!period) {
        period = currentPeriod;
    } else {
        currentPeriod = period;
    }

    currentPage = page;

    // Log để debug
    console.log('loadTransactions được gọi với period:', period);
    console.log('loadTransactions được gọi với page:', page);
    // Tạo URL với đúng tham số
    const url = "/JobTrans/Transactions?period=" + period + "&page=" + page;
    console.log('Request URL:', url);

    try {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        displayTransactions(data.transactions);
        updatePagination(data.totalRecords);
        console.log('Tổng số bản ghi:', data.totalRecords);
    } catch (error) {
        console.error("Lỗi khi tải giao dịch:", error);
        transactionTableBody.innerHTML = '<tr><td colspan="5" class="text-center">Không thể tải dữ liệu.</td></tr>';
        paginationControls.innerHTML = '';
        transactionCountElement.textContent = '';
    }
}

// Hàm để hiển thị dữ liệu giao dịch lên bảng
function displayTransactions(transactions) {
    transactionTableBody.innerHTML = '';
    console.log('Hiển thị dữ liệu giao dịch:', transactions);

    if (transactions && transactions.length > 0) {
        transactions.forEach((transaction, index) => {
            const row = transactionTableBody.insertRow();
            const sttCell = row.insertCell();
            const senderCell = row.insertCell();
            const dateCell = row.insertCell();
            const amountCell = row.insertCell();
            const statusCell = row.insertCell();

            sttCell.textContent = (currentPage - 1) * itemsPerPage + index + 1;
            senderCell.textContent = transaction.Account || 'N/A';
            dateCell.textContent = transaction.CreatedDate || 'N/A';
            amountCell.textContent = formatCurrency(transaction.Amount) || 'N/A';
            statusCell.innerHTML = getStatusBadge(transaction.Status);
        });
        console.log('Bảng đã được cập nhật.');
    } else {
        transactionTableBody.innerHTML = '<tr><td colspan="5" class="text-center">Không có giao dịch nào.</td></tr>';
        console.log('Không có dữ liệu để hiển thị hoặc mảng rỗng.');
    }
}

// Hàm định dạng tiền tệ
function formatCurrency(amount) {
    return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
}

// Hàm để tạo badge trạng thái - Đã sửa toán tử so sánh
function getStatusBadge(status) {
    if (status == 1) {
        return '<span class="badge bg-success">Thành công</span>';
    } else if (status == 0) {
        return '<span class="badge bg-warning">Đang xử lý</span>';
    } else {
        return '<span class="badge bg-secondary">Không xác định</span>';
    }
}

// Hàm để cập nhật phân trang
function updatePagination(totalRecords) {
    paginationControls.innerHTML = '';
    const totalPages = Math.ceil(totalRecords / itemsPerPage);

    console.log('Tổng số trang:', totalPages);
    console.log('Trang hiện tại:', currentPage);
    console.log('Period hiện tại khi tạo phân trang:', currentPeriod);

    if (totalPages > 1) {
        // Nút Previous
        const prevLi = createPaginationButton('Previous', currentPage > 1 ? currentPage - 1 : null);
        paginationControls.appendChild(prevLi);

        // Các nút số trang
        for (let i = 1; i <= totalPages; i++) {
            const pageLi = createPaginationButton(i, i);
            if (i === currentPage) {
                pageLi.classList.add('active');
            }
            paginationControls.appendChild(pageLi);
        }

        // Nút Next
        const nextLi = createPaginationButton('Next', currentPage < totalPages ? currentPage + 1 : null);
        paginationControls.appendChild(nextLi);
    }
}

// Hàm tạo một nút phân trang
function createPaginationButton(label, page) {
    const li = document.createElement('li');
    const link = document.createElement('a');
    li.classList.add('page-item');

    if (page === null) {
        li.classList.add('disabled');
    }

    link.classList.add('page-link');
    link.href = '#';
    link.textContent = label;

    if (page !== null) {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            console.log(`Clicked on page ${page} with period ${currentPeriod}`);
            // Quan trọng: Truyền cả period hiện tại vào
            loadTransactions(page, currentPeriod);
        });
    }

    li.appendChild(link);
    return li;
}

// Ánh xạ giữa text hiển thị và giá trị gửi đến server
const filterMapping = {
    'hôm nay': 'today',
    'hôm qua': 'yesterday',
    'tuần này': 'week',
    'tất cả': 'all'
};

// Gắn sự kiện cho các mục dropdown lọc
dropdownItems.forEach(item => {
    item.addEventListener('click', function(event) {
        event.preventDefault();
        const displayText = this.textContent.trim();
        const period = filterMapping[displayText.toLowerCase()] || 'all';

        console.log('Lọc theo:', displayText, 'với giá trị:', period);
        // Cập nhật biến currentPeriod trước khi gọi loadTransactions
        currentPeriod = period;
        loadTransactions(1, period);
        filterDropdownButton.textContent = displayText;
    });
});

// Lưu period hiện tại vào localStorage để giữ giữa các lần refresh trang
function savePeriodToStorage() {
    localStorage.setItem('currentTransactionPeriod', currentPeriod);
}

// Khôi phục period từ localStorage nếu có
function restorePeriodFromStorage() {
    const savedPeriod = localStorage.getItem('currentTransactionPeriod');
    if (savedPeriod) {
        currentPeriod = savedPeriod;
    }
}

// Tải trang đầu tiên với bộ lọc mặc định khi trang web được tải
document.addEventListener('DOMContentLoaded', function() {
    // Khôi phục period nếu có lưu trước đó
    restorePeriodFromStorage();

    console.log('Trang đã tải - Khởi tạo với period:', currentPeriod);
    loadTransactions(1, currentPeriod);

    // Lắng nghe sự kiện beforeunload để lưu period hiện tại
    window.addEventListener('beforeunload', savePeriodToStorage);
});
</script>


</body>
</html>