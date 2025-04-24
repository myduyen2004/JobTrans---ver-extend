<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <jsp:useBean id="accountDAO" class="jobtrans.dal.AccountDAO" scope="page" />
    <link rel="stylesheet" href="css/candidate-list.css">
</head>
<body>

<div class="container">
<%@include file="includes/header-01.jsp"%>
    <section class="job-header">
        <div class="job-title">
            <div>
                <h1>${job.jobTitle}</h1>
                <div class="applicant-meta">
                    <span><i class="fas fa-user"></i> ${poster.accountName}</span>
                    <span><i class="fas fa-map-marker-alt"></i> ${poster.address}</span>
                    <span><i class="fas fa-calendar-alt"></i> Đăng ngày: ${postDateFormatted}</span>
                </div>
            </div>
            <span class="job-status">${job.statusPost}</span>
        </div>

        <div class="job-details">
            <div class="detail-item">
                <i class="fas fa-money-bill-wave"></i>
                <div>
                    <strong>Ngân sách:</strong>
                    <p>${budgetRange}</p>
                </div>
            </div>
            <div class="detail-item">
                <i class="fas fa-calendar-check"></i>
                <div>
                    <strong>Hạn ứng tuyển:</strong>
                    <p>${dueDatePostFormatted}</p>
                </div>
            </div>
            <div class="detail-item">
                <i class="fas fa-clock"></i>
                <div>
                    <strong>Thời gian còn lại:</strong>
                    <p>${daysLeft}</p>
                </div>
            </div>
            <div class="detail-item">
                <i class="fas fa-users"></i>
                <div>
                    <strong>Số lượng tuyển dụng:</strong>
                    <p>${job.numOfMember}</p>
                </div>
            </div>
        </div>

        <div class="job-description">
            <h3 style="margin-bottom: 10px;">Mô tả công việc</h3>
            <p>${job.jobDescription}</p>
        </div>
    </section>

    <div class="greeting-filters">
        <div class="filter-group">
            <div class="filter-title">Trạng thái:</div>
            <div class="filter-options">
                <div class="filter-option active">Tất cả</div>
                <div class="filter-option">Chờ xét duyệt</div>
                <div class="filter-option">Chờ phỏng vấn</div>
                <div class="filter-option">Bị từ chối</div>
                <div class="filter-option">Được nhận</div>
            </div>
        </div>

        <div class="filter-group">
            <div class="filter-title">Sắp xếp:</div>
            <div class="filter-options">
                <div class="filter-option active">Mới nhất</div>
                <div class="filter-option">Giá cao nhất</div>
                <div class="filter-option">Thời gian ngắn nhất</div>
            </div>
        </div>
    </div>

    <section class="applicants-list">
        <h2 style="margin-bottom: 30px">Danh Sách Ứng Viên (${job.jobGreetingList.size( )})</h2>

        <!-- Ứng viên 1 -->
        <c:if test="${not empty job.jobGreetingList}">
            <c:forEach var="greeting" items="${job.jobGreetingList}">
                <div class="applicant-card pulse">
                    <div class="applicant-avatar">
                        <img src="${accountDAO.getAccountById(greeting.jobSeekerId).avatar}" alt="Avatar của ${accountDAO.getAccountById(greeting.jobSeekerId).accountName}">
                    </div>
                    <div class="applicant-info">
                        <div class="applicant-name">
                            Nguyễn Văn A
                            <i class="fas fa-check-circle verified-badge" title="Đã xác thực"></i>
                        </div>
                        <div class="applicant-meta">
                            <span><i class="fas fa-star"></i> ${accountDAO.getAccountById(greeting.jobSeekerId).starRate}</span>
                            <span><i class="fas fa-briefcase"></i> ${accountDAO.getAccountById(greeting.jobSeekerId).experienceYears} năm kinh nghiệm</span>
                            <span><i class="fas fa-money-bill"></i> ${greeting.price}</span>
                            <span><i class="fas fa-calendar"></i> ${greeting.expectedDay}</span>
                        </div>
