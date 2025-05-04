<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách hợp đồng đã ký kết</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/list-contract.css">
    <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="page" />
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Danh sách hợp đồng đã ký kết của công việc</h1>
        <div class="date">
            <i class="fas fa-calendar-alt"></i>
            <script>
                const today = new Date();
                document.write(today.toLocaleDateString('vi-VN', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' }));
            </script>
        </div>
    </div>
<%--Mở rộng--%>
<%--    <div class="search-filter">--%>
<%--        <div class="search-box">--%>
<%--            <i class="fas fa-search"></i>--%>
<%--            <input type="text" placeholder="Tìm kiếm theo tên dự án, bên A hoặc bên B...">--%>
<%--        </div>--%>
<%--        <select class="filter-select">--%>
<%--            <option value="all">Tất cả hợp đồng</option>--%>
<%--            <option value="recent">Ký kết gần đây</option>--%>
<%--            <option value="old">Ký kết cũ nhất</option>--%>
<%--            <option value="expiring">Sắp hết hạn</option>--%>
<%--        </select>--%>
<%--    </div>--%>

    <div class="contracts-list">
        <c:forEach var="contract" items="${contractList}" >
            <div class="contract-card">
                <div class="contract-header">
                    <div style="width: 80%;">
                        <div class="contract-title">${job.jobTitle}</div>
                        <div class="contract-id">${contract.contractId}</div>
                    </div>
                    <div>
                        <div class="contract-status">Kí kết thành công</div>
                    </div>

                </div>
                <div class="contract-body">
                    <div class="contract-parties">
                        <div class="party">
                            <div class="party-label">Bên A (Chủ dự án)</div>
                            <div class="party-name">${contract.aName}</div>
                        </div>
                        <div class="party">
                            <div class="party-label">Bên B (Người thực hiện)</div>
                            <div class="party-name">${contract.bName}</div>
                        </div>
                    </div>
                    <div class="contract-details">
                        <div class="detail-item">
                            <div class="detail-label">Ngày bắt đầu</div>
                            <div class="detail-value">${contract.startDate}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Ngày kết thúc</div>
                            <div class="detail-value">${contract.endDate}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Giá trị hợp đồng</div>
                            <div class="detail-value">${contract.jobFee} VNĐ</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Ngày ký kết</div>
                            <div class="detail-value">25/02/2025</div>
                        </div>
                    </div>
                </div>
                <div class="contract-footer">
                    <button class="view-btn">
                        <i class="fas fa-eye"></i> Xem chi tiết
                    </button>
                    <button class="download-btn">
                        <i class="fas fa-download"></i> Tải xuống
                    </button>
                </div>
            </div>
        </c:forEach>

    </div>

    <div class="pagination">
        <button class="page-btn active">1</button>
        <button class="page-btn">2</button>
        <button class="page-btn">3</button>
        <button class="page-btn">
            <i class="fas fa-ellipsis-h"></i>
        </button>
        <button class="page-btn">10</button>
        <button class="page-btn">
            <i class="fas fa-chevron-right"></i>
        </button>
    </div>
</div>

<script>
    // Animation for cards
    document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.contract-card');

        cards.forEach((card, index) => {
            setTimeout(() => {
                card.style.opacity = '1';
                card.style.transform = 'translateY(0)';
            }, 100 * index);
        });

        // Search functionality
        const searchInput = document.querySelector('.search-box input');
        searchInput.addEventListener('keyup', function() {
            const searchValue = this.value.toLowerCase();
            const cards = document.querySelectorAll('.contract-card');

            cards.forEach(card => {
                const title = card.querySelector('.contract-title').textContent.toLowerCase();
                const partyA = card.querySelector('.party-name').textContent.toLowerCase();
                const partyB = card.querySelectorAll('.party-name')[1].textContent.toLowerCase();

                if (title.includes(searchValue) || partyA.includes(searchValue) || partyB.includes(searchValue)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });

        // Pagination
        const pageButtons = document.querySelectorAll('.page-btn');
        pageButtons.forEach((btn, index) => {
            btn.addEventListener('click', function() {
                // Remove active class from all buttons
                pageButtons.forEach(b => b.classList.remove('active'));

                // Add active class to clicked button
                this.classList.add('active');

                // Simulate page change with animation
                const contractsList = document.querySelector('.contracts-list');
                contractsList.style.opacity = '0';

                setTimeout(() => {
                    contractsList.style.opacity = '1';
                }, 300);
            });
        });

        // Filter select change
        const filterSelect = document.querySelector('.filter-select');
        filterSelect.addEventListener('change', function() {
            const contractsList = document.querySelector('.contracts-list');
            contractsList.style.opacity = '0';

            setTimeout(() => {
                contractsList.style.opacity = '1';
                // Here you would normally filter the data based on the selection
            }, 300);
        });
    });
</script>
</body>
</html>