<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"/>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Danh sách công việc đã ứng tuyển &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large'/>
    <link href="css/applied-job-list.css" rel="stylesheet"/>
</head>

<body style="font-family: Inter, sans-serif">
<%@include file="includes/header-01.jsp" %>
<div class="content" id="content">
    <div class="main-content">
        <section class="section-padding">
            <div class="container">
                <div class="page-title-container">
                    <h1 class="page-title">Quản Lý Danh Sách Công Việc Đã Ứng Tuyển</h1>
                    <p class="page-subtitle">Theo dõi, cập nhật và quản lý danh sách các công việc, đơn ứng tuyển bạn đã ứng tuyển trên nền tảng JobTrans</p>
                </div>
                <div class="row mb-4 filter-container">
                    <div class="col-md-8"></div>
                    <div class="col-md-4 d-flex gap-2 align-items-center justify-content-end">
                        <div class="form-container">
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
                        </div>

                        <div class="form-container">
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
                </div>

                <div class="row justify-content-center">
                    <div class="search-result col-lg-9">
                        <c:forEach var="o" items="${job}" varStatus="status">
                            <div class="post-box">
                                <input type="hidden" name="jobId" value="${o.jobId}"/>
                                <div class="greeting-badge">
                                        ${jobDao.getNumOfJobGreetingByJobId(o.jobId)} Chào giá <i
                                        class="fas fa-bolt"></i>
                                </div>
                                <div class="row m-3">
                                    <div class="col-md-9">
                                        <a class="project-title" href="job?action=posted-job-detail&jobId=${o.jobId}">
                                            <h3>${o.jobTitle}</h3>
                                        </a>
                                        <div class="job-meta">
                                            <i class="fas fa-clock"></i>
                                            Hạn tuyển: <span>${o.dueDatePost}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-3 d-flex flex-column align-items-center justify-content-center">
                                        <div class="price-display">
                                                ${o.budgetMin}<span class="currency-symbol">&#8363;</span>
                                            -
                                                ${o.budgetMax}<span class="currency-symbol">&#8363;</span>
                                        </div>
                                        <div class="job-card-actions">
                                            <a href="job?action=details-job-posted&jobId=${o.jobId}">
                                                <button class="detail-btn">
                                                    <i class="fas fa-eye"></i> Chi tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div id="pagination" class="mt-4 d-flex justify-content-center">
                        <nav>
                            <ul class="pagination">
                                <li class="page_item prev-next">Trang Trước</li>
                                <li class="page_item active">1</li>
                                <li class="page_item">2</li>
                                <li class="page_item">3</li>
                                <li class="page_item">4</li>
                                <li class="page_item prev-next">Trang sau</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <%@include file="includes/footer.jsp" %>
</div>

</body>

</html>
