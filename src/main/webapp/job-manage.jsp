<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
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
                <div class="job-count">8</div>
                <p class="feature-desc">Quản lý tất cả công việc bạn đã đăng, theo dõi ứng viên và cập nhật thông tin.</p>
                <button class="feature-button" onclick="location.href='job?action=view-posted-jobs'">Xem Tất Cả</button>
            </div>
        </div>

        <!-- Applied Jobs -->
        <div class="feature-card" onclick="location.href='job?action=view-applied'">
            <div class="feature-header">
                <i class="fas fa-paper-plane feature-icon"></i>
                <h2>Công Việc Đã Ứng Tuyển</h2>
            </div>
            <div class="feature-content">
                <div class="job-count">12</div>
                <p class="feature-desc">Theo dõi trạng thái ứng tuyển, phản hồi từ nhà tuyển dụng và lịch phỏng vấn.</p>
                <button class="feature-button" onclick="location.href='job?action=view-applied'">Xem Tất Cả</button>
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
            <!-- Job 1 -->
            <div class="job-card">
                <span class="job-badge">Mới</span>
                <h3 class="job-title">Lập Trình Viên Frontend React</h3>
                <p class="job-company">
                    <i class="fas fa-building"></i>
                    Tech Solutions Vietnam
                </p>
                <div class="job-info">
                        <span class="job-salary">
                            <i class="fas fa-money-bill-wave"></i>
                            15-20 triệu
                        </span>
                    <span class="job-location">
                            <i class="fas fa-map-marker-alt"></i>
                            Hà Nội
                        </span>
                </div>
                <p class="job-posted">Đăng tải: 23/04/2025</p>
                <div class="job-actions">
                    <a href="jobs?action=view-job&jobId=101" class="job-btn job-btn-primary">Chi Tiết</a>
                    <a href="jobs?action=save-job&jobId=101" class="job-btn job-btn-secondary">
                        <i class="far fa-bookmark"></i> Lưu
                    </a>
                </div>
            </div>

            <!-- Job 2 -->
            <div class="job-card">
                <h3 class="job-title">UI/UX Designer (Senior)</h3>
                <p class="job-company">
                    <i class="fas fa-building"></i>
                    Creative Design Studio
                </p>
                <div class="job-info">
                        <span class="job-salary">
                            <i class="fas fa-money-bill-wave"></i>
                            25-30 triệu
                        </span>
                    <span class="job-location">
                            <i class="fas fa-map-marker-alt"></i>
                            TP.HCM
                        </span>
                </div>
                <p class="job-posted">Đăng tải: 22/04/2025</p>
                <div class="job-actions">
                    <a href="jobs?action=view-job&jobId=102" class="job-btn job-btn-primary">Chi Tiết</a>
                    <a href="jobs?action=save-job&jobId=102" class="job-btn job-btn-secondary">
                        <i class="far fa-bookmark"></i> Lưu
                    </a>
                </div>
            </div>

            <!-- Job 3 -->
            <div class="job-card">
                <h3 class="job-title">Chuyên Viên Digital Marketing</h3>
                <p class="job-company">
                    <i class="fas fa-building"></i>
                    Ecommerce Solutions
                </p>
                <div class="job-info">
                        <span class="job-salary">
                            <i class="fas fa-money-bill-wave"></i>
                            18-22 triệu
                        </span>
                    <span class="job-location">
                            <i class="fas fa-map-marker-alt"></i>
                            Đà Nẵng
                        </span>
                </div>
                <p class="job-posted">Đăng tải: 20/04/2025</p>
                <div class="job-actions">
                    <a href="jobs?action=view-job&jobId=103" class="job-btn job-btn-primary">Chi Tiết</a>
                    <a href="jobs?action=save-job&jobId=103" class="job-btn job-btn-secondary">
                        <i class="far fa-bookmark"></i> Lưu
                    </a>
                </div>
            </div>
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