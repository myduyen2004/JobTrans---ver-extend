<%@ page import="jobtrans.model.Contract" %>
<%@ page import="java.util.List" %>
<%@ page import="jobtrans.dal.ContractDAO" %>
<%@ page import="java.math.BigDecimal" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/4/2025
  Time: 5:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:useBean id="accountDAO" class="jobtrans.dal.AccountDAO" scope="page" />

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý thanh toán</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Biến màu từ theme chính */
        :root {
            --primary-dark: rgb(21, 42, 105);
            --primary-light: rgb(54, 75, 140);
            --accent-light: rgb(82, 113, 196);
            --accent-highlight: rgb(120, 150, 232);
            --accent-yellow: rgb(255, 196, 0);
            --accent-green: rgb(46, 196, 143);
            --accent-red: rgb(243, 92, 92);
            --text-light: rgb(240, 245, 255);
            --text-dark: rgb(30, 40, 60);
            --bg-light: rgb(248, 250, 255);
            --card-bg: rgb(255, 255, 255);
            --card-shadow: rgba(21, 42, 105, 0.15);
            --border-light: rgba(21, 42, 105, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--bg-light);
            color: var(--text-dark);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }

        .page-header {
            margin-bottom: 2rem;
            position: relative;
            animation: fadeInDown 0.6s ease-out;
        }

        .page-title {
            font-size: 1.8rem;
            color: var(--primary-dark);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .page-title i {
            background: linear-gradient(to right, var(--primary-dark), var(--primary-light));
            color: white;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            font-size: 1.2rem;
        }

        .page-subtitle {
            color: var(--accent-light);
            font-weight: normal;
            font-size: 1rem;
        }

        /* Thanh công cụ */
        .toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: var(--card-bg);
            padding: 1rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px var(--card-shadow);
            margin-bottom: 2rem;
            animation: fadeIn 0.6s ease-out 0.2s backwards;
        }

        .search-bar {
            display: flex;
            align-items: center;
            background-color: var(--bg-light);
            border-radius: 8px;
            padding: 0.5rem 1rem;
            flex: 1;
            max-width: 400px;
            border: 1px solid var(--border-light);
            transition: all 0.2s ease;
        }

        .search-bar:focus-within {
            box-shadow: 0 0 0 2px var(--accent-light);
            border-color: var(--accent-light);
        }

        .search-bar input {
            border: none;
            background: transparent;
            padding: 0.25rem;
            outline: none;
            font-size: 0.95rem;
            color: var(--text-dark);
            width: 100%;
        }

        .search-bar i {
            color: var(--primary-light);
            margin-right: 0.5rem;
        }

        .toolbar-actions {
            display: flex;
            gap: 0.75rem;
        }

        .btn {
            padding: 0.6rem 1.2rem;
            border-radius: 8px;
            font-size: 0.95rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
            transition: all 0.2s ease;
            border: none;
            outline: none;
        }

        .btn-primary {
            background: linear-gradient(to right, var(--primary-dark), var(--primary-light));
            color: white;
        }

        .btn-primary:hover {
            box-shadow: 0 4px 12px rgba(21, 42, 105, 0.3);
            transform: translateY(-2px);
        }

        .btn-outline {
            border: 1px solid var(--primary-light);
            color: var(--primary-light);
            background: transparent;
        }

        .btn-outline:hover {
            background-color: var(--primary-light);
            color: white;
        }

        /* Grid thanh toán */
        .payment-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 1.5rem;
            animation: fadeIn 0.6s ease-out 0.4s backwards;
        }

        .payment-card {
            background: var(--card-bg);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 12px var(--card-shadow);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            border-top: 4px solid transparent;
            background-clip: padding-box;
            animation: cardEntry 0.5s ease forwards;
            opacity: 0;
        }

        .payment-card::before {
            content: '';
            position: absolute;
            top: -4px;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(to right, var(--primary-dark), var(--primary-light), var(--accent-light));
            background-size: 200% 100%;
            animation: gradientShift 3s infinite alternate;
        }

        .payment-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px var(--card-shadow);
        }

        .payment-header {
            padding: 1.25rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .avatar {
            width: 3rem;
            height: 3rem;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-light), var(--primary-dark));
            /*color: var(--text-light);*/
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            box-shadow: 0 2px 8px rgba(21, 42, 105, 0.2);
        }

        .user-name {
            font-weight: 600;
            font-size: 1.1rem;
            /*color: var(--text-dark);*/
        }

        .user-role {
            font-size: 0.85rem;
            color: var(--accent-light);
        }

        .payment-action {
            width: 2.5rem;
            height: 2.5rem;
            border-radius: 8px;
            background-color: rgba(21, 42, 105, 0.08);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-dark);
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .payment-action:hover {
            background-color: var(--primary-dark);
            color: white;
        }

        .payment-details {
            padding: 0 1.25rem 1.25rem;
        }

        .amount-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 0;
            border-bottom: 1px solid var(--border-light);
        }

        .amount-label {
            color: var(--text-dark);
            font-weight: 500;
        }

        .amount-value {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-dark);
            background: linear-gradient(to right, var(--primary-dark), var(--accent-light));
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .payment-meta {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-top: 1.25rem;
        }

        .meta-item {
            display: flex;
            flex-direction: column;
        }

        .meta-label {
            font-size: 0.8rem;
            color: var(--accent-light);
            margin-bottom: 0.25rem;
        }

        .meta-value {
            font-weight: 500;
            color: var(--text-dark);
        }

        .payment-footer {
            padding: 1.25rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid var(--border-light);
            background-color: rgba(248, 250, 255, 0.5);
        }

        .status-badge {
            padding: 0.4rem 0.8rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.35rem;
        }

        .status-pending {
            background-color: rgba(255, 196, 0, 0.15);
            color: rgb(191, 145, 0);
        }

        .status-paid {
            background-color: rgba(46, 196, 143, 0.15);
            color: rgb(23, 148, 108);
        }

        .status-overdue {
            background-color: rgba(243, 92, 92, 0.15);
            color: rgb(203, 58, 58);
        }

        .btn-sm {
            padding: 0.5rem 1rem;
            font-size: 0.85rem;
        }

        /* Thông kê tổng quan */
        .summary-section {
            margin-bottom: 2.5rem;
            animation: fadeIn 0.6s ease-out 0.3s backwards;
        }

        .summary-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }

        .summary-card {
            background: var(--card-bg);
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 4px 12px var(--card-shadow);
            display: flex;
            align-items: center;
            gap: 1rem;
            transition: transform 0.3s ease;
        }

        .summary-card:hover {
            transform: translateY(-3px);
        }

        .summary-icon {
            width: 3rem;
            height: 3rem;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            color: white;
        }

        .icon-total {
            background: linear-gradient(135deg, var(--primary-dark), var(--primary-light));
        }

        .icon-pending {
            background: linear-gradient(135deg, rgb(230, 176, 0), rgb(255, 196, 0));
        }

        .icon-paid {
            background: linear-gradient(135deg, rgb(31, 165, 121), rgb(46, 196, 143));
        }

        .icon-overdue {
            background: linear-gradient(135deg, rgb(220, 68, 68), rgb(243, 92, 92));
        }

        .summary-data {
            flex: 1;
        }

        .summary-value {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 0.25rem;
        }

        .summary-label {
            color: var(--accent-light);
            font-size: 0.9rem;
        }

        /* Tab điều hướng */
        .filter-tabs {
            display: flex;
            gap: 0.5rem;
            margin-bottom: 2rem;
            border-bottom: 1px solid var(--border-light);
            padding-bottom: 0.5rem;
            animation: fadeIn 0.6s ease-out 0.3s backwards;
        }

        .tab {
            padding: 0.75rem 1.5rem;
            border-radius: 8px 8px 0 0;
            font-weight: 500;
            cursor: pointer;
            color: var(--accent-light);
            position: relative;
            transition: all 0.2s ease;
        }

        .tab.active {
            color: var(--primary-dark);
        }

        .tab.active::after {
            content: '';
            position: absolute;
            bottom: -0.5rem;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(to right, var(--primary-dark), var(--primary-light));
            border-radius: 3px 3px 0 0;
        }

        .tab:hover:not(.active) {
            background-color: rgba(82, 113, 196, 0.05);
        }

        /* Pagination */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 2.5rem;
            gap: 0.5rem;
            animation: fadeIn 0.6s ease-out 0.5s backwards;
        }

        .page-item {
            width: 2.5rem;
            height: 2.5rem;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: var(--card-bg);
            color: var(--accent-light);
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: 0 2px 6px var(--card-shadow);
        }

        .page-item.active {
            background: linear-gradient(to right, var(--primary-dark), var(--primary-light));
            color: white;
        }

        .page-item:hover:not(.active) {
            background-color: rgba(82, 113, 196, 0.1);
            color: var(--primary-dark);
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes cardEntry {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes gradientShift {
            0% {
                background-position: 0% 50%;
            }
            100% {
                background-position: 100% 50%;
            }
        }

        /* Staggered delay cho cards */
        .payment-card:nth-child(1) { animation-delay: 0.1s; }
        .payment-card:nth-child(2) { animation-delay: 0.2s; }
        .payment-card:nth-child(3) { animation-delay: 0.3s; }
        .payment-card:nth-child(4) { animation-delay: 0.4s; }
        .payment-card:nth-child(5) { animation-delay: 0.5s; }
        .payment-card:nth-child(6) { animation-delay: 0.6s; }
        .payment-card:nth-child(n+7) { animation-delay: 0.7s; }

        /* Media queries */
        @media (max-width: 768px) {
            .summary-cards {
                grid-template-columns: 1fr;
            }

            .payment-grid {
                grid-template-columns: 1fr;
            }

            .toolbar {
                flex-direction: column;
                gap: 1rem;
            }

            .search-bar {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
<%@include file="includes/header-01.jsp"%>
<div class="container">
    <div class="page-header">
        <h1 class="page-title">
            <i class="fas fa-wallet"></i>
            Quản lý thanh toán hợp đồng
        </h1>
        <p class="page-subtitle">Theo dõi và quản lý các khoản thanh toán cho đối tác</p>
    </div>
    <%
        String jobIdParam = (String) request.getAttribute("jobId");
        int jobId = Integer.parseInt(jobIdParam);
        ContractDAO contractDAO = new ContractDAO();
        List<Contract> contractList = contractDAO.getContractListByJobId(jobId);
        BigDecimal needToPay = new BigDecimal(0);
        BigDecimal paid = new BigDecimal(0);
        BigDecimal rest;

        for (Contract con : contractList){
            needToPay = needToPay.add(con.getJobFee());
            paid = paid.add(con.getJobDepositA());
        }

        rest = needToPay.subtract(paid);
    %>

    <!-- Thống kê tổng quan -->
    <div class="summary-section">
        <div class="summary-cards">
            <div class="summary-card">
                <div class="summary-icon icon-total">
                    <i class="fas fa-money-bill-wave"></i>
                </div>
                <div class="summary-data">
                    <div class="summary-value">
                        <fmt:formatNumber value="<%=needToPay%>" type="number" maxFractionDigits="0" /> ₫
                        </div>
                    <div class="summary-label">Tổng số tiền cần trả</div>
                </div>
            </div>
            <div class="summary-card">
                <div class="summary-icon icon-pending">
                    <i class="fas fa-clock"></i>
                </div>
                <div class="summary-data">
                    <div class="summary-value">
                        <fmt:formatNumber value="<%=paid%>" type="number" maxFractionDigits="0" /> đ</div>
                    <div class="summary-label">Số tiền đã trả</div>
                </div>
            </div>
            <div class="summary-card">
                <div class="summary-icon icon-paid">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="summary-data">
                    <div class="summary-value">
                        <fmt:formatNumber value="<%=rest%>" type="number" maxFractionDigits="0" /> đ</div>
                    <div class="summary-label">Còn thiếu</div>
                </div>
            </div>
        </div>
    </div>
    <!-- Danh sách thanh toán -->
    <div class="payment-grid">
        <c:forEach var="item" items="${contractList}">
            <div class="payment-card" data-contract-id="${item.contractId}">
                <div class="payment-header">
                    <div class="user-info">
                        <div class="avatar">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            <div class="user-name">${item.bName}</div>
                        </div>
                    </div>
                    <div class="payment-action">
                        <i class="fas fa-ellipsis-vertical"></i>
                    </div>
                </div>
                <div class="payment-details">
                    <div class="amount-row">
                        <div class="amount-label">Số tiền cần trả:</div>
                        <div class="amount-value">
                            <fmt:formatNumber value="${item.jobFee}" type="number" maxFractionDigits="0"/> đ
                        </div>
                    </div>
                    <div class="payment-meta">
                        <div class="meta-item">
                            <div class="meta-label">Số tiền đã cọc trước</div>
                            <div class="meta-value">
                                <fmt:formatNumber value="${item.jobDepositA}" type="number" maxFractionDigits="0"/> đ
                            </div>
                        </div>
                        <div class="meta-item">
                            <div class="meta-label">Ngày hẹn trả</div>
                            <div class="meta-value">
                                <fmt:formatDate value="${item.endDate}" pattern="dd/MM/yyyy"/>
                            </div>
                        </div>
                        <div class="meta-item">
                            <div class="meta-label">Phương thức</div>
                            <div class="meta-value">Chuyển khoản</div> <!-- Có thể tùy biến -->
                        </div>
                    </div>
                </div>
                <c:if test="${item.status != 'Hoàn tất thanh lí'}">
                <div class="payment-footer">
                    <button class="btn btn-primary btn-sm">
                        <i class="fas fa-check"></i> Xác nhận
                    </button>
                </div>
                </c:if>
                <c:if test="${item.status == 'Hoàn tất thanh lí'}">
                    <div class="payment-footer" style="color: green; font-weight: bold; padding: 10px; background-color: #f0fff0; border: 1px solid #c0e0c0; border-radius: 5px;">
                        <i class="fas fa-check"></i> Đã trả tiền
                    </div>
                </c:if>
            </div>
        </c:forEach>
    </div>

</div>
<!-- Thêm đoạn mã này vào phần cuối trang ngay trước đóng body -->

<!-- Thêm đoạn mã này vào phần cuối trang ngay trước đóng body -->

<!-- Modal Popup -->
<div id="paymentModal" class="modal-overlay">
    <div class="modal-container">
        <div class="modal-header">
            <h3>Xác nhận thanh toán</h3>
            <span class="close-modal">&times;</span>
        </div>
        <div class="modal-body">
            <p>Bạn có chắc chắn muốn thanh toán số tiền còn lại?</p>
            <div class="payment-amount">
                <span class="amount-label">Số tiền thanh toán:</span>
                <span class="amount-value" id="remainingAmount"></span>
            </div>
            <form id="paymentForm" action="job-manage-process" method="GET">
                <input type="hidden" name="action" value="handle-completion">
                <input type="hidden" name="contractId" id="contractIdInput">
                <input type="hidden" name="paymentAmount" id="paymentAmountInput">
                <input type="hidden" name="jobId" value="<%=jobId%>">
                <div class="form-group">
                    <label for="paymentNote">Ghi chú (không bắt buộc):</label>
                    <textarea id="paymentNote" name="paymentNote" class="form-control" rows="2"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline cancel-btn">Hủy</button>
                    <button type="submit" class="btn btn-primary confirm-btn">Xác nhận thanh toán</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- CSS cho Modal -->
<style>
    .modal-overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.6);
        z-index: 1000;
        justify-content: center;
        align-items: center;
        animation: fadeIn 0.3s ease;
    }

    .modal-container {
        background-color: var(--card-bg);
        border-radius: 12px;
        width: 90%;
        max-width: 500px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        overflow: hidden;
        animation: slideIn 0.3s ease;
    }

    .modal-header {
        padding: 1.25rem;
        border-bottom: 1px solid var(--border-light);
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .modal-header h3 {
        color: var(--primary-dark);
        margin: 0;
        font-size: 1.25rem;
    }

    .close-modal {
        font-size: 1.5rem;
        color: var(--accent-light);
        cursor: pointer;
        transition: color 0.2s;
    }

    .close-modal:hover {
        color: var(--accent-red);
    }

    .modal-body {
        padding: 1.5rem;
    }

    .payment-amount {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 1rem;
        background-color: var(--bg-light);
        border-radius: 8px;
        margin: 1rem 0;
    }

    .amount-label {
        font-weight: 500;
    }

    #remainingAmount {
        font-size: 1.25rem;
        font-weight: 700;
        color: var(--primary-dark);
    }

    .form-group {
        margin-bottom: 1.25rem;
    }

    .form-group label {
        display: block;
        margin-bottom: 0.5rem;
        color: var(--text-dark);
        font-weight: 500;
    }

    .form-control {
        width: 100%;
        padding: 0.75rem;
        border-radius: 8px;
        border: 1px solid var(--border-light);
        background-color: var(--bg-light);
        font-size: 0.95rem;
        transition: border 0.2s, box-shadow 0.2s;
    }

    .form-control:focus {
        outline: none;
        border-color: var(--accent-light);
        box-shadow: 0 0 0 2px rgba(82, 113, 196, 0.2);
    }

    .modal-footer {
        display: flex;
        justify-content: flex-end;
        gap: 1rem;
        margin-top: 1.5rem;
    }

    .cancel-btn {
        border: 1px solid var(--accent-light);
        color: var(--accent-light);
    }

    .confirm-btn {
        background: linear-gradient(to right, var(--primary-dark), var(--primary-light));
        color: white;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    @keyframes slideIn {
        from { transform: translateY(-20px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }
</style>

<!-- JavaScript cho Modal -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Lấy tất cả các nút xác nhận
        var confirmBtns = document.querySelectorAll('.payment-footer .btn-primary');
        var modal = document.getElementById('paymentModal');
        var closeBtn = document.querySelector('.close-modal');
        var cancelBtn = document.querySelector('.cancel-btn');

        // Mở modal khi nhấn vào nút xác nhận
        confirmBtns.forEach(function(btn) {
            btn.addEventListener('click', function(e) {
                e.preventDefault();

                // Lấy thông tin từ card này
                var card = this.closest('.payment-card');

                // Lấy contractId từ data attribute
                var contractId = card.getAttribute('data-contract-id');
                console.log("Contract ID:", contractId); // Để debug

                var jobFeeText = card.querySelector('.amount-value').textContent.trim();
                var depositText = card.querySelector('.meta-value').textContent.trim();

                // Xử lý chuỗi để lấy số (loại bỏ tất cả trừ số)
                var jobFee = jobFeeText.replace(/[^\d]/g, '');
                var deposit = depositText.replace(/[^\d]/g, '');

                // Chuyển đổi sang số nguyên (để tránh vấn đề với số thập phân)
                jobFee = parseInt(jobFee, 10);
                deposit = parseInt(deposit, 10);
                var remainingAmount = jobFee - deposit;

                // Định dạng số tiền với dấu phân cách hàng nghìn
                var formattedAmount = new Intl.NumberFormat('vi-VN').format(remainingAmount) + ' đ';

                // Cập nhật thông tin vào modal
                document.getElementById('remainingAmount').textContent = formattedAmount;
                document.getElementById('contractIdInput').value = contractId;
                document.getElementById('paymentAmountInput').value = remainingAmount;

                // Hiển thị modal
                modal.style.display = 'flex';
            });
        });

        // Đóng modal
        function closeModal() {
            modal.style.display = 'none';
        }

        closeBtn.addEventListener('click', closeModal);
        cancelBtn.addEventListener('click', closeModal);

        // Đóng modal khi click bên ngoài
        window.addEventListener('click', function(e) {
            if (e.target === modal) {
                closeModal();
            }
        });
    });
</script>
<%@include file="includes/footer.jsp"%>
</body>
</html>
