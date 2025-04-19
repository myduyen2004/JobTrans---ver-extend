<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin tài khoản - Admin</title>
    <link href="./css/infor-user-manage.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
    <!-- Header -->
    <div class="profile-header">
        <img class="profile-avatar" src="./img/anhcv/avatar.jpeg" alt="Ảnh đại diện">

        <div class="profile-info">
            <div class="profile-name">
                Nguyen Van A
                <span class="badge-verified">Đã xác thực</span>
            </div>
            <div class="profile-role">Cá nhân</div>
            <div class="profile-location">Đà Nẵng</div>
        </div>

        <div class="profile-actions">
            <h3 class="text-center">Điểm số: 1000</h3>
            <a href="#" class="edit-button">Chặn</a>
        </div>
    </div>

    <!-- Body content -->
    <div class="content-grid">
        <!-- Left column -->
        <div>
            <div class="card">
                <h2 class="card-title">Giới thiệu</h2>
                <p>Xin chào, tôi tên là [Tên bạn]. Hiện tại tôi đang sống và làm việc tại [thành phố]. Tôi là người thân thiện, chăm chỉ và luôn sẵn sàng học hỏi những điều mới. Trong thời gian rảnh, tôi thích đọc sách, nghe nhạc và học thêm ngoại ngữ. Rất vui được làm quen với mọi người!</p>
            </div>
            <div class="card">
                <h2 class="card-title">Thông tin chuyên môn</h2>
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-label">Chuyên môn</div>
                        <div class="info-value">IT</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Kinh nghiệm</div>
                        <div class="info-value">Công nghệ thông tin - 3 năm</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Học vấn</div>
                        <div class="info-value">Đại học FPT</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Trạng thái</div>
                        <div class="info-value">Đang hoạt động</div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="project-header">
                    <h2 class="card-title">Hoàn thành dự án</h2>
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
                <h2 class="card-title">Thông tin liên hệ</h2>
                <div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-envelope"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Email</div>
                            <div class="info-value">nguyenvana@gmail.com</div>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-phone-alt"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Điện thoại</div>
                            <div class="info-value">0863556255</div>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-map-marker-alt"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Địa chỉ</div>
                            <div class="info-value">Đà Nẵng</div>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-birthday-cake"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Ngày sinh</div>
                            <div class="info-value">22-12-2001</div>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-venus-mars"></i></div>
                        <div class="contact-detail">
                            <div class="info-label">Giới tính</div>
                            <div class="info-value">Nam</div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="card">
                <h2 class="card-title">Chữ ký số</h2>
                <div class="signature">
                    "Sáng tạo không giới hạn, chất lượng là ưu tiên hàng đầu."
                </div>
            </div>
        </div>
    </div>

    <!-- Reports Section -->
    <div class="reports-container">
        <div class="reports-header">
            <div class="contact-icon"><i class="fas fa-list"></i></div>
            <h2 class="reports-title">Danh sách các báo cáo nhận được</h2>
            <div class="reports-count">3 báo cáo</div>
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
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <div class="reporter">
                            <img src="img/default-avatar.jpg" alt="Phạm Văn D" class="reporter-avatar">
                            Phạm Văn D
                        </div>
                    </td>
                    <td>
                        <div class="report-content">
                            Vi phạm bản quyền trong thiết kế đã cung cấp, sử dụng hình ảnh không được phép mà không thông báo cho khách hàng.
                        </div>
                    </td>
                    <td>
                        <span class="criteria" data-tooltip="Vi phạm quyền sở hữu trí tuệ, sử dụng nội dung có bản quyền không được phép hoặc không đúng quy định">Vi phạm bản quyền</span>
                    </td>
                    <td>
                        <div class="report-date">20/02/2025</div>
                    </td>
                    <td>
                        <span class="status-badge status-rejected">Đã từ chối</span>
                    </td>
                    <td>
                        <div class="row flex">
                            <div class="col-6">
                                <span class="badge-verified">Xử lý</span>
                            </div>
                            <div class="col-6">
                                <span class="badge-reject">Từ chối</span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="reporter">
                            <img src="img/default-avatar.jpg" alt="Phạm Văn D" class="reporter-avatar">
                            Phạm Văn D
                        </div>
                    </td>
                    <td>
                        <div class="report-content">
                            Vi phạm bản quyền trong thiết kế đã cung cấp, sử dụng hình ảnh không được phép mà không thông báo cho khách hàng.
                        </div>
                    </td>
                    <td>
                        <span class="criteria" data-tooltip="Vi phạm quyền sở hữu trí tuệ, sử dụng nội dung có bản quyền không được phép hoặc không đúng quy định">Vi phạm bản quyền</span>
                    </td>
                    <td>
                        <div class="report-date">20/02/2025</div>
                    </td>
                    <td>
                        <span class="status-badge status-rejected">Đã từ chối</span>
                    </td>
                    <td>
                        <div class="row flex">
                            <div class="col-6">
                                <span class="badge-verified">Xử lý</span>
                            </div>
                            <div class="col-6">
                                <span class="badge-reject">Từ chối</span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="reporter">
                            <img src="img/default-avatar.jpg" alt="Phạm Văn D" class="reporter-avatar">
                            Phạm Văn D
                        </div>
                    </td>
                    <td>
                        <div class="report-content">
                            Vi phạm bản quyền trong thiết kế đã cung cấp, sử dụng hình ảnh không được phép mà không thông báo cho khách hàng.
                        </div>
                    </td>
                    <td>
                        <span class="criteria" data-tooltip="Vi phạm quyền sở hữu trí tuệ, sử dụng nội dung có bản quyền không được phép hoặc không đúng quy định">Vi phạm bản quyền</span>
                    </td>
                    <td>
                        <div class="report-date">20/02/2025</div>
                    </td>
                    <td>
                        <span class="status-badge status-rejected">Đã từ chối</span>
                    </td>
                    <td>
                        <div class="row flex">
                            <div class="col-6">
                                <span class="badge-verified">Xử lý</span>
                            </div>
                            <div class="col-6">
                                <span class="badge-reject">Từ chối</span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="reporter">
                            <img src="img/default-avatar.jpg" alt="Phạm Văn D" class="reporter-avatar">
                            Phạm Văn D
                        </div>
                    </td>
                    <td>
                        <div class="report-content">
                            Vi phạm bản quyền trong thiết kế đã cung cấp, sử dụng hình ảnh không được phép mà không thông báo cho khách hàng.
                        </div>
                    </td>
                    <td>
                        <span class="criteria" data-tooltip="Vi phạm quyền sở hữu trí tuệ, sử dụng nội dung có bản quyền không được phép hoặc không đúng quy định">Vi phạm bản quyền</span>
                    </td>
                    <td>
                        <div class="report-date">20/02/2025</div>
                    </td>
                    <td>
                        <span class="status-badge status-rejected">Đã từ chối</span>
                    </td>
                    <td>
                        <div class="row flex">
                            <div class="col-6">
                                <span class="badge-verified">Xử lý</span>
                            </div>
                            <div class="col-6">
                                <span class="badge-reject">Từ chối</span>
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="show-more-container">
                <button class="show-more-btn">Xem tất cả báo cáo</button>
            </div>
        </div>
    </div>
</div>


</body>
</html>