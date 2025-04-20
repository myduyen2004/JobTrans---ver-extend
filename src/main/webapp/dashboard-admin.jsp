<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
<%@include file="includes/header-01.jsp"%>
<%@include file="includes/sidebar.jsp"%>
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
                                            <i class="fas fa-users text-dark text-lg opacity-10" aria-hidden="true"></i>
                                        </div>
                                        <h5 class="text-white font-weight-bolder mb-0 mt-3">
                                            1600
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
                                            357
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
                                            2300
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
                                        <h5 class="text-white font-weight-bolder mb-0 mt-3">
                                            940
                                        </h5>
                                        <span class="text-white text-sm">Hoa hồng</span>
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
                            <canvas id="chart-line" class="chart-canvas" height="300"></canvas>
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
                            <button type="button" class="btn btn-sm btn-outline-primary" id="viewWeekly">Theo tuần</button>
                            <button type="button" class="btn btn-sm btn-outline-primary" id="viewMonthly">Theo tháng</button>
                        </div>
                    </div>
                    <div class="card-body p-3">
                        <div id="timePeriodLabel" class="text-sm text-muted mb-2">Tuần hiện tại</div>
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
                                <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" id="transactionFilterDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    Lọc theo ngày
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="transactionFilterDropdown">
                                    <li><a class="dropdown-item" href="javascript:filterTransactions('today')">Hôm nay</a></li>
                                    <li><a class="dropdown-item" href="javascript:filterTransactions('yesterday')">Hôm qua</a></li>
                                    <li><a class="dropdown-item" href="javascript:filterTransactions('week')">Tuần này</a></li>
                                    <li><a class="dropdown-item" href="javascript:filterTransactions('month')">Tháng này</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="javascript:filterTransactions('all')">Tất cả</a></li>
                                </ul>
                            </div>
                        </div>
                        <p class="text-sm mb-0" id="transactionFilterText">
                            <i class="fa fa-calendar text-jobtrans" aria-hidden="true"></i>
                            <span class="font-weight-bold ms-1">Hiển thị giao dịch tuần này</span>
                        </p>
                    </div>
                    <div class="card-body p-3">
                        <div class="table-responsive">
                            <table class="table align-items-center mb-0">
                                <thead>
                                <tr>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Mã giao dịch</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Khách hàng</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Ngày</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Số tiền</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Trạng thái</th>
                                </tr>
                                </thead>
                                <tbody id="transactionTableBody">
                                <tr>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">#JT0451</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="avatar avatar-xs me-2">
                                                <img src="/api/placeholder/24/24" class="rounded-circle" alt="user">
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">Nguyễn Văn A</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="text-xs text-secondary mb-0">13/04/2025</p>
                                    </td>
                                    <td>
                                        <p class="text-xs font-weight-bold mb-0">$2,500</p>
                                    </td>
                                    <td>
                                        <span class="badge bg-success">Thành công</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">#JT0450</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="avatar avatar-xs me-2">
                                                <img src="/api/placeholder/24/24" class="rounded-circle" alt="user">
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">Trần Thị B</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="text-xs text-secondary mb-0">12/04/2025</p>
                                    </td>
                                    <td>
                                        <p class="text-xs font-weight-bold mb-0">$1,800</p>
                                    </td>
                                    <td>
                                        <span class="badge bg-success">Thành công</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">#JT0449</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="avatar avatar-xs me-2">
                                                <img src="/api/placeholder/24/24" class="rounded-circle" alt="user">
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">Lê Văn C</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="text-xs text-secondary mb-0">12/04/2025</p>
                                    </td>
                                    <td>
                                        <p class="text-xs font-weight-bold mb-0">$950</p>
                                    </td>
                                    <td>
                                        <span class="badge bg-success">Thành công</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">#JT0448</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="avatar avatar-xs me-2">
                                                <img src="/api/placeholder/24/24" class="rounded-circle" alt="user">
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">Phạm Thị D</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="text-xs text-secondary mb-0">11/04/2025</p>
                                    </td>
                                    <td>
                                        <p class="text-xs font-weight-bold mb-0">$3,200</p>
                                    </td>
                                    <td>
                                        <span class="badge bg-success">Thành công</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">#JT0447</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="avatar avatar-xs me-2">
                                                <img src="/api/placeholder/24/24" class="rounded-circle" alt="user">
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">Hoàng Văn E</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="text-xs text-secondary mb-0">10/04/2025</p>
                                    </td>
                                    <td>
                                        <p class="text-xs font-weight-bold mb-0">$1,250</p>
                                    </td>
                                    <td>
                                        <span class="badge bg-warning">Đang xử lý</span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <p class="mb-0 text-sm">Hiển thị 5/20 giao dịch</p>
                            <nav aria-label="Transaction pagination">
                                <ul class="pagination pagination-sm mb-0">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 mb-lg-0 mb-4">
                <div class="card">
                    <div class="card-header pb-0 p-3 bg-white">
                        <h6 class="mb-0 text-jobtrans">Tổng quan giao dịch</h6>
                        <p class="text-sm mb-0">
                            <i class="fa fa-arrow-up text-success" aria-hidden="true"></i>
                            <span class="font-weight-bold ms-1">18% tăng</span> so với tháng trước
                        </p>
                    </div>
                    <div class="card-body p-3">
                        <div class="row">
                            <div class="col-6 mb-4">
                                <div class="card bg-gradient-jobtrans border-radius-lg">
                                    <div class="card-body p-3">
                                        <div class="row">
                                            <div class="col-8">
                                                <div class="numbers">
                                                    <p class="text-white text-sm mb-0 opacity-7">Tổng giao dịch</p>
                                                    <h5 class="text-white font-weight-bolder mb-0">
                                                        1,240
                                                    </h5>
                                                </div>
                                            </div>
                                            <div class="col-4 text-end">
                                                <div class="icon icon-shape bg-white shadow text-center border-radius-md">
                                                    <i class="fas fa-exchange-alt text-dark opacity-10" aria-hidden="true"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 mb-4">
                                <div class="card bg-gradient-jobtrans border-radius-lg">
                                    <div class="card-body p-3">
                                        <div class="row">
                                            <div class="col-8">
                                                <div class="numbers">
                                                    <p class="text-white text-sm mb-0 opacity-7">Giá trị trung bình</p>
                                                    <h5 class="text-white font-weight-bolder mb-0">
                                                        $1,850
                                                    </h5>
                                                </div>
                                            </div>
                                            <div class="col-4 text-end">
                                                <div class="icon icon-shape bg-white shadow text-center border-radius-md">
                                                    <i class="fas fa-dollar-sign text-dark opacity-10" aria-hidden="true"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="chart-container pt-3">
                                    <canvas id="transactionStatsChart" height="230"></canvas>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col-6">
                                <div class="d-flex align-items-center">
                                    <div class="rounded-circle me-2" style="width: 12px; height: 12px; background-color: var(--jobtrans-primary);"></div>
                                    <span class="text-sm">Thành công</span>
                                </div>
                                <h4 class="font-weight-bolder mt-2">85.2%</h4>
                                <div class="progress mt-2" style="height: 6px;">
                                    <div class="progress-bar bg-gradient-jobtrans" role="progressbar" style="width: 85%;" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="d-flex align-items-center">
                                    <div class="rounded-circle me-2" style="width: 12px; height: 12px; background-color: #ffc107;"></div>
                                    <span class="text-sm">Đang xử lý</span>
                                </div>
                                <h4 class="font-weight-bolder mt-2">12.5%</h4>
                                <div class="progress mt-2" style="height: 6px;">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 12.5%;" aria-valuenow="12.5" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-6">
                                <div class="d-flex align-items-center">
                                    <div class="rounded-circle me-2" style="width: 12px; height: 12px; background-color: #dc3545;"></div>
                                    <span class="text-sm">Thất bại</span>
                                </div>
                                <h4 class="font-weight-bolder mt-2">1.8%</h4>
                                <div class="progress mt-2" style="height: 6px;">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 1.8%;" aria-valuenow="1.8" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="d-flex align-items-center">
                                    <div class="rounded-circle me-2" style="width: 12px; height: 12px; background-color: #6c757d;"></div>
                                    <span class="text-sm">Hoàn tiền</span>
                                </div>
                                <h4 class="font-weight-bolder mt-2">0.5%</h4>
                                <div class="progress mt-2" style="height: 6px;">
                                    <div class="progress-bar bg-secondary" role="progressbar" style="width: 0.5%;" aria-valuenow="0.5" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Jobs Table -->
        <div class="row my-4">
            <div class="col-lg-12 col-md-6 mb-md-0 mb-4">
                <div class="card">
                    <div class="card-header pb-0 p-3 bg-white">
                        <div class="row">
                            <div class="col-lg-6 col-7">
                                <h6 class="mb-0 text-jobtrans">Công việc trong tháng</h6>
                                <p class="text-sm mb-0">
                                    <i class="fa fa-check text-jobtrans" aria-hidden="true"></i>
                                    <span class="font-weight-bold ms-1">30 công việc</span> hoàn thành trong tháng này
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
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Chi phí</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Tiến độ</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr data-page="soft-ui.html" style="cursor: pointer; transition: background-color 0.3s;">
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="avatar avatar-sm me-3">
                                                <img src="/api/placeholder/30/30" alt="xd">
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">Soft UI XD Version</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <span class="text-xs font-weight-bold">$14,000</span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="progress-wrapper w-75 mx-auto">
                                            <div class="progress-info">
                                                <div class="progress-percentage">
                                                    <span class="text-xs font-weight-bold">60%</span>
                                                </div>
                                            </div>
                                            <div class="progress">
                                                <div class="progress-bar bg-gradient-jobtrans w-60" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <!-- Other table rows remain the same -->
                                <tr data-page="soft-ui.html" style="cursor: pointer; transition: background-color 0.3s;">
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="avatar avatar-sm me-3">
                                                <img src="/api/placeholder/30/30" alt="xd">
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">Soft UI XD Version</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <span class="text-xs font-weight-bold">$14,000</span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="progress-wrapper w-75 mx-auto">
                                            <div class="progress-info">
                                                <div class="progress-percentage">
                                                    <span class="text-xs font-weight-bold">60%</span>
                                                </div>
                                            </div>
                                            <div class="progress">
                                                <div class="progress-bar bg-gradient-jobtrans w-60" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr data-page="soft-ui.html" style="cursor: pointer; transition: background-color 0.3s;">
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="avatar avatar-sm me-3">
                                                <img src="/api/placeholder/30/30" alt="xd">
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">Soft UI XD Version</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <span class="text-xs font-weight-bold">$14,000</span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="progress-wrapper w-75 mx-auto">
                                            <div class="progress-info">
                                                <div class="progress-percentage">
                                                    <span class="text-xs font-weight-bold">60%</span>
                                                </div>
                                            </div>
                                            <div class="progress">
                                                <div class="progress-bar bg-gradient-jobtrans" role="progressbar"
                                                     style="width: 60%;"
                                                     aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                                                    60%
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
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
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Cấu hình gradient
        var ctx2 = document.getElementById("chart-line").getContext("2d");

        var gradientStroke1 = ctx2.createLinearGradient(0, 230, 0, 50);
        gradientStroke1.addColorStop(1, 'rgba(101, 132, 250, 0.2)');
        gradientStroke1.addColorStop(0.2, 'rgba(101, 132, 250, 0.0)');
        gradientStroke1.addColorStop(0, 'rgba(101, 132, 250, 0)');

        var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);
        gradientStroke2.addColorStop(1, 'rgba(21, 32, 112, 0.2)');
        gradientStroke2.addColorStop(0.2, 'rgba(21, 32, 112, 0.0)');
        gradientStroke2.addColorStop(0, 'rgba(21, 32, 112, 0)');

        // Dữ liệu cho 5 năm gần nhất
        new Chart(ctx2, {
            type: "line",
            data: {
                labels: ["2021", "2022", "2023", "2024", "2025"],
                datasets: [{
                    label: "Công việc đăng tải",
                    tension: 0.4,
                    borderWidth: 0,
                    pointRadius: 5,
                    pointBackgroundColor: "#6584fa",
                    pointBorderColor: "transparent",
                    borderColor: "#6584fa",
                    borderWidth: 3,
                    backgroundColor: gradientStroke1,
                    fill: true,
                    data: [2500, 3200, 3800, 4200, 4400],
                    maxBarThickness: 6
                },
                    {
                        label: "Công việc hoàn thành",
                        tension: 0.4,
                        borderWidth: 0,
                        pointRadius: 5,
                        pointBackgroundColor: "#152070",
                        pointBorderColor: "transparent",
                        borderColor: "#152070",
                        borderWidth: 3,
                        backgroundColor: gradientStroke2,
                        fill: true,
                        data: [1800, 2400, 3000, 3500, 3700],
                        maxBarThickness: 6
                    }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: true,
                        position: 'top',
                        labels: {
                            font: {
                                family: "Inter"
                            }
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                let label = context.dataset.label || '';
                                if (label) {
                                    label += ': ';
                                }
                                label += context.parsed.y;
                                return label;
                            }
                        }
                    }
                },
                interaction: {
                    intersect: false,
                    mode: 'index',
                },
                scales: {
                    y: {
                        grid: {
                            drawBorder: false,
                            display: true,
                            drawOnChartArea: true,
                            drawTicks: false,
                            borderDash: [5, 5]
                        },
                        ticks: {
                            display: true,
                            padding: 10,
                            color: '#b2b9bf',
                            font: {
                                size: 11,
                                family: "Inter",
                                style: 'normal',
                                lineHeight: 2
                            },
                        }
                    },
                    x: {
                        grid: {
                            drawBorder: false,
                            display: false,
                            drawOnChartArea: false,
                            drawTicks: false,
                            borderDash: [5, 5]
                        },
                        ticks: {
                            display: true,
                            color: '#b2b9bf',
                            padding: 20,
                            font: {
                                size: 11,
                                family: "Inter",
                                style: 'normal',
                                lineHeight: 2
                            },
                        }
                    },
                },
            },
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        // Dữ liệu cho các chế độ xem
        const viewData = {
            daily: {
                title: "Tuần hiện tại",
                labels: ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'],
                created: [10, 8, 12, 14, 9, 7, 5],
                completed: [7, 6, 10, 11, 8, 5, 3]
            },
            weekly: {
                title: "Tháng hiện tại",
                labels: ['Tuần 1', 'Tuần 2', 'Tuần 3', 'Tuần 4'],
                created: [42, 38, 45, 36],
                completed: [35, 30, 38, 28]
            },
            monthly: {
                title: "Năm 2025",
                labels: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10', 'T11', 'T12'],
                created: [150, 165, 180, 172, 190, 210, 195, 205, 220, 215, 225, 235],
                completed: [120, 140, 155, 148, 165, 180, 172, 185, 190, 188, 195, 205]
            }
        };

        // Tạo datasets từ dữ liệu
        function createDatasets(viewType) {
            return [{
                label: 'Công việc đăng tải',
                data: viewData[viewType].created,
                borderColor: '#6584fa',
                backgroundColor: 'rgba(101, 132, 250, 0.1)',
                fill: true,
                tension: 0.4,
                pointRadius: 4,
                pointBackgroundColor: '#6584fa'
            }, {
                label: 'Công việc hoàn thành',
                data: viewData[viewType].completed,
                borderColor: '#152070',
                backgroundColor: 'rgba(21, 32, 112, 0.1)',
                fill: true,
                tension: 0.4,
                pointRadius: 4,
                pointBackgroundColor: '#152070'
            }];
        }

        // Cấu hình chung cho biểu đồ
        const chartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        font: {
                            family: 'Inter'
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    grid: {
                        color: 'rgba(0, 0, 0, 0.05)'
                    },
                    ticks: {
                        font: {
                            family: 'Inter'
                        }
                    }
                },
                x: {
                    grid: {
                        display: false
                    },
                    ticks: {
                        font: {
                            family: 'Inter'
                        }
                    }
                }
            }
        };

        // Khởi tạo biểu đồ
        const ctx = document.getElementById('jobStatsChart').getContext('2d');
        let jobChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: viewData.daily.labels,
                datasets: createDatasets('daily')
            },
            options: chartOptions
        });

        // Cập nhật nhãn thời gian
        document.getElementById('timePeriodLabel').textContent = viewData.daily.title;

        // Xử lý sự kiện chuyển đổi chế độ xem
        document.getElementById('viewDaily').addEventListener('click', function() {
            updateActiveButton('viewDaily');
            updateChart('daily');
        });

        document.getElementById('viewWeekly').addEventListener('click', function() {
            updateActiveButton('viewWeekly');
            updateChart('weekly');
        });

        document.getElementById('viewMonthly').addEventListener('click', function() {
            updateActiveButton('viewMonthly');
            updateChart('monthly');
        });

        // Hàm cập nhật trạng thái nút active
        function updateActiveButton(activeId) {
            document.getElementById('viewDaily').classList.remove('active');
            document.getElementById('viewWeekly').classList.remove('active');
            document.getElementById('viewMonthly').classList.remove('active');
            document.getElementById(activeId).classList.add('active');
        }

        // Hàm cập nhật biểu đồ
        function updateChart(viewType) {
            jobChart.data.labels = viewData[viewType].labels;
            jobChart.data.datasets = createDatasets(viewType);
            document.getElementById('timePeriodLabel').textContent = viewData[viewType].title;
            jobChart.update();
        }
    });

    // Initialize Daily Revenue Chart
    document.addEventListener('DOMContentLoaded', function() {
        // Dữ liệu mẫu
        const dailyData = {
            labels: ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'],
            datasets: [{
                label: 'Doanh thu (USD)',
                data: [1200, 1500, 1800, 2000, 1700, 900, 800],
                borderColor: '#6584fa',
                backgroundColor: 'rgba(101, 132, 250, 0.1)',
                fill: true,
                tension: 0.4,
                pointRadius: 4,
                pointBackgroundColor: '#6584fa'
            }]
        };

        const monthlyData = {
            labels: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10', 'T11', 'T12'],
            datasets: [{
                label: 'Doanh thu (USD)',
                data: [35000, 42000, 38000, 45000, 48000, 52000, 58000, 56000, 60000, 62000, 65000, 68000],
                borderColor: '#6584fa',
                backgroundColor: 'rgba(101, 132, 250, 0.1)',
                fill: true,
                tension: 0.4,
                pointRadius: 4,
                pointBackgroundColor: '#6584fa'
            }]
        };

        // Cấu hình chung cho biểu đồ
        const chartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        font: {
                            family: 'Inter'
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    grid: {
                        color: 'rgba(0, 0, 0, 0.05)'
                    },
                    ticks: {
                        callback: function(value) {
                            return '$' + value;
                        },
                        font: {
                            family: 'Inter'
                        }
                    }
                },
                x: {
                    grid: {
                        display: false
                    },
                    ticks: {
                        font: {
                            family: 'Inter'
                        }
                    }
                }
            }
        };

        // Tạo biểu đồ
        const ctx = document.getElementById('revenueChart').getContext('2d');
        let revenueChart = new Chart(ctx, {
            type: 'line',
            data: dailyData,
            options: chartOptions
        });

        // Xử lý sự kiện chuyển đổi chế độ xem
        document.getElementById('viewDailyRevenue').addEventListener('click', function() {
            document.getElementById('viewDailyRevenue').classList.add('active');
            document.getElementById('viewMonthlyRevenue').classList.remove('active');
            revenueChart.data = dailyData;
            revenueChart.update();
        });

        document.getElementById('viewMonthlyRevenue').addEventListener('click', function() {
            document.getElementById('viewMonthlyRevenue').classList.add('active');
            document.getElementById('viewDailyRevenue').classList.remove('active');
            revenueChart.data = monthlyData;
            revenueChart.update();
        });
    });

    // Functions for report interactions
    function viewReportDetails(reportId) {
        console.log('Viewing report details for:', reportId);
        // Implement actual view functionality here
        // For example, redirect to report page or show modal
        alert('Viewing details for ' + reportId);
    }

    function viewAllReports() {
        console.log('Viewing all reports');
        // Implement actual view all functionality here
        // For example, redirect to reports page
        alert('Redirecting to all reports page');
    }

    // Add click event listeners to table rows
    document.querySelectorAll('tbody tr').forEach(row => {
        row.addEventListener('click', function() {
            const page = this.getAttribute('data-page');
            if (page) {
                console.log('Navigating to:', page);
                // Uncomment this to actually navigate
                // window.location.href = page;
                alert('Navigating to ' + page);
            }
        });
    });

    // Initialize tooltips and popovers
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    });

    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl)
    });
