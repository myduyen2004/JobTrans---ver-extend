<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large'/>
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <!--new css -->
    <link rel="stylesheet" href="css/job-post-detail-employee.css">
    <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="page" />
    <jsp:useBean id="accountDAO" class="jobtrans.dal.AccountDAO" scope="page" />
    <jsp:useBean id="jobGreetingDAO" class="jobtrans.dal.JobGreetingDAO" scope="page" />

</head>
<body>
<%@include file="includes/header-01.jsp"%>

    <div class="container">
        <div class="job-header">
            <div>
                <h1>${job.jobTitle}</h1>
                <div class="job-meta">
                    <div class="job-meta-item">
                        <i class="fa-solid fa-tags"></i>
                        <span>IT</span>
                    </div>
                </div>
            </div>
            <div class="job-status ${job.statusPost == 'Đang tuyển' ? 'recruiting' :
                      job.statusPost == 'Hết hạn' ? 'expired' :'closed'}">
                ${job.statusPost}
            </div>
        </div>

        <div class="job-details-container">
            <div class="job-main">
                <div class="job-stats">
                    <div class="stat-item">
                        <div class="stat-value">${budgetRange}</div>
                        <div class="stat-label">Triệu VNĐ</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value">${job.numOfMember}</div>
                        <div class="stat-label">Số lượng cần tuyển</div>
                    </div>
                </div>

                <div class="job-stats">
                    <div class="stat-item">
                        <div class="stat-value">${postDateFormatted}</div>
                        <div class="stat-label">Ngày đăng</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value">${dueDatePostFormatted}</div>
                        <div class="stat-label">Hạn ứng tuyển</div>
                    </div>
                </div>

                <div class="card">
                    <h2>Mô tả công việc</h2>
                    <p>${job.jobDescription}</p>
                </div>

                <div class="card">
                    <h2>Yêu cầu</h2>
                    <p>${job.requirements}</p>
                </div>

                <div class="card">
                    <h2>Quyền lợi</h2>
                    <p>${job.benefit}</p>
                </div>

                <div class="card">
                    <h2>Tài liệu đính kèm</h2>
                    <div class="file-downloads">
                        <c:if test="${job.attachment != null}">
                            <div class="file-item">
                                <div class="file-info">
                                    <div class="file-name">${job.attachment}</div>
                                    <div class="file-meta">PDF, 2.4 MB</div>
                                </div>
                                <a href="job?action=" class="file-download-btn">
                                    <i class="bi bi-download"></i>
                                </a>
                            </div>
                        </c:if>
                        <c:if test="${job.attachment == null}">
                            <div class="null-attachment">
                                <p>Không có file đính kém</p>
                            </div>
                        </c:if>
<%--                        <div class="file-item">--%>
<%--                            <div class="file-info">--%>
<%--                                <div class="file-name">Tài liệu tham khảo.zip</div>--%>
<%--                                <div class="file-meta">ZIP, 5.7 MB</div>--%>
<%--                            </div>--%>
<%--                            <a href="#" class="file-download-btn">--%>
<%--                                <i class="bi bi-download"></i>--%>
<%--                            </a>--%>
<%--                        </div>--%>

<%--                        <div class="file-item">--%>
<%--                            <div class="file-info">--%>
<%--                                <div class="file-name">Hợp đồng mẫu.docx</div>--%>
<%--                                <div class="file-meta">DOCX, 1.2 MB</div>--%>
<%--                            </div>--%>
<%--                            <a href="#" class="file-download-btn">--%>
<%--                                <i class="bi bi-download"></i>--%>
<%--                            </a>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>

            <div class="job-sidebar">
                <div class="card">
                    <h2>Thông tin nhà tuyển dụng</h2>
                    <div style="display: flex; align-items: center; margin-bottom: 15px;">
                        <div style="width: 60px; height: 60px; border-radius: 50%; background-color: #e9ecef; display: flex; align-items: center; justify-content: center; margin-right: 15px; object-fit: cover;">
                            <img src="${poster.avatar}" alt="User avatar" style="width: 60px; height: 60px; border-radius: 50%;">
                        </div>
                        <div>
                            <h3 style="margin: 0; font-size: 16px;">${poster.accountName}</h3>
                            <p style="margin: 5px 0 0; font-size: 14px; color: #6c757d;">${joinDateFormatted}</p>
                        </div>
                    </div>
                    <div style="display: flex; margin-bottom: 10px;">
                        <div style="flex: 1; text-align: center;">
                            <div style="font-weight: 700; color: var(--accent-color);">${jobDAO.countTotalJobsByAccountId(poster.accountId)}</div>
                            <div style="font-size: 12px; color: #6c757d;">Dự án</div>
                        </div>
                        <div style="flex: 1; text-align: center;">
                            <div style="font-weight: 700; color: var(--accent-color);">${poster.starRate} <i class="fa-solid fa-star" style="color: #FCD53F"></i></div>
                            <div style="font-size: 12px; color: #6c757d;">Đánh giá</div>
                        </div>
                        <div style="flex: 1; text-align: center;">
                            <div style="font-weight: 700; color: var(--accent-color);">${jobDAO.getJobCompletionRateByAccountId(poster.accountId)}</div>
                            <div style="font-size: 12px; color: #6c757d;">Hoàn thành</div>
                        </div>
                    </div>
                </div>

                <c:if test="${sessionScope.account.accountId != poster.accountId}">
                    <div class="card">
                        <div>
                            <c:if test="${not jobGreetingDAO.hasApplied(account.accountId,job.jobId)}">
                                <a href="job-greeting?action=show-send-application&jobId=${job.jobId}" class="btn btn-gradient" style="color: white;">
                                    <i class="bi bi-send me-2"></i>Gửi chào giá
                                </a>
                            </c:if>
                            <a class="btn btn-outline-secondary">
                                <i class="bi bi-bookmark me-2"></i>Lưu công việc
                            </a>
                            <a class="btn btn-outline-secondary">
                                <i class="bi bi-flag me-2"></i>Báo cáo vi phạm
                            </a>
                        </div>
                    </div>
                </c:if>

                <c:if test="${sessionScope.account.accountId == poster.accountId}">
                    <div class="card stats-card">
                        <h5 class="section-title">Thống kê công việc</h5>

    <%--                    <div class="stat-row">--%>
    <%--                        <div class="stat-icon">--%>
    <%--                            <i class="bi bi-eye"></i>--%>
    <%--                        </div>--%>
    <%--                        <div class="stat-text">Lượt xem</div>--%>
    <%--                        <div class="stat-value">12</div>--%>
    <%--                    </div>--%>

                        <div class="stat-row">
                            <div class="stat-icon">
                                <i class="bi bi-people"></i>
                            </div>
                            <div class="stat-text">Số lượt chào giá</div>
                            <div class="stat-value">${numOfApplicants}</div>
                        </div>

                        <div class="stat-row">
                            <div class="stat-icon">
                                <i class="bi bi-bookmark"></i>
                            </div>
                            <div class="stat-text">Lượt lưu</div>
                            <div class="stat-value">35</div>
                        </div>
                    </div>
                </c:if>
