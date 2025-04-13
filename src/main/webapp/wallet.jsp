<%--
    Document   : wallet
    Created on : Mar 4, 2025, 10:23:59 AM
    Author     : qn407
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobTrans - Trang Cá Nhân</title>
    <link rel="stylesheet" href="css/wallet.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Inter', sans-serif;
        }

        .main-content {
            max-width: 1440px;
            margin: 2rem auto;
            padding: 0 15px;
        }

        .profile-section {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .profile-avatar {
            width: 100px;
            height: 100px;
            border-radius: 15px;
            object-fit: cover;
        }

        .rating {
            color: #FFDB5B;
            font-size: 1.25rem;
        }

        .social-icon {
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 4px;
            color: white;
        }

        .linkedin {
            background-color: #0077B5;
        }

        .stat-group {
            padding-left: 1.5rem;
            border-left: 1px solid #dee2e6;
        }

        .stat-group:first-child {
            border-left: none;
            padding-left: 0;
        }

        .account-balance {
            background: linear-gradient(to bottom right, rgba(103, 135, 254, 0.1), rgb(15, 27, 99, 0.1));
            border-radius: 15px;
            border: 1px solid #6584fa;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 0.125rem 0.25rem rgba(103, 135, 254, 0.2);
        }

        .btn-deposit {
            background-color: #6584fa;
            border-color: #6584fa;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-deposit:hover {
            background-color: rgb(15, 27, 99);
            border-color: rgb(15, 27, 99);
        }

        .btn-withdraw {
            background-color: rgba(103, 135, 254, 0.1);
            border-color: #6584fa;
            color: #6584fa;
            transition: all 0.3s ease;
        }

        .btn-withdraw:hover {
            background-color: rgba(103, 135, 254, 0.2);
            color: rgb(15, 27, 99);
        }

        /* Adding a subtle glow to the Coin amount */
        .account-balance .h4 {
            color: #6584fa;
            font-weight: bold;
        }

        /* Match icons to the color scheme */
        .account-balance i.fas {
            color: #6584fa;
        }
        .transactions {
            background-color: white;
            border-radius: 15px;
            border: 1px solid #dee2e6;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }

        .btn-deposit {
            background-color: #6584fa;
            border-color: #6584fa;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-deposit:hover {
            background-color: rgb(15, 27, 99);
            border-color: rgb(15, 27, 99);
        }

        .input-group-text {
            background-color: #6584fa;
            color: white;
            border-color: #6584fa;
        }

        .table-responsive {
            border-radius: 10px;
            overflow: hidden;
        }

        .table {
            margin-bottom: 0;
        }

        .table th {
            font-weight: 600;
            background-color: #f8f9fa;
        }

        .page-link {
            color: #6584fa;
        }

        .page-item.active .page-link {
            background-color: #6584fa;
            border-color: #6584fa;
        }

        .badge.bg-deposit {
            background-color: #6584fa !important;
        }

        .badge.bg-withdraw {
            background-color: #ffc107 !important;
        }

        .badge.bg-success-status {
            background-color: #198754 !important;
        }

        .badge.bg-failed-status {
            background-color: #dc3545 !important;
        }

        .table-hover tbody tr:hover {
            background-color: rgba(103, 135, 254, 0.05);
        }

        #noResults {
            display: none;
            text-align: center;
            padding: 20px;
            color: #6c757d;
        }
    </style>
</head>

<body>
<%@include file="includes/header-03.jsp"%>
<%@include file="includes/sidebar.jsp"%>

<div class="content" id="content">
<div class="main-content">
    <!-- Profile Section -->
    <div class="profile-section">
        <div class="row align-items-center">
            <div class="col-md-8">
                <div class="d-flex align-items-center">
                    <img class="profile-avatar me-4" src="img/home/user-demo.jpg" alt="Nguyễn Văn User">
                    <div>
                        <h2 class="mb-2">Nguyễn Văn User</h2>
                        <div class="rating mb-2">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="social-icons">
                            <a href="#" class="social-icon linkedin">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="d-flex justify-content-md-end mt-3 mt-md-0">
                    <div class="row">
                            <div class="stat-label text-muted">Số điểm:</div>
                            <div class="stat-value"><i class="fas fa-medal me-1"></i>1735 điểm</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Account Balance Section -->
    <div class="account-balance">
        <div class="row align-items-center">
            <div class="col-md-8">
                <h3 class="fw-bold mb-3"><i class="fas fa-wallet me-2"></i>Số dư tài khoản:</h3>
                <div class="d-flex align-items-center">
                    <span class="h4 mb-0">100.000</span>
                    <span class="ms-2 text-muted">Coin</span>
                </div>
            </div>
            <div class="col-md-4 text-md-end mt-3 mt-md-0">
                <button class="btn btn-deposit btn-lg me-2">
                    <i class="fas fa-plus-circle me-2"></i>Nạp
                </button>
                <button class="btn btn-withdraw btn-lg">
                    <i class="fas fa-minus-circle me-2"></i>Rút
                </button>
            </div>
        </div>
    </div>

    <!-- Transactions Section -->

        <!-- Filter Section -->
    <div class="transactions">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="fw-bold"><i class="fas fa-history me-2"></i>Giao dịch</h3>
            <div>
                <button id="resetFilters" class="btn btn-outline-secondary">
                    <i class="fas fa-redo-alt me-2"></i>Đặt lại bộ lọc
                </button>
            </div>
        </div>

        <!-- Filter Section -->
        <div class="row g-3 mb-4">
            <div class="col-md-2 col-sm-6">
                <div class="form-group">
                    <label class="form-label">Từ ngày</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                        <input type="date" id="fromDate" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-md-2 col-sm-6">
                <div class="form-group">
                    <label class="form-label">Đến ngày</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                        <input type="date" id="toDate" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-md-2 col-sm-6">
                <div class="form-group">
                    <label class="form-label">Hình thức</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-exchange-alt"></i></span>
                        <select id="transactionType" class="form-select">
                            <option value="">Tất cả</option>
                            <option value="nap">Nạp tiền</option>
                            <option value="rut">Rút tiền</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="form-group">
                    <label class="form-label">Trạng thái</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-check-circle"></i></span>
                        <select id="status" class="form-select">
                            <option value="">Tất cả</option>
                            <option value="success">Thành công</option>
                            <option value="failed">Thất bại</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 d-flex align-items-end">
                <button id="filterBtn" class="btn btn-deposit">
                    <i class="fas fa-filter me-2"></i>Lọc
                </button>
            </div>
        </div>

        <!-- Transaction Table -->
        <div class="table-responsive">
            <table id="transactionTable" class="table table-hover">
                <thead class="table-light">
                <tr>
                    <th><i class="far fa-clock me-2"></i>Giờ</th>
                    <th><i class="fas fa-coins me-2"></i>Số tiền</th>
                    <th><i class="fas fa-exchange-alt me-2"></i>Hình thức</th>
                    <th><i class="fas fa-info-circle me-2"></i>Trạng thái</th>
                    <th><i class="fas fa-comment-alt me-2"></i>Nội dung</th>
                </tr>
                </thead>
                <tbody id="transactionBody">
                <!-- Dữ liệu giao dịch được hiển thị trực tiếp -->
                <tr>
                    <td>16:00:41 15/01/2025</td>
                    <td>500.000</td>
                    <td><span class="badge bg-deposit"><i class="fas fa-plus-circle me-1"></i>Nạp tiền</span></td>
                    <td><span class="badge bg-success-status"><i class="fas fa-check-circle me-1"></i>Thành công</span></td>
                    <td>Nạp tiền vào JobTrans</td>
                </tr>
                <tr>
                    <td>20:56:23 15/01/2025</td>
                    <td>200.000</td>
                    <td><span class="badge bg-withdraw"><i class="fas fa-minus-circle me-1"></i>Rút tiền</span></td>
                    <td><span class="badge bg-failed-status"><i class="fas fa-times-circle me-1"></i>Thất bại</span></td>
                    <td>Rút tiền vào ví cá nhân</td>
                </tr>
                <tr>
                    <td>21:01:36 15/01/2025</td>
                    <td>200.000</td>
                    <td><span class="badge bg-withdraw"><i class="fas fa-minus-circle me-1"></i>Rút tiền</span></td>
                    <td><span class="badge bg-success-status"><i class="fas fa-check-circle me-1"></i>Thành công</span></td>
                    <td>Rút tiền vào ví cá nhân</td>
                </tr>
                <tr>
                    <td>08:30:15 16/01/2025</td>
                    <td>300.000</td>
                    <td><span class="badge bg-deposit"><i class="fas fa-plus-circle me-1"></i>Nạp tiền</span></td>
                    <td><span class="badge bg-success-status"><i class="fas fa-check-circle me-1"></i>Thành công</span></td>
                    <td>Nạp tiền từ thẻ ngân hàng</td>
                </tr>
                <tr>
                    <td>14:22:50 16/01/2025</td>
                    <td>150.000</td>
                    <td><span class="badge bg-withdraw"><i class="fas fa-minus-circle me-1"></i>Rút tiền</span></td>
                    <td><span class="badge bg-success-status"><i class="fas fa-check-circle me-1"></i>Thành công</span></td>
                    <td>Rút tiền vào ví MoMo</td>
                </tr>
                </tbody>
            </table>
            <div id="noResults">
                <i class="fas fa-search me-2"></i>Không tìm thấy giao dịch nào phù hợp với bộ lọc
            </div>
        </div>

        <!-- Pagination -->
        <nav class="mt-4">
            <ul id="pagination" class="pagination justify-content-center">
                <!-- Phân trang được hiển thị trực tiếp -->
                <li class="page-item disabled">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true"><i class="fas fa-chevron-left"></i></span>
                    </a>
                </li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true"><i class="fas fa-chevron-right"></i></span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    </div>

</div>
<script>
    // Giữ lại một số chức năng JavaScript cơ bản để xử lý các tương tác
    document.addEventListener('DOMContentLoaded', function() {
        const fromDateInput = document.getElementById('fromDate');
        const toDateInput = document.getElementById('toDate');
        const typeSelect = document.getElementById('transactionType');
        const statusSelect = document.getElementById('status');
        const filterBtn = document.getElementById('filterBtn');
        const resetBtn = document.getElementById('resetFilters');

        // Xử lý nút đặt lại bộ lọc
        resetBtn.addEventListener('click', function() {
            fromDateInput.value = '';
            toDateInput.value = '';
            typeSelect.value = '';
            statusSelect.value = '';
            // Trong thực tế, bạn sẽ cần thêm mã để làm mới bảng dữ liệu
        });

        // Xử lý nút lọc
        filterBtn.addEventListener('click', function() {
            // Trong thực tế, bạn sẽ cần thêm mã để lọc dữ liệu
            // Hiện tại chỉ hiển thị thông báo để minh họa
            alert('Chức năng lọc sẽ được triển khai ở phía máy chủ');
        });

        // Xử lý phân trang
        const pageLinks = document.querySelectorAll('.page-link');
        pageLinks.forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                // Trong thực tế, bạn sẽ cần thêm mã để chuyển trang
            });
        });
        // Xử lý responsive cho sidebar trên màn hình nhỏ
        function checkScreenSize() {
            if (window.innerWidth < 768) {
                sidebar.classList.add('sidebar-collapsed');
                content.classList.add('content-expanded');
                toggleBtn.classList.remove('toggle-btn-shifted');
            } else {
                sidebar.classList.remove('sidebar-collapsed');
                content.classList.remove('content-expanded');
                toggleBtn.classList.add('toggle-btn-shifted');
            }
        }

        // Kiểm tra kích thước màn hình khi tải trang
        checkScreenSize();

        // Kiểm tra kích thước màn hình khi thay đổi kích thước cửa sổ
        window.addEventListener('resize', checkScreenSize);
    });
</script>


</body>
</html>