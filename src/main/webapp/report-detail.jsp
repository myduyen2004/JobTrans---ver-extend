<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/20/2025
  Time: 8:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết báo cáo</title>
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
    </style>
</head>
<%@include file="includes/header-01.jsp"%>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-10 col-md-9 p-4" style="margin-left: 150px">
            <div class="report-header d-flex justify-content-between align-items-center">
                <h2>Chi tiết báo cáo #12345</h2>
                <div>
                    <span class="badge bg-warning text-dark me-2 status-badge">Đang xử lý</span>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <!-- Report Details -->
                    <div class="card mb-4">
                        <div class="card-header bg-custom-gradient text-white">
                            <h5 class="mb-0"><i class="fas fa-exclamation-circle me-2"></i>Thông tin báo cáo</h5>
                        </div>
                        <div class="card-body">
                            <div class="reporter-info">
                                <img src="/api/placeholder/50/50" alt="Avatar" class="avatar">
                                <div class="reporter-details">
                                    <h6 class="mb-0">Nguyễn Văn A</h6>
                                    <small class="text-muted">nguyen.van.a@example.com</small>
                                </div>
                            </div>

                            <div class="mb-3">
                                <h6 class="text-secondary">Tiêu chí báo cáo:</h6>
                                <span class="badge bg-danger me-2">Vi phạm nội quy</span>
                            </div>

                            <div class="mb-3">
                                <h6 class="text-secondary">Thời gian báo cáo:</h6>
                                <p>20/04/2025, 10:35 AM</p>
                            </div>

                            <div class="mb-3">
                                <h6 class="text-secondary">Mô tả chi tiết:</h6>
                                <div class="report-content">
                                    <p>Tài khoản này đã đăng nội dung vi phạm quy tắc cộng đồng. Cụ thể là đã đăng tải hình ảnh và bài viết có nội dung quảng cáo trái phép. Đây không phải là lần đầu tiên tài khoản này vi phạm quy định.</p>
                                    <p>Tôi đã chụp ảnh màn hình và đính kèm các bằng chứng bên dưới. Đề nghị kiểm tra và có biện pháp xử lý kịp thời.</p>
                                </div>
                            </div>

                            <div class="mb-3">
                                <h6 class="text-secondary">Tệp đính kèm:</h6>
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img src="/api/placeholder/200/150" class="card-img-top" alt="Bằng chứng 1">
                                            <div class="card-body p-2">
                                                <p class="card-text small">evidence1.jpg</p>
                                                <a href="#" class="btn btn-sm btn-outline-primary">Xem</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img src="/api/placeholder/200/150" class="card-img-top" alt="Bằng chứng 2">
                                            <div class="card-body p-2">
                                                <p class="card-text small">evidence2.jpg</p>
                                                <a href="#" class="btn btn-sm btn-outline-primary">Xem</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img src="/api/placeholder/200/150" class="card-img-top" alt="Bằng chứng 3">
                                            <div class="card-body p-2">
                                                <p class="card-text small">evidence3.jpg</p>
                                                <a href="#" class="btn btn-sm btn-outline-primary">Xem</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="attachment-preview">
                                <h6 class="text-secondary">Xem trước tệp đính kèm</h6>
                                <div class="text-center">
                                    <img src="/api/placeholder/400/320" class="img-fluid" alt="Preview">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Reported Content -->
                    <div class="card mb-4">
                        <div class="card-header bg-custom-gradient text-white">
                            <h5 class="mb-0"><i class="fas fa-file-alt me-2"></i>Nội dung bị báo cáo</h5>
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <div class="d-flex align-items-center mb-3">
                                    <img src="/api/placeholder/40/40" alt="User Avatar" class="avatar me-2" style="width: 40px; height: 40px;">
                                    <div>
                                        <h6 class="mb-0">Trần Văn B</h6>
                                        <small class="text-muted">@tranvanb • 19/04/2025</small>
                                    </div>
                                </div>
                                <div class="report-content">
                                    <p>Mua ngay sản phẩm XYZ tại đây! Giảm giá 70% chỉ trong hôm nay! Liên hệ ngay số điện thoại 09xx.xxx.xxx để được tư vấn...</p>
                                    <p>Đảm bảo hoàn tiền nếu không hài lòng. Sản phẩm nhập khẩu chính hãng, không qua trung gian.</p>
                                    <div class="border p-2 rounded bg-light">
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-link me-2 text-secondary"></i>
                                            <span>www.example-spam-site.com/product123</span>
                                        </div>
                                    </div>
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
                                        <tr>
                                            <td>05/03/2025</td>
                                            <td>Quảng cáo trái phép</td>
                                            <td><span class="badge bg-danger">Đã xử lý</span></td>
                                        </tr>
                                        <tr>
                                            <td>15/02/2025</td>
                                            <td>Spam</td>
                                            <td><span class="badge bg-danger">Đã xử lý</span></td>
                                        </tr>
                                        <tr>
                                            <td>20/04/2025</td>
                                            <td>Quảng cáo trái phép</td>
                                            <td><span class="badge bg-warning text-dark">Đang xử lý</span></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <!-- Action Card -->
                    <div class="card mb-4">
                        <div class="card-header bg-custom-gradient text-white">
                            <h5 class="mb-0"><i class="fas fa-tasks me-2"></i>Hành động</h5>
                        </div>
                        <div class="card-body">
                            <div class="d-grid gap-2">
                                <button class="btn btn-success" type="button">
                                    <i class="fas fa-check me-2"></i>Chấp nhận báo cáo
                                </button>
                                <button class="btn btn-danger" type="button">
                                    <i class="fas fa-times me-2"></i>Từ chối báo cáo
                                </button>
                                <button class="btn btn-warning" type="button">
                                    <i class="fas fa-exclamation-triangle me-2"></i>Cảnh báo người dùng
                                </button>
                                <button class="btn btn-dark" type="button">
                                    <i class="fas fa-ban me-2"></i>Khóa tài khoản
                                </button>
                            </div>

                            <hr>

                            <div class="mb-3">
                                <label for="noteToUser" class="form-label">Ghi chú cho người dùng:</label>
                                <textarea class="form-control" id="noteToUser" rows="3" placeholder="Nhập ghi chú..."></textarea>
                            </div>
                            <div class="d-grid">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-save me-2"></i>Lưu ghi chú
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