<%--                <div class="card">--%>
<%--                    <h2>Chào giá cho công việc này</h2>--%>
<%--                    <form id="jobApplicationForm">--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="price">Mức giá (VNĐ)</label>--%>
<%--                            <input type="number" id="price" class="form-control" placeholder="Nhập mức giá đề xuất" required>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="expectedDays">Thời gian dự kiến hoàn thành (ngày)</label>--%>
<%--                            <input type="number" id="expectedDays" class="form-control" placeholder="Số ngày dự kiến" required>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="cv">Chọn CV</label>--%>
<%--                            <select id="cv" class="form-control" required>--%>
<%--                                <option value="">-- Chọn CV --</option>--%>
<%--                                <option value="1">CV Web Developer</option>--%>
<%--                                <option value="2">CV UI/UX Designer</option>--%>
<%--                                <option value="3">CV Frontend Developer</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="introduction">Giới thiệu chung</label>--%>
<%--                            <textarea id="introduction" class="form-control" placeholder="Giới thiệu về bản thân và kinh nghiệm của bạn liên quan đến công việc này" required></textarea>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="attachment">Chọn tệp đính kèm để gửi</label>--%>
<%--                            <input type="file" id="attachment" class="form-control">--%>
<%--                        </div>--%>
<%--                        <button type="submit" class="btn btn-block">Gửi chào giá</button>--%>
<%--                    </form>--%>
<%--                </div>--%>
            </div>
        </div>

        <div class="card">
            <div class="d-flex justify-content-between">
                <h2>Danh sách ứng viên (${numOfApplicants})</h2>
                <c:if test="${jobDAO.isPostOwner(job.jobId,sessionScope.account.accountId)}">
                    <a href="job?action=view-candidates-list&jobId=${job.jobId}" style="text-decoration: none">Xem chi tiết >></a>
                </c:if>
            </div>
            <hr>
            <c:if test="${not empty job.jobGreetingList}">
            <ul class="applicant-list">
                <c:forEach var="greeting" items="${job.jobGreetingList}">
                    <li class="applicant-item">
                        <img src="${accountDAO.getAccountById(greeting.jobSeekerId).avatar}" alt="Nguyễn Thành" class="applicant-avatar">
                        <div class="applicant-info">
                            <div class="applicant-name">${accountDAO.getAccountById(greeting.jobSeekerId).accountName}</div>
                            <div class="applicant-meta">
                                <span class="meta-icon"><i class="fas fa-money-bill-wave"></i> ${greeting.price}</span>
                                <span class="meta-icon"><i class="fas fa-calendar-alt"></i>${greeting.expectedDay} ngày</span>
                            </div>
                        </div>
                        <c:if test="${greeting.status == 'Chờ xét duyệt'}">
                            <div class="status-badge status-pending">${greeting.status}</div>
                        </c:if>
                        <c:if test="${greeting.status == 'Chờ phỏng vấn'}">
                            <div class="status-badge status-interview">${greeting.status}</div>
                        </c:if>
                        <c:if test="${greeting.status == 'Bị từ chối'}">
                            <div class="status-badge status-rejected">${greeting.status}</div>
                        </c:if>
                        <c:if test="${greeting.status == 'Được nhận'}">
                            <div class="status-badge status-accepted">${greeting.status}</div>
                        </c:if>
                    </li>
                </c:forEach>
            </ul>
            </c:if>

        </div>
    </div>
<%@include file="includes/footer.jsp"%>
</body>
</html>