</script>
<script>
    // Transaction filter functionality
    function filterTransactions(period) {
        let filterText = '';

        switch(period) {
            case 'today':
                filterText = 'Hiển thị giao dịch hôm nay';
                // Here you would normally filter the actual data
                break;
            case 'yesterday':
                filterText = 'Hiển thị giao dịch hôm qua';
                break;
            case 'week':
                filterText = 'Hiển thị giao dịch tuần này';
                break;
            case 'month':
                filterText = 'Hiển thị giao dịch tháng này';
                break;
            case 'all':
                filterText = 'Hiển thị tất cả giao dịch';
                break;
        }

        document.getElementById('transactionFilterText').innerHTML =
            `<i class="fa fa-calendar text-jobtrans" aria-hidden="true"></i>
     <span class="font-weight-bold ms-1">${filterText}</span>`;

        // In a real application, this would refresh the table data based on the filter
        console.log('Filtering transactions for period:', period);
    }

    // Initialize Transaction Stats Chart
    document.addEventListener('DOMContentLoaded', function() {
        var transactionCtx = document.getElementById('transactionStatsChart').getContext('2d');

        // Create gradient for the chart
        var gradientStroke = transactionCtx.createLinearGradient(0, 230, 0, 50);
        gradientStroke.addColorStop(1, 'rgba(101, 132, 250, 0.2)');
        gradientStroke.addColorStop(0.2, 'rgba(72, 72, 176, 0.0)');
        gradientStroke.addColorStop(0, 'rgba(101, 132, 250, 0)');

        new Chart(transactionCtx, {
            type: 'line',
            data: {
                labels: ['08/04', '09/04', '10/04', '11/04', '12/04', '13/04'],
                datasets: [{
                    label: 'Số lượng giao dịch',
                    tension: 0.4,
                    borderWidth: 3,
                    pointRadius: 4,
                    borderColor: '#6584fa',
                    backgroundColor: gradientStroke,
                    fill: true,
                    data: [42, 38, 45, 50, 58, 55],
                    maxBarThickness: 6
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false,
                    }
                },
                interaction: {
                    intersect: false,
                    mode: 'index',
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(0, 0, 0, 0.05)'
                        },
                        ticks: {
                            font: {
                                family: 'Inter'
                            }
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        },
                        ticks: {
                            font: {
                                family: 'Inter'
                            }
                        }
                    }
                }
            }
        });
    });
    function updateProgressBar(selector, percentage) {
        const progressBar = document.querySelector(selector);
        if (progressBar) {
            progressBar.style.width = percentage + '%';
            progressBar.setAttribute('aria-valuenow', percentage);

            // Add percentage text inside if it doesn't exist
            if (!progressBar.querySelector('span') && percentage > 15) {
                const percentText = document.createElement('span');
                percentText.textContent = percentage + '%';
                progressBar.appendChild(percentText);
            } else if (progressBar.querySelector('span')) {
                progressBar.querySelector('span').textContent = percentage + '%';
            }
        }
    }
    // Example usage with a selector
    updateProgressBar('.progress-bar', 75); // Updates all progress bars
    // Or for a specific progress bar
    updateProgressBar('#specific-progress .progress-bar', 60);
</script>
</body>
</html>