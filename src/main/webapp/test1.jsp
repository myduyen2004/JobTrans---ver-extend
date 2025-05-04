<%-- Document : favoriteListJob Created on : Mar 2, 2025, 4:13:55 PM Author : qn407 --%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Projects &#8211; ProLancer</title>
  <meta name='robots' content='max-image-preview:large' />
  <style id="prolancer_opt-dynamic-css" title="dynamic-css" class="redux-options-output">
    :root {
      --primary-color: #4a6def;
      --secondary-color: #f5f7ff;
      --text-color: #333;
      --border-color: #ddd;
      --success-color: #28a745;
      --warning-color: #ffc107;
      --danger-color: #dc3545;
      --info-color: #17a2b8;
    }

    body {
      font-family: 'Inter', sans-serif;
      line-height: 1.6;
      color: var(--text-color);
      margin: 0;
      padding: 0;
      background-color: #f8f9fa;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }

    .contract-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
      padding-bottom: 15px;
      border-bottom: 1px solid var(--border-color);
    }

    .contract-title {
      font-size: 24px;
      font-weight: bold;
    }

    .contract-status {
      padding: 8px 16px;
      border-radius: 20px;
      font-weight: 500;
      font-size: 14px;
    }

    .status-pending {
      background-color: var(--warning-color);
      color: #856404;
    }

    .status-completed {
      background-color: var(--success-color);
      color: white;
    }

    .contract-progress {
      display: flex;
      justify-content: space-between;
      margin-bottom: 40px;
    }

    .progress-step {
      flex: 1;
      text-align: center;
      position: relative;
    }

    .progress-step:not(:last-child):after {
      content: '';
      position: absolute;
      top: 15px;
      left: 60%;
      width: 80%;
      height: 2px;
      background-color: var(--border-color);
      z-index: 1;
    }

    .progress-step.active:not(:last-child):after,
    .progress-step.completed:not(:last-child):after {
      background-color: var(--success-color);
    }

    .step-number {
      display: inline-block;
      width: 30px;
      height: 30px;
      line-height: 30px;
      border-radius: 50%;
      background-color: var(--secondary-color);
      color: var(--text-color);
      font-weight: bold;
      margin-bottom: 10px;
      position: relative;
      z-index: 2;
    }

    .progress-step.active .step-number {
      background-color: var(--primary-color);
      color: white;
    }

    .progress-step.completed .step-number {
      background-color: var(--success-color);
      color: white;
    }

    .step-label {
      font-size: 14px;
      color: var(--text-color);
    }

    .contract-body {
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      padding: 30px;
      margin-bottom: 30px;
    }

    .contract-section {
      margin-bottom: 30px;
    }

    .section-title {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 15px;
      color: var(--primary-color);
    }

    .completion-message {
      text-align: center;
      padding: 40px 20px;
    }

    .success-icon {
      font-size: 72px;
      color: var(--success-color);
      margin-bottom: 20px;
    }

    .completion-message h3 {
      font-size: 24px;
      margin-bottom: 20px;
    }

    .completion-message p {
      font-size: 16px;
      margin-bottom: 10px;
    }

    .completion-actions {
      display: flex;
      justify-content: center;
      gap: 20px;
      margin-top: 40px;
    }

    .btn {
      display: inline-block;
      padding: 10px 20px;
      background-color: var(--primary-color);
      color: white;
      border: none;
      border-radius: 4px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s;
      text-decoration: none;
    }

    .btn:hover {
      background-color: #3a56c5;
    }

    .btn-outline {
      background-color: transparent;
      border: 1px solid var(--primary-color);
      color: var(--primary-color);
    }

    .btn-outline:hover {
      background-color: var(--secondary-color);
    }

    .btn i {
      margin-right: 8px;
    }

    .contract-details {
      margin-top: 40px;
      border-top: 1px solid var(--border-color);
      padding-top: 30px;
    }

    .details-title {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .details-grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 20px;
    }

    .detail-card {
      background-color: var(--secondary-color);
      padding: 20px;
      border-radius: 8px;
    }

    .detail-card h4 {
      margin-top: 0;
      margin-bottom: 15px;
      color: var(--primary-color);
    }

    .detail-item {
      display: flex;
      justify-content: space-between;
      margin-bottom: 10px;
    }

    .detail-item:last-child {
      margin-bottom: 0;
    }

    .detail-label {
      font-weight: 500;
    }

    .signature-preview {
      margin-top: 30px;
      display: flex;
      justify-content: space-between;
    }

    .signature-box {
      width: 48%;
      padding: 15px;
      border: 1px solid var(--border-color);
      border-radius: 4px;
    }

    .signature-box h4 {
      margin-top: 0;
      margin-bottom: 10px;
      font-size: 16px;
    }

    .signature-image {
      width: 100%;
      height: 100px;
      background-color: var(--secondary-color);
      display: flex;
      align-items: center;
      justify-content: center;
      font-style: italic;
      color: #666;
    }

    .next-steps {
      margin-top: 40px;
      background-color: var(--secondary-color);
      padding: 20px;
      border-radius: 8px;
    }

    .next-steps h3 {
      margin-top: 0;
      margin-bottom: 15px;
    }

    .steps-list {
      list-style-type: none;
      padding: 0;
    }

    .steps-list li {
      margin-bottom: 10px;
      padding-left: 25px;
      position: relative;
    }

    .steps-list li:before {
      content: '\f058';
      font-family: 'Font Awesome 5 Free';
      font-weight: 900;
      position: absolute;
      left: 0;
      color: var(--success-color);
    }



  </style>
