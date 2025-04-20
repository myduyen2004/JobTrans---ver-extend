<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/20/2025
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh sách báo cáo | Tài khoản người dùng</title>
  <link rel="stylesheet" href="css/account-report-list.css">
</head>
<body>
<%@include file="includes/header-01.jsp"%>
<!-- Main Content -->
<div class="container my-4">
  <div class="row">
    <!-- Main Content -->
    <div class="col-lg-12" style="margin-left: 20px; margin-right: 20px">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h3 class="mb-0" style="color: white">Danh sách báo cáo</h3>
          <button class="btn btn-sm btn-light"><i class="fas fa-filter me-2"></i> Lọc</button>
        </div>
        <div class="card-body">
          <div class="search-box">
            <i class="fas fa-search"></i>
            <input type="text" class="form-control" placeholder="Tìm kiếm báo cáo...">
          </div>

          <ul class="nav nav-tabs mb-4" id="reportTabs" role="tablist">
            <li class="nav-item" role="presentation">
              <button class="nav-link active" id="created-tab" data-bs-toggle="tab" data-bs-target="#created" type="button" role="tab" aria-controls="created" aria-selected="true">
                <i class="fas fa-edit me-2"></i> Báo cáo đã tạo
              </button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="received-tab" data-bs-toggle="tab" data-bs-target="#received" type="button" role="tab" aria-controls="received" aria-selected="false">
                <i class="fas fa-inbox me-2"></i> Báo cáo nhận được
              </button>
            </li>
          </ul>

          <div class="tab-content" id="reportTabsContent">
            <!-- Báo cáo đã tạo -->
            <div class="tab-pane fade show active" id="created" role="tabpanel" aria-labelledby="created-tab">
              <h5 class="section-heading">Báo cáo đã tạo (8)</h5>

              <div class="report-item d-flex align-items-center">
                <div class="report-icon">
                  <i class="fas fa-chart-bar"></i>
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex justify-content-between align-items-start">
                    <h6 class="mb-1">Báo cáo doanh thu quý 1/2025</h6>
                    <span class="badge badge-status badge-completed">Hoàn thành</span>
                  </div>
                  <p class="text-muted mb-0 small">Cập nhật: 15/04/2025</p>
                </div>
              </div>

              <div class="report-item d-flex align-items-center">
                <div class="report-icon">
                  <i class="fas fa-file-invoice"></i>
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex justify-content-between align-items-start">
                    <h6 class="mb-1">Báo cáo chi phí vận hành tháng 3/2025</h6>
                    <span class="badge badge-status badge-processing">Đang xử lý</span>
                  </div>
                  <p class="text-muted mb-0 small">Cập nhật: 12/04/2025</p>
                </div>
              </div>

              <div class="report-item d-flex align-items-center">
                <div class="report-icon">
                  <i class="fas fa-tasks"></i>
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex justify-content-between align-items-start">
                    <h6 class="mb-1">Báo cáo tiến độ dự án ABC</h6>
                    <span class="badge badge-status badge-completed">Hoàn thành</span>
                  </div>
                  <p class="text-muted mb-0 small">Cập nhật: 10/04/2025</p>
                </div>
              </div>

              <div class="report-item d-flex align-items-center">
                <div class="report-icon">
                  <i class="fas fa-chart-line"></i>
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex justify-content-between align-items-start">
                    <h6 class="mb-1">Báo cáo phân tích thị trường</h6>
                    <span class="badge badge-status badge-completed">Hoàn thành</span>
                  </div>
                  <p class="text-muted mb-0 small">Cập nhật: 05/04/2025</p>
                </div>
              </div>

              <div class="report-item d-flex align-items-center">
                <div class="report-icon">
                  <i class="fas fa-user-friends"></i>
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex justify-content-between align-items-start">
                    <h6 class="mb-1">Báo cáo nhân sự quý 1/2025</h6>
                    <span class="badge badge-status badge-completed">Hoàn thành</span>
                  </div>
                  <p class="text-muted mb-0 small">Cập nhật: 28/03/2025</p>
                </div>
              </div>
            </div>

            <!-- Báo cáo nhận được -->
            <div class="tab-pane fade" id="received" role="tabpanel" aria-labelledby="received-tab">
              <h5 class="section-heading">Báo cáo nhận được (3)</h5>

              <div class="report-item d-flex align-items-center">
                <div class="report-icon">
                  <i class="fas fa-file-alt"></i>
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex justify-content-between align-items-start">
                    <h6 class="mb-1">Báo cáo hiệu suất nhóm IT</h6>
                    <span class="badge badge-status badge-new">Mới</span>
                  </div>
                  <p class="text-muted mb-0 small">Từ: Trần Văn B - 18/04/2025</p>
                </div>
              </div>

              <div class="report-item d-flex align-items-center">
                <div class="report-icon">
                  <i class="fas fa-bug"></i>
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex justify-content-between align-items-start">
                    <h6 class="mb-1">Báo cáo lỗi hệ thống tháng 3/2025</h6>
                    <span class="badge badge-status badge-processing">Đang xử lý</span>
                  </div>
                  <p class="text-muted mb-0 small">Từ: Lê Thị C - 10/04/2025</p>
                </div>
              </div>

              <div class="report-item d-flex align-items-center">
                <div class="report-icon">
                  <i class="fas fa-lightbulb"></i>
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex justify-content-between align-items-start">
                    <h6 class="mb-1">Báo cáo đề xuất cải tiến quy trình</h6>
                    <span class="badge badge-status badge-completed">Hoàn thành</span>
                  </div>
                  <p class="text-muted mb-0 small">Từ: Phạm Văn D - 02/04/2025</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Floating Action Button -->
<a href="#" class="floating-create-btn">
  <i class="fas fa-plus fa-lg"></i>
</a>
<%@include file="includes/footer.jsp"%>
<!-- Scripts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>