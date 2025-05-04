<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Công Việc</title>
    <link rel="stylesheet" href="css/job-manage.css">
</head>
<%@include file="includes/header-01.jsp"%>
<body>
<div class="job-management-container">
    <h1 class="page-title">Quản Lý Công Việc</h1>

    <!-- Main Features -->
    <div class="main-features">
        <!-- Posted Jobs -->
        <div class="feature-card" onclick="location.href='job?action=view-posted-jobs'">
            <div class="feature-header">
                <i class="fas fa-briefcase feature-icon"></i>
                <h2>Công Việc Đã Đăng</h2>
            </div>
            <div class="feature-content">
                <div class="job-count">${jobDao.countTotalJobsByAccountId(account.accountId)}</div>
                <p class="feature-desc">Quản lý tất cả công việc bạn đã đăng, theo dõi ứng viên và cập nhật thông tin.</p>
                <button class="feature-button" onclick="location.href='job?action=view-posted-jobs'">Xem Tất Cả</button>
            </div>
        </div>

        <!-- Applied Jobs -->
        <div class="feature-card" onclick="location.href='job-greeting?action=view-applied'">
            <div class="feature-header">
                <i class="fas fa-paper-plane feature-icon"></i>
                <h2>Công Việc Đã Ứng Tuyển</h2>
            </div>
            <div class="feature-content">
                <div class="job-count">${jobDao.countJobGreetingByJobSeekerId(account.accountId)}</div>
                <p class="feature-desc">Theo dõi trạng thái ứng tuyển, phản hồi từ nhà tuyển dụng và lịch phỏng vấn.</p>
                <button class="feature-button" onclick="location.href='job-greeting?action=view-applied'">Xem Tất Cả</button>
            </div>
        </div>
    </div>

    <!-- Saved Jobs -->
    <div class="minor-feature">
        <div class="minor-feature-header">
            <h2 class="minor-feature-title">
                <i class="fas fa-bookmark"></i>
                Công Việc Đã Lưu
            </h2>
            <span class="job-count-sm">5 công việc</span>
        </div>
        <p>Danh sách công việc bạn đã lưu để xem lại sau. Bạn có thể dễ dàng quản lý và ứng tuyển vào bất kỳ lúc nào.</p>
        <a href="jobs?action=saved-jobs" class="view-all-btn">Xem Tất Cả</a>
    </div>

    <!-- Recent Jobs -->
    <div class="recent-jobs">
        <h2 class="section-title">
            <i class="fas fa-history"></i>
            Đã đăng gần đây
        </h2>

        <div class="job-grid">
            <c:forEach var="job" items="${jobList}" varStatus="loop" begin="0" end="2">
                <div class="job-card">

                    <h3 class="job-title">${job.jobTitle}</h3>
                    <div class="job-info">
         <span class="job-salary">
            <i class="fas fa-money-bill-wave"></i>
            <c:if test="${not empty job.budgetMin && not empty job.budgetMax}">
                <fmt:formatNumber value="${job.budgetMin}" type="currency" currencySymbol="&#8363;"/> -
                <fmt:formatNumber value="${job.budgetMax}" type="currency" currencySymbol="&#8363;"/>
            </c:if>
            <c:if test="${empty job.budgetMin && not empty job.budgetMax}">
                Tối đa: <fmt:formatNumber value="${job.budgetMax}" type="currency" currencySymbol="&#8363;"/>
            </c:if>
            <c:if test="${not empty job.budgetMin && empty job.budgetMax}">
                Tối thiểu: <fmt:formatNumber value="${job.budgetMin}" type="currency" currencySymbol="&#8363;"/>
            </c:if>
            <c:if test="${empty job.budgetMin && empty job.budgetMax}">
                Thỏa thuận
            </c:if>
        </span>
                        <span class="job-location">
            <i class="fas fa-map-marker-alt"></i>
        </span>
                    </div>
                    <p class="job-posted">Đăng tải:
                        <fmt:formatDate value="${job.postDate}" pattern="HH:mm:ss dd/MM/yyyy"/>
                    </p>
                    <div class="job-actions">
                        <a href="/JobTrans/job?action=details-job-posted&jobId=${job.jobId}" class="job-btn job-btn-primary">Chi Tiết</a>
                        <a href="jobs?action=save-job&jobId=${job.jobId}" class="job-btn job-btn-secondary">
                            <i class="far fa-bookmark"></i> Lưu
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp"%>

<script>
    // Animations and interactions
    document.addEventListener('DOMContentLoaded', function() {
        // Reveal animations for job cards with delay
        const jobCards = document.querySelectorAll('.job-card');
        jobCards.forEach((card, index) => {
            setTimeout(() => {
                card.style.animation = `fadeInUp 0.5s ease forwards`;
            }, 100 * index);

            // Hover effects
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-5px)';
            });

            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
            });
        });

        // Add click effect to buttons
        const buttons = document.querySelectorAll('button, .job-btn');
        buttons.forEach(button => {
            button.addEventListener('mousedown', function() {
                this.style.transform = 'scale(0.95)';
            });

            button.addEventListener('mouseup', function() {
                this.style.transform = '';
            });

            button.addEventListener('mouseleave', function() {
                this.style.transform = '';
            });
        });
    });
</script>
</body>
</html>