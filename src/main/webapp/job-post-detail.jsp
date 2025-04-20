<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="jobtrans.model.Account"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:useBean id="accDao" class="jobtrans.dal.AccountDAO" scope="session"/>
    <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"/>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large'/>

    <!--new css -->
<%--    <script src="https://cdn.tailwindcss.com"></script>--%>
    <link href="./css/job_post_detail_employee.css" rel="stylesheet">
<%--    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">--%>
</head>
<%@include file="includes/header-01.jsp"%>
<body style="font-family: Inter,sans-serif">
<main class="job-detail-container">
    <div class="row">
        <div class="col-lg-8">
            <div class="main-content mb-4">
                <div class="job-header">
                    <div class="d-flex justify-content-between align-items-start">
                        <h1 class="job-title">${job.jobTitle}</h1>
                        <div class="heart-icon" onclick="toggleHeart(this)">
                            <i class="far fa-heart"></i>
                        </div>
                    </div>
                </div>

                <div class="job-content">
                    <h2 class="section-title">Mô tả chi tiết công việc</h2>
                    <div class="content-list">
                        <li>${job.jobDescription}</li>
                    </div>

                    <h2 class="section-title">Yêu cầu ứng viên</h2>
                    <div class="content-list">
                        <li>${job.requirements}</li>
                    </div>

                    <h2 class="section-title">Quyền lợi</h2>
                    <div class="content-list">
                        <li>${job.benefit}</li>
                    </div>

                    <h2 class="section-title">Tệp đính kèm</h2>
                    <c:choose>
                        <c:when test="${empty job.attachment or job.attachment.trim() == ''}">
                            <p class="fst-italic text-muted">Không có tệp đính kèm</p>
                        </c:when>
                        <c:otherwise>
                            <a href="job?action=download&fileName=${job.attachment}&jobId=${job.jobId}" class="text-decoration-none">
                                <div class="file-attachment">
                                    <i class="fas fa-file file-icon"></i>
                                    <span class="file-name">${job.attachment}</span>
                                </div>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="bids-section">
                <h2 class="bids-title">Các chào giá nhận được</h2>

                <c:forEach items="${greetings}" var="o">
                    <div class="bid-card">
                        <img src="${accDao.getAccountById(o.jobSeekerId).avatar}" alt="Avatar" class="avatar">
                        <div class="bidder-info">
                            <h3 class="bidder-name">${accDao.getAccountById(o.jobSeekerId).accountName}</h3>
                            <div class="bidder-points">
                                <i class="fas fa-star text-warning"></i> Điểm số: ${accDao.getAccountById(o.jobSeekerId).point}
                            </div>
                            <div class="bid-price">
                                Giá đề xuất: <span class="bid-price-value">${o.price} ₫</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <c:if test="${empty greetings}">
                    <div class="text-center py-5">
                        <i class="fas fa-exclamation-circle fa-3x text-muted mb-3"></i>
                        <p class="lead text-muted">Chưa có chào giá nào cho công việc này</p>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="sidebar">
                <div class="budget-card">
                    <h3 class="budget-title">Ngân sách</h3>
                    <p class="budget-amount">${job.budgetMin} VND</p>
                    <p class="budget-divider">-</p>
                    <p class="budget-amount">${job.budgetMax} VND</p>
                </div>

                <div class="details-card">
                    <ul class="details-list">
                        <li><strong>Trạng thái:</strong> <span class="badge bg-success">${job.statusPost}</span></li>
                        <li><strong>Nhà tuyển dụng:</strong> ${accDao.getAccountById(job.postAccountId).accountName}</li>
                        <li><strong>Phân loại:</strong> ${jobDao.getCategoryById(job.categoryId).categoryName}</li>
                        <li>
                            <strong>Kiểm tra:</strong>
                            <c:choose>
                                <c:when test="${job.haveTested}">
                                    <span class="badge bg-primary">Có</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-secondary">Không</span>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li>
                            <strong>Phỏng vấn:</strong>
                            <c:choose>
                                <c:when test="${job.haveInterviewed}">
                                    <span class="badge bg-primary">Có</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-secondary">Không</span>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li><strong>Ngày đăng:</strong> <fmt:formatDate value="${job.postDate}" pattern="dd/MM/yyyy" /></li>
                        <li><strong>Ngày hết hạn:</strong> <fmt:formatDate value="${job.dueDatePost}" pattern="dd/MM/yyyy" /></li>
                    </ul>
                </div>

                <div class="action-card">
                    <a href="job?action=pre-update&jobId=${job.jobId}">
                        <button class="action-btn btn-primary">
                            <i class="fas fa-edit me-2"></i> Cập nhật công việc
                        </button>
                    </a>
                    <a href="job?action=pre-update&jobId=${job.jobId}">
                        <button class="action-btn btn-primary">
                            <i class="fas fa-tasks me-2"></i> Cập nhật kiểm tra
                        </button>
                    </a>
                    <a href="job?action=posted-job-detail&jobId=${job.jobId}">
                        <button class="action-btn btn-primary">
                            <i class="fas fa-video me-2"></i> Cập nhật phỏng vấn
                        </button>
                    </a>
                    <a href="job?action=deleteJob&jobId=${job.jobId}">
                        <button class="action-btn btn-danger">
                            <i class="fas fa-trash-alt me-2"></i> Xóa công việc
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="includes/footer.jsp"%>
<script>
    function toggleHeart(element) {
        const icon = element.querySelector('i');
        if (icon.classList.contains('far')) {
            // Chuyển sang trái tim đầy màu đỏ
            icon.classList.remove('far');
            icon.classList.add('fas');
            icon.style.color = '#fa0000';
        } else {
            // Chuyển lại trái tim viền
            icon.classList.remove('fas');
            icon.classList.add('far');
            icon.style.color = ''; // Hoặc set lại màu ban đầu nếu có
        }
    }
</script>
<script>
    function toggleHeart(element) {
        const icon = element.querySelector('i');
        if (icon.classList.contains('far')) {
            icon.classList.remove('far');
            icon.classList.add('fas');
        } else {
            icon.classList.remove('fas');
            icon.classList.add('far');
        }
    }

    // Thêm hiệu ứng AOS khi cuộn trang
    document.addEventListener('DOMContentLoaded', function() {
        const mainContent = document.querySelector('.main-content');
        const sidebar = document.querySelector('.sidebar');
        const bidCards = document.querySelectorAll('.bid-card');

        // Thêm hiệu ứng khi cuộn
        window.addEventListener('scroll', function() {
            const scrollPosition = window.scrollY;

            // Parallax effect cho sidebar
            sidebar.style.transform = `translateY(${scrollPosition * 0.03}px)`;

            // Hiệu ứng opacity cho bid-cards khi scroll đến
            bidCards.forEach((card, index) => {
                const cardPosition = card.getBoundingClientRect().top;
                const windowHeight = window.innerHeight;

                if (cardPosition < windowHeight - 100) {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }
            });
        });

        // Set up initial states
        bidCards.forEach((card, index) => {
            card.style.opacity = '0';
            card.style.transform = 'translateY(20px)';
            card.style.transition = `all 0.5s ease ${index * 0.1}s`;
        });

        // Trigger initial check
        setTimeout(() => {
            window.dispatchEvent(new Event('scroll'));
        }, 300);
    });
</script>
</body>
</html>