</head>

<body>
<div class="row main-content" id="mainContent">
  <section class="section-padding">
    <div class="container">
      <div class="justify-content-center" style="position: relative;">

        <main class="container">
          <div class="contract-header">
            <div class="contract-title">Hợp Đồng Dịch Vụ Freelance</div>
            <div class="contract-status status-completed">Đã hoàn thành</div>
          </div>

          <div class="contract-progress">
            <div class="progress-step completed">
              <div class="step-number">1</div>
              <div class="step-label">Thông tin dự án</div>
            </div>
            <div class="progress-step completed">
              <div class="step-number">2</div>
              <div class="step-label">Điều khoản</div>
            </div>
            <div class="progress-step completed">
              <div class="step-number">3</div>
              <div class="step-label">Ký kết</div>
            </div>
            <div class="progress-step completed">
              <div class="step-number">4</div>
              <div class="step-label">Hoàn thành</div>
            </div>
          </div>

          <div class="contract-body">
            <div class="contract-section">
              <div class="completion-message">
                <div class="success-icon">
                  <i class="fas fa-check-circle"></i>
                </div>
                <h3>Hợp đồng đã được ký kết thành công!</h3>
                <p>Mã hợp đồng: <strong>CON-2025-0001</strong></p>
                <p>Ngày ký: <strong>14/03/2025</strong></p>
                <p>Bản hợp đồng đã ký đã được gửi qua email cho cả hai bên.</p>

                <div class="completion-actions">
                  <a href="#" class="btn btn-outline">
                    <i class="fas fa-download"></i> Tải hợp đồng (PDF)
                  </a>
                  <a href="#" class="btn">
                    <i class="fas fa-home"></i> Về trang quản lý
                  </a>
                </div>
              </div>
            </div>

            <div class="contract-details">
              <div class="details-title">Chi tiết hợp đồng</div>
              <div class="details-grid">
                <div class="detail-card">
                  <h4>Thông tin dự án</h4>
                  <div class="detail-item">
                    <span class="detail-label">Tên dự án:</span>
                    <span>Thiết kế Website Công ty TNHH ABC</span>
                  </div>
                  <div class="detail-item">
                    <span class="detail-label">Loại dự án:</span>
                    <span>Thiết kế web</span>
                  </div>
                  <div class="detail-item">
                    <span class="detail-label">Ngày bắt đầu:</span>
                    <span>20/03/2025</span>
                  </div>
                  <div class="detail-item">
                    <span class="detail-label">Ngày kết thúc:</span>
                    <span>20/06/2025</span>
                  </div>
                </div>

                <div class="detail-card">
                  <h4>Thông tin thanh toán</h4>
                  <div class="detail-item">
                    <span class="detail-label">Giá trị hợp đồng:</span>
                    <span>45.000.000 VNĐ</span>
                  </div>
                  <div class="detail-item">
                    <span class="detail-label">Phương thức:</span>
                    <span>Thanh toán theo giai đoạn</span>
                  </div>
                  <div class="detail-item">
                    <span class="detail-label">Đặt cọc:</span>
                    <span>15.000.000 VNĐ (30%)</span>
                  </div>
                  <div class="detail-item">
                    <span class="detail-label">Thanh toán cuối:</span>
                    <span>30.000.000 VNĐ (70%)</span>
                  </div>
                </div>

                <div class="detail-card">
                  <h4>Thông tin khách hàng</h4>
                  <div class="detail-item">
                    <span class="detail-label">Tên công ty:</span>
                    <span>Công ty TNHH ABC</span>
                  </div>
                  <div class="detail-item">
                    <span class="detail-label">Người đại diện:</span>
                    <span>Nguyễn Văn A</span>
                  </div>
                  <div class="detail-item">
                    <span class="detail-label">Email:</span>
                    <span>nguyenvana@abc.com.vn</span>
                  </div>
                  <div class="detail-item">
                    <span class="detail-label">Số điện thoại:</span>
                    <span>098 765 4321</span>
                  </div>
                </div>

                <div class="detail-card">
                  <h4>Thông tin freelancer</h4>
                  <div class="detail-item">
                    <span class="detail-label">Tên freelancer:</span>
                    <span>Trần Thị B</span>
                  </div>
                  <div class="detail-item">
                    <span class="detail-label">Chuyên môn:</span>
                    <span>Thiết kế và phát triển web</span>
                  </div>
                  <div class="detail-item">
                    <span class="detail-label">Email:</span>
                    <span>tranthib@gmail.com</span>
                  </div>
                  <div class="detail-item">
                    <span class="detail-label">Số điện thoại:</span>
                    <span>091 234 5678</span>
                  </div>
                </div>
              </div>

              <div class="signature-preview">
                <div class="signature-box">
                  <h4>Chữ ký khách hàng</h4>
                  <div class="signature-image">
                    <img src="/api/placeholder/200/100" alt="Chữ ký Nguyễn Văn A" />
                  </div>
                  <p>Nguyễn Văn A</p>
                  <p>Ngày ký: 14/03/2025</p>
                </div>
                <div class="signature-box">
                  <h4>Chữ ký freelancer</h4>
                  <div class="signature-image">
                    <img src="/api/placeholder/200/100" alt="Chữ ký Trần Thị B" />
                  </div>
                  <p>Trần Thị B</p>
                  <p>Ngày ký: 14/03/2025</p>
                </div>
              </div>

              <div class="next-steps">
                <h3>Các bước tiếp theo</h3>
                <ul class="steps-list">
                  <li>Lịch hẹn khởi động dự án sẽ được gửi qua email trong vòng 24 giờ tới
                  </li>
                  <li>Thanh toán đặt cọc sẽ được xử lý trong vòng 48 giờ</li>
                  <li>Theo dõi tiến độ dự án tại trang quản lý của bạn</li>
                  <li>Liên hệ với đối tác của bạn thông qua hệ thống tin nhắn của chúng
                    tôi</li>
                </ul>
              </div>
            </div>

          </div>
        </main>
      </div>
    </div>
  </section>
</div>
</body>
</html>
