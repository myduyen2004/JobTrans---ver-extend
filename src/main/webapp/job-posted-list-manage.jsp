<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"/>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Danh sách công việc đã đăng &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large'/>
    <link href="./css/job-posted-list-manage.css" rel="stylesheet"/>
</head>

<body style="font-family: Inter, sans-serif">
<%@include file="includes/header-01.jsp" %>
<%@include file="includes/sidebar.jsp" %>
<div class="content" id="content">
    <div class="main-content">
        <section class="section-padding">
            <div class="container">
                <div class="row mb-4 filter-container">
                    <div class="col-md-8"></div>
                    <div class="col-md-4 d-flex gap-2 align-items-center justify-content-end">
                        <button class="filter-btn expired-btn">Hết hạn</button>
                        <button class="filter-btn active-btn">Đang tuyển</button>
                        <div class="sort-dropdown">
                            <button class="btn dropdown-toggle" type="button" id="sortDropdown" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                Sắp xếp <i class="fas fa-filter"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="sortDropdown">
                                <a class="dropdown-item" href="#">Mới nhất</a>
                                <a class="dropdown-item" href="#">A - Z</a>
                                <a class="dropdown-item" href="#">Z - A</a>
                                <a class="dropdown-item" href="#">Lương tăng dần</a>
                                <a class="dropdown-item" href="#">Lương giảm dần</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="search-result col-lg-9">
                        <c:forEach var="o" items="${jobList}" varStatus="status">
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
                                        <a href="job?action=posted-job-detail&jobId=${o.jobId}">
                                            <button class="detail-btn">
                                                Chi tiết
                                            </button>
                                        </a>
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
        <%@include file="includes/sidebar.jsp"%>
    </div>
    <%@include file="includes/footer.jsp" %>
</div>

</body>


</html>