<%--                        <div class="applicant-skills">--%>
<%--                            <span class="skill-tag">ReactJS</span>--%>
<%--                            <span class="skill-tag">NodeJS</span>--%>
<%--                            <span class="skill-tag">MongoDB</span>--%>
<%--                            <span class="skill-tag">UI/UX</span>--%>
<%--                        </div>--%>
                    </div>
                    <div class="applicant-actions">
                        <c:if test="${greeting.status == 'Chờ xét duyệt'}">
                            <span class="status-badge status-pending">${greeting.status}</span>
                        </c:if>
                        <c:if test="${greeting.status == 'Chờ phỏng vấn'}">
                            <span class="status-badge status-interview">${greeting.status}</span>
                        </c:if>
                        <c:if test="${greeting.status == 'Bị từ chối'}">
                            <span class="status-badge status-rejected">${greeting.status}</span>
                        </c:if>
                        <c:if test="${greeting.status == 'Được nhận'}">
                            <span class="status-badge status-accepted">${greeting.status}</span>
                        </c:if>

                        <a href="job-greeting?action=view-details-greeting&greetingId=${greeting.greetingId}" class="action-btn btn-view">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <!-- Ứng viên 2 -->
    </section>

    <div class="pagination">
        <span class="pagination-item"><i class="fas fa-chevron-left"></i></span>
        <span class="pagination-item active">1</span>
        <span class="pagination-item">2</span>
        <span class="pagination-item">3</span>
        <span class="pagination-item">...</span>
        <span class="pagination-item">5</span>
        <span class="pagination-item"><i class="fas fa-chevron-right"></i></span>
    </div>
</div>

<%@include file="includes/footer.jsp"%>

