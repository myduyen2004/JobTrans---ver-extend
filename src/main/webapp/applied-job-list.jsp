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
    <link rel="stylesheet" href="css/applied-job-list.css">
</head>
<body>
<%@include file="includes/header-01.jsp" %>
<div class="py-4 banner_title">
    <h1 class="text-white font-weight-bold" style="padding-left: 50px;">Danh sách công việc</h1>
</div>
<div class="cong">

    <div class="content" id="content">
        <div class="row main-content" id="mainContent">


            <div class="containerr">
                <header>
                    <h1 style="font-size: 24px;
            color: var(--dark);font-weight: bold">Danh sách công việc đã ứng tuyển</h1>

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
                        <form action="jobGreeting" method="get">
                            <input type="hidden" name="action" value="list-job-by-status">
                            <select name="status" onchange="this.form.submit()">
                                <option value="">-- Chọn trạng thái --</option>
                                <option value="Chờ xét duyệt">Chờ xét duyệt</option>
                                <option value="Chờ phỏng vấn">Chờ phỏng vấn</option>
                                <option value="Được nhận">Được nhận</option>
                                <option value="Bị từ chối">Bị từ chối</option>
                                <option value="tất cả">tất cả</option>
                            </select>
                        </form>

                        <form id="sortForm" action="jobGreeting" method="get">
                            <input type="hidden" name="action" value="sort">

                            <select name="sort" onchange="document.getElementById('sortForm').submit()">
                                <option value="newest" ${param.sort == 'newest' ? 'selected' : ''}>Sắp xếp theo: Mới
                                    nhất
                                </option>
                                <option value="oldest" ${param.sort == 'oldest' ? 'selected' : ''}>Sắp xếp theo: Cũ nhất
                                </option>
                                <option value="salary_high" ${param.sort == 'salary_high' ? 'selected' : ''}>Sắp xếp
                                    theo:
                                    Mức lương cao
                                </option>
                                <option value="salary_low" ${param.sort == 'salary_low' ? 'selected' : ''}>Sắp xếp theo:
                                    Mức
                                    lương thấp
                                </option>
                            </select>
                        </form>
                    </div>
                </div>

                <form action="jobGreeting" method="get">
                    <input type="hidden" name="action" value="detail">

                    <div class="jobs-list">
                        <c:forEach items="${job}" var="o">
                            <c:set var="jobDetail" value="${jobDAO.getJobById(o.jobId)}"/>
                            <c:set var="accountDetail" value="${accountDAO.getAccountById(o.jobSeekerId)}"/>
                            <c:set var="accountCompany" value="${accountDAO.getAccountById(jobDetail.postAccountId)}"/>
                            <input type="hidden" name="jobGreetingId" value="${o.greetingId}">
                            <input type="hidden" name="jobId" value="${jobDetail.jobId}">
                            <!-- Job Card 1 -->
                            <div class="job-card">
                                <div style="font-weight: bold" class="job-status status-reviewing">${o.status}</div>
                                <h3 class="job-title">${jobDetail.jobTitle}</h3>
                                <div class="job-company">
                                    <div class="company-logo">T</div>
                                    <div class="company-name">${accountCompany.accountName}</div>
                                </div>
                                <div class="job-details">
                                    <div class="job-detail">
                                        <span class="detail-label">Ngày ứng tuyển</span>
                                        <span class="detail-value"><fmt:formatDate value="${jobDetail.dueDatePost}"
                                                                                   pattern="dd/MM/yyyy"/> </span>
                                    </div>
                                    <div class="job-detail">
                                        <span class="detail-label">Mức lương</span>
                                        <span class="detail-value"><fmt:formatNumber value="${jobDetail.budgetMin}"
                                                                                     type="currency"
                                                                                     currencyCode="VND"/> - <fmt:formatNumber value="${jobDetail.budgetMax}"
                                                                                                                              type="currency"
                                                                                                                              currencyCode="VND"/></span>
                                    </div>
                                    <div class="job-detail">
                                        <span class="detail-label">Thời hạn</span>
                                        <span class="detail-value"> <fmt:formatDate value="${jobDetail.dueDateJob}"
                                                                                    pattern="dd/MM/yyyy"/></span>
                                    </div>

                                </div>
                                <div class="job-actions">
                                    <a href="jobGreeting?action=detail&jobGreetingId=${o.greetingId}&jobId=${jobDetail.postAccountId}" class="btn btn-outline">Xem chi tiết</a>
                                    <a class="btn btn-primary">Liên hệ</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </form>
                <div class="pagination">
                    <button class="page-btn">←</button>
                    <button class="page-btn active">1</button>
                    <button class="page-btn">2</button>
                    <button class="page-btn">3</button>
                    <button class="page-btn">→</button>
                </div>
            </div>
        </div>
        <div>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
<script>
    document.querySelector('select[name="sort"]').addEventListener('change', function () {
        const form = document.getElementById('sortForm');
        fetch(form.action + '?' + new URLSearchParams(new FormData(form)), {
            method: 'GET'
        })
            .then(response => response.text())
            .then(html => {
                document.querySelector('.jobs-list').innerHTML =
                    new DOMParser().parseFromString(html, 'text/html')
                        .querySelector('.jobs-list').innerHTML;
            });
    });
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