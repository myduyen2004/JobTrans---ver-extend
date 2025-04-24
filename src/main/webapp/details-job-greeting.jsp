<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đơn ứng tuyển</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        :root {
            --primary-gradient: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            --dark-blue: rgb(21, 32, 112);
            --light-blue: rgb(39, 64, 179);
            --text-light: #f8f9fa;
            --text-dark: #343a40;
            --border-radius: 12px;
            --box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f8f9fa;
            color: var(--text-dark);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            background: var(--primary-gradient);
            color: white;
            padding: 20px 0;
            margin-bottom: 30px;
            border-radius: 0 0 var(--border-radius) var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        .header-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .page-title {
            font-size: 28px;
            margin-bottom: 20px;
            color: var(--text-light);
            animation: fadeInDown 1s;
        }

        .card {
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            margin-bottom: 30px;
            overflow: hidden;
            animation: fadeIn 0.8s;
        }

        .card-header-a {
            background: var(--primary-gradient);
            color: white;
            padding: 20px;
            font-size: 18px;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-body-a {
            padding: 20px 40px;
        }

        .applicant-info {
            display: flex;
            margin-bottom: 30px;
            animation: fadeInUp 1s;
        }

        .avatar-container-a {
            width: 120px;
            height: 120px;
            margin-right: 20px;
            position: relative;
            flex-shrink: 0;
        }

        .avatar {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .verification-badge {
            position: absolute;
            bottom: 5px;
            right: 5px;
            background-color: #28a745;
            color: white;
            border-radius: 50%;
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
        }

        .applicant-details {
            flex-grow: 1;
        }

        .applicant-name {
            font-size: 24px;
            margin-bottom: 5px;
            color: var(--dark-blue);
        }

        .applicant-rating {
            color: #ffc107;
            margin-bottom: 10px;
        }

        .info-row {
            display: flex;
            margin-bottom: 10px;
        }

        .info-label {
            width: 180px;
            font-weight: 500;
            color: #6c757d;
        }

        .info-value {
            flex-grow: 1;
        }

        .tags {
            margin-top: 15px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .tag {
            background: linear-gradient(135deg, rgba(39, 64, 179, 0.1), rgba(21, 32, 112, 0.2));
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 14px;
            color: var(--dark-blue);
            display: inline-block;
            transition: var(--transition);
        }

        .tag:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }

        .job-details {
            margin-bottom: 30px;
            animation: fadeInUp 1.2s;
        }

        .job-title {
            font-size: 22px;
            margin-bottom: 15px;
            color: var(--dark-blue);
        }

        .job-params {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 20px;
        }

        .job-param {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .icon-circle {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--primary-gradient);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        .introduction {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: var(--border-radius);
            margin-bottom: 30px;
            border-left: 4px solid var(--light-blue);
            animation: fadeInUp 1.4s;
        }

        .cv-preview {
            margin-bottom: 30px;
            animation: fadeInUp 1.6s;
        }

        .cv-container {
            height: 600px;
            background-color: #f8f9fa;
            border-radius: var(--border-radius);
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
            border: 1px solid #dee2e6;
        }

        .cv-placeholder {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .cv-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: var(--transition);
        }

        .cv-container:hover .cv-overlay {
            opacity: 1;
        }

        .btn-a {
            padding: 12px 24px;
            border-radius: 30px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .btn-primary {
            background: var(--primary-gradient);
            color: white;
        }

        .btn-outline {
            background: transparent;
            border: 2px solid var(--light-blue);
            color: var(--light-blue);
        }

        .btn-a:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .btn-group {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .attachment {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: var(--border-radius);
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 15px;
            animation: fadeInUp 1.8s;
        }

        .attachment-icon {
            width: 45px;
            height: 45px;
            background: var(--primary-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 20px;
        }

        .attachment-details {
            flex-grow: 1;
        }

        .attachment-name {
            font-weight: 500;
            margin-bottom: 5px;
        }

        .attachment-size {
            font-size: 14px;
            color: #6c757d;
        }

        .actions {
            padding: 20px;
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            animation: fadeInUp 2s;
        }

        .status-badge {
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
        }

        .status-pending {
            background-color: #ffc107;
            color: #212529;
        }

        .status-interview {
            background-color: #17a2b8;
            color: white;
        }

        .status-rejected {
            background-color: #dc3545;
            color: white;
        }

        .status-approved {
            background-color: #28a745;
            color: white;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }

        .modal-content {
            background-color: white;
            border-radius: var(--border-radius);
            width: 90%;
            max-width: 600px;
            max-height: 90vh;
            overflow-y: auto;
            animation: zoomIn 0.3s;
        }

        .modal-header {
            background: var(--primary-gradient);
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-title {
            font-size: 20px;
            font-weight: 600;
        }

        .modal-close {
            background: none;
            border: none;
            color: white;
            font-size: 24px;
            cursor: pointer;
        }

        .modal-body {
            padding: 20px;
        }

        .modal-footer {
            padding: 15px 20px;
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            border-top: 1px solid #dee2e6;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: var(--border-radius);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--light-blue);
            box-shadow: 0 0 0 3px rgba(39, 64, 179, 0.2);
        }

        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }

        /* Animation keyframes */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes zoomIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            .applicant-info {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .avatar-container-a {
                margin-right: 0;
                margin-bottom: 20px;
            }

            .info-row {
                flex-direction: column;
                margin-bottom: 15px;
            }

            .info-label {
                width: 100%;
                margin-bottom: 5px;
            }

            .job-params {
                flex-direction: column;
                gap: 10px;
            }

            .btn-group {
                flex-direction: column;
            }

            .btn-a {
                width: 100%;
                justify-content: center;
            }

            .actions {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<%@include file="includes/header-01.jsp"%>
<div class="container">
    <div class="card">
        <div class="card-header-a">
            <span>Thông tin ứng viên</span>
            <div class="status-badge status-interview">${jobGreeting.status}</div>
        </div>
        <div class="card-body-a">
            <div class="applicant-info">
                <div class="avatar-container-a">
                    <img src="${account.avatar}" alt="Ảnh đại diện" class="avatar">
                    <div class="verification-badge">
                        <i class="fas fa-check"></i>
                    </div>
                </div>
                <div class="applicant-details">
                    <h2 class="applicant-name">${account.accountName}</h2>
                    <div class="applicant-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <span>4.5</span>
                    </div>
                    <div class="" style="display: grid; grid-template-columns: auto auto;">
                        <div class="info-row">
                            <div class="info-label">Điểm:</div>
                            <div class="info-value">${account.point}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Số điện thoại:</div>
                            <div class="info-value">${account.phone}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Chuyên môn:</div>
                            <div class="info-value">${account.speciality}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Số năm kinh nghiệm:</div>
                            <div class="info-value">${account.experienceYears}</div>
                        </div>
                    </div>
<%--                    <div class="tags">--%>
<%--                        <span class="tag">JavaScript</span>--%>
<%--                        <span class="tag">ReactJS</span>--%>
<%--                        <span class="tag">NodeJS</span>--%>
<%--                        <span class="tag">SQL Server</span>--%>
<%--                        <span class="tag">UI/UX</span>--%>
<%--                    </div>--%>
                </div>
            </div>

            <div class="job-details">
                <h3 class="job-title" style="margin-bottom: 20px">Chi tiết báo giá</h3>
                <div class="job-params">
                    <div class="job-param">
                        <div class="icon-circle">
                            <i class="fas fa-coins"></i>
                        </div>
                        <div>
                            <div class="param-label">Báo giá</div>
                            <div class="param-value">${formattedPrice} VNĐ</div>
                        </div>
                    </div>
                    <div class="job-param">
                        <div class="icon-circle">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <div>
                            <div class="param-label">Thời gian dự kiến</div>
                            <div class="param-value">${jobGreeting.expectedDay} ngày</div>
                        </div>
                    </div>
<%--                    <div class="job-param">--%>
<%--                        <div class="icon-circle">--%>
<%--                            <i class="fas fa-clock"></i>--%>
<%--                        </div>--%>
<%--                        <div>--%>
<%--                            <div class="param-label">Ngày ứng tuyển</div>--%>
<%--                            <div class="param-value">${jobGreeting.introduction}</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>

            <div class="introduction">
                <h3 class="intro-title" style="margin-bottom: 10px">Thư giới thiệu</h3>
                <p>${jobGreeting.introduction}</p>
            </div>

            <div class="cv-preview">
                <h3 class="cv-title" style="margin-bottom: 20px">Xem CV</h3>
                <div class="cv-container">
                    <img src="/api/placeholder/800/1000" alt="CV Preview" class="cv-placeholder">
                    <div class="cv-overlay">
                        <div class="btn-group">
                            <a  class="btn-a btn-primary" id="viewCvBtn">
                                <i class="fas fa-eye"></i> Xem CV
                            </a>
                            <a class="btn-a btn-outline" id="downloadCvBtn" style="background-color: #FFFFFF">
                                <i class="fas fa-download"></i> Tải xuống
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="attachment">

                <c:if test="${jobGreeting.attachment == null}">
                    <div style="text-align: center;margin: auto;font-style: italic;">
                        <p>Không có tệp đính kèm</p>
                    </div>
                </c:if>
                <c:if test="${jobGreeting.attachment != null}">
                    <div class="attachment-icon">
                        <i class="fas fa-file-alt"></i>
                    </div>
                    <div class="attachment-details">
                        <div class="attachment-name">${jobGreeting.attachment}</div>
                            <%--                    <div class="attachment-size">5.2 MB</div>--%>
                    </div>
                    <a href="uploads/attachments/${jobGreeting.attachment}" download class="btn-a btn-outline">
                        <i class="fas fa-download"></i>
                    </a>
                </c:if>
            </div>

            <div class="actions">
                <button class="btn-a btn-outline" id="rejectBtn">
                    <i class="fas fa-times"></i> Từ chối
                </button>
                <c:if test="${jobGreeting.status == 'Chờ xét duyệt'}">
                    <a href="job-greeting?action=accept-to-interview&greetingId=${jobGreeting.greetingId}" class="btn-a btn-primary" style="text-decoration: none">
                        <i class="fas fa-check"></i> Duyệt phỏng vấn
                    </a>
                </c:if>
                <c:if test="${jobGreeting.status == 'Chờ phỏng vấn'}">
                    <button class="btn-a btn-outline" id="interviewBtn">
                        <i class="fas fa-calendar-check"></i> Cập nhật phỏng vấn
                    </button>
                    <a class="btn-a btn-primary" id="approveBtn">
                        <i class="fas fa-check"></i> Chấp nhận ứng viên
                    </a>
                </c:if>
            </div>
        </div>
    </div>
</div>

<!-- Modal phỏng vấn -->
<div class="modal" id="interviewModal">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">Đặt lịch phỏng vấn</h4>
            <button class="modal-close" id="closeInterviewModal">&times;</button>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label class="form-label">Ngày phỏng vấn</label>
                <input type="date" class="form-control" min="2025-04-24">
            </div>
            <div class="form-group">
                <label class="form-label">Thời gian</label>
                <input type="time" class="form-control">
            </div>
            <div class="form-group">
                <label class="form-label">Hình thức</label>
                <select class="form-control">
                    <option>Trực tiếp</option>
                    <option>Online</option>
                </select>
            </div>
            <div class="form-group">
                <label class="form-label">Ghi chú</label>
                <textarea class="form-control" placeholder="Nhập thông tin chi tiết về buổi phỏng vấn..."></textarea>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn-a btn-outline" id="cancelInterviewModal">Hủy</button>
            <button class="btn-a btn-primary">Xác nhận</button>
        </div>
    </div>
</div>

<!-- Modal từ chối -->
<div class="modal" id="rejectModal">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">Từ chối ứng viên</h4>
            <button class="modal-close" id="closeRejectModal">&times;</button>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label class="form-label">Lý do từ chối</label>
                <select class="form-control">
                    <option>Không đáp ứng yêu cầu kỹ năng</option>
                    <option>Thiếu kinh nghiệm</option>
                    <option>Mức lương đề xuất không phù hợp</option>
                    <option>Thời gian dự kiến không phù hợp</option>
                    <option>Khác</option>
                </select>
            </div>
            <div class="form-group">
                <label class="form-label">Ghi chú</label>
                <textarea class="form-control" placeholder="Nhập thông tin phản hồi cho ứng viên..."></textarea>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn-a btn-outline" id="cancelRejectModal">Hủy</button>
            <a href="job-greeting?action=refuse-candidate&greetingId=${jobGreeting.greetingId}" class="btn-a btn-primary" style="text-decoration: none">Xác nhận</a>
        </div>
    </div>
</div>

<!-- Modal xác nhận chấp nhận -->
<div class="modal" id="approveModal">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">Xác nhận chấp nhận ứng viên</h4>
            <button class="modal-close" id="closeApproveModal">&times;</button>
        </div>
        <div class="modal-body">
            <p>Bạn có chắc chắn muốn chấp nhận ứng viên <strong>Nguyễn Văn A</strong> với mức giá <strong>5.000.000 VNĐ</strong> và thời gian dự kiến <strong>15 ngày</strong>?</p>
            <div class="form-group">
                <label class="form-label">Ghi chú</label>
                <textarea class="form-control" placeholder="Nhập thông tin bổ sung (nếu có)..."></textarea>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn-a btn-outline" id="cancelApproveModal">Hủy</button>
            <button class="btn-a btn-primary">Xác nhận</button>
        </div>
    </div>
</div>

<!-- Modal xem CV -->
<div class="modal" id="viewCvModal">
    <div class="modal-content" style="width: 95%; max-width: 800px; height: 90vh;">
        <div class="modal-header">
            <h4 class="modal-title">CV của Nguyễn Văn A</h4>
            <button class="modal-close" id="closeViewCvModal">&times;</button>
        </div>
        <div class="modal-body" style="padding: 0; height: calc(90vh - 130px);">
            <iframe src="/api/placeholder/800/1000" style="width: 100%; height: 100%; border: none;"></iframe>
        </div>
        <div class="modal-footer">
            <button class="btn-a btn-outline" id="cancelViewCvModal">Đóng</button>
            <button class="btn-a btn-primary">
                <i class="fas fa-download"></i> Tải xuống
            </button>
        </div>
    </div>
</div>

<script>
    document.getElementById("downloadBtn").addEventListener("click", function() {
        // Lấy tên tệp từ `${jobGreeting.attachment}`
        var attachmentFileName = "${jobGreeting.attachment}";

        // Tạo URL đầy đủ cho tệp tải xuống
        var downloadUrl = '/uploads/attachments/' + attachmentFileName;

        // Tạo thẻ <a> để tải tệp
        var link = document.createElement("a");
        link.href = downloadUrl;  // Đường dẫn tải tệp
        link.download = attachmentFileName;  // Đặt tên tệp khi tải về

        // Thực hiện tải tệp
        link.click();
    });
</script>

<script>
    $(document).ready(function() {
        // Animation for tags
        $('.tag').hover(function() {
            $(this).addClass('animate__animated animate__pulse');
        }, function() {
            $(this).removeClass('animate__animated animate__pulse');
        });

        // Modal handling
        $('#interviewBtn').click(function() {
            $('#interviewModal').css('display', 'flex');
        });

        $('#closeInterviewModal, #cancelInterviewModal').click(function() {
            $('#interviewModal').css('display', 'none');
        });

        $('#rejectBtn').click(function() {
            $('#rejectModal').css('display', 'flex');
        });

        $('#closeRejectModal, #cancelRejectModal').click(function() {
            $('#rejectModal').css('display', 'none');
        });

        $('#approveBtn').click(function() {
            $('#approveModal').css('display', 'flex');
        });

        $('#closeApproveModal, #cancelApproveModal').click(function() {
            $('#approveModal').css('display', 'none');
        });

        $('#viewCvBtn').click(function() {
            $('#viewCvModal').css('display', 'flex');
        });

        $('#closeViewCvModal, #cancelViewCvModal').click(function() {
            $('#viewCvModal').css('display', 'none');
        });

        // Close modals when clicking outside
        $('.modal').click(function(e) {
            if ($(e.target).hasClass('modal')) {
                $(this).css('display', 'none');
            }
        });

        // Animation for buttons
        $('.btn').hover(function() {
            $(this).addClass('animate__animated animate__pulse');
        }, function() {
            $(this).removeClass('animate__animated animate__pulse');
        });
    });
</script>
<%@include file="includes/footer.jsp"%>
</body>
</html>