<%--Phân trang--%>
<script >
    document.addEventListener('DOMContentLoaded', function() {
        // Cấu hình phân trang
        const itemsPerPage = 5;
        const applicantCards = document.querySelectorAll('.applicant-card');
        const totalApplicants = applicantCards.length;
        const totalPages = Math.ceil(totalApplicants / itemsPerPage);

        // Cập nhật số lượng ứng viên trong tiêu đề
        const applicantsCountElement = document.querySelector('.applicants-list h2');
        if (applicantsCountElement) {
            applicantsCountElement.textContent = `Danh Sách Ứng Viên (${totalApplicants})`;
        }

        // Khởi tạo phân trang
        initPagination();

        // Hiển thị trang đầu tiên
        showPage(1);

        function initPagination() {
            // Xóa phân trang cũ nếu có
            const paginationDiv = document.querySelector('.pagination');
            paginationDiv.innerHTML = '';

            // Nút trang trước
            const prevBtn = document.createElement('span');
            prevBtn.className = 'pagination-item';
            prevBtn.innerHTML = '<i class="fas fa-chevron-left"></i>';
            prevBtn.addEventListener('click', function() {
                const activePage = document.querySelector('.pagination-item.active');
                if (activePage && activePage.textContent !== '1') {
                    showPage(parseInt(activePage.textContent) - 1);
                }
            });
            paginationDiv.appendChild(prevBtn);

            // Tạo các nút số trang
            if (totalPages <= 5) {
                // Hiển thị tất cả các trang nếu ≤ 5 trang
                for (let i = 1; i <= totalPages; i++) {
                    createPageButton(i, paginationDiv);
                }
            } else {
                // Hiển thị trang 1, 2, ..., trang cuối nếu > 5 trang
                createPageButton(1, paginationDiv);
                createPageButton(2, paginationDiv);

                // Thêm nút "..."
                const ellipsis = document.createElement('span');
                ellipsis.className = 'pagination-item ellipsis';
                ellipsis.textContent = '...';
                paginationDiv.appendChild(ellipsis);

                // Thêm trang gần cuối và trang cuối
                createPageButton(totalPages - 1, paginationDiv);
                createPageButton(totalPages, paginationDiv);
            }

            // Nút trang sau
            const nextBtn = document.createElement('span');
            nextBtn.className = 'pagination-item';
            nextBtn.innerHTML = '<i class="fas fa-chevron-right"></i>';
            nextBtn.addEventListener('click', function() {
                const activePage = document.querySelector('.pagination-item.active');
                if (activePage && parseInt(activePage.textContent) < totalPages) {
                    showPage(parseInt(activePage.textContent) + 1);
                }
            });
            paginationDiv.appendChild(nextBtn);
        }

        function createPageButton(pageNum, container) {
            const pageBtn = document.createElement('span');
            pageBtn.className = 'pagination-item';
            pageBtn.textContent = pageNum;
            if (pageNum === 1) {
                pageBtn.classList.add('active');
            }
            pageBtn.addEventListener('click', function() {
                showPage(pageNum);
            });
            container.appendChild(pageBtn);
            return pageBtn;
        }

        function showPage(pageNum) {
            // Cập nhật nút active
            const paginationItems = document.querySelectorAll('.pagination-item');
            paginationItems.forEach(item => {
                if (item.textContent == pageNum) {
                    item.classList.add('active');
                } else {
                    item.classList.remove('active');
                }
            });

            // Ẩn tất cả các ứng viên
            applicantCards.forEach(card => {
                card.style.display = 'none';
            });

            // Hiển thị các ứng viên của trang hiện tại
            const startIndex = (pageNum - 1) * itemsPerPage;
            const endIndex = Math.min(startIndex + itemsPerPage, totalApplicants);

            for (let i = startIndex; i < endIndex; i++) {
                if (applicantCards[i]) {
                    applicantCards[i].style.display = 'flex';
                }
            }

            // Cập nhật UI phân trang khi số trang > 5
            updatePaginationUI(pageNum);
        }

        function updatePaginationUI(currentPage) {
            if (totalPages <= 5) return;

            const paginationItems = Array.from(document.querySelectorAll('.pagination-item:not(:first-child):not(:last-child)'));
            const ellipsisItem = document.querySelector('.pagination-item.ellipsis');

            // Xử lý hiển thị phân trang động khi có nhiều trang
            if (currentPage <= 3) {
                // Hiển thị trang 1, 2, 3, ..., totalPages
                paginationItems.forEach((item, index) => {
                    if (index === 0) item.textContent = '1';
                    else if (index === 1) item.textContent = '2';
                    else if (index === 2) {
                        if (ellipsisItem) {
                            item.textContent = '3';
                            ellipsisItem.style.display = 'inline-block';
                        }
                    }
                    else if (index === paginationItems.length - 2) item.textContent = totalPages - 1;
                    else if (index === paginationItems.length - 1) item.textContent = totalPages;
                });
            } else if (currentPage >= totalPages - 2) {
                // Hiển thị trang 1, ..., totalPages-2, totalPages-1, totalPages
                paginationItems.forEach((item, index) => {
                    if (index === 0) item.textContent = '1';
                    else if (index === 1) {
                        if (ellipsisItem) {
                            ellipsisItem.style.display = 'inline-block';
                        }
                    }
                    else if (index === paginationItems.length - 3) item.textContent = totalPages - 2;
                    else if (index === paginationItems.length - 2) item.textContent = totalPages - 1;
                    else if (index === paginationItems.length - 1) item.textContent = totalPages;
                });
            } else {
                // Hiển thị trang 1, ..., currentPage, ..., totalPages
                paginationItems.forEach((item, index) => {
                    if (index === 0) item.textContent = '1';
                    else if (index === 1) {
                        if (ellipsisItem) {
                            ellipsisItem.style.display = 'inline-block';
                            item.textContent = currentPage;
                        }
                    }
                    else if (index === paginationItems.length - 2) {
                        if (ellipsisItem) {
                            ellipsisItem.style.display = 'inline-block';
                        }
                    }
                    else if (index === paginationItems.length - 1) item.textContent = totalPages;
                });
            }
        }
    });
</script>

