<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:useBean id="criteriaDAO" class="jobtrans.dal.CriteriaDAO" scope="page" />
    <jsp:useBean id="accountDAO" class="jobtrans.dal.AccountDAO" scope="page" />
    <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="page" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Báo Cáo Vi Phạm</title>
    <style>
        :root {
            --primary-color: rgb(21, 42, 105);
            --primary-light: rgb(54, 75, 140);
            --accent-color: #6787fe;
            --accent-light: #9dabff;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --neutral-color: #6c757d;
        }

        body {
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }

        .container {
            width: 100%;
            max-width: 1000px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }

        .header {
            background: linear-gradient(to right, var(--primary-color), var(--primary-light));
            color: white;
            padding: 25px 30px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 8px;
            position: relative;
            z-index: 1;
        }

        .header p {
            font-size: 16px;
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }

        .header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
            animation: shimmer 8s infinite linear;
            pointer-events: none;
        }

        @keyframes shimmer {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .report-id {
            background-color: rgba(255, 255, 255, 0.2);
            padding: 5px 15px;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 600;
            display: inline-block;
            margin-top: 10px;
        }

        .content-section {
            padding: 30px;
        }

        .section-title {
            color: var(--primary-color);
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
            display: flex;
            align-items: center;
        }

        .section-title svg {
            margin-right: 10px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .info-card {
            background-color: #f9f9f9;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .info-card:hover {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transform: translateY(-3px);
        }

        .info-label {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }

        .info-value {
            font-size: 16px;
            font-weight: 600;
            color: #333;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        .evidence-section {
            margin-bottom: 30px;
        }

        .evidence-files {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .evidence-file {
            display: flex;
            align-items: center;
            background-color: #f1f5ff;
            border-radius: 8px;
            padding: 10px 15px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .evidence-file:hover {
            background-color: #e1e9ff;
        }

        .evidence-file svg {
            margin-right: 10px;
            color: var(--accent-color);
        }

        .evidence-name {
            font-size: 14px;
            color: #444;
        }

        .progress-section {
            margin: 30px 0;
            padding: 0 10px;
        }

        .progress-title {
            font-weight: 500;
            font-size: 16px;
            color: var(--primary-color);
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
        }

        .progress-percentage {
            color: var(--accent-color);
            font-weight: 700;
        }

        .progress {
            height: 12px;
            border-radius: 10px;
            background-color: #e9ecef;
            overflow: hidden;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .progress-bar {
            background: linear-gradient(to right, var(--accent-color), var(--accent-light));
            border-radius: 10px;
            transition: width 1.5s ease;
            position: relative;
        }

        .progress-milestones {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
            position: relative;
            padding: 0 1%;
        }

        .milestone {
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
            width: 18%;
            text-align: center;
        }

        .milestone-dot {
            width: 12px;
            height: 12px;
            background-color: #c6d0f5;
            border-radius: 50%;
            margin-bottom: 6px;
            position: relative;
            z-index: 2;
            transition: all 0.3s ease;
        }

        .milestone.active .milestone-dot {
            background-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(103, 135, 254, 0.2);
        }

        .milestone-label {
            font-size: 12px;
            color: #728095;
            transition: all 0.3s ease;
        }

        .milestone.active .milestone-label {
            color: var(--primary-color);
            font-weight: 500;
        }

        .admin-actions {
            margin-top: 30px;
            border-top: 3px solid #ffcdd2;
            padding-top: 20px;
            background-color: #fff8f8;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(211, 47, 47, 0.1);
        }

        .action-buttons {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .btn {
            padding: 12px 20px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn svg {
            margin-right: 8px;
        }

        .btn-primary {
            background: linear-gradient(to right, var(--primary-color), var(--primary-light));
            color: white;
            box-shadow: 0 4px 15px rgba(21, 42, 105, 0.2);
        }

        .btn-primary:hover {
            box-shadow: 0 6px 20px rgba(21, 42, 105, 0.3);
            transform: translateY(-2px);
        }

        .btn-success {
            background-color: var(--success-color);
            color: white;
        }

        .btn-success:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        .btn-warning {
            background-color: var(--warning-color);
            color: #212529;
        }

        .btn-warning:hover {
            background-color: #e0a800;
            transform: translateY(-2px);
        }

        .btn-danger {
            background-color: var(--danger-color);
            color: white;
        }

        .btn-danger:hover {
            background-color: #c82333;
            transform: translateY(-2px);
        }

        .btn-neutral {
            background-color: var(--neutral-color);
            color: white;
        }

        .btn-neutral:hover {
            background-color: #5a6268;
            transform: translateY(-2px);
        }

        .admin-note {
            margin-top: 20px;
        }

        .note-textarea {
            width: 100%;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
            min-height: 120px;
            resize: vertical;
            margin-bottom: 15px;
            transition: all 0.3s ease;
        }

        .note-textarea:focus {
            outline: none;
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(103, 135, 254, 0.1);
        }

        .badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            margin-left: 10px;
        }

        .badge-pending {
            background-color: #ffecb5;
            color: #856404;
        }

        .badge-processing {
            background-color: #b8daff;
            color: #004085;
        }

        .badge-resolved {
            background-color: #c3e6cb;
            color: #155724;
        }

        .badge-rejected {
            background-color: #f8d7da;
            color: #721c24;
        }

        .history-section {
            margin-top: 30px;
        }

        .timeline {
            position: relative;
            padding-left: 30px;
            margin-top: 20px;
        }

        .timeline::before {
            content: '';
            position: absolute;
            top: 0;
            left: 10px;
            height: 100%;
            width: 2px;
            background-color: #e9ecef;
        }

        .timeline-item {
            position: relative;
            padding-bottom: 20px;
        }

        .timeline-dot {
            position: absolute;
            left: -30px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background-color: white;
            border: 2px solid var(--accent-color);
            top: 0;
        }

        .timeline-content {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .timeline-date {
            font-size: 12px;
            color: #666;
            margin-bottom: 5px;
        }

        .timeline-text {
            font-size: 14px;
            margin-bottom: 0;
        }

        @media (max-width: 768px) {
            .container {
                max-width: 95%;
            }

            .header {
                padding: 20px 15px;
            }

            .content-section {
                padding: 20px 15px;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<%@include file="includes/header-01.jsp"%>

<body>
<div class="container">
    <div class="header">
        <h1>Chi Tiết Báo Cáo Vi Phạm</h1>
        <p>Xem xét và xử lý báo cáo vi phạm</p>
        <div class="report-id">Mã báo cáo: #${report.reportId}</div>
    </div>

    <div class="progress-section">
        <div class="progress-title">
            <span>Trạng thái xử lý</span>
            <c:choose>
                <c:when test="${report.status == 'Chờ xử lí'}">
                    <span class="progress-percentage">50%</span>
                </c:when>
                <c:when test="${report.status == 'Bị từ chối' || report.status == 'Đã xử lí'}">
                    <span class="progress-percentage">100%</span>
                </c:when>
            </c:choose>
        </div>

        <div class="progress">
            <c:choose>
                <c:when test="${report.status == 'Chờ xử lí'}">
                    <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                </c:when>
                <c:when test="${report.status == 'Bị từ chối' || report.status == 'Đã xử lí'}">
                    <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </c:when>
            </c:choose>
        </div>
        <div class="progress-milestones">
            <div class="milestone active">
                <div class="milestone-dot"></div>
                <div class="milestone-label">Báo cáo đã tạo</div>
            </div>
            <div class="milestone ${report.status == 'Chờ xử lí'}">
                <div class="milestone-dot"></div>
                <div class="milestone-label">Đang xử lý</div>
            </div>
            <div class="milestone ${report.status == 'Đã xử lí' || report.status == 'Bị từ chối'}">
                <div class="milestone-dot"></div>
                <div class="milestone-label">Đã xử lý</div>
            </div>
        </div>
    </div>

    <div class="content-section">
        <div class="section-title">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="12" r="10"></circle>
                <line x1="12" y1="8" x2="12" y2="12"></line>
                <line x1="12" y1="16" x2="12" y2="16"></line>
            </svg>
            Chi tiết nội dung báo cáo
            <c:choose>
                <c:when test="${report.status == 'Chờ xử lí'}">
                    <span class="badge badge-pending">Chờ xử lý</span>
                </c:when>
                <c:when test="${report.status == 'Đã xử lí'}">
                    <span class="badge badge-resolved">Đã giải quyết</span>
                </c:when>
                <c:when test="${report.status == 'Bị từ chối'}">
                    <span class="badge badge-rejected">Đã từ chối</span>
                </c:when>
            </c:choose>
        </div>

        <div class="info-grid">
            <div class="info-card">
                <div class="info-label">Ngày báo cáo</div>
                <div class="info-value">
                    <fmt:formatDate value="${report.reportTime}" pattern="dd/MM/yyyy HH:mm" />
                </div>
            </div>
            <div class="info-card">
                <div class="info-label">Tiêu chí vi phạm</div>
                <div class="info-value">${criteriaDAO.getCriteriaById(report.criteriaId).content}</div>
            </div>
            <div class="info-card">
                <div class="info-label">Người báo cáo</div>
                <div class="info-value">${accountDAO.getAccountById(report.reportBy).accountName}</div>
            </div>
            <div class="info-card">
                <div class="info-label">Email người báo cáo</div>
                <div class="info-value">${accountDAO.getAccountById(report.reportBy).email}</div>
            </div>
            <div class="info-card">
                <div class="info-label">Người bị báo cáo</div>
                <div class="info-value">${accountDAO.getAccountById(report.reportedAccount).accountName}</div>
            </div>
            <div class="info-card">
                <div class="info-label">Email người bị báo cáo</div>
                <div class="info-value">${accountDAO.getAccountById(report.reportedAccount).email}</div>
            </div>
            <div class="info-card full-width">
                <div class="info-label">Công việc liên quan</div>
                <div class="info-value">${jobDAO.getJobById(report.jobId).jobTitle}</div>
            </div>
            <div class="info-card full-width">
                <div class="info-label">Nội dung vi phạm</div>
                <div class="info-value" style="white-space: pre-line;">${report.contentReport}</div>
            </div>
        </div>

        <div class="evidence-section">
            <div class="section-title">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
                    <polyline points="13 2 13 9 20 9"></polyline>
                </svg>
                Bằng chứng đính kèm
            </div>
            <div class="evidence-files">
                    <a href="${report.attachment}" class="evidence-file">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                            <polyline points="14 2 14 8 20 8"></polyline>
                            <line x1="16" y1="13" x2="8" y2="13"></line>
                            <line x1="16" y1="17" x2="8" y2="17"></line>
                            <polyline points="10 9 9 9 8 9"></polyline>
                        </svg>
                        <span class="evidence-name">${report.attachment}</span>
                    </a>
                <c:if test="${empty report.attachment}">
                    <div class="evidence-file" style="color: #6c757d;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"></circle>
                            <line x1="8" y1="12" x2="16" y2="12"></line>
                        </svg>
                        <span class="evidence-name">Không có bằng chứng đính kèm</span>
                    </div>
                </c:if>
            </div>
        </div>

            <div class="history-section">
                <div class="section-title">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"></circle>
                        <polyline points="12 6 12 12 16 14"></polyline>
                    </svg>
                    Lịch sử xử lý
                </div>
                <div class="timeline">

                        <div class="timeline-item">
                            <div class="timeline-dot"></div>
                            <div class="timeline-content">
                                <div class="timeline-date">
                                    <fmt:formatDate value="${report.reportTime}" pattern="dd/MM/yyyy HH:mm" />
                                </div>
                                <p class="timeline-text">
                                    <strong>Kêt quả xử lí:</strong> ${report.status}
                                    <br>
                                    <strong>Note từ admin: ${report.noteByAdmin}</strong>
                                </p>
                            </div>
                        </div>
                </div>
            </div>

        <div class="admin-actions">
            <div class="section-title" style="color: #d32f2f; border-bottom: 2px solid #ffcdd2;">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                </svg>
                QUYẾT ĐỊNH XỬ LÝ BÁO CÁO
            </div>
            <%if(account.getRole().equals("Admin")){%>
            <form id="admin-action-form" action="report-manage" method="POST">
                <input type="hidden" name="reportId" value="${report.reportId}">
<%--                <input type="hidden" name="action" id="actionType" value="acceptReport">--%>
                <c:if test="${report.status == 'Chờ xử lí'}">
                <div class="admin-note">
                    <label for="adminNote" class="info-label" style="color: #d32f2f; font-weight: bold; font-size: 16px;">GHI CHÚ XỬ LÝ CỦA ADMIN</label>
                    <div style="color: #757575; font-style: italic; margin-bottom: 10px; font-size: 13px;">
                        * Vui lòng cung cấp lý do chi tiết cho quyết định của bạn. Ghi chú này sẽ được hiển thị cho cả người báo cáo và người bị báo cáo.
                    </div>
                    <textarea name="adminNote" id="adminNote" class="note-textarea"
                              style="border: 2px solid #d32f2f; min-height: 150px;"
                              placeholder="Nhập chi tiết lý do xử lý báo cáo này... (bắt buộc)" required></textarea>
                </div>

<%--                <div class="action-buttons">--%>
<%--                    <c:if test="${report.status == 'C'}">--%>
<%--                        <button type="button" class="btn btn-primary" onclick="submitForm('PROCESSING')">--%>
<%--                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">--%>
<%--                                <polyline points="9 11 12 14 22 4"></polyline>--%>
<%--                                <path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path>--%>
<%--                            </svg>--%>
<%--                            Tiếp nhận và xử lý--%>
<%--                        </button>--%>
<%--                    </c:if>--%>


                        <button name="action" value="accept" type="submit" class="btn btn-success" style="font-size: 16px; padding: 14px 25px;" onclick="submitForm('RESOLVED')">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                                <polyline points="22 4 12 14.01 9 11.01"></polyline>
                            </svg>
                            <strong>CHẤP NHẬN BÁO CÁO</strong>
                        </button>

                        <button name="action" value="reject" type="submit" class="btn btn-danger" style="font-size: 16px; padding: 14px 25px;" onclick="submitForm('REJECTED')">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="15" y1="9" x2="9" y2="15"></line>
                                <line x1="9" y1="9" x2="15" y2="15"></line>
                            </svg>
                            <strong>TỪ CHỐI BÁO CÁO</strong>
                        </button>
                    </c:if>

                    <button type="button" class="btn btn-neutral" onclick="history.back()">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="19" y1="12" x2="5" y2="12"></line>
                            <polyline points="12 19 5 12 12 5"></polyline>
                        </svg>
                        Quay lại
                    </button>
                </div>
            </form>
            <%}%>

        </div>
    </div>
</div>
</body>
</html>