<%@ page import="jobtrans.model.Job" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobTrans - Trang chủ</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="page"></jsp:useBean>
    <jsp:useBean id="accoutDAO" class="jobtrans.dal.AccountDAO" scope="page"></jsp:useBean>


</head>

<body>
<%@include file="includes/header.jsp"%>
    <div class="hero-section" style="margin-top: 15px">
        <div class="container-fluid">
            <!-- Content -->
            <div class="row align-items-center mt-5">
                <div class="col-lg-7 col-md-12 ps-md-5 pe-md-4 text-center text-md-start">
                    <h1 class="headline mb-4">Nhận việc mới dễ dàng<br> – Bắt đầu ngay hôm nay!</h1>
                    <p class="subheadline mb-5">Làm việc cùng nhân tài với chi phí tối ưu – Tiết kiệm thời gian, tối đa hiệu quả!</p>

                    <div class="search-container mb-5">
                        <form action="viec-lam/" method="GET" class="row g-0 align-items-center search-form-inline">
                            <div class="col-8 col-md-9">
                                <input type="text" id="searchInput" name="keyword" class="search-input form-control form-control-lg border-0 ps-4" placeholder="Nhập từ khóa tìm kiếm...">
                            </div>
                            <div class="col-4 col-md-3 text-end">
                                <button type="submit" id="searchButton" class="search-btn">Tìm kiếm</button>
                            </div>
                        </form>
                    </div>
                </div>


                <div class="col-lg-5 d-none d-lg-block text-center">
                    <img src="img/home/01.png" alt="Featured image" class="img-fluid featured-image">
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container py-5">
            <div class="row text-center gy-5">

                <div class="col-md-4">
                    <img src="img/home/2.jpg" class="img-fluid rounded shadow mb-3" alt="Icon 1">
                    <p class="feature-text">
                        Giao dịch đáng tin cậy – Cam kết chất lượng, hiệu quả bền vững, bình đẳng
                    </p>
                </div>

                <div class="col-md-4">
                    <img src="img/home/3.jpg" class="img-fluid rounded shadow mb-3" alt="Icon 2">
                    <p class="feature-text">
                        Dữ liệu bảo mật – An toàn tuyệt đối, yên tâm sử dụng
                    </p>
                </div>

                <div class="col-md-4">
                    <img src="img/home/4.jpg" class="img-fluid rounded shadow mb-3" alt="Icon 3">
                    <p class="feature-text">
                        Đa dạng các mẫu CV để tạo nhanh linh hoạt
                    </p>
                </div>

            </div>
        </div>
        <div class="container my-5" style="padding-top: 10px">
            <!-- Section Header -->
            <header class="mb-5">
                <h1 style="font-family: Inter, sans-serif" class="section-title">CÔNG VIỆC PHỔ BIẾN</h1>
                <p class="section-subtitle">Các công việc phổ biến được ưa chuộng nhất với cơ hội nghề nghiệp phù hợp cho bạn</p>
            </header>

            <!-- Job Listings Grid -->

            <div class="row">
                <% List<Job> jobList = jobDAO.get6Job(); %> <%-- Gọi hàm get6Job() để lấy danh sách công việc --%>
                <% for (Job job : jobList) { %>
                <div class="col-md-6 col-lg-4">
                    <a href="/job-detail/<%= job.getJobId() %>" class="job-link">
                        <div class="job-card">
                            <img src="img/home/job-02.jpg" alt="Job image" class="job-card-image"> <%-- Bạn có thể thay đổi đường dẫn ảnh dựa trên dữ liệu công việc --%>
                            <div class="job-card-content">
                                <div class="job-avatar-wrapper">
                                    <img src="<%= job.getAvatar() != null ? job.getAvatar() : "./img/default-avatar.jpg" %>" alt="<%= job.getAccountName() %>" class="job-avatar">
                                </div>
                                <div class="job-details">
                                    <p class="job-recruiter"><%= job.getAccountName() %></p>
                                    <p class="job-deadline">Hạn tuyển: <%= job.getDueDatePost() != null ? job.getDueDatePost() : "Chưa xác định" %></p>
                                    <h2 class="job-title"><%= job.getJobTitle() %></h2>
                                    <div class="job-meta">
                                        <div class="job-category">
                                            <div class="category-icon">
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M12 2L2 7L12 12L22 7L12 2Z" stroke="#B3B3B3" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>
                                            </div>
                                            <span><%= job.getCategoryName()%></span> <%-- Bạn có thể lấy thông tin này từ đối tượng Job nếu có --%>
                                        </div>
                                        <div class="job-salary"><%= job.getFormattedBudgetMin() != null ? job.getFormattedBudgetMin() : "Thỏa thuận" %> - <%= job.getFormattedBudgetMax() != null ? job.getFormattedBudgetMax() : "Thỏa thuận" %></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <% } %>
            </div>
            <div class="text-center">
                <a href="viec-lam" class="see-more-btn">Xem thêm</a>
            </div>
        </div>



        <div class="container my-5">
            <!-- Section Header -->
            <h2 class="section-heading">DANH MỤC</h2>

            <!-- Category Carousel -->
            <div class="category-container">
                <div id="categoryCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
                    <!-- Carousel Indicators -->
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#categoryCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#categoryCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    </div>

                    <!-- Carousel Items -->
                    <div class="carousel-inner">
                        <!-- First Slide - 3 categories -->
                        <div class="carousel-item active">
                            <div class="row">
                                <!-- Marketing Category -->
                                <div class="col-md-4">
                                    <div class="category-card">
                                        <a href="viec-lam/?jobType=marketing&sort=${sortType}&page=1" class="category-link">
                                            <img src="img/home/cat-01.jpg" alt="Marketing" class="category-image">
                                            <div class="category-overlay">
                                                <h3 class="category-title">Marketing</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                                <!-- IT Category -->
                                <div class="col-md-4">
                                    <div class="category-card">
                                        <a href="viec-lam/?jobType=congnghe-it&sort=${sortType}&page=1" class="category-link">
                                            <img src="img/home/cat-06.jpg" alt="Công nghệ & IT" class="category-image">
                                            <div class="category-overlay">
                                                <h3 class="category-title">Công nghệ & IT</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                                <!-- Design Category -->
                                <div class="col-md-4">
                                    <div class="category-card">
                                        <a href="/design" class="category-link">
                                            <img src="img/home/cat-02.jpg" alt="Design" class="category-image">
                                            <div class="category-overlay">
                                                <h3 class="category-title">Design</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Second Slide - 3 categories -->
                        <div class="carousel-item">
                            <div class="row">
                                <!-- Translation Category -->
                                <div class="col-md-4">
                                    <div class="category-card">
                                        <a href="viec-lam/?jobType=dichthuat&sort=${sortType}&page=1" class="category-link">
                                            <img src="img/home/cat-03.jpg" alt="Dịch thuật" class="category-image">
                                            <div class="category-overlay">
                                                <h3 class="category-title">Dịch thuật</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                                <!-- Coaching Category -->
                                <div class="col-md-4">
                                    <div class="category-card">
                                        <a href="viec-lam/?jobType=tuvan-coaching&sort=${sortType}&page=1" class="category-link">
                                            <img src="img/home/cat-04.jpg" alt="Tư vấn, Coaching" class="category-image">
                                            <div class="category-overlay">
                                                <h3 class="category-title">Tư vấn, Coaching</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                                <!-- Other Category -->
                                <div class="col-md-4">
                                    <div class="category-card">
                                        <a href="viec-lam/?jobType=khac&sort=${sortType}&page=1" class="category-link">
                                            <img src="img/home/cat-05.jpg" alt="Khác" class="category-image">
                                            <div class="category-overlay">
                                                <h3 class="category-title">Khác</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Carousel Controls -->
                    <button class="carousel-control-prev" type="button" data-bs-target="#categoryCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#categoryCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
        <div class="container-fluid mt-5" style="padding-top: 10px">
            <h2 class="section-heading">THÀNH VIÊN UY TÍN</h2>
        </div>
        <section class="top-members-section" style="padding-top: 10px">
            <div class="container position-relative">
                <h3 class="section-subheading">TOP 5</h3>

                <div class="scroll-indicator">
                    <span>Kéo sang để xem thêm</span>
                    <span class="scroll-arrow">→</span>
                </div>
                <button class="scroll-left-btn">←</button>
                <button class="scroll-right-btn">→</button>

                <div class="members-scroll-container">
                    <%
                        List<Account> topAccounts = accoutDAO.get5Accounts();
                        for(Account accounts : topAccounts) {
                    %>
                    <!-- Member card -->
                    <div class="member-card-container">
                        <a href="member-detail.html?id=<%= accounts.getAccountId() %>" class="text-decoration-none">
                            <div class="member-card position-relative">
                                <img src="<%= accounts.getAvatar() != null ? accounts.getAvatar() : "img/home/user-demo.jpg" %>" alt="<%= accounts.getAccountName() %>" class="member-image">
                                <div class="member-info">
                                    <h4 class="member-name">
                                        <%= accounts.getAccountName() %>
                                        <span class="verified-badge">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18">
                    <circle cx="12" cy="12" r="11" fill="#1DA1F2"/>
                    <path d="M9.6 16.2l-4.2-4.2 1.4-1.4 2.8 2.8 7.8-7.8 1.4 1.4-9.2 9.2z" fill="white"/>
                </svg>
            </span>
                                    </h4>
                                    <div class="star-rating">

                                        <c:set var="rating" value="<%= accounts.getStarRate() %>"/>

                                        <c:forEach begin="1" end="5" varStatus="loop">
                                            <c:choose>
                                                <c:when test="${rating >= loop.index}">
                                                    <i class="fas fa-star"></i>
                                                </c:when>
                                                <c:when test="${rating > loop.index - 0.5}">
                                                    <i class="fas fa-star-half-alt"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="far fa-star"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                        <span class="rating-text">${String.format("%.1f", rating)}/5.0</span>
                                    </div>

                                    <p class="member-reputation">Điểm uy tín: <%= accounts.getPoint() %> điểm</p>

                                    <!-- Hiển thị sao dựa trên điểm uy tín -->
                                    <div class="rating-stars" data-rating="4.5"></div>

                                    <div class="member-details">
                                        <div class="member-role">
                <span class="role-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="#6c757d">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                    </svg>
                </span>
                                            <%= accounts.getSpeciality() %>
                                        </div>
                                        <div class="member-location">
                <span class="location-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="#6c757d">
                        <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                    </svg>
                </span>
                                            <%= accounts.getAddress() %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <div class="text-center">
                    <a href="/all-members" class="see-more-btn">Xem thêm</a>
                </div>
            </div>
        </section>
        <section class="stats-section">
            <div class="container">
                <div class="row justify-content-center">
                    <!-- Jobs Stats -->
                    <div class="col-md-4 col-sm-6 text-center mb-4" style="text-align: center">
                        <div >
                        <div class="circle purple"><i class="fas fa-user"></i></div>
                            <div>
                            <div class="stats-number">
                                <span class="counter" data-target="5000">0</span>
                            </div>
                            <div class="stats-label">Người dùng</div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 text-center mb-4">
                        <div class="circle green"><i class="fas fa-file-alt"></i></div>
                        <div class="stats-number">
                            <span class="counter" data-target="13000">0</span>
                        </div>
                        <div class="stats-label">Công việc</div>
                    </div>

                    <!-- CV Stats -->
                    <div class="col-md-4 col-sm-6 text-center mb-4">
                        <div class="circle orange"><i class="fas fa-star"></i></div>
                        <div class="stats-number">
                            <span class="counter" data-target="5000">0</span>
                        </div>
                        <div class="stats-label">CV</div>
                    </div>
                </div>
            </div>
        </section>

        <div class="container my-5">
            <div class="row align-items-center justify-content-between">
                <!-- Phần nội dung bên trái -->
                <div class="col-12 col-md-6 mb-4 mb-md-0">
                    <h2 class="main-heading mb-4">
                        Tìm kiếm cộng sự phù hợp để làm việc cùng bạn
                    </h2>
                    <div class="custom-button-wrapper">
                        <button class="btn custom-btn" style="background: #6787fe; color: whitesmoke">
                            Bắt đầu đăng công việc
                        </button>
                    </div>
                </div>

                <!-- Phần ảnh bên phải -->
                <div class="col-12 col-md-5 text-center">
                    <img src="img/home/01.png" alt="Cộng sự" class="img-fluid custom-img" />
                </div>
            </div>
        </div>

        <%@include file="includes/footer.jsp"%>

</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const scrollContainer = document.querySelector('.members-scroll-container');
        const scrollLeftBtn = document.querySelector('.scroll-left-btn');
        const scrollRightBtn = document.querySelector('.scroll-right-btn');

        if (scrollLeftBtn && scrollRightBtn && scrollContainer) {
            // Ẩn nút trái khi ở đầu
            scrollContainer.addEventListener('scroll', function() {
                if (scrollContainer.scrollLeft <= 10) {
                    scrollLeftBtn.style.opacity = '0.5';
                } else {
                    scrollLeftBtn.style.opacity = '1';
                }

                if (scrollContainer.scrollLeft + scrollContainer.clientWidth >= scrollContainer.scrollWidth - 10) {
                    scrollRightBtn.style.opacity = '0.5';
                } else {
                    scrollRightBtn.style.opacity = '1';
                }
            });

            // Xử lý sự kiện click nút
            scrollLeftBtn.addEventListener('click', function() {
                scrollContainer.scrollBy({
                    left: -340,
                    behavior: 'smooth'
                });
            });

            scrollRightBtn.addEventListener('click', function() {
                scrollContainer.scrollBy({
                    left: 340,
                    behavior: 'smooth'
                });
            });
        }
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Hàm tạo sao dựa trên điểm đánh giá
        function createStars(containerElement) {
            const rating = parseFloat(containerElement.getAttribute('data-rating')) || 0;
            const starCount = 5; // Tổng số sao

            containerElement.innerHTML = ''; // Xóa nội dung hiện tại

            for (let i = 1; i <= starCount; i++) {
                const star = document.createElement('span');
                star.classList.add('star');

                if (i <= rating) {
                    // Sao đầy đủ
                    star.classList.add('star-full');
                    star.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
          <path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/>
        </svg>`;
                } else if (i - 0.5 <= rating) {
                    // Nửa sao
                    star.classList.add('star-half');
                    star.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
          <path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/>
        </svg>`;
                } else {
                    // Sao trống
                    star.classList.add('star-empty');
                    star.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
          <path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/>
        </svg>`;
                }

                containerElement.appendChild(star);
            }
        }

        // Chuyển đổi điểm uy tín thành thang điểm 5 sao
        function convertPointsToRating(points) {
            // Giả sử điểm tối đa là 500, bạn có thể điều chỉnh thang điểm này
            const maxPoints = 500;
            return Math.min(5, (points / maxPoints) * 5);
        }

        // Áp dụng cho tất cả thẻ thành viên
        document.querySelectorAll('.member-card').forEach(card => {
            const pointsElement = card.querySelector('.member-reputation');
            if (pointsElement) {
                // Trích xuất số điểm từ văn bản (ví dụ: "Điểm uy tín: 380 điểm")
                const pointsText = pointsElement.textContent;
                const pointsMatch = pointsText.match(/(\d+)/);

                if (pointsMatch && pointsMatch[1]) {
                    const points = parseInt(pointsMatch[1], 10);
                    const rating = convertPointsToRating(points);

                    // Tạo container đánh giá sao nếu chưa có
                    let ratingContainer = card.querySelector('.rating-stars');
                    if (!ratingContainer) {
                        ratingContainer = document.createElement('div');
                        ratingContainer.classList.add('rating-stars');
                        pointsElement.after(ratingContainer);
                    }

                    // Đặt điểm đánh giá và tạo các sao
                    ratingContainer.setAttribute('data-rating', rating.toFixed(1));
                    createStars(ratingContainer);
                }
            }
        });
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Counter animation function
        function animateCounter(element, target) {
            let current = 0;
            const increment = Math.ceil(target / 50); // Adjust speed by changing the divisor
            const timer = setInterval(() => {
                current += increment;
                if (current >= target) {
                    element.textContent = new Intl.NumberFormat('vi-VN').format(target);
                    clearInterval(timer);

                    // Add animation class
                    element.classList.add('animated-number');

                    // Optional: Reset and restart animation after delay
                    setTimeout(() => {
                        element.classList.remove('animated-number');
                        restartCounter(element, target);
                    }, 5000); // Wait 5 seconds before restarting
                } else {
                    element.textContent = new Intl.NumberFormat('vi-VN').format(current);
                }
            }, 30);
        }
        // Initialize all counters when they come into view
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const counterElements = entry.target.querySelectorAll('.counter');
                    counterElements.forEach(counter => {
                        const target = parseInt(counter.getAttribute('data-target'));
                        animateCounter(counter, target);
                    });
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.1 });

        // Observe the stats section
        const statsSection = document.querySelector('.stats-section');
        if (statsSection) {
            observer.observe(statsSection);
        }
    });
</script>

</body>
</html>