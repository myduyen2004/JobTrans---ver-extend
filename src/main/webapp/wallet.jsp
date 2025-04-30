<%--
    Document   : wallet
    Created on : Mar 4, 2025, 10:23:59 AM
    Author     : qn407
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobTrans - Trang Cá Nhân</title>
    <link rel="stylesheet" type="text/css" href="css/wallet.css"/>
    <style>
        #noResults {
            display: none;
            margin-top: 10px;
            color: #888;
            font-style: italic;
        }
    </style>

</head>

<body>
<%@include file="includes/header-01.jsp" %>
<%--<%@include file="includes/sidebar.jsp" %>--%>

<div class="content" id="content">
    <div class="main-content">
        <!-- Profile Section -->
        <div class="profile-section">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <div class="d-flex align-items-center">
                        <img class="profile-avatar me-4" src="${account.avatar}" alt="Nguyễn Văn User">
                        <div>
                            <h2 class="mb-2">${account.accountName}</h2>
                            <div class="rating mb-2">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="social-icons">
                                <a href="#" class="social-icon linkedin">
                                    <i class="fab fa-linkedin-in"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="d-flex justify-content-md-end mt-3 mt-md-0">
                        <div class="row">
                            <div class="stat-label text-muted">Số điểm:</div>
                            <div class="stat-value"><i class="fas fa-medal me-1"></i>${account.point} điểm</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Account Balance Section -->
        <div class="account-balance">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h3 class="fw-bold mb-3"><i class="fas fa-wallet me-2"></i>Số dư tài khoản:</h3>
                    <div class="d-flex align-items-center">
                        <span class="h4 mb-0">
                            <fmt:formatNumber value="${account.amountWallet}" type="number" groupingUsed="true"/> VNĐ
                        </span>
                        <span class="ms-2 text-muted">Xu</span>
                    </div>
                </div>
                <div class="col-md-4 text-md-end mt-3 mt-md-0">
                    <button class="btn btn-deposit btn-lg me-2" onclick="location.href='vnpay.jsp'">
                        <i class="fas fa-plus-circle me-2"></i>Nạp
                    </button>
                    <button class="btn btn-withdraw btn-lg" onclick="location.href='WithdrawServlet'">
                        <i class="fas fa-minus-circle me-2"></i>Rút
                    </button>
                </div>

            </div>
        </div>

        <!-- Transactions Section -->

        <!-- Filter Section -->
        <div class="transactions">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="fw-bold"><i class="fas fa-history me-2"></i>Giao dịch</h3>
            </div>
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="dateFilter" class="form-label">Lọc theo ngày:</label>
                    <input type="date" id="dateFilter" class="form-control" onchange="filterTransactions()">
                </div>
            </div>

            <!-- Transaction Table -->
            <div class="table-responsive">
                <table id="transactionTable" class="table table-hover">
                    <thead class="table-light">
                    <tr>
                        <th><i class="far fa-clock me-2"></i>Giờ</th>
                        <th><i class="fas fa-coins me-2"></i>Số tiền</th>
                        <th><i class="fas fa-exchange-alt me-2"></i>Hình thức</th>
                        <th><i class="fas fa-info-circle me-2"></i>Trạng thái</th>
                        <th><i class="fas fa-comment-alt me-2"></i>Nội dung</th>
                    </tr>
                    </thead>
                    <tbody id="transactionBody">

                    <c:forEach var="trans" items="${transList}">
                        <tr class="transactionRow">
                        <td>
                                <fmt:formatDate value="${trans.createdDate}" pattern="HH:mm:ss dd/MM/yyyy"/>
                            </td>
                            <td>
                                <fmt:formatNumber value="${trans.amount}" type="number" groupingUsed="true"/> VNĐ
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${trans.transactionType == 'DEPOSIT'}">
                                        <span class="badge bg-deposit"><i
                                                class="fas fa-plus-circle me-1"></i>Nạp tiền</span>
                                    </c:when>
                                    <c:when test="${trans.transactionType == 'WITHDRAW'}">
                                        <span class="badge bg-withdraw"><i class="fas fa-minus-circle me-1"></i>Rút tiền</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-secondary"><i class="fas fa-question-circle me-1"></i>Khác</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${trans.status}">
                                        <span class="badge bg-success-status"><i class="fas fa-check-circle me-1"></i>Thành công</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-failed-status"><i class="fas fa-times-circle me-1"></i>Thất bại</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${trans.description}</td>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
                <c:if test="${empty transList}">
                    <div id="noResults">
                        <i class="fas fa-search me-2"></i>Không tìm thấy giao dịch nào phù hợp với bộ lọc
                    </div>
                </c:if>
            </div>
            <nav>
                <ul class="pagination justify-content-center mt-3" id="pagination">
                    <!-- Các nút phân trang sẽ được thêm bằng JS -->
                </ul>
            </nav>

        </div>
    </div>

</div>
<script>
    const rowsPerPage = 5;
    let currentPage = 1;
    let filteredRows = [];

    function formatDate(dateString) {
        const parts = dateString.split(" ");
        return parts[1].split("/").reverse().join("-");
    }

    function filterTransactions() {
        const dateInput = document.getElementById("dateFilter").value;
        const allRows = Array.from(document.querySelectorAll(".transactionRow"));

        if (dateInput === "") {
            filteredRows = allRows;
        } else {
            filteredRows = allRows.filter(row => {
                const dateText = row.querySelector("td").innerText.trim(); // lấy cột giờ
                const rowDate = formatDate(dateText);
                return rowDate === dateInput;
            });
        }

        currentPage = 1;
        updateTable();
        updatePagination();
    }

    function updateTable() {
        const allRows = Array.from(document.querySelectorAll(".transactionRow"));
        allRows.forEach(row => row.style.display = "none");

        const start = (currentPage - 1) * rowsPerPage;
        const end = start + rowsPerPage;

        filteredRows.slice(start, end).forEach(row => row.style.display = "");
    }

    function updatePagination() {
        const totalPages = Math.ceil(filteredRows.length / rowsPerPage);
        const pagination = document.getElementById("pagination");

        pagination.innerHTML = "";

        for (let i = 1; i <= totalPages; i++) {
            const li = document.createElement("li");
            li.classList.add("page-item");
            if (i === currentPage) li.classList.add("active");

            const a = document.createElement("a");
            a.classList.add("page-link");
            a.href = "#";
            a.innerText = i;
            a.addEventListener("click", function (e) {
                e.preventDefault();
                currentPage = i;
                updateTable();
                updatePagination();
            });

            li.appendChild(a);
            pagination.appendChild(li);
        }

        // Ẩn thông báo nếu có dữ liệu
        document.getElementById("noResults").style.display = filteredRows.length === 0 ? "block" : "none";
    }

    // Khởi tạo khi trang load
    window.addEventListener("DOMContentLoaded", function () {
        filteredRows = Array.from(document.querySelectorAll(".transactionRow"));
        updateTable();
        updatePagination();
    });
</script>

<%@include file="includes/footer.jsp" %>

</body>
</html>