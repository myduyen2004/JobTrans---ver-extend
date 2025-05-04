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
<div class="content" id="content">
    <div class="main-content">
        <section class="section-padding">
            <div class="container">
                <div class="page-title-container">
                    <h1 class="page-title">Quản Lý Công Việc Đã Đăng</h1>
                    <p class="page-subtitle">Theo dõi, cập nhật và quản lý danh sách các công việc bạn đã đăng trên nền tảng JobTrans</p>
                </div>
                <div class="new-job-btn-container">
                    <a href="post_job.jsp">
                        <button class="new-job-btn">
                            <i class="fas fa-plus-circle"></i> Đăng việc mới
                        </button>
                    </a>
                </div>
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
                    <div class="search-result col-lg-10">
                        <c:forEach var="o" items="${jobList}" varStatus="status">
                            <div class="post-box">
                                <input type="hidden" name="jobId" value="${o.jobId}"/>
                                <div class="greeting-badge">
                                        ${jobDao.getNumOfJobGreetingByJobId(o.jobId)} Chào giá <i
                                        class="fas fa-bolt" ></i>
                                </div>
                                <div class="row m-3">
                                    <div class="col-md-6">
                                        <a class="project-title" href="job?action=posted-job-detail&jobId=${o.jobId}">
                                            <h3>${o.jobTitle}</h3>
                                        </a>
                                        <div class="job-meta">
                                            <i class="fas fa-clock"></i>
                                            Hạn tuyển: <span>${o.dueDatePost}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6 d-flex flex-column align-items-center justify-content-center">
                                        <div class="price-display">
                                                ${o.budgetMin}<span class="currency-symbol">&#8363;</span>
                                            -
                                                ${o.budgetMax}<span class="currency-symbol">&#8363;</span>
                                        </div>
                                        <div class="job-card-actions">
                                            <c:if test="${o.statusJobId >=1}">
                                            <a href="job-manage-process?action=process-tool&jobId=${o.jobId}">
                                                <button class="detail-btn">
                                                    <i class="fas fa-cogs "></i> Quản lí công việc
                                                </button>
                                            </a>
                                            </c:if>
                                            <a href="job?action=pre-update&jobId=${o.jobId}">
                                                <button class="edit-btn">
                                                    <i class="fas fa-edit"></i> Sửa
                                                </button>
                                            </a>
<%--                                            <button class="delete-btn" onclick="confirmDelete(${o.jobId})">--%>
<%--                                                <i class="fas fa-trash"></i> Xóa--%>
<%--                                            </button>--%>
                                            <a href="javascript:void(0)" onclick="openDeleteModal('${o.jobId}')"
                                               class="delete-btn" style="text-decoration: none">
                                                <i class="fas fa-trash-alt"></i> Xóa
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
<%--<script>--%>
<%--    function confirmDelete(jobId) {--%>
<%--        if (confirm("Bạn có chắc chắn muốn xóa công việc này không?")) {--%>
<%--            window.location.href = "job?action=delete-job&jobId=" + jobId;--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>

<%--Popup--%>
<div id="deleteConfirmModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%;
    background: rgba(0,0,0,0.5); justify-content: center; align-items: center; z-index: 9999;">
    <div style="background: white; padding: 20px; border-radius: 8px; width: 500px; text-align: center;">
        <h5 style="margin-bottom: 20px;">Bạn có chắc chắn muốn xóa công việc này không?</h5>
        <div class="d-flex justify-content-center gap-2">
            <button id="confirmDeleteBtn" class="delete-btn" style="color: white; width: 100%">Xóa</button>
            <button onclick="closeDeleteModal()" class="btn btn-outline-secondary" style="width: 100%">Không</button>
        </div>
    </div>
</div>

<script>
    let jobIdToDelete = null;

    function openDeleteModal(jobId) {
        jobIdToDelete = jobId;
        document.getElementById('deleteConfirmModal').style.display = 'flex';
    }

    function closeDeleteModal() {
        document.getElementById('deleteConfirmModal').style.display = 'none';
        jobIdToDelete = null;
    }

    document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
        if (jobIdToDelete) {
            window.location.href = 'job?action=deleteJob&jobId=' + jobIdToDelete;
        }
    });
</script>
</html>