<%--Lọc Greeting--%>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Lấy tất cả các filter option
        const filterOptions = document.querySelectorAll('.filter-option');
        const statusFilterOptions = document.querySelectorAll('.filter-group:nth-child(1) .filter-option');
        const sortFilterOptions = document.querySelectorAll('.filter-group:nth-child(2) .filter-option');

        // Lấy tất cả các applicant cards
        const applicantCards = document.querySelectorAll('.applicant-card');
        const originalCards = Array.from(applicantCards);

        // Lưu trữ trạng thái lọc và sắp xếp hiện tại
        let currentStatusFilter = 'Tất cả';
        let currentSortFilter = 'Mới nhất';

        // Thêm event listener cho tất cả các filter option
        filterOptions.forEach(option => {
            option.addEventListener('click', function() {
                // Cập nhật active status trong filter group hiện tại
                const parentGroup = this.parentElement;
                parentGroup.querySelectorAll('.filter-option').forEach(opt => {
                    opt.classList.remove('active');
                });
                this.classList.add('active');

                // Cập nhật trạng thái lọc hiện tại
                if (parentGroup.parentElement.querySelector('.filter-title').textContent.includes('Trạng thái')) {
                    currentStatusFilter = this.textContent;
                } else if (parentGroup.parentElement.querySelector('.filter-title').textContent.includes('Sắp xếp')) {
                    currentSortFilter = this.textContent;
                }

                // Áp dụng lọc và sắp xếp
                applyFilters();
            });
        });

        // Hàm áp dụng cả bộ lọc và sắp xếp
        function applyFilters() {
            const filteredCards = filterByStatus(originalCards, currentStatusFilter);
            const sortedCards = sortCards(filteredCards, currentSortFilter);

            // Hiển thị các cards đã lọc và sắp xếp
            displayCards(sortedCards);

            // Cập nhật phân trang
            initPagination(sortedCards);
            showPage(1, sortedCards);
        }

        // Hàm lọc theo trạng thái
        function filterByStatus(cards, statusFilter) {
            if (statusFilter === 'Tất cả') {
                return cards;
            }

            return cards.filter(card => {
                const statusBadge = card.querySelector('.status-badge');
                const cardStatus = statusBadge ? statusBadge.textContent.trim() : '';

                // Map giữa filter option và status trong card
                const statusMap = {
                    'Chờ xét duyệt': 'Chờ xét duyệt',
                    'Chờ phỏng vấn': 'Chờ phỏng vấn',
                    'Bị từ chối': 'Bị từ chối',
                    'Được nhận': 'Được nhận'
                };

                return cardStatus === statusMap[statusFilter];
            });
        }

        // Hàm sắp xếp cards
        function sortCards(cards, sortBy) {
            const sortedCards = [...cards];

            switch (sortBy) {
                case 'Mới nhất':
                    // Mặc định là mới nhất, không cần sắp xếp gì thêm
                    break;

                case 'Giá cao nhất':
                    sortedCards.sort((a, b) => {
                        const priceA = extractPrice(a);
                        const priceB = extractPrice(b);
                        return priceB - priceA;
                    });
                    break;

                case 'Thời gian ngắn nhất':
                    sortedCards.sort((a, b) => {
                        const daysA = extractDays(a);
                        const daysB = extractDays(b);
                        return daysA - daysB;
                    });
                    break;
            }

            return sortedCards;
        }

        // Hàm lấy giá trị price từ card
        function extractPrice(card) {
            const priceText = card.querySelector('.fas.fa-money-bill').parentElement.textContent.trim();
            // Trích xuất giá trị số từ chuỗi (ví dụ: "500000" từ "500000 VND")
            const priceMatch = priceText.match(/(\d+)/);
            return priceMatch ? parseInt(priceMatch[0]) : 0;
        }

        // Hàm lấy số ngày từ card
        function extractDays(card) {
            const dayText = card.querySelector('.fas.fa-calendar').parentElement.textContent.trim();
            // Trích xuất số ngày từ chuỗi (ví dụ: "7" từ "7 ngày")
            const dayMatch = dayText.match(/(\d+)/);
            return dayMatch ? parseInt(dayMatch[0]) : 0;
        }

        // Hàm hiển thị các cards
        function displayCards(cards) {
            const container = document.querySelector('.applicants-list');
            const heading = container.querySelector('h2');

            // Xóa tất cả các card hiện tại
            Array.from(container.children).forEach(child => {
                if (child !== heading) {
                    child.remove();
                }
            });

            // Thêm các card đã lọc và sắp xếp
            cards.forEach(card => {
                container.appendChild(card);
            });

            // Cập nhật số lượng ứng viên trong tiêu đề
            heading.textContent = `Danh Sách Ứng Viên (${cards.length})`;
        }

        // Hàm khởi tạo phân trang
        function initPagination(cardsToShow) {
            const itemsPerPage = 5;
            const totalApplicants = cardsToShow.length;
            const totalPages = Math.ceil(totalApplicants / itemsPerPage);

            // Xóa phân trang cũ nếu có
            const paginationDiv = document.querySelector('.pagination');
            if (!paginationDiv) {
                // Tạo phân trang nếu chưa có
                const newPaginationDiv = document.createElement('div');
                newPaginationDiv.className = 'pagination';
                document.querySelector('.applicants-list').after(newPaginationDiv);
                initPaginationUI(newPaginationDiv, totalPages, cardsToShow);
            } else {
                paginationDiv.innerHTML = '';
                initPaginationUI(paginationDiv, totalPages, cardsToShow);
            }
        }

        function initPaginationUI(paginationDiv, totalPages, cardsToShow) {
            // Nút trang trước
            const prevBtn = document.createElement('span');
            prevBtn.className = 'pagination-item';
            prevBtn.innerHTML = '<i class="fas fa-chevron-left"></i>';
            prevBtn.addEventListener('click', function() {
                const activePage = document.querySelector('.pagination-item.active');
                if (activePage && activePage.textContent !== '1') {
                    showPage(parseInt(activePage.textContent) - 1, cardsToShow);
                }
            });
            paginationDiv.appendChild(prevBtn);

            // Tạo các nút số trang
            if (totalPages <= 5) {
                // Hiển thị tất cả các trang nếu ≤ 5 trang
                for (let i = 1; i <= totalPages; i++) {
                    createPageButton(i, paginationDiv, cardsToShow);
                }
            } else {
                // Hiển thị trang 1, 2, ..., trang cuối nếu > 5 trang
                createPageButton(1, paginationDiv, cardsToShow);
                createPageButton(2, paginationDiv, cardsToShow);

                // Thêm nút "..."
                const ellipsis = document.createElement('span');
                ellipsis.className = 'pagination-item ellipsis';
                ellipsis.textContent = '...';
                paginationDiv.appendChild(ellipsis);

                // Thêm trang gần cuối và trang cuối
                createPageButton(totalPages - 1, paginationDiv, cardsToShow);
                createPageButton(totalPages, paginationDiv, cardsToShow);
            }

            // Nút trang sau
            const nextBtn = document.createElement('span');
            nextBtn.className = 'pagination-item';
            nextBtn.innerHTML = '<i class="fas fa-chevron-right"></i>';
            nextBtn.addEventListener('click', function() {
                const activePage = document.querySelector('.pagination-item.active');
                if (activePage && parseInt(activePage.textContent) < totalPages) {
                    showPage(parseInt(activePage.textContent) + 1, cardsToShow);
                }
            });
            paginationDiv.appendChild(nextBtn);
        }

        function createPageButton(pageNum, container, cardsToShow) {
            const pageBtn = document.createElement('span');
            pageBtn.className = 'pagination-item';
            pageBtn.textContent = pageNum;
            if (pageNum === 1) {
                pageBtn.classList.add('active');
            }
            pageBtn.addEventListener('click', function() {
                showPage(pageNum, cardsToShow);
            });
            container.appendChild(pageBtn);
            return pageBtn;
        }

        function showPage(pageNum, cardsToShow) {
            const itemsPerPage = 5;

            // Cập nhật nút active
            const paginationItems = document.querySelectorAll('.pagination-item');
            paginationItems.forEach(item => {
                if (item.textContent == pageNum) {
                    item.classList.add('active');
                } else {
                    item.classList.remove('active');
                }
            });

            // Ẩn tất cả các ứng viên
            cardsToShow.forEach(card => {
                card.style.display = 'none';
            });

            // Hiển thị các ứng viên của trang hiện tại
            const startIndex = (pageNum - 1) * itemsPerPage;
            const endIndex = Math.min(startIndex + itemsPerPage, cardsToShow.length);

            for (let i = startIndex; i < endIndex; i++) {
                if (cardsToShow[i]) {
                    cardsToShow[i].style.display = 'flex';
                }
            }

            // Cập nhật UI phân trang khi số trang > 5
            updatePaginationUI(pageNum, cardsToShow);
        }

        function updatePaginationUI(currentPage, cardsToShow) {
            const itemsPerPage = 5;
            const totalPages = Math.ceil(cardsToShow.length / itemsPerPage);

            if (totalPages <= 5) return;

            const paginationItems = Array.from(document.querySelectorAll('.pagination-item:not(:first-child):not(:last-child)'));
            const ellipsisItem = document.querySelector('.pagination-item.ellipsis');

            // Xử lý hiển thị phân trang động khi có nhiều trang
            if (currentPage <= 3) {
                // Hiển thị trang 1, 2, 3, ..., totalPages
                paginationItems.forEach((item, index) => {
                    if (index === 0) item.textContent = '1';
                    else if (index === 1) item.textContent = '2';
                    else if (index === 2) {
                        if (ellipsisItem) {
                            item.textContent = '3';
                            ellipsisItem.style.display = 'inline-block';
                        }
                    }
                    else if (index === paginationItems.length - 2) item.textContent = totalPages - 1;
                    else if (index === paginationItems.length - 1) item.textContent = totalPages;
                });
            } else if (currentPage >= totalPages - 2) {
                // Hiển thị trang 1, ..., totalPages-2, totalPages-1, totalPages
                paginationItems.forEach((item, index) => {
                    if (index === 0) item.textContent = '1';
                    else if (index === 1) {
                        if (ellipsisItem) {
                            ellipsisItem.style.display = 'inline-block';
                        }
                    }
                    else if (index === paginationItems.length - 3) item.textContent = totalPages - 2;
                    else if (index === paginationItems.length - 2) item.textContent = totalPages - 1;
                    else if (index === paginationItems.length - 1) item.textContent = totalPages;
                });
            } else {
                // Hiển thị trang 1, ..., currentPage, ..., totalPages
                paginationItems.forEach((item, index) => {
                    if (index === 0) item.textContent = '1';
                    else if (index === 1) {
                        if (ellipsisItem) {
                            ellipsisItem.style.display = 'inline-block';
                            item.textContent = currentPage;
                        }
                    }
                    else if (index === paginationItems.length - 2) {
                        if (ellipsisItem) {
                            ellipsisItem.style.display = 'inline-block';
                        }
                    }
                    else if (index === paginationItems.length - 1) item.textContent = totalPages;
                });
            }
        }

        // Khởi tạo ban đầu
        initPagination(originalCards);
        showPage(1, originalCards);
    });
</script>

<script>
    // Animation for filter options
    const filterOptions = document.querySelectorAll('.filter-option');

    filterOptions.forEach(option => {
        option.addEventListener('click', function() {
            // Remove active class from siblings
            const siblings = this.parentElement.querySelectorAll('.filter-option');
            siblings.forEach(sibling => {
                sibling.classList.remove('active');
            });

            // Add active class to clicked option
            this.classList.add('active');
        });
    });

    // Animation for pagination
    const pageItems = document.querySelectorAll('.page-item');

    pageItems.forEach(item => {
        item.addEventListener('click', function() {
            // Remove active class from all items
            pageItems.forEach(page => {
                page.classList.remove('active');
            });

            // Add active class to clicked item
            this.classList.add('active');
        });
    });

    // Animation for view details button
    const viewButtons = document.querySelectorAll('.view-details');

    viewButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Redirect to detail page (for demo purposes)
            window.location.href = '#greeting-detail';
        });
    });
</script>
</body>
</html>
