<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết công việc - ${job.job_title}</title>
    <!-- Bootstrap 5.3.0 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-gradient: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            --primary-color: rgb(39, 64, 179);
            --primary-dark: rgb(21, 32, 112);
            --light-bg: #f8f9fa;
            --border-radius: 8px;
        }

        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        .gradient-custom {
            background: var(--primary-gradient);
        }

        .btn-gradient {
            background: var(--primary-gradient);
            color: white;
            border: none;
            transition: all 0.3s;
        }

        .btn-gradient:hover {
            opacity: 0.9;
            color: white;
            box-shadow: 0 5px 15px rgba(21, 32, 112, 0.3);
        }

        .job-detail-card {
            border-radius: var(--border-radius);
            border: none;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .card-header-custom {
            background: var(--primary-gradient);
            color: white;
            padding: 1.5rem;
        }

        .job-info-icon {
            width: 24px;
            color: var(--primary-color);
            margin-right: 8px;
        }

        .job-detail-section {
            padding: 20px 0;
            border-bottom: 1px solid #e5e5e5;
        }

        .job-detail-section:last-child {
            border-bottom: none;
        }

        .section-title {
            color: var(--primary-dark);
            font-weight: 600;
            margin-bottom: 15px;
        }

        .greeting-card {
            border-radius: var(--border-radius);
            border: 1px solid #e5e5e5;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
            transition: transform 0.2s;
        }

        .greeting-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .greeting-header {
            padding: 15px;
            border-bottom: 1px solid #e5e5e5;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .greeting-body {
            padding: 15px;
        }

        .greeting-footer {
            padding: 15px;
            border-top: 1px solid #e5e5e5;
            background-color: #f8f9fa;
        }

        .new-greeting-form {
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .tab-pane {
            padding: 20px 0;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }

        .status-interview {
            background-color: #d1ecf1;
            color: #0c5460;
        }

        .status-rejected {
            background-color: #f8d7da;
            color: #721c24;
        }

        .status-accepted {
            background-color: #d4edda;
            color: #155724;
        }

        .greeting-info {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
        }

        .greeting-info i {
            color: var(--primary-color);
            margin-right: 8px;
            width: 16px;
        }

        .budget-range {
            color: #28a745;
            font-weight: 600;
        }

        .custom-control-input:checked ~ .custom-control-label::before {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .cv-card {
            border: 1px solid #e5e5e5;
            border-radius: 8px;
            padding: 10px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .cv-card:hover {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(39, 64, 179, 0.1);
        }

        .cv-card.selected {
            border-color: var(--primary-color);
            background-color: rgba(39, 64, 179, 0.05);
        }

        .cv-card-header {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .cv-card-body {
            font-size: 0.9rem;
            color: #666;
        }

        .cv-card input[type="radio"] {
            accent-color: var(--primary-color);
        }

        .attachment-preview {
            width: 100%;
            height: 150px;
            border: 1px dashed #ddd;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 10px;
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
<!-- Main Content -->
<div class="container py-4">
    <!-- Job Detail Section -->
    <div class="row">
        <div class="col-lg-8">
            <!-- Job Detail Card -->
            <div class="card job-detail-card mb-4">
                <div class="card-header-custom">
                    <h1 class="h3 mb-2">${job.job_title}</h1>
                    <div class="d-flex align-items-center mt-2">
                        <span class="badge bg-light text-dark me-2">${job.category_name}</span>
                        <span class="small text-white-50">
                                <i class="bi bi-calendar-event me-1"></i> Đăng ngày
                                <fmt:formatDate pattern="dd/MM/yyyy" value="${job.post_date}" />
                            </span>
                        <span class="mx-2 text-white-50">|</span>
                        <span class="small text-white-50">
                                <i class="bi bi-clock me-1"></i> Hết hạn
                                <fmt:formatDate pattern="dd/MM/yyyy" value="${job.due_date_post}" />
                            </span>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-cash job-info-icon"></i>
                                <div>
                                    <div class="small text-muted">Ngân sách</div>
                                    <div class="fw-bold budget-range">
                                        <fmt:formatNumber value="${job.budget_min}" type="currency" currencyCode="VND" /> -
                                        <fmt:formatNumber value="${job.budget_max}" type="currency" currencyCode="VND" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-people job-info-icon"></i>
                                <div>
                                    <div class="small text-muted">Số lượng cần tuyển</div>
                                    <div class="fw-bold">${job.num_of_member} người</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-calendar-check job-info-icon"></i>
                                <div>
                                    <div class="small text-muted">Dự kiến hoàn thành</div>
                                    <div class="fw-bold">
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${job.due_date_job}" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-shield-check job-info-icon"></i>
                                <div>
                                    <div class="small text-muted">Đảm bảo thanh toán</div>
                                    <div class="fw-bold">
                                        <fmt:formatNumber value="${job.secure_wallet}" type="currency" currencyCode="VND" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Tags -->
                    <div class="job-detail-section">
                        <h5 class="section-title">Kỹ năng yêu cầu</h5>
                        <div>
                            <c:forEach var="tag" items="${jobTags}">
                                <span class="badge bg-light text-dark border me-2 mb-2 py-2 px-3">${tag.tag_name}</span>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="job-detail-section">
                        <h5 class="section-title">Mô tả công việc</h5>
                        <div>${job.job_description}</div>
                    </div>

                    <!-- Requirements -->
                    <div class="job-detail-section">
                        <h5 class="section-title">Yêu cầu</h5>
                        <div>${job.requirements}</div>
                    </div>

                    <!-- Benefits -->
                    <div class="job-detail-section">
                        <h5 class="section-title">Quyền lợi</h5>
                        <div>${job.benefit}</div>
                    </div>

                    <!-- Additional Details -->
                    <div class="job-detail-section">
                        <h5 class="section-title">Thông tin bổ sung</h5>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <i class="bi bi-person-video3 me-2 text-primary"></i>
                                    <span class="me-2">Phỏng vấn:</span>
                                    <strong>${job.have_interviewed ? 'Có' : 'Không'}</strong>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <i class="bi bi-journal-check me-2 text-primary"></i>
                                    <span class="me-2">Bài test:</span>
                                    <strong>${job.have_tested ? 'Có' : 'Không'}</strong>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Attachments if any -->
                    <c:if test="${not empty job.attachment}">
                        <div class="job-detail-section">
                            <h5 class="section-title">Tài liệu đính kèm</h5>
                            <div class="d-flex align-items-center">
                                <i class="bi bi-file-earmark-text me-2 fs-4 text-primary"></i>
                                <a href="${job.attachment}" class="text-decoration-none">Tải xuống tài liệu</a>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- Right Sidebar -->
        <div class="col-lg-4">
            <!-- Action Buttons -->
            <div class="card job-detail-card mb-4">
                <div class="card-body">
                    <div class="d-grid gap-2">
                        <button class="btn btn-gradient" data-bs-toggle="modal" data-bs-target="#greetingModal">
                            <i class="bi bi-send me-2"></i>Gửi chào giá
                        </button>
                        <button class="btn btn-outline-secondary">
                            <i class="bi bi-bookmark me-2"></i>Lưu công việc
                        </button>
                        <button class="btn btn-outline-secondary">
                            <i class="bi bi-flag me-2"></i>Báo cáo vi phạm
                        </button>
                    </div>
                </div>
            </div>

            <!-- Employer Info -->
            <div class="card job-detail-card mb-4">
                <div class="card-body">
                    <h5 class="section-title">Thông tin người đăng</h5>
                    <div class="d-flex mb-3">
                        <img src="${employer.avatar}" alt="${employer.fullname}" class="rounded-circle me-3" width="60" height="60">
                        <div>
                            <h6 class="mb-1">${employer.fullname}</h6>
                            <div class="small text-muted">Thành viên từ:
                                <fmt:formatDate pattern="MM/yyyy" value="${employer.created_at}" />
                            </div>
                            <div class="mt-1">
                                <i class="bi bi-star-fill text-warning"></i>
                                <span class="ms-1">${employer.rating} (${employer.reviews} đánh giá)</span>
                            </div>
                        </div>
                    </div>
                    <div class="d-grid">
                        <button class="btn btn-outline-primary">
                            <i class="bi bi-chat-dots me-2"></i>Liên hệ người đăng
                        </button>
                    </div>
                </div>
            </div>

            <!-- Job Stats -->
            <div class="card job-detail-card mb-4">
                <div class="card-body">
                    <h5 class="section-title">Thống kê công việc</h5>
                    <div class="d-flex align-items-center mb-2">
                        <i class="bi bi-eye me-2 text-primary"></i>
                        <span>Lượt xem: ${jobStats.viewCount}</span>
                    </div>
                    <div class="d-flex align-items-center mb-2">
                        <i class="bi bi-people me-2 text-primary"></i>
                        <span>Số lượt chào giá: ${jobStats.greetingCount}</span>
                    </div>
                    <div class="d-flex align-items-center mb-2">
                        <i class="bi bi-bookmark me-2 text-primary"></i>
                        <span>Lượt lưu: ${jobStats.saveCount}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Greetings Section -->
    <div class="row mt-4">
        <div class="col-12">
            <div class="card job-detail-card">
                <div class="card-header-custom">
                    <h4 class="m-0">Danh sách chào giá</h4>
                </div>
                <div class="card-body">
                    <ul class="nav nav-tabs" id="greetingTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#all-pane" type="button" role="tab" aria-selected="true">
                                Tất cả <span class="badge bg-secondary ms-1">${greetings.size()}</span>
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pending-tab" data-bs-toggle="tab" data-bs-target="#pending-pane" type="button" role="tab" aria-selected="false">
                                Chờ xét duyệt
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="interview-tab" data-bs-toggle="tab" data-bs-target="#interview-pane" type="button" role="tab" aria-selected="false">
                                Chờ phỏng vấn
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="accepted-tab" data-bs-toggle="tab" data-bs-target="#accepted-pane" type="button" role="tab" aria-selected="false">
                                Đã nhận
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="rejected-tab" data-bs-toggle="tab" data-bs-target="#rejected-pane" type="button" role="tab" aria-selected="false">
                                Bị từ chối
                            </button>
                        </li>
                    </ul>
                    <div class="tab-content" id="greetingTabContent">
                        <div class="tab-pane fade show active" id="all-pane" role="tabpanel" aria-labelledby="all-tab">
                            <c:choose>
                                <c:when test="${not empty greetings}">
                                    <c:forEach var="greeting" items="${greetings}">
                                        <div class="greeting-card">
                                            <div class="greeting-header">
                                                <div class="d-flex align-items-center">
                                                    <img src="${greeting.avatar}" alt="${greeting.fullname}" class="rounded-circle me-3" width="50" height="50">
                                                    <div>
                                                        <h6 class="mb-1">${greeting.fullname}</h6>
                                                        <div class="small text-muted">${greeting.job_position}</div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <c:choose>
                                                        <c:when test="${greeting.status eq 'Chờ xét duyệt'}">
                                                            <span class="status-badge status-pending">Chờ xét duyệt</span>
                                                        </c:when>
                                                        <c:when test="${greeting.status eq 'Chờ phỏng vấn'}">
                                                            <span class="status-badge status-interview">Chờ phỏng vấn</span>
                                                        </c:when>
                                                        <c:when test="${greeting.status eq 'Bị từ chối'}">
                                                            <span class="status-badge status-rejected">Bị từ chối</span>
                                                        </c:when>
                                                        <c:when test="${greeting.status eq 'Được nhận'}">
                                                            <span class="status-badge status-accepted">Được nhận</span>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <div class="greeting-body">
                                                <div class="row mb-3">
                                                    <div class="col-md-6">
                                                        <div class="greeting-info">
                                                            <i class="bi bi-cash"></i>
                                                            <span>Báo giá: <strong><fmt:formatNumber value="${greeting.price}" type="currency" currencyCode="VND" /></strong></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="greeting-info">
                                                            <i class="bi bi-calendar-check"></i>
                                                            <span>Thời gian hoàn thành: <strong>${greeting.expected_day} ngày</strong></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <h6>Giới thiệu</h6>
                                                <p>${greeting.introduction}</p>
                                                <c:if test="${not empty greeting.attachment}">
                                                    <div class="mt-3">
                                                        <a href="${greeting.attachment}" class="btn btn-sm btn-outline-primary">
                                                            <i class="bi bi-file-earmark me-1"></i>Xem tệp đính kèm
                                                        </a>
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="greeting-footer">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <button class="btn btn-sm btn-outline-secondary me-2">
                                                            <i class="bi bi-eye me-1"></i>Chi tiết hồ sơ
                                                        </button>
                                                        <button class="btn btn-sm btn-outline-secondary">
                                                            <i class="bi bi-chat-dots me-1"></i>Nhắn tin
                                                        </button>
                                                    </div>
                                                    <div>
                                                        <c:if test="${greeting.status eq 'Chờ xét duyệt'}">
                                                            <button class="btn btn-sm btn-outline-danger me-2">Từ chối</button>
                                                            <button class="btn btn-sm btn-gradient">Liên hệ phỏng vấn</button>
                                                        </c:if>
                                                        <c:if test="${greeting.status eq 'Chờ phỏng vấn'}">
                                                            <button class="btn btn-sm btn-outline-danger me-2">Từ chối</button>
                                                            <button class="btn btn-sm btn-gradient">Chọn ứng viên</button>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <div class="text-center py-5">
                                        <i class="bi bi-inbox fs-1 text-muted"></i>
                                        <p class="mt-3">Chưa có chào giá nào cho công việc này</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <!-- Other tab panes would follow the same pattern -->
                        <div class="tab-pane fade" id="pending-pane" role="tabpanel" aria-labelledby="pending-tab">
                            <!-- Filtered greetings for pending status -->
                        </div>
                        <div class="tab-pane fade" id="interview-pane" role="tabpanel" aria-labelledby="interview-tab">
                            <!-- Filtered greetings for interview status -->
                        </div>
                        <div class="tab-pane fade" id="accepted-pane" role="tabpanel" aria-labelledby="accepted-tab">
                            <!-- Filtered greetings for accepted status -->
                        </div>
                        <div class="tab-pane fade" id="rejected-pane" role="tabpanel" aria-labelledby="rejected-tab">
                            <!-- Filtered greetings for rejected status -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Greeting Modal -->
<div class="modal fade" id="greetingModal" tabindex="-1" aria-labelledby="greetingModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header gradient-custom text-white">
                <h5 class="modal-title" id="greetingModalLabel">Gửi chào giá cho công việc</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="greetingForm" method="post" action="submitGreeting" enctype="multipart/form-data">
                    <input type="hidden" name="job_id" value="${job.job_id}">

                    <!-- Select CV Section -->
                    <div class="mb-4">
                        <label class="form-label fw-bold">Chọn CV của bạn <span class="text-danger">*</span></label>
                        <div class="cv-list">
                            <c:forEach var="cv" items="${userCVs}" varStatus="status">
                                <div class="cv-card ${status.index == 0 ? 'selected' : ''}">
                                    <div class="d-flex justify-content-between">
                                        <div class="cv-card-header">
                                            <input type="radio" name="cv_id" id="cv_${cv.CV_id}" value="${cv.CV_id}"
                                                   class="me-2" ${status.index == 0 ? 'checked' : ''}>
                                            <label for="cv_${cv.CV_id}" class="mb-0">
                                                <strong>${cv.name}</strong>
                                                <span class="text-muted ms-2">(${cv.job_position})</span>
                                            </label>
                                        </div>
                                        <a href="viewCV?id=${cv.CV_id}" target="_blank" class="text-primary">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                    </div>
                                    <div class="cv-card-body">
                                            ${cv.summary}
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="text-end mt-2">
                            <a href="createCV" class="text-decoration-none">
                                <i class="bi bi-plus-circle"></i> Tạo CV mới
                            </a>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="price" class="form-label fw-bold">Báo giá (VNĐ) <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <input type="number" class="form-control" id="price" name="price" required
                                       min="${job.budget_min}" max="${job.budget_max}"
                                       placeholder="Nhập giá đề xuất">
                                <span class="input-group-text">VNĐ</span>
                            </div>
                            <div class="form-text">
                                Ngân sách: <fmt:formatNumber value="${job.budget_min}" type="currency" currencyCode="VND" /> -
                                <fmt:formatNumber value="${job.budget_max}" type="currency" currencyCode="VND" />
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="expected_day" class="form-label fw-bold">Thời gian hoàn thành (ngày) <span class="text-danger">*</span></label>
                            <input type="number" class="form-control" id="expected_day" name="expected_day"
                                   min="1" max="365" required placeholder="Số ngày dự kiến">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="introduction" class="form-label fw-bold">Giới thiệu về bạn <span class="text-danger">*</span></label>
                        <textarea class="form-control" id="introduction" name="introduction" rows="5" required
                                  placeholder="Giới thiệu bản thân, năng lực và kinh nghiệm của bạn phù hợp với công việc này"></textarea>
                        <div class="form-text">Đây là cơ hội để gây ấn tượng với người đăng công việc. Hãy nêu rõ điểm mạnh và lý do bạn phù hợp với công việc.</div>
                    </div>

                    <div class="mb-3">
                        <label for="attachment" class="form-label fw-bold">Tài liệu đính kèm (tùy chọn)</label>
                        <input class="form-control" type="file" id="attachment" name="attachment">
                        <div class="form-text">Định dạng hỗ trợ: PDF, DOC, DOCX, JPG, PNG (tối đa 5MB)</div>
                        <div class="attachment-preview" id="attachmentPreview">
                            <span class="text-muted">Xem trước tài liệu</span>
                        </div>
                    </div>

                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="termsCheck" required>
                        <label class="form-check-label" for="termsCheck">
                            Tôi đồng ý với <a href="#" class="text-decoration-none">Điều khoản dịch vụ</a> và đã đọc <a href="#" class="text-decoration-none">Chính sách bảo mật</a>
                        </label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                <button type="submit" form="greetingForm" class="btn btn-gradient">
                    <i class="bi bi-send me-1"></i>Gửi chào giá
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Similar Jobs Section -->
<div class="container py-4">
    <div class="row">
        <div class="col-12">
            <h3 class="mb-4">Công việc tương tự</h3>
            <div class="row">
                <!-- Similar Job Cards -->
                <c:forEach var="similarJob" items="${similarJobs}" varStatus="status">
                    <div class="col-md-4 mb-4">
                        <div class="card job-detail-card h-100">
                            <div class="card-body">
                                <h5 class="card-title mb-2">
                                    <a href="viewJob?id=${similarJob.job_id}" class="text-decoration-none">${similarJob.job_title}</a>
                                </h5>
                                <span class="badge bg-light text-dark mb-2">${similarJob.category_name}</span>
                                <div class="small text-muted mb-3">
                                    <i class="bi bi-calendar-event me-1"></i>
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${similarJob.post_date}" />
                                </div>
                                <div class="mb-3">
                                    <strong class="d-block mb-1">Ngân sách:</strong>
                                    <span class="budget-range">
                                            <fmt:formatNumber value="${similarJob.budget_min}" type="currency" currencyCode="VND" /> -
                                            <fmt:formatNumber value="${similarJob.budget_max}" type="currency" currencyCode="VND" />
                                        </span>
                                </div>
                                <p class="card-text mb-3">${fn:substring(similarJob.job_description, 0, 100)}...</p>
                                <div>
                                    <c:forEach var="tag" items="${similarJob.tags}" varStatus="tagStatus">
                                        <span class="badge bg-light text-dark border me-1 mb-1">${tag.tag_name}</span>
                                        <c:if test="${tagStatus.count == 3}">
                                            <c:if test="${similarJob.tags.size() > 3}">
                                                <span class="badge bg-light text-dark border">+${similarJob.tags.size() - 3}</span>
                                            </c:if>
                                            <c:set var="breakLoop" value="true"/>
                                        </c:if>
                                        <c:if test="${breakLoop}">

                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="card-footer bg-light">
                                <div class="d-flex justify-content-between align-items-center">
                                        <span class="small text-muted">
                                            <i class="bi bi-people"></i> ${similarJob.greetingCount} chào giá
                                        </span>
                                    <a href="viewJob?id=${similarJob.job_id}" class="btn btn-sm btn-outline-primary">Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Interview Scheduling -->
<div class="modal fade" id="interviewModal" tabindex="-1" aria-labelledby="interviewModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header gradient-custom text-white">
                <h5 class="modal-title" id="interviewModalLabel">Lên lịch phỏng vấn</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="interviewForm">
                    <input type="hidden" id="greetingId" name="greetingId">

                    <div class="mb-3">
                        <label for="interviewDate" class="form-label">Ngày phỏng vấn</label>
                        <input type="date" class="form-control" id="interviewDate" name="interviewDate" required>
                    </div>

                    <div class="mb-3">
                        <label for="interviewTime" class="form-label">Giờ phỏng vấn</label>
                        <input type="time" class="form-control" id="interviewTime" name="interviewTime" required>
                    </div>

                    <div class="mb-3">
                        <label for="interviewMethod" class="form-label">Phương thức phỏng vấn</label>
                        <select class="form-select" id="interviewMethod" name="interviewMethod" required>
                            <option value="">Chọn phương thức</option>
                            <option value="online">Trực tuyến (Zoom/Meet)</option>
                            <option value="phone">Điện thoại</option>
                            <option value="offline">Trực tiếp</option>
                        </select>
                    </div>

                    <div class="mb-3" id="locationField" style="display: none;">
                        <label for="interviewLocation" class="form-label">Địa điểm phỏng vấn</label>
                        <input type="text" class="form-control" id="interviewLocation" name="interviewLocation">
                    </div>

                    <div class="mb-3" id="linkField" style="display: none;">
                        <label for="interviewLink" class="form-label">Link phỏng vấn</label>
                        <input type="text" class="form-control" id="interviewLink" name="interviewLink">
                    </div>

                    <div class="mb-3">
                        <label for="interviewNote" class="form-label">Ghi chú thêm</label>
                        <textarea class="form-control" id="interviewNote" name="interviewNote" rows="3"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                <button type="submit" form="interviewForm" class="btn btn-gradient">Gửi lịch phỏng vấn</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Rejection -->
<div class="modal fade" id="rejectModal" tabindex="-1" aria-labelledby="rejectModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header gradient-custom text-white">
                <h5 class="modal-title" id="rejectModalLabel">Từ chối chào giá</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="rejectForm">
                    <input type="hidden" id="rejectGreetingId" name="rejectGreetingId">

                    <div class="mb-3">
                        <label for="rejectReason" class="form-label">Lý do từ chối</label>
                        <select class="form-select" id="rejectReason" name="rejectReason" required>
                            <option value="">Chọn lý do</option>
                            <option value="Không phù hợp với yêu cầu công việc">Không phù hợp với yêu cầu công việc</option>
                            <option value="Đã tìm được ứng viên phù hợp">Đã tìm được ứng viên phù hợp</option>
                            <option value="Báo giá quá cao">Báo giá quá cao</option>
                            <option value="Không đủ kinh nghiệm">Không đủ kinh nghiệm</option>
                            <option value="other">Lý do khác</option>
                        </select>
                    </div>

                    <div class="mb-3" id="otherReasonField" style="display: none;">
                        <label for="otherReason" class="form-label">Lý do khác</label>
                        <textarea class="form-control" id="otherReason" name="otherReason" rows="3"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                <button type="submit" form="rejectForm" class="btn btn-danger">Xác nhận từ chối</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // CV Selection
    document.addEventListener('DOMContentLoaded', function() {
        const cvCards = document.querySelectorAll('.cv-card');

        cvCards.forEach(card => {
            const radioInput = card.querySelector('input[type="radio"]');

            card.addEventListener('click', function() {
                // Remove selected class from all cards
                cvCards.forEach(c => c.classList.remove('selected'));

                // Add selected class to clicked card
                card.classList.add('selected');

                // Check the radio button
                radioInput.checked = true;
            });
        });

        // File preview
        const attachmentInput = document.getElementById('attachment');
        const attachmentPreview = document.getElementById('attachmentPreview');

        attachmentInput.addEventListener('change', function() {
            const file = this.files[0];
            if (file) {
                let fileType = file.type;
                let validImageTypes = ['image/jpeg', 'image/png', 'image/gif'];

                if (validImageTypes.includes(fileType)) {
                    // Image preview
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        attachmentPreview.innerHTML = `<img src="${e.target.result}" style="max-height: 140px;">`;
                    }
                    reader.readAsDataURL(file);
                } else {
                    // File icon based on type
                    let iconClass = 'bi-file-earmark';
                    if (fileType.includes('pdf')) {
                        iconClass = 'bi-file-earmark-pdf';
                    } else if (fileType.includes('word') || fileType.includes('doc')) {
                        iconClass = 'bi-file-earmark-word';
                    } else if (fileType.includes('excel') || fileType.includes('sheet')) {
                        iconClass = 'bi-file-earmark-excel';
                    }

                    attachmentPreview.innerHTML = `
                            <div class="text-center">
                                <i class="bi ${iconClass} fs-1 text-primary"></i>
                                <p class="mt-2 mb-0">${file.name}</p>
                                <small class="text-muted">${(file.size / 1024 / 1024).toFixed(2)} MB</small>
                            </div>
                        `;
                }
            } else {
                attachmentPreview.innerHTML = `<span class="text-muted">Xem trước tài liệu</span>`;
            }
        });

        // Interview method toggle fields
        const interviewMethod = document.getElementById('interviewMethod');
        const locationField = document.getElementById('locationField');
        const linkField = document.getElementById('linkField');

        interviewMethod?.addEventListener('change', function() {
            if (this.value === 'offline') {
                locationField.style.display = 'block';
                linkField.style.display = 'none';
            } else if (this.value === 'online') {
                locationField.style.display = 'none';
                linkField.style.display = 'block';
            } else {
                locationField.style.display = 'none';
                linkField.style.display = 'none';
            }
        });

        // Reject reason toggle
        const rejectReason = document.getElementById('rejectReason');
        const otherReasonField = document.getElementById('otherReasonField');

        rejectReason?.addEventListener('change', function() {
            if (this.value === 'other') {
                otherReasonField.style.display = 'block';
            } else {
                otherReasonField.style.display = 'none';
            }
        });

        // Set up modal data passing
        const interviewModal = document.getElementById('interviewModal');
        if (interviewModal) {
            interviewModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget;
                const greetingId = button.getAttribute('data-greeting-id');
                document.getElementById('greetingId').value = greetingId;
            });
        }

        const rejectModal = document.getElementById('rejectModal');
        if (rejectModal) {
            rejectModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget;
                const greetingId = button.getAttribute('data-greeting-id');
                document.getElementById('rejectGreetingId').value = greetingId;
            });
        }

        // Budget validation
        const priceInput = document.getElementById('price');
        if (priceInput) {
            const minBudget = ${job.budget_min};
            const maxBudget = ${job.budget_max};

            priceInput.addEventListener('input', function() {
                const value = parseInt(this.value);
                if (value < minBudget) {
                    this.setCustomValidity(`Giá chào thấp nhất là ${minBudget.toLocaleString('vi-VN')} VNĐ`);
                } else if (value > maxBudget) {
                    this.setCustomValidity(`Giá chào cao nhất là ${maxBudget.toLocaleString('vi-VN')} VNĐ`);
                } else {
                    this.setCustomValidity('');
                }
            });
        }
    });

    // Function to set up event handlers for interview and reject buttons
    function setupActionButtons() {
        // Interview buttons
        document.querySelectorAll('.btn-interview').forEach(button => {
            button.addEventListener('click', function() {
                const greetingId = this.getAttribute('data-greeting-id');
                document.getElementById('greetingId').value = greetingId;
                new bootstrap.Modal(document.getElementById('interviewModal')).show();
            });
        });

        // Reject buttons
        document.querySelectorAll('.btn-reject').forEach(button => {
            button.addEventListener('click', function() {
                const greetingId = this.getAttribute('data-greeting-id');
                document.getElementById('rejectGreetingId').value = greetingId;
                new bootstrap.Modal(document.getElementById('rejectModal')).show();
            });
        });
    }

    // Call setup function
    setupActionButtons();

    // Tab content loading
    document.querySelectorAll('#greetingTab button').forEach(button => {
        button.addEventListener('click', function() {
            const tabId = this.getAttribute('data-bs-target').replace('-pane', '');
            const status = tabId.replace('#', '');

            // You can implement AJAX loading here if needed
            console.log(`Loading ${status} greetings`);
        });
    });
</script>
</body>
</html>