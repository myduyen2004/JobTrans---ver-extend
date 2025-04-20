<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"/>
    <jsp:useBean id="accDao" class="jobtrans.dal.AccountDAO" scope="session"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin tài khoản - Admin</title>
    <link href="./css/infor-user-manage.css" rel="stylesheet"/>
</head>
<body>
<%@include file="includes/header-01.jsp" %>
<%@include file="includes/sidebar.jsp" %>
<div class="container">
    <div class="profile-header">
        <img class="profile-avatar" src="${account.avatar}" alt="${account.accountName}">

        <div class="profile-info">
            <div class="profile-name">
                ${account.accountName}
                <c:if test="${account.verifiedAccount}">
                    <span class="badge-verified">Đã xác thực</span>
                </c:if>
            </div>
            <div class="profile-role">${account.typeAccount}</div>
            <div class="profile-location">${account.address}</div>
        </div>

        <div class="profile-actions">
            <h3 class="text-center">Điểm số: ${account.point}</h3>
            <a href="#" class="edit-button" style="color: white; background-color: #DC2626;">Chặn</a>
        </div>
    </div>

    <!-- Body content -->
    <div class="content-grid">
        <!-- Left column -->
        <div>
            <div class="card">
                <h2 class="card-title">Giới thiệu</h2>
                <p>${account.bio}</p>
            </div>
            <div class="card">
                <h2 class="card-title">Thông tin chuyên môn</h2>
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-label">Chuyên môn</div>
                        <div class="info-value">${account.speciality}</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Kinh nghiệm</div>
                        <div class="info-value">${account.experienceYears}</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Học vấn</div>
                        <div class="info-value">${account.education}</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Trạng thái</div>
                        <div class="info-value">${account.status}</div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="project-header">
                    <h2 class="card-title">Hoàn thành dự án</h2>
                    <span class="project-count">${jobDao.getNumOfCompleteJobByJobSeekerId(account.accountId)}</span>
                </div>
                <div class="progress-container">
                    <div class="progress-header">
                        <span class="progress-text">Tỷ lệ hoàn thành</span>
                        <span class="progress-value">${account.completePercent}</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-fill"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right column -->
        <div>
            <div class="card">
                <h2 class="card-title">Thông tin liên hệ</h2>
                <div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-envelope"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Email</div>
                            <div class="info-value">${account.email}</div>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-phone-alt"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Điện thoại</div>
                            <div class="info-value">${account.phone}</div>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-map-marker-alt"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Địa chỉ</div>
                            <div class="info-value">${account.address}</div>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-birthday-cake"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Ngày sinh</div>
                            <div class="info-value">${account.dateOfBirth}</div>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-venus-mars"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Giới tính</div>
                            <div class="info-value">${account.gender}</div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="card">
                <h2 class="card-title">Chữ ký số</h2>
                <div class="signature">
                    ${account.signature}
                </div>
            </div>
        </div>
    </div>

    <%--    Member--%>
    <c:if test="${account.typeAccount == 'Nhóm'}">
        <div class="reports-header">
            <h1 class="reports-title" style="padding-left: 500px;">Thành viên nhóm</h1>
        </div>

        <div class="container">
            <c:forEach var="members" items="${memberList}" varStatus="loop">
                <c:choose>
                    <c:when test="${not empty memberList}">
                        <div class="card">
                            <div class="member-header">
                                <div class="d-flex">
                                    <div class="member-avatar-wrapper">
                                        <img src="${members.avatarMember}" alt="${members.memberName}"
                                             class="member-avatar">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <h3 class="member-name">${members.memberName}</h3>
                                        <div class="member-role">${members.position}</div>
                                        <div>
                                            <span class="badge badge-custom" style="background-color: #4285f4; color: #fff;">
                                                <i class="fas fa-laptop-code"></i> ${members.speciality}
                                            </span>
                                            <span class="badge badge-custom" style="background-color: #34a853; color: #fff;">
                                                <i class="fas fa-briefcase"></i> ${members.experienceYears}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="px-4 py-3 d-grid">
                                <button class="btn btn-details btn-action" type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#memberDetails${loop.index}"
                                        aria-expanded="false"
                                        aria-controls="memberDetails${loop.index}">
                                    <i class="fas fa-chevron-down me-2"></i> Xem thông tin chi tiết
                                </button>
                            </div>

                            <div class="collapse" id="memberDetails${loop.index}">
                                <div class="collapse-content">
                                    <div class="member-info">
                                        <div class="bio-section">
                                            <p class="bio-text mb-0">
                                                Kinh nghiệm: ${members.experienceYears} Năm
                                            </p>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-graduation-cap"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Học vấn</span>
                                                        <div class="info-value">${members.education}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-birthday-cake"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Ngày sinh</span>
                                                        <div class="info-value">${members.dateOfBirth}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-venus-mars"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Giới tính</span>
                                                        <div class="info-value">${members.gender}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-check-circle"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Trạng thái</span>
                                                        <div class="info-value">${members.status}</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <p>Không có thành viên nào trong nhóm.</p>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </c:if>

    <!-- Reports Section -->
    <div class="reports-container">
        <div class="reports-header">
            <div class="contact-icon"><i class="fas fa-list"></i></div>
            <h2 class="reports-title">Danh sách các báo cáo nhận được</h2>
            <div class="reports-count">${accDao.getNumberOfReportsByReportedAcc(o.reportedAccount)}</div>
        </div>

        <div class="reports-body">
            <table class="reports-table">
                <thead>
                <tr>
                    <th>Người báo cáo</th>
                    <th>Nội dung báo cáo</th>
                    <th>Tiêu chí vi phạm</th>
                    <th>Thời gian</th>
                    <th>Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${accDao.getReportByreportedAccount(account.accountId)}" var="o">
                    <tr>
                        <td>
                            <div class="reporter">
                                <img src="${accDao.getAccountById(o.reportBy).avatar}"
                                     alt="${accDao.getAccountById(o.reportBy).accountName}" class="reporter-avatar">
                                    ${accDao.getAccountById(o.reportBy).accountName}
                            </div>
                        </td>
                        <td>
                            <div class="report-content">
                                    ${o.contentReport}
                            </div>
                        </td>
                        <td>
                            <span class="criteria">${accDao.getCriteriaById(o.criteriaId).content}</span>
                        </td>
                        <td>
                            <div class="report-date"><fmt:formatDate value="${o.reportTime}"
                                                                     pattern="dd/MM/yyyy"/></div>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${o.status == 'Chờ xử lí'}">
                                    <span class="status-badge status-pending">Đang xử lý</span>
                                </c:when>
                                <c:when test="${o.status == 'Bị từ chối'}">
                                    <span class="status-badge status-rejected">Đã từ chối</span>
                                </c:when>
                                <c:when test="${o.status == 'Đã xử lí'}">
                                    <span class="status-badge status-resolved">Đã giải quyết</span>
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="show-more-container">
                <a href="acc-manage?action=viewAccountDetails&accId=${o.accountId}">
                    <button class="show-more-btn">Xem tất cả báo cáo</button>
                </a>
            </div>
        </div>
    </div>

</div>
<%@include file="includes/footer.jsp" %>

</body>
</html>