<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="session"/>
    <jsp:useBean id="accountDAO" class="jobtrans.dal.AccountDAO" scope="session"/>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Danh sách công việc đã ứng tuyển &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large'/>
    <link href="css/applied-job-list.css" rel="stylesheet"/>
    <style>
        .job-card-2 {
            border-radius: 12px;
            padding: 16px;
            display: block;
            width: 100%;
            position: relative;
            background: #FFFFFF;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            overflow: hidden;
            transition: var(--transition);
            border: 1px solid #eaeaea;
        }

        .job-card-2::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: rgb(21, 42, 105);
        }

        .job-card-2:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .job-header-2 {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .job-title-2 {
            font-size: 18px;
            font-weight: bold;
            color: rgb(21, 42, 105);
            margin-bottom: 10px;
        }

        .job-category-2 {
            font-size: 14px;
            color: #777;
            margin-top: 4px;
            margin-left: 20px;
            margin-right: 20px;
        }

        .job-info-2 {
            font-size: 14px;
            color: rgb(21, 42, 105);
            margin-bottom: 10px;
        }

        .cv-name-2 {
            font-weight: bold;
            color: #6787FE;
        }

        .salary-range-2 {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 20px;
        }

        .salary-2 {
            font-size: 16px;
            font-weight: 700;
            color: rgb(21, 42, 105);
        }

        .jobG-status {
            padding: 4px 12px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            color: whitesmoke;
            border: 0;
            margin-bottom: 10px;
        }

        .jobG-status.pending {
            background-color: #ffc107; /* vàng - chờ xét duyệt */
        }

        .jobG-status.interview {
            background-color: #17a2b8; /* xanh dương nhạt - chờ phỏng vấn */
        }

        .jobG-status.accepted {
            background-color: #28a745; /* xanh lá - được nhận */
        }

        .jobG-status.rejected {
            background-color: #dc3545; /* đỏ - bị từ chối */
        }

        .detail-link {
            display: inline-block;
            padding: 6px 12px;
            font-size: 14px;
            background: linear-gradient(to right, var(--primary-dark), var(--primary-light));
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            transition: background-color 0.3s ease, transform 0.2s ease;
            margin-bottom: 10px;
        }

        .detail-link:hover {
            box-shadow: 0 4px 8px rgba(21, 42, 105, 0.3);
            transform: scale(1.03); /* Hiệu ứng phóng to nhẹ */
        }

        .detail-link:active {
            box-shadow: 0 4px 8px rgba(21, 42, 105, 0.3);
            transform: scale(0.97); /* Hiệu ứng khi click */
        }

        .greeting-box {
            position: absolute;
            top: 15px;
            right: 15px;
            background: rgb(21, 42, 105);
            color: #fff;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            animation: pulse 2s infinite;
        }
    </style>
</head>

<body style="font-family: Inter, sans-serif">
<%@include file="includes/header-01.jsp" %>
<div class="content" id="content">
    <div class="main-content">
        <section class="section-padding">
            <div class="container">
                <div class="page-title-container">
                    <h1 class="page-title">Quản Lý Danh Sách Công Việc Đã Ứng Tuyển</h1>
                    <p class="page-subtitle">Theo dõi, cập nhật và quản lý danh sách các công việc, đơn ứng tuyển bạn đã
                        ứng tuyển trên nền tảng JobTrans</p>
                </div>
                <div class="row mb-4 filter-container">
                    <div class="col-md-8"></div>
                    <div class="col-md-4 d-flex gap-2 align-items-center justify-content-end">
                        <div class="form-container">
                            <form action="job-greeting" method="get">
                                <input type="hidden" name="action" value="list-job-by-status">
                                <select name="status" onchange="this.form.submit()">
                                    <option value="">-- Chọn trạng thái --</option>
                                    <option value="Chờ xét duyệt" ${param.status == 'Chờ xét duyệt' ? 'selected' : ''}>
                                        Chờ xét duyệt
                                    </option>
                                    <option value="Chờ phỏng vấn" ${param.status == 'Chờ phỏng vấn' ? 'selected' : ''}>
                                        Chờ phỏng vấn
                                    </option>
                                    <option value="Được nhận" ${param.status == 'Được nhận' ? 'selected' : ''}>Được
                                        nhận
                                    </option>
                                    <option value="Bị từ chối" ${param.status == 'Bị từ chối' ? 'selected' : ''}>Bị từ
                                        chối
                                    </option>
                                    <option value="tất cả" ${param.status == 'tất cả' ? 'selected' : ''}>tất cả</option>
                                </select>
                            </form>
                        </div>

                        <div class="form-container">
                            <form id="sortForm" action="job-greeting" method="get">
                                <input type="hidden" name="action" value="sort">

                                <select name="sort" onchange="document.getElementById('sortForm').submit()">
                                    <option value="newest" ${param.sort == 'newest' ? 'selected' : ''}>Sắp xếp theo: Mới
                                        nhất
                                    </option>
                                    <option value="oldest" ${param.sort == 'oldest' ? 'selected' : ''}>Sắp xếp theo: Cũ
                                        nhất
                                    </option>
                                    <option value="salary_high" ${param.sort == 'salary_high' ? 'selected' : ''}>Sắp xếp
                                        theo:
                                        Mức lương thấp
                                    </option>
                                    <option value="salary_low" ${param.sort == 'salary_low' ? 'selected' : ''}>Sắp xếp
                                        theo:
                                        Mức
                                        lương cao
                                    </option>
                                </select>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="search-result col-lg-10">
                        <c:forEach items="${job}" var="o">
                            <c:set var="jobDetail" value="${jobDAO.getJobById(o.jobId)}"/>
                            <c:set var="accountDetail" value="${accountDAO.getAccountById(o.jobSeekerId)}"/>
                            <c:set var="accountCompany" value="${accountDAO.getAccountById(jobDetail.postAccountId)}"/>
                            <div class="job-card-2">
                                <div class="greeting-box">
                                    ${jobDAO.getNumOfJobGreetingByJobId(jobDetail.jobId)} Chào giá <i style="color: #ffcc00; margin-left: 4px;" class="fas fa-bolt"></i>
                                </div>
                                <div class="row">
                                <div class="col-md-6" style="display: flex; flex-direction: column; justify-content: center;">
                                        <div class="job-header-2">
                                            <div style="display: flex;">
                                                <div style="justify-content: space-between; display: flex">
                                                    <div class="job-title-2">${jobDetail.jobTitle}</div>
                                                    <div class="job-category-2">${accountCompany.accountName}</div>
                                                    <c:choose>
                                                        <c:when test="${o.status == 'Chờ xét duyệt'}">
                                                            <button class="jobG-status pending">Chờ xét duyệt</button>
                                                        </c:when>
                                                        <c:when test="${o.status == 'Chờ phỏng vấn'}">
                                                            <button class="jobG-status interview">Chờ phỏng vấn</button>
                                                        </c:when>
                                                        <c:when test="${o.status == 'Được nhận'}">
                                                            <button class="jobG-status accepted">Được nhận</button>
                                                        </c:when>
                                                        <c:when test="${o.status == 'Bị từ chối'}">
                                                            <button class="jobG-status rejected">Bị từ chối</button>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="job-info-2">
                                            <i class="fas fa-clock"></i>
                                            Hạn tuyển: <fmt:formatDate value="${jobDetail.dueDatePost}"
                                                                       pattern="dd/MM/yyyy"/>
                                        </div>
                                        <div class="job-info-2">
                                            CV đã ứng tuyển:
                                            <a href="cv?action=view&cvId=${o.cvId}"><span
                                                    class="cv-name-2">Xem CV</span></a>
                                        </div>
                                    </div>
                                <div class="col-md-6" style="display: flex; flex-direction: column; align-items: center;">
                                        <div class="salary-range-2">
                                            <span class="salary-2">
                                                    <fmt:formatNumber value="${jobDetail.budgetMin}" pattern="#,##0.00 ₫"/>
                                            </span>
                                            <span>-</span>
                                            <span class="salary-2">
                                                <fmt:formatNumber value="${jobDetail.budgetMax}" pattern="#,##0.00 ₫"/>
                                            </span>
                                        </div>
                                        <div style="display: flex; gap: 10px;">
                                            <a href="job-manage-process?action=process-tool&jobId=${jobDetail.jobId}">
                                                <button class="detail-link">
                                                    <i class="fas fa-cogs "></i> Quản lí công việc
                                                </button>
                                            </a>
                                            <a href="job-greeting?action=detail&jobGreetingId=${o.greetingId}&jobId=${jobDetail.jobId}"
                                               class="detail-link" style="text-decoration: none;">
                                                Xem chi tiết
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
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
        </section>
    </div>
    <%@include file="includes/footer.jsp" %>
</div>
</body>
</html>