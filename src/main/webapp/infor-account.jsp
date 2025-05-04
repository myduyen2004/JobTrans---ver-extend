<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin tài khoản</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/infor-account.css">
    <jsp:useBean id="accountDAO" class="jobtrans.dal.AccountDAO" scope="page" />
    <jsp:useBean id="reportDAO" class="jobtrans.dal.ReportDAO" scope="page" />
    <jsp:useBean id="criteriaDAO" class="jobtrans.dal.CriteriaDAO" scope="page" />

</head>
<body>
<%@include file="includes/header-01.jsp"%>
<div class="container" >
    <!-- Header -->
    <div class="profile-header">
        <img class="profile-avatar" src=" ${account.avatar}" alt="Ảnh đại diện">

        <div class="profile-info">
            <div class="profile-name">
                ${account.accountName}
                <span class="badge-verified">Đã xác thực</span>
            </div>
            <div class="profile-role">${account.typeAccount}</div>
            <div class="profile-points">${account.point} Điểm</div>
        </div>

        <div class="profile-actions">
            <a href="profile?action=showUpdateForm&account_id=${account.accountId}" class="edit-button">Chỉnh sửa hồ sơ</a>
        </div>
    </div>

    <!-- Body content -->
    <div class="content-grid">
        <!-- Left column -->
        <div>
            <div class="card">
                <h2 class="card-title-a">Giới thiệu</h2>
                <p>${account.bio}</p>
            </div>
            <c:if test="${account.typeAccount == 'Cá nhân'}">
                <div class="card">
                    <h2 class="card-title-a">Kĩ năng</h2>
                    <p id="skills-tags-container" style="display: flex">${account.skills}</p>
                </div>
            </c:if>
            <div class="card">
                <h2 class="card-title-a">Thông tin chuyên môn</h2>
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-label">Chuyên môn</div>
                        <div class="info-value">${account.speciality}</div>
                    </div>
                    <c:if test="${account.typeAccount == 'Cá nhân'}">
                        <div class="info-item">
                            <div class="info-label">Kinh nghiệm</div>
                            <div class="info-value">${account.experienceYears}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Học vấn</div>
                            <div class="info-value">${account.education}</div>
                        </div>
                    </c:if>
                    <div class="info-item">
                        <div class="info-label">Trạng thái</div>
                        <div class="info-value">${account.status}</div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="project-header">
                    <h2 class="card-title-a">Hoàn thành dự án</h2>
                    <span class="project-count">15 dự án</span>
                </div>
                <div class="progress-container">
                    <div class="progress-header">
                        <span class="progress-text">Tỷ lệ hoàn thành</span>
                        <span class="progress-value">90%</span>
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
                <h2 class="card-title-a">Thông tin liên hệ</h2>
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
                    <c:if test="${account.typeAccount == 'Cá nhân'}">

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
                    </c:if>
                </div>
            </div>


            <div class="card">
                <h2 class="card-title-a">Chữ ký số</h2>
                <c:if test="${account.signature != null}">
                <div class="signature">
                    <img class="signature-placeholder" src="${account.signature}" alt="Chữ ký của ${account.accountName}">
                </div>
                </c:if>
                <c:if test="${account.signature == null}">
                    <div class="signature">
                        <p>Chưa có chữ kỹ</p>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <c:if test="${account.typeAccount == 'Nhóm'}">
        <div class="page-header text-center">
            <div class="header-container">
                <h1 class="display-4 fw-bold">Thành viên nhóm</h1>
                <p class="lead">Danh sách thành viên và thông tin chi tiết</p>
            </div>
        </div>

        <div>
            <div class="btn-add-container">
                <a href="group?action=showAddMember&account_id=${account.accountId}" class="btn-add btn-action">
                    <i class="fas fa-plus"></i> Thêm thành viên
                </a>
            </div>

            <c:forEach var="members" items="${memberList}" varStatus="loop">
                <c:choose>
                    <c:when test="${not empty memberList}">
                        <div class="card">
                            <div class="member-header">
                                <div class="d-flex">
                                    <div class="member-avatar-wrapper">
                                        <img src="${members.avatarMember}" alt="${members.memberName}" class="member-avatar">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <h3 class="member-name">${members.memberName}</h3>
                                        <div class="member-role">${members.position}</div>
                                        <div>
                                            <span class="badge-custom badge-experience">
                                                  <i class="fas fa-briefcase"></i>Số năm kinh nghiệm: ${members.experienceYears}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="px-4 py-3 d-grid">
                                <button class="btn-details btn-action" type="button"
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
                                            <span class="info-label">Giới thiệu</span>
                                            <p class="bio-text mb-0">
                                                    ${members.bio}
                                            </p>
                                        </div>

                                        <div class="bio-section">
                                            <span class="info-label">Kĩ năng</span>
                                            <p class="bio-text mb-0">
                                                    ${members.skills}
                                            </p>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-user-tie"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Chuyên môn</span>
                                                        <div class="info-value">${members.speciality}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-phone-alt"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Số điện thoại</span>
                                                        <div class="info-value">${members.phone}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center info-group">
                                                    <div class="info-icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </div>
                                                    <div>
                                                        <span class="info-label">Địa chỉ</span>
                                                        <div class="info-value">${members.address}</div>
                                                    </div>
                                                </div>
                                            </div>

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

                            <div class="actions-container">
                                <div class="d-flex">
                                    <div class="info-icon me-2">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <div>
                                        <div class="info-value">ID: ${members.memberId}</div>
                                    </div>
                                </div>

                                <div>
                                    <a href="group?action=showUpdateMember&memberId=${members.memberId}" class="btn-edit btn-action me-2" style="text-decoration: none">
                                        <i class="fas fa-edit"></i> Chỉnh sửa
                                    </a>
                                    <a href="group?action=delete&memberId=${members.memberId}&accountId=${members.accountId}" class="btn-delete btn-action" style="text-decoration: none">
                                        <i class="fas fa-trash-alt"></i> Xóa
                                    </a>
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
            <h2 class="reports-title" style="margin-left: 70px">Danh sách các báo cáo nhận được</h2>
            <div class="reports-count">${reportDAO.getReportCountByReportedAccount(account.accountId)} báo cáo</div>
        </div>

        <div class="reports-body">
            <c:if test="${not empty reportList}">
            <table class="reports-table">
                <thead>
                <tr>
                    <th>Người báo cáo</th>
                    <th>Nội dung báo cáo</th>
                    <th>Tiêu chí</th>
                    <th>Thời gian</th>
                    <th>Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="report" items="${reportList}">
                    <tr>
                        <td>
                            <div class="reporter">
                                <img src="${accountDAO.getAccountById(report.reportBy).avatar}" alt="${accountDAO.getAccountById(report.reportBy).accountName}" class="reporter-avatar">
                                ${accountDAO.getAccountById(report.reportBy).accountName}
                            </div>
                        </td>
                        <td>
                            <div class="report-content">${report.contentReport}</div>
                        </td>
                        <td>
                            <span class="criteria" data-tooltip="${criteriaDAO.getCriteriaById(report.criteriaId).content}">${criteriaDAO.getCriteriaById(report.criteriaId).labelTag}</span>
                        </td>
                        <td>
                            <div class="report-date">${report.reportTime}</div>
                        </td>
                        <td>
                            <c:if test="${report.status == 'Chờ xử lí'}">
                                <span class="status-badge status-pending">${report.status}</span>
                            </c:if>
                            <c:if test="${report.status == 'Bị từ chối'}">
                                <span class="status-badge status-rejected">${report.status}</span>
                            </c:if>
                            <c:if test="${report.status == 'Đã xử lí'}">
                                <span class="status-badge status-resolved">${report.status}</span>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="show-more-container">
                <a href="profile?action=viewAccountReport">
                    <button class="show-more-btn">Xem tất cả báo cáo</button>
                </a>
            </div>
            </c:if>
            <c:if test="${empty reportList}">
                <p style="font-style: italic; text-align: center; margin: 20px 0;">Không có báo cáo nào cho tài khoản này</p>
            </c:if>
        </div>
    </div>
</div >
<%@include file="includes/footer.jsp"%>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Lấy container chứa các tag kỹ năng
        const container = document.getElementById('skills-tags-container');

        // Lấy giá trị kỹ năng từ server (giả sử cách nhau bằng dấu phẩy)
        const skillsString = container.textContent.trim();

        // Xóa nội dung gốc
        container.innerHTML = '';

        // Kiểm tra nếu có kỹ năng
        if (skillsString) {
            // Tách các kỹ năng thành mảng
            const skillsArray = skillsString.split(',');

            // Tạo tag cho mỗi kỹ năng
            skillsArray.forEach(skill => {
                const skillTrimmed = skill.trim();
                if (skillTrimmed) {
                    // Tạo thẻ div với class "tag"
                    const tagElement = document.createElement('div');
                    tagElement.className = 'tag';

                    // Thêm tên kỹ năng
                    tagElement.appendChild(document.createTextNode(skillTrimmed));

                    // Thêm tag vào container
                    container.appendChild(tagElement);
                }
            });
        } else {
            // Hiển thị thông báo nếu không có kỹ năng
            container.textContent = 'Chưa có thông tin kỹ năng';
        }
    });
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>