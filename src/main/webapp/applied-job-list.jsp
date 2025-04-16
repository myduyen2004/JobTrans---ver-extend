<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->

<head>
    <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="session"></jsp:useBean>
    <jsp:useBean id="accountDAO" class="jobtrans.dal.AccountDAO" scope="session"></jsp:useBean>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">

    <title>Projects &#8211; ProLancer</title>
    <meta name='robots' content='max-image-preview:large'/>
    <link rel="icon" type="image/png" href="">
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2ecc71;
            --warning: #f39c12;
            --danger: #e74c3c;
            --light: #f5f5f5;
            --dark: #34495e;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }

        h1 {
            font-size: 24px;
            color: var(--dark);
        }

        .user-controls {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .user-type {
            display: flex;
            background-color: #eee;
            border-radius: 30px;
            overflow: hidden;
        }

        .user-type button {
            padding: 8px 20px;
            border: none;
            background: none;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
        }

        .user-type button.active {
            background-color: #6787fe;
            color: white;
        }

        .filters {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 10px;
        }

        .search-box {
            flex: 1;
            max-width: 400px;
            position: relative;
        }

        .search-box input {
            width: 100%;
            padding: 10px 15px;
            padding-left: 40px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .search-box:before {
            content: "🔍";
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }

        .filter-group {
            display: flex;
            gap: 10px;
        }

        select {
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            background-color: #fff;
        }

        .jobs-list {
        }

        @media (max-width: 768px) {
            .jobs-list {
                grid-template-columns: 1fr;
            }
        }

        .job-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
            padding: 20px;
            transition: transform 0.2s;
            border-left: 1px solid #eee; /* Đổi thành đường viền nhẹ thay vì màu đặc trưng */
            position: relative;
            margin: 20px 0;
        }

        .job-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .job-status {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 5px 10px;
            border-radius: 30px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .status-pending {
            background-color: rgba(243, 156, 18, 0.1);
            color: var(--warning);
        }

        .status-accepted {
            background-color: rgba(46, 204, 113, 0.1);
            color: var(--secondary);
        }

        .status-rejected {
            background-color: rgba(231, 76, 60, 0.1);
            color: var(--danger);
        }

        .status-reviewing {
            background-color: rgba(52, 152, 219, 0.1);
            color: var(--primary);
        }

        .job-title {
            font-size: 18px;
            margin-bottom: 10px;
            padding-right: 80px;
        }

        .job-company {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 15px;
        }

        .company-logo {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: #eee;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: var(--dark);
        }

        .company-name {
            font-weight: 500;
        }

        .job-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px 20px;
            margin-bottom: 15px;
        }

        .job-detail {
            display: flex;
            flex-direction: column;
        }

        .detail-label {
            font-size: 12px;
            color: #777;
        }

        .detail-value {
            font-weight: 500;
        }

        .job-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 15px;
        }

        .btn {
            padding: 8px 12px;
            border-radius: 4px;
            border: none;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-primary {
            background-color: #6787fe;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0F1B63;
        }

        .btn-outline {
            background-color: transparent;
            border: 1px solid #ddd;
        }

        .btn-outline:hover {
            background-color: #f5f5f5;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 30px;
            gap: 10px;
        }

        .page-btn {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            border: 1px solid #ddd;
            background-color: #fff;
            cursor: pointer;
            transition: all 0.2s;
        }

        .page-btn:hover, .page-btn.active {
            background-color: #6787fe;
            color: white;
            border-color: var(--primary);
        }

        .no-results {
            grid-column: 1/-1;
            text-align: center;
            padding: 40px;
            color: #777;
        }
    </style>
</head>

<body>

<div class="row main-content" id="mainContent">

<%--    <section class="section-padding">--%>
<%--        <div class="container">--%>
<%--            <div class="row justify-content-center flex-row-reverse">--%>
<%--                <div class="col-xl-9" style="text-align: center;">--%>
<%--                    <h2>Danh sách công việc đã ứng tuyển</h2>--%>
<%--                </div>--%>
<%--                <c:forEach items="${job}" var="o">--%>
<%--                    <c:set var="jobDetail" value="${jobDAO.getJobById(o.jobId)}" />--%>
<%--                    <c:set var="accountDetail" value="${accountDAO.getAccountById(o.jobSeekerId)}" />--%>
<%--                    <c:set var="accountCompany" value="${accountDAO.getAccountById(jobDetail.postAccountId)}" />--%>

<%--                <div class="job-card-2">--%>
<%--                    <div class="job-header-2">--%>
<%--                        <div class="avatar-wrapper">--%>
<%--                            <img src="" alt="User Avatar" class="avatar-2">--%>
<%--                            <div class="verified-icon"></div>--%>
<%--                        </div>--%>
<%--                        <div>--%>
<%--                            <div style="display: flex">--%>
<%--                                <div class="job-title-2">${jobDetail.jobTitle}</div>--%>

<%--                                <div style="margin-left: 100px" class="job-category-2">${fn:substring(jobDetail.description, 0, 30)}...</div>--%>
<%--                                    &lt;%&ndash;                                <a  href="" class="view-cv-2">Xem </a>&ndash;%&gt;--%>
<%--                            </div>--%>
<%--                            <div class="job-category-2">${accountCompany.accountName}</div>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                    <div class="job-info-2">--%>
<%--                        Thời hạn ứng tuyển:--%>
<%--                        <fmt:formatDate value="${jobDetail.postDate}" pattern="dd/MM/yyyy" /> ---%>
<%--                        <fmt:formatDate value="${jobDetail.dueDate}" pattern="dd/MM/yyyy" />--%>
<%--                    </div>--%>
<%--                    <div class="job-info-2">--%>
<%--                        CV đã ứng tuyển:--%>
<%--                        <a href="href="cv?action=view&cvId=${o.cvId}"><span class="cv-name-2">Xem CV</span></a>--%>
<%--                    </div>--%>
<%--                    <div class="salary-range-2">--%>
<%--            <span class="salary-2">--%>
<%--                <fmt:formatNumber value="${jobDetail.budgetMin}" type="currency" currencyCode="VND" />--%>
<%--            </span>--%>
<%--                        <span style="color: #6787FE;">-</span>--%>
<%--                        <span class="salary-2">--%>
<%--                <fmt:formatNumber value="${jobDetail.budgetMax}" type="currency" currencyCode="VND" />--%>


<%--                        </span>--%>


<%--                    </div>--%>
<%--                </div>--%>
<%--                </c:forEach>--%>
<%--    </section>--%>

    <div class="container">
        <header>
            <h1>Danh sách công việc đã ứng tuyển</h1>
            <div class="user-controls">
                <div class="user-type">
                    <button class="active">Freelancer</button>
                    <button>Employer</button>
                </div>
            </div>
        </header>

        <div class="filters">
            <div class="search-box">
                <input type="text" placeholder="Tìm kiếm theo tên công việc hoặc công ty">
            </div>
            <div class="filter-group">
                <select>
                    <option>Tất cả trạng thái</option>
                    <option>Đã nộp hồ sơ</option>
                    <option>Đang xem xét</option>
                    <option>Được chấp nhận</option>
                    <option>Bị từ chối</option>
                </select>

                <select>
                    <option>Sắp xếp theo: Mới nhất</option>
                    <option>Sắp xếp theo: Cũ nhất</option>
                    <option>Sắp xếp theo: Mức lương cao</option>
                    <option>Sắp xếp theo: Mức lương thấp</option>
                </select>
            </div>
        </div>

        <div class="jobs-list">
            <!-- Job Card 1 -->
            <div class="job-card">
                <div class="job-status status-reviewing">Đang xem xét</div>
                <h3 class="job-title">Thiết kế website tuyển dụng freelancer</h3>
                <div class="job-company">
                    <div class="company-logo">T</div>
                    <div class="company-name">Tech Solutions Inc.</div>
                </div>
                <div class="job-details">
                    <div class="job-detail">
                        <span class="detail-label">Ngày ứng tuyển</span>
                        <span class="detail-value">05/04/2025</span>
                    </div>
                    <div class="job-detail">
                        <span class="detail-label">Mức lương</span>
                        <span class="detail-value">15.000.000 VND</span>
                    </div>
                    <div class="job-detail">
                        <span class="detail-label">Thời hạn</span>
                        <span class="detail-value">30 ngày</span>
                    </div>
                    <div class="job-detail">
                        <span class="detail-label">Loại công việc</span>
                        <span class="detail-value">Web Development</span>
                    </div>
                </div>
                <div class="job-actions">
                    <button class="btn btn-outline">Xem chi tiết</button>
                    <button class="btn btn-primary">Liên hệ</button>
                </div>
            </div>

            <!-- Job Card 2 -->
            <div class="job-card">
                <div class="job-status status-accepted">Được chấp nhận</div>
                <h3 class="job-title">Thiết kế logo cho ứng dụng di động</h3>
                <div class="job-company">
                    <div class="company-logo">M</div>
                    <div class="company-name">Mobile App Studio</div>
                </div>
                <div class="job-details">
                    <div class="job-detail">
                        <span class="detail-label">Ngày ứng tuyển</span>
                        <span class="detail-value">01/04/2025</span>
                    </div>
                    <div class="job-detail">
                        <span class="detail-label">Mức lương</span>
                        <span class="detail-value">5.000.000 VND</span>
                    </div>
                    <div class="job-detail">
                        <span class="detail-label">Thời hạn</span>
                        <span class="detail-value">7 ngày</span>
                    </div>
                    <div class="job-detail">
                        <span class="detail-label">Loại công việc</span>
                        <span class="detail-value">Graphic Design</span>
                    </div>
                </div>
                <div class="job-actions">
                    <button class="btn btn-outline">Xem chi tiết</button>
                    <button class="btn btn-primary">Liên hệ</button>
                </div>
            </div>

            <!-- Job Card 3 -->
            <div class="job-card">
                <div class="job-status status-pending">Đã nộp hồ sơ</div>
                <h3 class="job-title">Viết nội dung blog về công nghệ AI</h3>
                <div class="job-company">
                    <div class="company-logo">A</div>
                    <div class="company-name">AI Tech Blog</div>
                </div>
                <div class="job-details">
                    <div class="job-detail">
                        <span class="detail-label">Ngày ứng tuyển</span>
                        <span class="detail-value">08/04/2025</span>
                    </div>
                    <div class="job-detail">
                        <span class="detail-label">Mức lương</span>
                        <span class="detail-value">3.000.000 VND</span>
                    </div>
                    <div class="job-detail">
                        <span class="detail-label">Thời hạn</span>
                        <span class="detail-value">15 ngày</span>
                    </div>
                    <div class="job-detail">
                        <span class="detail-label">Loại công việc</span>
                        <span class="detail-value">Content Writing</span>
                    </div>
                </div>
                <div class="job-actions">
                    <button class="btn btn-outline">Xem chi tiết</button>
                    <button class="btn btn-primary">Liên hệ</button>
                </div>
            </div>

            <!-- Job Card 4 -->
            <div class="job-card">
                <div class="job-status status-rejected">Bị từ chối</div>
                <h3 class="job-title">Phát triển ứng dụng di động bán hàng</h3>
                <div class="job-company">
                    <div class="company-logo">E</div>
                    <div class="company-name">E-commerce Solutions</div>
                </div>
                <div class="job-details">
                    <div class="job-detail">
                        <span class="detail-label">Ngày ứng tuyển</span>
                        <span class="detail-value">25/03/2025</span>
                    </div>
                    <div class="job-detail">
                        <span class="detail-label">Mức lương</span>
                        <span class="detail-value">20.000.000 VND</span>
                    </div>
                    <div class="job-detail">
                        <span class="detail-label">Thời hạn</span>
                        <span class="detail-value">45 ngày</span>
                    </div>
                    <div class="job-detail">
                        <span class="detail-label">Loại công việc</span>
                        <span class="detail-value">Mobile Development</span>
                    </div>
                </div>
                <div class="job-actions">
                    <button class="btn btn-outline">Xem chi tiết</button>
                    <button class="btn btn-primary">Tìm tương tự</button>
                </div>
            </div>
        </div>

        <div class="pagination">
            <button class="page-btn">←</button>
            <button class="page-btn active">1</button>
            <button class="page-btn">2</button>
            <button class="page-btn">3</button>
            <button class="page-btn">→</button>
        </div>
    </div>

    <script>
        // Chuyển đổi giữa chế độ Freelancer và Employer
        const userTypeButtons = document.querySelectorAll('.user-type button');
        userTypeButtons.forEach(button => {
            button.addEventListener('click', () => {
                userTypeButtons.forEach(btn => btn.classList.remove('active'));
                button.classList.add('active');

                // Ở đây bạn có thể thêm mã để tải danh sách công việc dựa trên loại người dùng
                // Ví dụ: loadJobs(button.textContent.toLowerCase());
            });
        });

        // Mô phỏng chức năng tìm kiếm (trong thực tế, cần xử lý thêm)
        const searchInput = document.querySelector('.search-box input');
        searchInput.addEventListener('input', () => {
            const searchQuery = searchInput.value.toLowerCase();
            const jobCards = document.querySelectorAll('.job-card');

            jobCards.forEach(card => {
                const title = card.querySelector('.job-title').textContent.toLowerCase();
                const company = card.querySelector('.company-name').textContent.toLowerCase();

                if (title.includes(searchQuery) || company.includes(searchQuery)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    </script>
</div>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

</body>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

</html>