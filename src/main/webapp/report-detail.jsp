<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="jobtrans.utils.CookieUtils" %>
<%
    String email = CookieUtils.get("cookemail", request);
    String password = CookieUtils.get("cookpass", request);
    String rememberVal = CookieUtils.get("cookrem", request);
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:useBean id="accDao" class="jobtrans.dal.AccountDAO" scope="session"/>
    <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết báo cáo</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .bg-custom-gradient {
            background: linear-gradient(300deg, rgba(103, 135, 254, 0.4) 0%, rgb(43, 61, 159) 20%);
        }
        .sidebar {
            min-height: 100vh;
        }
        .report-header {
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }
        .report-content {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .badge-report {
            background-color: #dc3545;
            color: white;
        }
        .attachment-preview {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 15px;
            margin-top: 15px;
        }
        .avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
        }
        .reporter-info {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .reporter-details {
            margin-left: 15px;
        }
        .status-badge {
            font-size: 0.8rem;
            padding: 5px 10px;
        }
        .timeline-item {
            position: relative;
            padding-left: 30px;
            margin-bottom: 15px;
        }
        .timeline-item:before {
            content: '';
            position: absolute;
            left: 10px;
            top: 0;
            height: 100%;
            width: 2px;
            background-color: #dee2e6;
        }
        .timeline-item:last-child:before {
            height: 50%;
        }
        .timeline-badge {
            position: absolute;
            left: 0;
            top: 0;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background-color: #6787fe;
            border: 3px solid white;
            z-index: 1;
        }

        .report-status {
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }

        .status-completed {
            background-color: #d4edda;
            color: #155724;
        }

        .status-in-progress {
            background-color: #ffa2a2;
            color: #0c5460;
        }
    </style>
</head>
<%@include file="includes/header-01.jsp"%>
<body>
<%@include file="includes/toast-notification.jsp"%>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-10 col-md-9 p-4" style="margin-left: 150px">
            <div class="report-header d-flex justify-content-between align-items-center">
                <h2>Chi tiết báo cáo</h2>
                <div>
                    <c:choose>
                        <c:when test="${report.status == 'Chờ xử lí'}">
                            <span class="report-status status-pending">Đang xử lí</span>
                        </c:when>
                        <c:when test="${report.status == 'Bị từ chối'}">
                            <span class="report-status status-in-progress">Đã từ chối</span>
                        </c:when>
                        <c:when test="${report.status == 'Đã xử lí'}">
                            <span class="report-status status-completed">Đã xử lí</span>
                        </c:when>
                    </c:choose>
                </div>
            </div>

            <div class="row" style="display: flex; flex-direction: row; justify-content: center;">
                <div class="col-lg-8">
                    <!-- Report Details -->
                    <div class="card mb-4">
                        <div class="card-header bg-custom-gradient text-white">
                            <h5 class="mb-0"><i class="fas fa-exclamation-circle me-2"></i>Thông tin báo cáo</h5>
                        </div>
                        <div class="card-body">
                            <div class="reporter-info">
                                <img src="${accDao.getAccountById(report.reportBy).avatar}" alt="${accDao.getAccountById(report.reportBy).accountName}" class="avatar">
                                <div class="reporter-details">
                                    <h6 class="mb-0">${accDao.getAccountById(report.reportBy).accountName}</h6>
                                    <small class="text-muted">${accDao.getAccountById(report.reportBy).email}</small>
                                </div>
                            </div>

                            <div class="mb-3">
                                <h6 class="text-secondary">Tiêu chí báo cáo:</h6>
                                <span class="badge bg-danger me-2">${accDao.getCriteriaById(report.criteriaId).content}</span>
                            </div>

                            <div class="mb-3">
                                <h6 class="text-secondary">Người dùng bị báo cáo:</h6>
                            </div>
                            <div class="reporter-info" style="padding-left: 20px;">
                                <img src="${accDao.getAccountById(report.reportedAccount).avatar}" alt="${accDao.getAccountById(report.reportedAccount).accountName}" class="avatar">
                                <div class="reporter-details">
                                    <h6 class="mb-0">${accDao.getAccountById(report.reportedAccount).accountName}</h6>
                                    <small class="text-muted">${accDao.getAccountById(report.reportedAccount).email}</small>
                                </div>
                            </div>

                            <div class="mb-3">
                                <h6 class="text-secondary">Thời gian báo cáo:</h6>
                                <p><fmt:formatDate value="${report.reportTime}" pattern="dd/MM/yyyy"/></p>
                            </div>

                            <div class="mb-3">
                                <h6 class="text-secondary">Mô tả chi tiết:</h6>
                                <div class="report-content">
                                    <p>${report.contentReport}</p>
                                </div>
                            </div>

                            <div class="mb-3">
                                <h6 class="text-secondary">Tệp đính kèm:</h6>
                                <c:if test="${report.attachment != null and not empty report.attachment}">
                                    <div class="row">
                                        <div class="col-md-4 mb-3">
                                            <div class="card">
                                                <img src="./job_docs/${report.attachment}" class="card-img-top" alt="Bằng chứng">
                                                <div class="card-body p-2">
                                                    <p class="card-text small">${report.attachment}</p>
                                                    <a href="report-manage?action=download&fileName=${report.attachment}&reportId=${report.reportId}" class="btn btn-sm btn-outline-primary">Xem</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${report.attachment == null or empty report.attachment}">
                                    <div class="row">
                                        <div class="col-md-4 mb-3">
                                            <div class="card">
                                                Không có tệp đính kèm
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                        </div>
                                    </div>
                                </c:if>
                            </div>

                            <c:if test="${report.attachment != null and not empty report.attachment}">
                                <div class="attachment-preview">
                                    <h6 class="text-secondary">Xem trước tệp đính kèm</h6>
                                    <div class="text-center">
                                        <img src="./job_docs/${report.attachment}" class="img-fluid" alt="Preview">
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${report.attachment == null or empty report.attachment}">
                                <div class="attachment-preview">
                                    <h6 class="text-secondary">Xem trước tệp đính kèm</h6>
                                    <div class="text-center">
                                        Không có bằng chứng
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <!-- Reported Content -->
                    <c:if test="${not empty report.jobId}">
                        <div class="card mb-4">
                            <div class="card-header bg-custom-gradient text-white">
                                <h5 class="mb-0"><i class="fas fa-file-alt me-2"></i>Nội dung bị báo cáo</h5>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <div class="d-flex align-items-center mb-3">
                                        <img src="${accDao.getAccountById(report.reportedAccount).avatar}" alt="${accDao.getAccountById(report.reportedAccount).accountName}" class="avatar me-2" style="width: 40px; height: 40px;">
                                        <div>
                                            <h6 class="mb-0">${accDao.getAccountById(report.reportedAccount).accountName}</h6>
                                            <small class="text-muted">${accDao.getAccountById(report.reportedAccount).email} • <fmt:formatDate value="${report.reportTime}" pattern="dd/MM/yyyy"/></small>
                                        </div>
                                    </div>
                                    <div class="report-content">
                                        <p style="font-size: 20px;">${jobDao.getJobById(report.jobId).jobTitle}</p>
                                        <p>${jobDao.getJobById(report.jobId).jobDescription}</p>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <h6 class="text-secondary">Lịch sử vi phạm của người dùng:</h6>
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>
                                                <th>Ngày</th>
                                                <th>Loại vi phạm</th>
                                                <th>Trạng thái</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="o" items="${accDao.getReportByreportedAccount(report.reportedAccount)}">
                                                <tr>
                                                    <td><fmt:formatDate value="${o.reportTime}" pattern="dd/MM/yyyy"/></td>
                                                    <td>${accDao.getCriteriaById(o.criteriaId).content}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${o.status == 'Chờ xử lí'}">
                                                                <span class="report-status status-pending">Đang xử lí</span>
                                                            </c:when>
                                                            <c:when test="${o.status == 'Bị từ chối'}">
                                                                <span class="report-status status-in-progress">Đã từ chối</span>
                                                            </c:when>
                                                            <c:when test="${o.status == 'Đã xử lí'}">
                                                                <span class="report-status status-completed">Đã xử lí</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>

                <c:if test="${accDao.getAccountById(accountLogged.accountId).role == 'Admin'}">
                    <div class="col-lg-4">
                        <!-- Action Card -->
                        <div class="card mb-4">
                            <div class="card-header bg-custom-gradient text-white">
                                <h5 class="mb-0"><i class="fas fa-tasks me-2"></i>Hành động</h5>
                            </div>
                            <div class="card-body">
                                <div class="d-grid gap-2">
                                    <a href="report-manage?action=acceptReport&reportId=${report.reportId}">
                                        <button class="btn btn-success" type="button" style="width: 100%">
                                            <i class="fas fa-check me-2"></i>Chấp nhận báo cáo
                                        </button>
                                    </a>
                                    <a href="report-manage?action=rejectReport&reportId=${report.reportId}">
                                        <button class="btn btn-danger" type="button" style="width: 100%">
                                            <i class="fas fa-times me-2"></i>Từ chối báo cáo
                                        </button>
                                    </a>
                                    <a href="report-manage?action=banAccount&reportId=${report.reportId}">
                                        <button class="btn btn-dark" type="button" style="width: 100%">
                                            <i class="fas fa-ban me-2"></i>Khóa tài khoản
                                        </button>
                                    </a>
                                </div>

                                <hr>

                                <form action="report-manage" method="get">
                                    <input type="hidden" name="reportId" value="${report.reportId}">
                                    <input type="hidden" name="action" value="saveNote">
                                    <div class="mb-3">
                                        <label for="noteToUser" class="form-label">Ghi chú cho người dùng:</label>
                                        <textarea class="form-control" id="noteToUser" name="note" rows="3" placeholder="Nhập ghi chú..."></textarea>
                                    </div>
                                    <div class="d-grid">
                                        <button class="btn btn-primary" type="submit">
                                            <i class="fas fa-save me-2"></i>Lưu ghi chú
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp"%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>--%>
</body>
</html>
