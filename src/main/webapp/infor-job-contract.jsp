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
            <link rel="profile" href="https://gmpg.org/xfn/11">

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
                    font-family: 'Roboto', sans-serif;
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

                .form-section {
  margin-bottom: 30px;
  background-color: #fff;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.section-title {
  font-size: 18px;
  font-weight: 600;
  color: #333;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 1px solid #eaeaea;
}

.info-group {
  margin-bottom: 20px;
}

.info-label {
  font-size: 14px;
  font-weight: bold;
  color: #414141;
  margin-bottom: 8px;

}

.info-value {
  font-size: 16px;
  color: #333;
  line-height: 1.5;
  padding: 8px 0;
}

.form-row {
  display: flex;
  flex-wrap: wrap;
  margin: 0 -10px;
  margin-bottom: 15px;
}

.form-col {
  flex: 1;
  padding: 0 10px;
  min-width: 200px;
}

@media (max-width: 768px) {
  .form-row {
    flex-direction: column;
  }
  
  .form-col {
    width: 100%;
    margin-bottom: 15px;
  }

  .milestone-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 5px;
  }
  
  .milestone-amount {
    font-size: 14px;
  }
}

.milestone-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.milestone-item {
  border: 1px solid var(--border-color, #e0e0e0);
  border-radius: 4px;
  padding: 15px;
  background-color: #fff;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
  transition: all 0.2s ease;
}

.milestone-item:hover {
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.milestone-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.milestone-name {
  font-size: 16px;
  font-weight: 600;
  color: #333;
}

.milestone-amount {
  font-size: 16px;
  font-weight: 600;
  color: #1a73e8;
}

.milestone-description {
  font-size: 14px;
  color: #666;
  margin-bottom: 10px;
  line-height: 1.4;
}

.milestone-status {
  display: inline-block;
  padding: 4px 12px;
  border-radius: 16px;
  font-size: 12px;
  font-weight: 500;
  margin-top: 5px;
}

.milestone-status.completed {
  background-color: rgba(76, 175, 80, 0.1);
  color: #4caf50;
  border: 1px solid rgba(76, 175, 80, 0.2);
}

.milestone-status.active {
  background-color: rgba(33, 150, 243, 0.1);
  color: #2196f3;
  border: 1px solid rgba(33, 150, 243, 0.2);
}

.milestone-status.pending {
  background-color: rgba(158, 158, 158, 0.1);
  color: #757575;
  border: 1px solid rgba(158, 158, 158, 0.2);
}

                header {
                    background-color: white;
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
                    padding: 15px 0;
                    margin-bottom: 30px;
                }

                .header-content {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .logo {
                    font-size: 22px;
                    font-weight: bold;
                    color: var(--primary-color);
                }

                .nav-links {
                    display: flex;
                    gap: 20px;
                }

                .nav-link {
                    color: var(--text-color);
                    text-decoration: none;
                    font-weight: 500;
                }

                .nav-link:hover {
                    color: var(--primary-color);
                }

                .user-menu {
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .user-avatar {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    background-color: var(--secondary-color);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-weight: bold;
                    color: var(--primary-color);
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

                .status-draft {
                    background-color: var(--info-color);
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
                    background-color: var(--primary-color);
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

                .section-title {
                    font-size: 18px;
                    font-weight: bold;
                    margin-bottom: 20px;
                    color: var(--primary-color);
                }

                .form-section {
                    margin-bottom: 30px;
                    padding-bottom: 20px;
                    border-bottom: 1px solid var(--border-color);
                }

                .form-section:last-child {
                    border-bottom: none;
                }

                .form-group {
                    margin-bottom: 20px;
                }

                .form-group label {
                    display: block;
                    margin-bottom: 8px;
                    font-weight: 500;
                }

                .form-control {
                    width: 100%;
                    padding: 10px;
                    border: 1px solid var(--border-color);
                    border-radius: 4px;
                    font-size: 16px;
                }

                .form-control:focus {
                    outline: none;
                    border-color: var(--primary-color);
                    box-shadow: 0 0 0 2px rgba(74, 109, 239, 0.2);
                }

                textarea.form-control {
                    min-height: 120px;
                    resize: vertical;
                }

                .form-row {
                    display: flex;
                    gap: 20px;
                }

                .form-col {
                    flex: 1;
                }

                .checkbox-group {
                    margin-top: 10px;
                }

                .checkbox-item {
                    display: flex;
                    align-items: center;
                    margin-bottom: 10px;
                }

                .checkbox-item input[type="checkbox"] {
                    margin-right: 10px;
                }

                .btn-container {
                    display: flex;
                    justify-content: space-between;
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

                .form-hint {
                    font-size: 14px;
                    color: #666;
                    margin-top: 5px;
                }

                .skill-tags {
                    display: flex;
                    flex-wrap: wrap;
                    gap: 10px;
                    margin-top: 10px;
                }

                .skill-tag {
                    background-color: var(--secondary-color);
                    color: var(--primary-color);
                    padding: 5px 10px;
                    border-radius: 20px;
                    font-size: 14px;
                    display: flex;
                    align-items: center;
                }

                .skill-tag .remove-tag {
                    margin-left: 5px;
                    cursor: pointer;
                    font-size: 12px;
                }

                .file-upload {
                    border: 2px dashed var(--border-color);
                    padding: 20px;
                    text-align: center;
                    border-radius: 4px;
                    margin-top: 10px;
                    cursor: pointer;
                }

                .file-upload i {
                    font-size: 24px;
                    color: var(--primary-color);
                    margin-bottom: 10px;
                }

                .uploaded-files {
                    margin-top: 15px;
                }

                .file-item {
                    display: flex;
                    align-items: center;
                    background-color: var(--secondary-color);
                    padding: 8px 12px;
                    border-radius: 4px;
                    margin-bottom: 10px;
                }

                .file-item i {
                    margin-right: 10px;
                    color: var(--primary-color);
                }

                .file-item .file-name {
                    flex-grow: 1;
                }

                .file-item .remove-file {
                    cursor: pointer;
                    color: var(--danger-color);
                }

                footer {
                    background-color: #f8f9fa;
                    padding: 20px 0;
                    margin-top: 60px;
                    border-top: 1px solid var(--border-color);
                }

                .footer-content {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .footer-links {
                    display: flex;
                    gap: 20px;
                }

                .footer-link {
                    color: var(--text-color);
                    text-decoration: none;
                    font-size: 14px;
                }

                .footer-link:hover {
                    color: var(--primary-color);
                }

                .copyright {
                    font-size: 14px;
                    color: #666;
                }

                @media (max-width: 768px) {
                    .header-content {
                        flex-direction: column;
                        gap: 15px;
                    }

                    .nav-links {
                        flex-wrap: wrap;
                        justify-content: center;
                    }

                    .contract-progress {
                        flex-direction: column;
                        gap: 20px;
                    }

                    .progress-step:not(:last-child):after {
                        display: none;
                    }

                    .form-row {
                        flex-direction: column;
                        gap: 15px;
                    }

                    .btn-container {
                        flex-direction: column;
                        gap: 15px;
                    }

                    .btn {
                        width: 100%;
                        text-align: center;
                    }

                    .footer-content {
                        flex-direction: column;
                        gap: 20px;
                    }
                }
            </style>
        </head>

        <body
            class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">

            <!-- Preloading -->
            <div id="preloader">
                <div class="spinner">
                    <div class="uil-ripple-css">
                        <div></div>
                        <div></div>
                    </div>
                </div>
            </div>

            <%@include file="includes/header-01.jsp" %>

                <a class="skip-link screen-reader-text" href="#content">Skip to content</a>

                <section>
                    <div class="breadcrumbs">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 my-auto">
                                    <h1>
                                        Projects </h1>
                                    <ul class="trail-items" itemscope itemtype="http://schema.org/BreadcrumbList">
                                        <li class="trail-item trail-begin"><a href="../index.html"><span
                                                    itemprop="name">Home</span></a>
                                            <meta itemprop="position" content="1" />
                                        </li>
                                        <li class="trail-item trail-end"><span itemprop="item"><span
                                                    itemprop="name">Projects</span></span>
                                            <meta itemprop="position" content="2" />
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>

                <section >
                    <div class="container section-padding">
                        <div class="justify-content-center" style="position: relative;">
                
                            <main class="container">
                                <div class="contract-header">
                                    <div class="contract-title">Hợp Đồng Dịch Vụ Freelance</div>
                                    <div class="contract-status status-active">Đang thực hiện</div>
                                </div>
                
                                <div class="contract-progress">
                                    <div class="progress-step active">
                                        <div class="step-number">1</div>
                                        <div class="step-label">Thông tin dự án</div>
                                    </div>
                                    <div class="progress-step">
                                        <div class="step-number">2</div>
                                        <div class="step-label">Điều khoản</div>
                                    </div>
                                    <div class="progress-step">
                                        <div class="step-number">3</div>
                                        <div class="step-label">Ký kết</div>
                                    </div>
                                    <div class="progress-step ">
                                        <div class="step-number">4</div>
                                        <div class="step-label">Hoàn thành</div>
                                    </div>
                                </div>
                
                                <div class="contract-body">
                                    <div class="form-section">
                                        <div class="section-title">Thông tin cơ bản</div>
                                        <div class="info-group">    
                                            <div class="info-label">Tên dự án</div>
                                            <div class="info-value">Website thương mại điện tử ABC Store</div>
                                        </div>
                                        
                                        <div class="form-row">
                                            <div class="form-col">
                                                <div class="info-group">
                                                    <div class="info-label">Loại dự án</div>
                                                    <div class="info-value">Thiết kế website</div>
                                                </div>
                                            </div>
                                            <div class="form-col">
                                                <div class="info-group">
                                                    <div class="info-label">Danh mục</div>
                                                    <div class="info-value">Thương mại điện tử</div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="info-group">
                                            <div class="info-label">Mô tả dự án</div>
                                            <div class="info-value">Xây dựng website thương mại điện tử bán hàng trực tuyến với đầy đủ tính năng: danh mục sản phẩm, giỏ hàng, thanh toán trực tuyến, quản lý đơn hàng, tích hợp các cổng thanh toán và vận chuyển phổ biến tại Việt Nam. Website cần thiết kế responsive, tối ưu SEO và tích hợp các công cụ phân tích.</div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-section">
                                        <div class="section-title">Yêu cầu kỹ năng</div>
                                        <div class="info-group">
                                            <div class="info-label">Kỹ năng yêu cầu</div>
                                            <div class="skill-tags">
                                                <div class="skill-tag">HTML/CSS</div>
                                                <div class="skill-tag">JavaScript</div>
                                                <div class="skill-tag">Responsive Design</div>
                                                <div class="skill-tag">PHP</div>
                                                <div class="skill-tag">MySQL</div>
                                                <div class="skill-tag">WordPress/WooCommerce</div>
                                            </div>
                                        </div>
                                        
                                        <div class="info-group">
                                            <div class="info-label">Mức độ kinh nghiệm</div>
                                            <div class="info-value">Cao cấp (3-5 năm)</div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-section">
                                        <div class="section-title">Thời gian và ngân sách</div>
                                        
                                        <div class="form-row">
                                            <div class="form-col">
                                                <div class="info-group">
                                                    <div class="info-label">Ngày bắt đầu dự kiến</div>
                                                    <div class="info-value">01/04/2025</div>
                                                </div>
                                            </div>
                                            <div class="form-col">
                                                <div class="info-group">
                                                    <div class="info-label">Ngày kết thúc dự kiến</div>
                                                    <div class="info-value">30/06/2025</div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-row">
                                            <div class="form-col">
                                                <div class="info-group">
                                                    <div class="info-label">Ngân sách</div>
                                                    <div class="info-value">45,000,000 VNĐ</div>
                                                </div>
                                            </div>
                                            <div class="form-col">
                                                <div class="info-group">
                                                    <div class="info-label">Hình thức thanh toán</div>
                                                    <div class="info-value">Trả theo giai đoạn</div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="info-group">
                                            <div class="info-label">Các giai đoạn thanh toán</div>
                                            <div class="milestone-list">
                                                <div class="milestone-item" style="border: 1px solid var(--border-color); border-radius: 4px; padding: 15px; margin-bottom: 15px;">
                                                    <div class="milestone-header">
                                                        <div class="milestone-name">Đặt cọc</div>
                                                        <div class="milestone-amount">15,000,000 VNĐ</div>
                                                    </div>
                                                    <div class="milestone-description">Thanh toán trước khi bắt đầu dự án</div>
                                                    <div class="milestone-status completed">Đã thanh toán</div>
                                                </div>
                            
                                                <div class="milestone-item" style="border: 1px solid var(--border-color); border-radius: 4px; padding: 15px; margin-bottom: 15px;">
                                                    <div class="milestone-header">
                                                        <div class="milestone-name">Bàn giao giao diện</div>
                                                        <div class="milestone-amount">15,000,000 VNĐ</div>
                                                    </div>
                                                    <div class="milestone-description">Sau khi hoàn thành và duyệt giao diện</div>
                                                    <div class="milestone-status active">Đang thực hiện</div>
                                                </div>
                
                                                <div class="milestone-item" style="border: 1px solid var(--border-color); border-radius: 4px; padding: 15px; margin-bottom: 15px;">
                                                    <div class="milestone-header">
                                                        <div class="milestone-name">Bàn giao hoàn thiện</div>
                                                        <div class="milestone-amount">15,000,000 VNĐ</div>
                                                    </div>
                                                    <div class="milestone-description">Sau khi hoàn thành toàn bộ chức năng và test</div>
                                                    <div class="milestone-status pending">Chưa bắt đầu</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-section">
                                        <div class="section-title">Tài liệu đính kèm</div>
                                        <div class="info-group">
                                            <div class="info-label">Tài liệu liên quan</div>
                                            <div class="uploaded-files">
                                                <div class="file-item">
                                                    <i class="fas fa-file-pdf"></i>
                                                    <span class="file-name">mau-thiet-ke-website.pdf</span>
                                                    <span class="download-file"><i class="fas fa-download"></i></span>
                                                </div>
                                                <div class="file-item">
                                                    <i class="fas fa-file-word"></i>
                                                    <span class="file-name">yeu-cau-chi-tiet.docx</span>
                                                    <span class="download-file"><i class="fas fa-download"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-section">
                                        <div class="section-title">Thông tin khách hàng</div>
                                        <div class="form-row">
                                            <div class="form-col">
                                                <div class="info-group">
                                                    <div class="info-label">Tên công ty</div>
                                                    <div class="info-value">Công ty TNHH Thương mại ABC</div>
                                                </div>
                                            </div>
                                            <div class="form-col">
                                                <div class="info-group">
                                                    <div class="info-label">Người đại diện</div>
                                                    <div class="info-value">Nguyễn Văn A</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-col">
                                                <div class="info-group">
                                                    <div class="info-label">Email</div>
                                                    <div class="info-value">contact@abcstore.vn</div>
                                                </div>
                                            </div>
                                            <div class="form-col">
                                                <div class="info-group">
                                                    <div class="info-label">Số điện thoại</div>
                                                    <div class="info-value">0912 345 678</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="info-group">
                                            <div class="info-label">Địa chỉ</div>
                                            <div class="info-value">123 Đường Lê Lợi, Phường Bến Nghé, Quận 1, TP. Hồ Chí Minh</div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-section">
                                        <div class="section-title">Điều khoản bổ sung</div>
                                        <div class="info-group">
                                            <div class="info-label">Các điều khoản khác</div>
                                            <div class="info-value">Freelancer đồng ý cung cấp dịch vụ hỗ trợ kỹ thuật trong thời gian 3 tháng sau khi bàn giao sản phẩm. Mọi thay đổi về yêu cầu trong quá trình thực hiện cần được thảo luận và đồng thuận từ cả hai bên. Freelancer có trách nhiệm đào tạo cơ bản cho nhân viên của khách hàng về cách sử dụng và quản trị website.</div>
                                        </div>
                                        <div class="info-group">
                                            <div class="info-label">Thỏa thuận bảo mật</div>
                                            <div class="info-value"><i class="fas fa-check-circle" style="color: var(--success-color);"></i> Dự án này yêu cầu ký thỏa thuận bảo mật (NDA)</div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-section">
                                        <div class="section-title">Trạng thái dự án</div>
                                        <div class="info-group">
                                            <div class="project-status">
                                                <div class="status-bar">
                                                    <div class="status-progress" style="width: 40%;"></div>
                                                </div>
                                                <div class="status-text">Đang thực hiện (40% hoàn thành)</div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="btn-container">
                                        <button type="button" class="btn btn-outline">Trở lại</button>
                                        <button type="button" class="btn">Cập nhật Điều khoản thỏa thuận</button>
                                    </div>
                                </div>
                            </main>
                        </div>
                    </div>
                </section>

            <%@include file="includes/footer.jsp" %>
                    <!--======= Back to Top =======-->
                    <div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

        </body>

        <!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

        </html>