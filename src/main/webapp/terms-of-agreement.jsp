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
            background-color: var(--warning-color);
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
            background-color: var(--success-color);
            z-index: 1;
        }
        
        .progress-step.active:not(:last-child):after {
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
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
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
            padding: 10px;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            font-size: 16px;
            margin: 10px 0;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(74, 109, 239, 0.2);
        }
        
        .contract-terms {
            height: 600px;
            overflow-y: auto;
            padding: 15px;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            margin-bottom: 20px;
        }
        
        .contract-parties {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        
        .party-info {
            flex: 1;
            padding: 20px;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            margin-right: 20px;
        }
        
        .party-info:last-child {
            margin-right: 0;
        }
        
        .signature-area {
            border: 1px dashed var(--border-color);
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
            border-radius: 4px;
        }
        
        .signature-pad {
            width: 100%;
            height: 150px;
            background-color: var(--secondary-color);
            border-radius: 4px;
            margin-bottom: 15px;
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
        
        .contract-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        
        .contract-summary {
            background-color: var(--secondary-color);
            padding: 20px;
            border-radius: 4px;
            margin-bottom: 30px;
        }
        
        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid var(--border-color);
        }
        
        .summary-item:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }
        
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
        }
        
        .modal-content {
            background-color: white;
            margin: 10% auto;
            padding: 20px;
            border-radius: 8px;
            width: 60%;
            max-width: 600px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }
        
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        
        .close:hover {
            color: black;
        }
        
        @media (max-width: 768px) {
            .contract-parties {
                flex-direction: column;
            }
            
            .party-info {
                margin-right: 0;
                margin-bottom: 20px;
            }
            
            .contract-actions {
                flex-direction: column;
            }
            
            .btn {
                margin-bottom: 10px;
                width: 100%;
            }
            
            .modal-content {
                width: 90%;
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


                <section class="section-padding">
                    <div class="container">
                        <div class="justify-content-center" style="position: relative;">
                            <div class="contract-header">
                                <div class="contract-title">Hợp Đồng Dịch Vụ Freelance</div>
                                <div class="contract-status">Đang chờ ký kết</div>
                            </div>
                            
                            <div class="contract-progress">
                                <div class="progress-step completed">
                                    <div class="step-number">1</div>
                                    <div class="step-label">Thông tin dự án</div>
                                </div>
                                <div class="progress-step active">
                                    <div class="step-number">2</div>
                                    <div class="step-label">Điều khoản</div>
                                </div>
                                <div class="progress-step">
                                    <div class="step-number">3</div>
                                    <div class="step-label">Ký kết</div>
                                </div>
                                <div class="progress-step">
                                    <div class="step-number">4</div>
                                    <div class="step-label">Hoàn thành</div>
                                </div>
                            </div>
                            
                            <div class="contract-body">
                                <!-- Phần Thỏa thuận điều khoản -->
                                <div class="contract-section" id="negotiation-section">
                                    <div class="section-title">Thỏa thuận điều khoản</div>
                                    <div class="negotiation-area">
                                        <div class="alert alert-info">
                                            <p><i class="fas fa-info-circle"></i> Đây là khu vực để hai bên thảo luận và thống nhất các điều khoản trước khi tạo hợp đồng chính thức. Sau khi thỏa thuận xong, các điều khoản sẽ được điền vào mẫu hợp đồng.</p>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="form-label">Tiền cọc của Bên A</label>
                                            <input type="text" class="form-control" id="money-number-A" placeholder="Bằng số">
                                            <input type="text" class="form-control" id="money-letter-A" placeholder="Bằng chữ">
                                        </div>

                                        <div class="form-group">
                                            <label class="form-label">Tiền cọc của Bên B</label>
                                            <input type="text" class="form-control" id="money-number-B" placeholder="Bằng số">
                                            <input type="text" class="form-control" id="money-letter-B" placeholder="Bằng chữ">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="form-label">Yêu cầu về chất lượng công việc</label>
                                            <textarea class="form-control" id="project-description" rows="3" placeholder="Yêu cầu chi tiết về chất lượng công việc"></textarea>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="form-label">Thời hạn dự án</label>
                                            <div class="date-range">
                                                <input type="date" class="form-control" id="start-date">
                                                <span class="date-separator" >Đến</span>
                                                <input type="date" class="form-control" id="end-date">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="form-label">Giá trị hợp đồng (VNĐ)</label>
                                            <input type="number" class="form-control" id="contract-value" placeholder="Nhập giá trị hợp đồng">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="form-label">Phương thức thanh toán</label>
                                            <div id="payment-terms">
                                                <div class="payment-term">
                                                    <input type="number" class="form-control payment-percent" placeholder="%" min="1" max="100">
                                                    <span>% sau khi</span>
                                                    <input type="text" class="form-control payment-condition" placeholder="điều kiện thanh toán">
                                                    <button class="btn btn-sm btn-outline add-payment-term"><i class="fas fa-plus"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="form-label">Quyền sở hữu trí tuệ</label>
                                            <select class="form-control" id="intellectual-property">
                                                <option value="employer">Bên thuê sở hữu toàn bộ</option>
                                                <option value="shared">Hai bên chia sẻ quyền sở hữu</option>
                                                <option value="custom">Tùy chỉnh (thêm chi tiết bên dưới)</option>
                                            </select>
                                            <textarea class="form-control mt-2" id="ip-details" rows="2" placeholder="Chi tiết về quyền sở hữu trí tuệ"></textarea>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="form-label">Thời gian bảo hành</label>
                                            <div class="input-group">
                                                <input type="number" class="form-control" id="warranty-period" placeholder="Số">
                                                <select class="form-control" id="warranty-unit">
                                                    <option value="days">Ngày</option>
                                                    <option value="weeks">Tuần</option>
                                                    <option value="months">Tháng</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="form-label">Điều khoản khác</label>
                                            <textarea class="form-control" id="additional-terms" rows="4" placeholder="Thêm các điều khoản khác cần thảo luận"></textarea>
                                        </div>
                                        
                                        <div class="negotiation-chat" style="margin-bottom: 40px;">
                                            <div class="section-subtitle">Thảo luận</div>
                                            <div class="chat-messages" id="negotiation-chat">
                                                <!-- Tin nhắn thảo luận sẽ xuất hiện ở đây -->
                                            </div>
                                            <div class="chat-input">
                                                <textarea class="form-control" id="chat-message" placeholder="Nhập tin nhắn thảo luận..."></textarea>
                                
                                            </div>
                                        </div>
                                        
                                        <div class="negotiation-actions" style="display: flex;justify-content: space-between;">
                                            <button class="btn btn-outline" id="save-draft">Lưu bản nháp</button>
                                            <button class="btn" id="generate-contract">Tạo hợp đồng từ thỏa thuận</button>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Phần Xem trước hợp đồng (sẽ hiển thị sau khi tạo từ thỏa thuận) -->
                                <div class="contract-section" id="preview-section" style="display: none;">
                                    <div class="section-title">Xem trước hợp đồng</div>
                                    <div class="contract-preview">
                                        <div class="alert alert-success">
                                            <p><i class="fas fa-check-circle"></i> Hợp đồng đã được tạo từ các điều khoản đã thỏa thuận. Vui lòng xem lại chi tiết trước khi ký kết.</p>
                                        </div>
                                        
                                        <div class="contract-summary">
                                            <div class="summary-item">
                                                <span>Tên dự án:</span>
                                                <span id="preview-project-name">Thiết kế website bán hàng</span>
                                            </div>
                                            <div class="summary-item">
                                                <span>Mô tả công việc:</span>
                                                <span id="preview-project-description">Thiết kế và phát triển website thương mại điện tử cho doanh nghiệp</span>
                                            </div>
                                            <div class="summary-item">
                                                <span>Thời hạn:</span>
                                                <span id="preview-project-duration">30 ngày (14/03/2025 - 13/04/2025)</span>
                                            </div>
                                            <div class="summary-item">
                                                <span>Giá trị hợp đồng:</span>
                                                <span id="preview-contract-value">15,000,000 VNĐ</span>
                                            </div>
                                        </div>
                                        
                                        <div class="contract-terms" id="preview-contract-terms">
                                            <!-- Nội dung hợp đồng được tạo từ thỏa thuận sẽ xuất hiện ở đây -->
                                        </div>
                                        
                                        <div class="preview-actions">
                                            <button class="btn btn-outline" id="edit-terms">Chỉnh sửa điều khoản</button>
                                            <button class="btn" id="approve-contract">Xác nhận và tiếp tục</button>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Phần thông tin các bên (hiển thị sau khi xác nhận điều khoản) -->
                                <div class="contract-section" id="parties-section" style="display: none;">
                                    <div class="section-title">Thông tin các bên</div>
                                    <div class="contract-parties">
                                        <div class="party-info">
                                            <h3>Bên thuê (Employer)</h3>
                                            <div class="form-group">
                                                <label class="form-label">Tên công ty/Cá nhân</label>
                                                <input type="text" class="form-control" id="employer-name">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Người đại diện</label>
                                                <input type="text" class="form-control" id="employer-representative">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Chức vụ</label>
                                                <input type="text" class="form-control" id="employer-position">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Địa chỉ</label>
                                                <input type="text" class="form-control" id="employer-address">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Email</label>
                                                <input type="email" class="form-control" id="employer-email">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Điện thoại</label>
                                                <input type="tel" class="form-control" id="employer-phone">
                                            </div>
                                        </div>
                                        <div class="party-info">
                                            <h3>Bên cung cấp dịch vụ (Freelancer)</h3>
                                            <div class="form-group">
                                                <label class="form-label">Họ tên</label>
                                                <input type="text" class="form-control" id="freelancer-name">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">CMND/CCCD</label>
                                                <input type="text" class="form-control" id="freelancer-id">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Địa chỉ</label>
                                                <input type="text" class="form-control" id="freelancer-address">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Email</label>
                                                <input type="email" class="form-control" id="freelancer-email">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Điện thoại</label>
                                                <input type="tel" class="form-control" id="freelancer-phone">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-actions">
                                        <button class="btn btn-outline" id="back-to-preview">Quay lại</button>
                                        <button class="btn" id="confirm-parties">Xác nhận thông tin</button>
                                    </div>
                                </div>
                                
                                <!-- Phần ký kết hợp đồng (hiển thị sau khi xác nhận thông tin các bên) -->
                                <div class="contract-section" id="signing-section" style="display: none;">
                                    <div class="section-title">Ký kết hợp đồng</div>
                                    <div class="final-contract" id="final-contract">
                                        <!-- Nội dung hợp đồng hoàn chỉnh sẽ xuất hiện ở đây -->
                                    </div>
                                    
                                    <div class="signature-areas">
                                        <div class="signature-area">
                                            <h3>Chữ ký Bên A (Employer)</h3>
                                            <div class="signature-pad" id="employer-signature"></div>
                                            <button class="btn btn-sm btn-outline" id="clear-employer-signature">Xóa chữ ký</button>
                                        </div>
                                        
                                        <div class="signature-area">
                                            <h3>Chữ ký Bên B (Freelancer)</h3>
                                            <div class="signature-pad" id="freelancer-signature"></div>
                                            <button class="btn btn-sm btn-outline" id="clear-freelancer-signature">Xóa chữ ký</button>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="form-label">
                                            <input type="checkbox" required id="terms-agreement"> Tôi đã đọc và đồng ý với các điều khoản của hợp đồng này
                                        </label>
                                    </div>
                                    
                                    <div class="contract-actions">
                                        <button class="btn btn-outline" id="back-to-parties">Quay lại</button>
                                        <button class="btn" id="finalize-contract">Hoàn tất ký kết hợp đồng</button>
                                    </div>
                                </div>
                                
                                <!-- Phần xác nhận hoàn tất (hiển thị sau khi ký kết thành công) -->
                                <div class="contract-section" id="completion-section" style="display: none;">
                                    <div class="section-title">Hoàn tất ký kết</div>
                                    <div class="completion-message">
                                        <div class="success-icon">
                                            <i class="fas fa-check-circle"></i>
                                        </div>
                                        <h3>Hợp đồng đã được ký kết thành công!</h3>
                                        <p>Mã hợp đồng: <strong id="contract-id">CON-2025-0001</strong></p>
                                        <p>Ngày ký: <strong id="signing-date">14/03/2025</strong></p>
                                        <p>Bản hợp đồng đã ký đã được gửi qua email cho cả hai bên.</p>
                                        
                                        <div class="completion-actions">
                                            <button class="btn btn-outline" id="download-contract">
                                                <i class="fas fa-download"></i> Tải hợp đồng (PDF)
                                            </button>
                                            <button class="btn" id="go-to-dashboard">
                                                <i class="fas fa-home"></i> Về trang quản lý
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <%@include file="includes/footer.jsp" %>
                    <!--======= Back to Top =======-->
                    <div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>


        </body>

        <!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

        </html>