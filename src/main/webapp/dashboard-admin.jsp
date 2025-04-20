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



</body>
</html>