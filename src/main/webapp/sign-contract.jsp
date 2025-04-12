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

            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

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
                }

                .form-control:focus {
                    outline: none;
                    border-color: var(--primary-color);
                    box-shadow: 0 0 0 2px rgba(74, 109, 239, 0.2);
                }

                .contract-terms {
                    height: 800px;
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
                    background-color: rgba(0, 0, 0, 0.5);
                }

                .modal-content {
                    background-color: white;
                    margin: 10% auto;
                    padding: 20px;
                    border-radius: 8px;
                    width: 60%;
                    max-width: 600px;
                    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
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
                                <div class="progress-step completed">
                                    <div class="step-number">2</div>
                                    <div class="step-label">Điều khoản</div>
                                </div>
                                <div class="progress-step active">
                                    <div class="step-number">3</div>
                                    <div class="step-label">Ký kết</div>
                                </div>
                                <div class="progress-step">
                                    <div class="step-number">4</div>
                                    <div class="step-label">Hoàn thành</div>
                                </div>
                            </div>

                            <div class="contract-body">
                                <div class="contract-section">
                                    <div class="section-title">Tóm tắt hợp đồng</div>
                                    <div class="contract-summary">
                                        <div class="summary-item">
                                            <span>Tên dự án:</span>
                                            <span>Thiết kế website bán hàng</span>
                                        </div>
                                        <div class="summary-item">
                                            <span>Mô tả công việc:</span>
                                            <span>Thiết kế và phát triển website thương mại điện tử cho doanh
                                                nghiệp</span>
                                        </div>
                                        <div class="summary-item">
                                            <span>Thời hạn:</span>
                                            <span>30 ngày (14/03/2025 - 13/04/2025)</span>
                                        </div>
                                        <div class="summary-item">
                                            <span>Giá trị hợp đồng:</span>
                                            <span>15,000,000 VNĐ (1000 VNĐ tương đương 1000 Coins)</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="contract-section">
                                    <div class="section-title">Thông tin các bên</div>
                                    <div class="contract-parties">
                                        <div class="party-info">
                                            <h3>Bên thuê (Employer)</h3>
                                            <p><strong>Công ty:</strong> Công ty TNHH ABC</p>
                                            <p><strong>Đại diện:</strong> Nguyễn Văn A</p>
                                            <p><strong>Chức vụ:</strong> Giám đốc</p>
                                            <p><strong>Địa chỉ:</strong> 123 Đường Lê Lợi, Quận 1, TP. HCM</p>
                                            <p><strong>Email:</strong> contact@abc.com</p>
                                            <p><strong>Điện thoại:</strong> 0901234567</p>
                                        </div>
                                        <div class="party-info">
                                            <h3>Bên cung cấp dịch vụ (Freelancer)</h3>
                                            <p><strong>Họ tên:</strong> Trần Thị B</p>
                                            <p><strong>CMND/CCCD:</strong> 012345678</p>
                                            <p><strong>Địa chỉ:</strong> 456 Đường Nguyễn Huệ, Quận 3, TP. HCM</p>
                                            <p><strong>Email:</strong> tranthib@email.com</p>
                                            <p><strong>Điện thoại:</strong> 0909876543</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="contract-section">
                                    <div class="section-title">Điều khoản hợp đồng</div>
                                    <div class="contract-terms">
                                        <h3>HỢP ĐỒNG DỊCH VỤ FREELANCE</h3>
                                        <p>Hợp đồng này được lập vào ngày 14 tháng 3 năm 2025 giữa:</p>
                                        <p><strong>BÊN A (BÊN THUÊ):</strong> Công ty TNHH ABC</p>
                                        <p><strong>BÊN B (FREELANCER):</strong> Trần Thị B</p>

                                        <h4>ĐIỀU 1: NỘI DUNG CÔNG VIỆC</h4>
                                        <p>Bên B đồng ý cung cấp dịch vụ thiết kế và phát triển website thương mại điện
                                            tử cho Bên A theo các yêu cầu và thông số kỹ thuật đã được thống nhất trong
                                            phụ lục đính kèm hợp đồng này.</p>

                                        <h4>ĐIỀU 2: THỜI GIAN THỰC HIỆN</h4>
                                        <p>Thời gian thực hiện công việc là 30 ngày, bắt đầu từ ngày 14/03/2025 và kết
                                            thúc vào ngày 13/04/2025.</p>

                                        <h4>ĐIỀU 3: GIÁ TRỊ HỢP ĐỒNG VÀ PHƯƠNG THỨC THANH TOÁN</h4>
                                        <p>3.1 Giá trị hợp đồng: 15,000,000 VNĐ (bằng chữ: Mười lăm triệu đồng) (1000 VNĐ tương đương 1000 Coins).</p>
                                        <p>3.2 Phương thức thanh toán:</p>
                                        <ul>
                                            <li>Đợt 1: 30% giá trị hợp đồng (4,500,000 VNĐ) thanh toán ngay sau khi ký
                                                hợp đồng.</li>
                                            <li>Đợt 2: 30% giá trị hợp đồng (4,500,000 VNĐ) thanh toán sau khi hoàn
                                                thành giai đoạn thiết kế và được Bên A phê duyệt.</li>
                                            <li>Đợt 3: 40% giá trị hợp đồng (6,000,000 VNĐ) thanh toán sau khi bàn giao
                                                sản phẩm hoàn chỉnh và được Bên A nghiệm thu.</li>
                                        </ul>
                                        <p>3.3 Hình thức thanh toán: Chuyển khoản ngân hàng.</p>

                                        <h4>ĐIỀU 4: QUYỀN VÀ NGHĨA VỤ CỦA BÊN A</h4>
                                        <p>4.1 Cung cấp đầy đủ thông tin, tài liệu cần thiết để Bên B thực hiện công
                                            việc.</p>
                                        <p>4.2 Phản hồi, góp ý các nội dung liên quan đến sản phẩm trong thời hạn 3 ngày
                                            làm việc kể từ khi nhận được yêu cầu từ Bên B.</p>
                                        <p>4.3 Thanh toán đầy đủ và đúng hạn theo thỏa thuận tại Điều 3.</p>
                                        <p>4.4 Nghiệm thu sản phẩm trong vòng 5 ngày làm việc kể từ ngày Bên B bàn giao.
                                        </p>

                                        <h4>ĐIỀU 5: QUYỀN VÀ NGHĨA VỤ CỦA BÊN B</h4>
                                        <p>5.1 Thực hiện công việc theo đúng yêu cầu và thời hạn đã thỏa thuận.</p>
                                        <p>5.2 Bảo mật thông tin của Bên A trong quá trình thực hiện hợp đồng.</p>
                                        <p>5.3 Chịu trách nhiệm về chất lượng sản phẩm và sửa chữa lỗi (nếu có) trong
                                            thời gian bảo hành.</p>
                                        <p>5.4 Bàn giao đầy đủ mã nguồn, tài liệu kỹ thuật và hướng dẫn sử dụng cho Bên
                                            A sau khi hoàn thành công việc.</p>

                                        <h4>ĐIỀU 6: BẢO HÀNH VÀ HỖ TRỢ</h4>
                                        <p>6.1 Thời gian bảo hành: 3 tháng kể từ ngày bàn giao sản phẩm.</p>
                                        <p>6.2 Nội dung bảo hành: Sửa chữa lỗi kỹ thuật phát sinh trong quá trình sử
                                            dụng.</p>
                                        <p>6.3 Thời gian hỗ trợ kỹ thuật: Trong vòng 24 giờ kể từ khi nhận được yêu cầu
                                            từ Bên A.</p>

                                        <h4>ĐIỀU 7: QUYỀN SỞ HỮU TRÍ TUỆ</h4>
                                        <p>7.1 Bên A sở hữu toàn bộ quyền sở hữu trí tuệ đối với sản phẩm sau khi thanh
                                            toán đầy đủ giá trị hợp đồng.</p>
                                        <p>7.2 Bên B được phép sử dụng sản phẩm làm tài liệu tham khảo hoặc portfolio
                                            với sự đồng ý bằng văn bản của Bên A.</p>

                                        <h4>ĐIỀU 8: CHẤM DỨT HỢP ĐỒNG</h4>
                                        <p>8.1 Hợp đồng tự động chấm dứt khi hai bên hoàn thành đầy đủ nghĩa vụ.</p>
                                        <p>8.2 Trường hợp một bên đơn phương chấm dứt hợp đồng, phải thông báo bằng văn
                                            bản cho bên kia trước ít nhất 7 ngày và chịu phạt 10% giá trị hợp đồng.</p>

                                        <h4>ĐIỀU 9: GIẢI QUYẾT TRANH CHẤP</h4>
                                        <p>9.1 Mọi tranh chấp phát sinh từ hợp đồng này sẽ được giải quyết thông qua
                                            thương lượng, hòa giải.</p>
                                        <p>9.2 Trường hợp không thể giải quyết thông qua thương lượng, tranh chấp sẽ
                                            được đưa ra Tòa án có thẩm quyền tại Việt Nam để giải quyết.</p>

                                        <h4>ĐIỀU 10: HIỆU LỰC HỢP ĐỒNG</h4>
                                        <p>10.1 Hợp đồng có hiệu lực kể từ ngày ký và kết thúc khi hai bên hoàn thành
                                            đầy đủ nghĩa vụ.</p>
                                        <p>10.2 Hợp đồng được lập thành 02 bản có giá trị pháp lý như nhau, mỗi bên giữ
                                            01 bản.</p>
                                    </div>
                                </div>

                                <div class="contract-section">
                                    <div class="section-title">Xác nhận và ký kết</div>
                                    <div class="signature-area">
                                        <h3>Chữ ký Bên A (Employer)</h3>
                                        <div class="signature-pad" id="employer-signature"></div>
                                        <button class="btn btn-outline" id="clear-employer-signature">Xóa chữ
                                            ký</button>
                                    </div>

                                    <div class="signature-area">
                                        <h3>Chữ ký Bên B (Freelancer)</h3>
                                        <div class="signature-pad" id="freelancer-signature"></div>
                                        <button class="btn btn-outline" id="clear-freelancer-signature">Xóa chữ
                                            ký</button>
                                    </div>

                                    <div class="signature-area">
                                        <h3>Chữ ký Bên C (JobTrans)</h3>
                                        <div class="signature-pad" id="jobTrans-signature"></div>
                                        <button class="btn btn-outline" id="clear-jobTrans-signature">Xóa chữ
                                            ký</button>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">
                                            <input type="checkbox" required> Tôi đã đọc và đồng ý với các điều khoản của
                                            hợp đồng này
                                        </label>
                                    </div>

                                    <div class="contract-actions">
                                        <button class="btn btn-outline">Quay lại</button>
                                        <button class="btn" id="export-pdf-button">Xác nhận và ký kết hợp đồng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Phần này sẽ được ẩn trên giao diện hiện tại nhưng được sử dụng để xuất PDF -->
                <div id="contract-content-for-pdf">
                    <div class="container">
                        <div class="contract-header" style="display: block;">
                            <div class="national-title">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</div>
                            <div class="independence-title">Độc lập - Tự do - Hạnh phúc</div>
                            <div class="contract-title">HỢP ĐỒNG DỊCH VỤ</div>
                            <div class="contract-number">Số: ......</div>
                        </div>

                        <div class="legal-basis">
                            <p>Căn cứ Bộ luật Dân sự 2015 số 91/2015/QH13 và các văn bản hướng dẫn thi hành;</p>
                            <p>Căn cứ nhu cầu và thỏa thuận giữa các bên</p>
                            <p>Hôm nay, vào ngày ... tháng ... năm ... tại Công ty JobTrans, các bên bao gồm:</p>
                        </div>

                        <div class="party-info" style="border: none;">
                            <p><strong style="color: #000000; font-size: 22px;">BÊN A: ......................
                                    (EMPLOYER)</strong></p>
                            <p>Địa chỉ trụ sở (nếu có): .....................................................</p>
                            <p>Đại diện là Ông/bà (nếu có): .......................... Chức vụ:
                                ...........................</p>
                            <p>Mã số thuế: .....................................................</p>
                            <p>Sinh ngày: ..../..../......</p>
                            <p>Địa chỉ thường trú: .....................................................</p>
                            <p>Địa chỉ liên hệ: .....................................................</p>
                            <p>Số điện thoại: .....................................................</p>
                            <p>Email: .....................................................</p>
                        </div>

                        <div class="party-info" style="border: none;">
                            <p><strong style="color: #000000; font-size: 22px;">BÊN B: ......................
                                    (FREELANCER)</strong></p>
                            <p>Số CMND/CCCD: .......................... cấp ngày.../.../... tại ................</p>
                            <p>Sinh ngày: ..../..../......</p>
                            <p>Địa chỉ thường trú: .....................................................</p>
                            <p>Địa chỉ liên hệ: .....................................................</p>
                            <p>Số điện thoại: .....................................................</p>
                            <p>Email: .....................................................</p>
                        </div>

                        <div class="party-info" style="border: none;">
                            <p><strong style="color: #000000; font-size: 22px;">BÊN C: NỀN TẢNG JOBTRANS</strong></p>
                            <p>Công ty: JobTrans - Nền tảng hỗ trợ tuyển dụng và tìm kiếm việc làm.</p>
                            <p>Địa chỉ: Khu đô thị FPT Đà Nẵng - Ngũ Hành Sơn - Đà Nẵng</p>
                            <p>MSDN: 0932551005</p>
                            <p>Điện thoại: xxx-xxxxxxx</p>
                            <p>Đại diện: Võ Thị Mỹ Duyên</p>
                            <p>Chức vụ: Quản trị viên nền tảng</p>
                            <p>Quốc tịch: Việt Nam</p>
                        </div>

                        <p>Sau khi bàn bạc và thỏa thuận, hai bên đã thống nhất những nội dung như sau:</p>

                        <div class="section-title-contract">ĐIỀU 1. NỘI DUNG CÔNG VIỆC</div>
                        <p class="section-subtitle">1.1. Bên B nhận thực hiện cho bên A các công việc sau:
                            .................................................</p>
                        <p class="section-subtitle">1.2. Yêu cầu về chất lượng công việc:
                            .................................................</p>

                        <div class="section-title-contract">ĐIỀU 2. THỜI GIAN, ĐỊA ĐIỂM THỰC HIỆN HỢP ĐỒNG VÀ ĐIỀU KHOẢN
                        </div>
                        <p class="section-subtitle">2.1. Thời gian thực hiện:</p>
                        <p>Bên B thực hiện công việc cho Bên A trong thời hạn từ ngày/tháng/năm...đến ngày/tháng/năm.
                        </p>
                        <p class="section-subtitle">2.2. Địa điểm thực hiện: Tự do</p>
                        <p class="section-subtitle">2.3. Ngày thanh lý hợp đồng phải cách ngày dự kiến hoàn thành công
                            việc tối đa sau 5 ngày.
                        </p>
                        <p class="section-subtitle">2.4. Điều khoản:</p>
                        <p>Bên B hoàn thành công việc không đúng thời hạn ngày/tháng/năm.... Thời hạn bên B hoàn thành
                            công việc chậm tối đa là 5 ngày kể từ ngày phải hoàn thành. Sau ngày thứ 5 chậm hoàn thành
                            công việc, Bên B bồi thường mất toàn bộ tiền đặt cọc và bị trừ điểm trên hệ thống (35 điểm
                            bao gồm những lần nhắc nhở trong quá trình hoàn thành chậm -- <em>chính sách điểm trừ
                                JobTrans</em>). Ngoài ra, bên B phải chịu phạt lãi chậm thanh toán theo mức lãi suất
                            0,1%/ngày (trên thù lao dự tính được nhận cho dự án đó) chậm thanh toán và phải bồi thường
                            thiệt hại (nếu có) theo quy định của pháp luật. Trường hợp chậm tiến độ hoàn thành (đã nêu
                            tại Điều 2.1) sau 15 ngày, Bên A có quyền đơn phương chấm dứt hợp đồng.</p>

                        <div class="section-title-contract">ĐIỀU 3. PHÍ DỊCH VỤ, HÌNH THỨC, THỜI HẠN THANH TOÁN VÀ ĐẶT
                            CỌC TRƯỚC
                            KHI BẮT ĐẦU CÔNG VIỆC</div>
                        <p class="section-subtitle">3.1. Phí dịch vụ:</p>
                        <p>Bên A phải thanh toán cho Bên B phí dịch vụ là ........................VNĐ. (1000 VNĐ tương đương 1000 Coins)</p>
                        <p>Bên A sẽ thực hiện khấu trừ thuế TNCN 10% tại nguồn đối với các khoản thu nhập từ 2.000.000
                            VNĐ (bằng chữ: Hai triệu đồng) trở lên.</p>
                        <p class="section-subtitle">3.2. Hình thức thanh toán: Bằng ví điện tử của nền tảng.</p>
                        <p class="section-subtitle">3.3. Thời hạn thanh toán:</p>
                        <p>Bên A thanh toán cho Bên B theo 02 đợt:</p>
                        <p>- Lần 1: Bên A đặt cọc cho Bên B là: .................... VNĐ (1000 VNĐ tương đương 1000 Coins) vào ngày....tháng....năm.....
                        </p>
                        <p>- Lần 2: Bên A thanh toán phần giá trị hợp đồng còn lại cho Bên B sau khi đã trừ đi giá trị
                            tạm ứng và thuế thu nhập cá nhân của Bên B vào ngày hoàn thành việc cung cấp dịch vụ ở Điều
                            2.4.</p>
                        <p>Thời hạn bên A thanh toán chậm tối đa là 5 ngày kể từ ngày phải thanh toán. Sau ngày thứ 5
                            chậm thanh toán, Bên A bồi thường mất toàn bộ tiền đặt cọc và bị trừ điểm trên hệ thống (35
                            điểm bao gồm những lần nhắc nhở trong quá trình thanh toán chậm - <em>chính sách điểm trừ
                                JobTrans</em>). Ngoài ra, bên A phải chịu phạt lãi chậm thanh toán theo mức lãi suất
                            0,1%/ngày chậm thanh toán và phải bồi thường thiệt hại (nếu có) theo quy định của pháp luật.
                            Trường hợp chậm thanh toán (đã nêu tại điều 2.3) sau 15 ngày, Bên B có quyền đơn phương chấm
                            dứt hợp đồng.</p>
                        <p class="section-subtitle">3.4. Đặt cọc trước khi bắt đầu công việc:</p>
                        <p>- Bên A và Bên B có nghĩa vụ đặt cọc trước khi bắt đầu công việc với số tiền cụ thể như sau:
                        </p>
                        <p>+ Bên A đặt cọc: .................... VNĐ (bằng chữ:.......................................)
                        </p>
                        <p>+ Bên B đặt cọc: .................... VNĐ (bằng chữ:.......................................)
                        </p>
                        <p>- Sau khi đã đặt cọc, các bên không được phép rút lại tiền đặt cọc với bất kỳ lý do gì trừ
                            khi được quy định trong hợp đồng này.</p>
                        <p>- Việc xử lý tiền đặt cọc sẽ tuân theo các điều khoản liên quan đến việc hoàn thành công
                            việc, vi phạm hợp đồng hoặc chấm dứt hợp đồng như đã quy định tại Điều 2.4, Điều 3.3 và Điều
                            6 của hợp đồng này.</p>
                        <p>- Bên C có nghĩa vụ phải đảm bảo số tiền đã đặt cọc của Bên A và Bên B. Bên C sẽ phải chịu
                            hoàn toàn trách nhiệm nếu số tiền xảy ra mất mát.</p>
                        <p>- Bên C có nghĩa vụ phải đảm bảo số tiền đã đặt cọc của Bên A và Bên B. Bên C sẽ phải chịu
                            hoàn toàn trách nhiệm nếu số tiền xảy ra mất mát.</p>

                        <p class="section-subtitle">3.5. Sau khi công việc hoàn thành:</p>
                        <p>+ Số tiền đặt cọc của Bên A sẽ được dùng để trả tiền lương cho Bên B sau khi Bên B hoàn tất
                            công việc theo đúng yêu cầu công việc đã nêu ở Điều 1.</p>
                        <p>+ Số tiền đặt cọc của Bên B sẽ được hoàn trả lại cho Bên B.</p>
                        <p>- Trường hợp không hoàn thành công việc hoặc vi phạm hợp đồng:</p>
                        <p>+ Nếu Bên B không hoàn thành công việc theo đúng yêu cầu và thời hạn, số tiền đặt cọc của Bên
                            B sẽ bị xử lý theo quy định tại Điều 2.4.</p>
                        <p>+ Nếu Bên A không thanh toán đúng hạn sau khi công việc hoàn thành, số tiền đặt cọc của Bên A
                            sẽ bị xử lý theo quy định tại Điều 3.3.</p>

                        <div class="section-title-contract">ĐIỀU 4. QUYỀN VÀ NGHĨA VỤ CỦA CÁC BÊN</div>
                        <p class="section-subtitle">4.1. Quyền và nghĩa vụ của Bên A:</p>
                        <p>- Quyền của Bên A:</p>
                        <p>+ Yêu cầu Bên B thực hiện đúng công việc đã thỏa thuận theo đúng thời gian trong hợp đồng;
                        </p>
                        <p>+ Đơn phương chấm dứt hợp đồng và yêu cầu bồi thường thiệt hại theo quy định của pháp luật và
                            thỏa thuận trong hợp đồng này (Điều 2.4);</p>
                        <p>+ Các quyền khác theo quy định của pháp luật.</p>
                        <p>- Nghĩa vụ của Bên A:</p>
                        <p>+ Thanh toán đầy đủ và đúng hạn cho Bên B theo đúng thỏa thuận trong hợp đồng này;</p>
                        <p>+ Tạo điều kiện để Bên B hoàn thành công việc theo thỏa thuận;</p>
                        <p>+ Khấu trừ 10% phí dịch vụ của Bên B để đóng thuế TNCN đối với các khoản thu nhập từ
                            2.000.000 VNĐ trở lên;</p>
                        <p>+ Kê khai, đóng thuế TNCN cho Bên B trong phạm vi liên quan đến hợp đồng này;</p>
                        <p>+ Là người chịu trách nhiệm kê khai, nộp thuế TNCN đã khấu trừ cho cơ quan thuế theo quy
                            định, và cung cấp cho Bên B chứng từ khấu trừ thuế TNCN (nếu Bên B yêu cầu);</p>
                        <p>+ Các nghĩa vụ khác theo quy định của pháp luật.</p>

                        <p class="section-subtitle">4.2. Quyền và nghĩa vụ của Bên B:</p>
                        <p>- Quyền của Bên B:</p>
                        <p>+ Yêu cầu Bên A thanh toán đầy đủ và đúng hạn cho Bên B;</p>
                        <p>+ Yêu cầu Bên A trích phí dịch vụ để đóng thuế TNCN cho Bên B;</p>
                        <p>+ Đơn phương chấm dứt hợp đồng và yêu cầu bồi thường thiệt hại theo quy định của pháp luật và
                            thỏa thuận trong hợp đồng này;</p>
                        <p>+ Các quyền lợi khác theo quy định của pháp luật.</p>
                        <p>- Nghĩa vụ của Bên B:</p>
                        <p>+ Thực hiện các công việc đúng yêu cầu, thời gian, địa điểm và chất lượng theo thỏa thuận;
                        </p>
                        <p>+ Chịu sự kiểm tra của Bên A và phải báo cáo thường xuyên công việc cho Bên A;</p>
                        <p>+ Có trách nhiệm bảo mật thông tin trong thời gian thực hiện công việc;</p>
                        <p>+ Bảo quản, giao lại cho bên A tài liệu, phương tiện được giao để hoàn thành công việc;</p>
                        <p>+ Bồi thường thiệt hại trong trường hợp làm mất, hư hỏng tài liệu, phương tiện được giao để
                            thực hiện công việc hoặc khi tiết lộ thông tin bí mật của bên A.</p>
                        <p>+ Các nghĩa vụ khác theo quy định của pháp luật.</p>

                        <div class="section-title-contract">ĐIỀU 5. THANH LÝ HỢP ĐỒNG</div>
                        <p class="section-subtitle">5.1. Hợp đồng chấm dứt khi hết thời hạn hợp đồng hoặc khi các bên
                            hoàn thành quyền và nghĩa
                            vụ với nhau và không có thỏa thuận gia hạn khác;</p>
                        <p class="section-subtitle">5.2. Nếu trong quá trình thực hiện hợp đồng, hai bên thỏa thuận được
                            với nhau về việc chấm
                            dứt hợp đồng, hợp đồng này sẽ chấm dứt kể từ thời điểm đạt được thỏa thuận giữa hai bên.</p>
                        <p class="section-subtitle">5.3. Hợp đồng chấm dứt khi một trong hai bên đơn phương chấm dứt hợp
                            đồng theo quy định của
                            pháp luật và hợp đồng này.</p>

                        <div class="section-title-contract">ĐIỀU 6. ĐƠN PHƯƠNG CHẤM DỨT HỢP ĐỒNG</div>
                        <p class="section-subtitle">6.1. Các bên không được đơn phương chấm dứt hợp đồng trừ những
                            trường hợp do pháp luật quy
                            định. Bên đơn phương chấm dứt hợp đồng phải bồi thường số tiền đã đặt cọc cho công việc bao
                            gồm 3% tiền chiết khấu cho hệ thống và số tiền còn lại cho bên còn lại.</p>
                        <p class="section-subtitle">6.2. Một bên được quyền đơn phương chấm dứt hợp đồng mà không phải
                            bồi thường thiệt hại nếu
                            bên còn lại vi phạm nghiêm trọng nghĩa vụ trong hợp đồng tại Điều 2.4 và Điều 3.3 hoặc những
                            trường hợp pháp luật có quy định. Bên đơn phương chấm dứt hợp đồng có trách nhiệm chứng minh
                            được lỗi của bên kia. Chi phí kiểm tra, chứng minh lỗi vi phạm và thiệt hại gây ra do bên có
                            vi phạm nghĩa vụ chi trả.</p>
                        <p>Trường hợp đơn phương chấm dứt hợp đồng, bên đã thực hiện nghĩa vụ có quyền yêu cầu bên kia
                            thanh toán hoặc hoàn trả phần nghĩa vụ đã thực hiện.</p>

                        <div class="section-title-contract">ĐIỀU 7. BẢO MẬT THÔNG TIN</div>
                        <p class="section-subtitle">7.1. Hai bên không được tiết lộ cho bên thứ ba những thông tin, tài
                            liệu liên quan đến hợp
                            đồng này, trừ trường hợp được sự chấp thuận bằng văn bản của bên còn lại hoặc theo yêu cầu
                            của cơ quan nhà nước có thẩm quyền.</p>
                        <p class="section-subtitle">7.2. Trong khi thực hiện và sau khi hợp đồng này chấm dứt hoặc nếu
                            xảy ra tranh chấp, điều
                            khoản này vẫn sẽ còn hiệu lực pháp lý.</p>
                        <p>- Trường hợp một bên vi phạm điều khoản này, bên còn lại có quyền đơn phương chấm dứt hợp
                            đồng và yêu cầu bồi thường thiệt hại (nếu có).</p>

                        <div class="section-title-contract">ĐIỀU 8. PHÍ DỊCH VỤ NỀN TẢNG</div>
                        <p class="section-subtitle">8.1. Phí dịch vụ nền tảng: Bên C (Nền tảng JobTrans) trong bất kì
                            trường hợp nào được quyền
                            trích 3% tổng giá trị hợp đồng làm phí dịch vụ sử dụng nền tảng.</p>
                        <p class="section-subtitle">8.2. Trách nhiệm thanh toán phí dịch vụ: Bên A và Bên B đồng ý thanh
                            toán phí dịch vụ nền
                            tảng như sau:</p>
                        <p>- Bên A và Bên B chịu trách nhiệm thanh toán 3% tổng giá trị hợp đồng (bao gồm các phí như
                            sau: thù lao bên A trả cho B và số tiền bên B đã cọc cho công việc)</p>
                        <p class="section-subtitle">8.3. Phương thức thanh toán: Phí dịch vụ nền tảng sẽ được khấu trừ
                            trực tiếp từ các khoản
                            thanh toán khi thực hiện giao dịch qua nền tảng JobTrans.</p>
                        <p class="section-subtitle">8.4. Phí dịch vụ nền tảng được áp dụng cho tất cả các giao dịch được
                            thực hiện thông qua nền
                            tảng JobTrans, bao gồm cả các khoản thanh toán ban đầu và các khoản thanh toán bổ sung (nếu
                            có).</p>

                        <div class="section-title-contract">ĐIỀU 9. QUYỀN SỞ HỮU TRÍ TUỆ VÀ BẢN QUYỀN</div>
                        <p class="section-subtitle">9.1. Quyền sở hữu sản phẩm:</p>
                        <p>- Tất cả các sản phẩm, kết quả, tài liệu được tạo ra bởi Bên B trong quá trình thực hiện hợp
                            đồng này (bao gồm nhưng không giới hạn ở: mã nguồn, thiết kế, hình ảnh, văn bản, ý tưởng,
                            thuật toán...) sẽ thuộc quyền sở hữu của Bên A sau khi Bên A hoàn tất thanh toán đầy đủ.</p>
                        <p>- Bên B cam kết không sử dụng, sao chép, phân phối, chuyển nhượng hoặc khai thác thương mại
                            các sản phẩm này sau khi đã chuyển giao cho Bên A.</p>
                        <p class="section-subtitle">9.2. Chuyển giao quyền sở hữu:</p>
                        <p>- Việc chuyển giao quyền sở hữu trí tuệ từ Bên B sang Bên A sẽ được thực hiện tự động sau khi
                            Bên A hoàn tất thanh toán đầy đủ theo Điều 3 của hợp đồng.</p>
                        <p>- Bên B có trách nhiệm bàn giao đầy đủ tất cả các tài liệu, mã nguồn, thiết kế và các tài
                            liệu liên quan khác cho Bên A trong vòng 03 ngày làm việc sau khi hoàn thành công việc.</p>
                        <p>- Bên B cam kết xóa hoặc không sử dụng các tài liệu này sau khi đã chuyển giao cho Bên A, trừ
                            trường hợp được Bên A đồng ý bằng văn bản.</p>
                        <p class="section-subtitle">9.3. Cam kết về tính nguyên gốc:</p>
                        <p>- Bên B cam kết rằng tất cả các sản phẩm, kết quả được tạo ra trong quá trình thực hiện hợp
                            đồng là nguyên gốc, không vi phạm quyền sở hữu trí tuệ của bất kỳ bên thứ ba nào.</p>
                        <p>- Trong trường hợp phát sinh khiếu nại, khiếu kiện từ bên thứ ba về vấn đề quyền sở hữu trí
                            tuệ đối với các sản phẩm do Bên B tạo ra, Bên B có trách nhiệm giải quyết và bồi thường mọi
                            thiệt hại phát sinh cho Bên A.</p>
                        <p class="section-subtitle">9.4. Quyền giữ lại của Bên B:</p>
                        <p>- Bên B được phép đưa các sản phẩm đã tạo ra vào portfolio cá nhân chỉ với mục đích tham
                            khảo, sau khi được sự đồng ý bằng văn bản của Bên A.</p>
                        <p>- Việc sử dụng các sản phẩm này trong portfolio phải tuân thủ các điều khoản bảo mật được quy
                            định tại Điều 7 của hợp đồng này. </p>

                        <div class="section-title-contract">ĐIỀU 10. BẤT KHẢ KHÁNG VÀ RỦI RO CÔNG NGHỆ</div>
                        <p class="section-subtitle">10.1. Định nghĩa sự kiện bất khả kháng:</p>
                        <p>- Sự kiện bất khả kháng bao gồm nhưng không giới hạn ở: chiến tranh, nổi loạn, bạo động, đình
                            công, thiên tai (bão, lũ lụt, động đất, cháy nổ...), dịch bệnh, phong tỏa, các quyết định
                            của cơ quan nhà nước có thẩm quyền hoặc các sự kiện khác nằm ngoài tầm kiểm soát hợp lý của
                            các bên.</p>
                        <p class="section-subtitle">10.2. Xử lý khi xảy ra sự kiện bất khả kháng:</p>
                        <p>- Khi xảy ra sự kiện bất khả kháng, bên bị ảnh hưởng phải thông báo bằng văn bản cho bên còn
                            lại trong vòng 03 ngày làm việc kể từ khi sự kiện xảy ra.</p>
                        <p>- Thời gian thực hiện hợp đồng sẽ được gia hạn tương ứng với thời gian kéo dài của sự kiện
                            bất khả kháng.</p>
                        <p>- Nếu sự kiện bất khả kháng kéo dài trên 30 ngày, các bên có quyền đàm phán lại các điều
                            khoản hợp đồng hoặc chấm dứt hợp đồng mà không phải bồi thường thiệt hại.</p>
                        <p class="section-subtitle">10.3. Rủi ro công nghệ và sự cố kỹ thuật:</p>
                        <p>- Rủi ro công nghệ bao gồm: sự cố máy chủ, sự cố hệ thống của nền tảng JobTrans, mất kết nối
                            internet, mất điện kéo dài, tấn công mạng, và các sự cố kỹ thuật khác ảnh hưởng đến khả năng
                            hoàn thành công việc.</p>
                        <p>- Khi xảy ra sự cố kỹ thuật trên nền tảng JobTrans, Bên C có trách nhiệm:</p>
                        <p>+ Thông báo ngay cho Bên A và Bên B về tình trạng sự cố.</p>
                        <p>+ Nỗ lực khắc phục sự cố trong thời gian sớm nhất.</p>
                        <p>+ Gia hạn thời gian thực hiện hợp đồng tương ứng với thời gian khắc phục sự cố.</p>
                        <p>- Trường hợp mất dữ liệu do lỗi của nền tảng, Bên C có trách nhiệm khôi phục dữ liệu và bồi
                            thường thiệt hại (nếu có) cho các bên liên quan theo quy định của pháp luật.</p>
                        <p class="section-subtitle">10.4. Xử lý lỗi giao dịch thanh toán:</p>
                        <p>- Khi phát sinh lỗi giao dịch thanh toán, các bên có trách nhiệm thông báo ngay cho Bên C.
                        </p>
                        <p>- Bên C có trách nhiệm xác minh và xử lý các lỗi giao dịch trong vòng 48 giờ làm việc kể từ
                            khi nhận được thông báo.</p>
                        <p>- Trong trường hợp thanh toán bị chậm trễ do lỗi hệ thống của Bên C, các bên được miễn trừ
                            trách nhiệm về việc chậm thanh toán và không bị áp dụng các điều khoản phạt liên quan.</p>

                        <div class="section-title-contract">ĐIỀU 11. CƠ CHẾ GIẢI QUYẾT KHIẾU NẠI</div>
                        <p class="section-subtitle">11.1. Vai trò của nền tảng JobTrans:</p>
                        <p>- Bên C (Nền tảng JobTrans) đóng vai trò trung gian trong việc giải quyết các tranh chấp phát
                            sinh giữa Bên A và Bên B liên quan đến việc thực hiện hợp đồng.</p>
                        <p>- Bên C có quyền can thiệp và đưa ra quyết định cuối cùng trong trường hợp Bên A và Bên B
                            không thể đạt được thỏa thuận, dựa trên các điều khoản của hợp đồng và chính sách của nền
                            tảng.</p>
                        <p>- Quyết định của Bên C có hiệu lực ràng buộc đối với các bên, trừ trường hợp các bên có bằng
                            chứng rõ ràng về việc quyết định đó vi phạm pháp luật hoặc các điều khoản hợp đồng.</p>

                        <p class="section-subtitle">11.2. Quy trình khiếu nại và phản hồi:</p>
                        <p>- Bên khiếu nại phải gửi văn bản khiếu nại đến Bên C trong vòng 07 ngày làm việc kể từ khi
                            phát sinh vấn đề, nêu rõ nội dung khiếu nại và các bằng chứng liên quan.</p>
                        <p>- Bên C sẽ xác nhận đã nhận khiếu nại trong vòng 24 giờ và thông báo cho bên còn lại.</p>
                        <p>- Bên bị khiếu nại có quyền phản hồi trong vòng 03 ngày làm việc kể từ khi nhận thông báo từ
                            Bên C.</p>
                        <p>- Bên C sẽ xem xét các bằng chứng và đưa ra quyết định trong vòng 07 ngày làm việc kể từ khi
                            nhận đủ thông tin từ cả hai bên.</p>

                        <p class="section-subtitle">11.3. Xử lý khiếu nại về chất lượng công việc:</p>
                        <p>- Trong trường hợp Bên A khiếu nại về chất lượng công việc của Bên B, Bên C sẽ đánh giá dựa
                            trên các yêu cầu đã nêu của khiếu nại.</p>
                        <p>- Nếu khiếu nại được xác nhận là hợp lý, Bên B có trách nhiệm chỉnh sửa, hoàn thiện công việc
                            trong thời hạn do Bên C quy định, hoặc hoàn trả tiền cọc hoặc toàn bộ phí dịch vụ tùy theo
                            mức độ vi phạm kèm theo bị trừ điểm trên nền tảng.</p>
                        <p>- Nếu khiếu nại không được xác nhận, Bên A vẫn phải thực hiện đầy đủ nghĩa vụ thanh toán theo
                            hợp đồng.</p>
                        <p>- Tiêu chí đánh giá chất lượng công việc được xác định dựa trên:</p>
                        <ul>
                            <li>Sự phù hợp với yêu cầu cụ thể đã nêu tại Điều 1.2 của hợp đồng.</li>
                            <li>Sự tuân thủ các thông số kỹ thuật, tiêu chuẩn ngành và quy định pháp luật liên quan.
                            </li>
                            <li>Tính đầy đủ của các thành phần, chức năng theo yêu cầu.</li>
                            <li>Độ hoàn thiện và chất lượng kỹ thuật của sản phẩm.</li>
                            <li>Khả năng đáp ứng mục tiêu sử dụng của Bên A.</li>
                        </ul>
                        <p>- Bên C sẽ thành lập hội đồng đánh giá gồm ít nhất 2 chuyên gia trong lĩnh vực liên quan để
                            đánh giá khách quan khi có khiếu nại về chất lượng.</p>

                        <p class="section-subtitle">11.4. Xử lý khiếu nại về thanh toán:</p>
                        <p>- Trong trường hợp Bên B khiếu nại về việc thanh toán của Bên A, Bên C sẽ xác minh tình trạng
                            thanh toán và thông báo kết quả cho các bên.</p>
                        <p>- Nếu Bên A chậm thanh toán mà không có lý do chính đáng, Bên C có quyền áp dụng các biện
                            pháp xử lý theo quy định tại Điều 3.3 của hợp đồng.</p>
                        <p>- Bên C có thể sử dụng số tiền đặt cọc để thanh toán cho Bên B trong trường hợp xác định Bên
                            A vi phạm nghĩa vụ thanh toán.</p>

                        <div class="section-title-contract">ĐIỀU 12. ÁP DỤNG QUY CHẾ ĐIỂM CỘNG TRÊN NỀN TẢNG</div>
                        <p class="section-subtitle">12.1. Tuân thủ quy chế điểm:</p>
                        <p>- Các bên xác nhận đã đọc, hiểu rõ và đồng ý tuân thủ "Quy chế Điểm Uy tín" hiện hành trên
                            nền tảng JobTrans.</p>
                        <p>- Quy chế này là một phần không tách rời của hợp đồng này và có hiệu lực ràng buộc đối với
                            các bên.</p>

                        <p class="section-subtitle">12.2. Phạm vi áp dụng:</p>
                        <p>- Việc tích lũy, trừ điểm và các quyền lợi liên quan sẽ được thực hiện theo đúng Quy chế Điểm
                            Uy tín của nền tảng.</p>
                        <p>- Trong trường hợp có sự khác biệt giữa điều khoản trong hợp đồng này và Quy chế Điểm Uy tín,
                            quy định trong hợp đồng sẽ được ưu tiên áp dụng.</p>

                        <p class="section-subtitle">12.3. Cập nhật quy chế:</p>
                        <p>- Quy chế Điểm Uy tín có thể được Bên C cập nhật theo thời gian, việc cập nhật sẽ được thông
                            báo cho các bên và có hiệu lực sau 07 ngày kể từ ngày thông báo.</p>
                        <p>- Các thay đổi trong Quy chế không áp dụng hồi tố đối với các hợp đồng đã ký kết trước thời
                            điểm thay đổi có hiệu lực.</p>

                        <p class="section-subtitle">12.4. Tra cứu và xác nhận điểm:</p>
                        <p>- Các bên có thể tra cứu số điểm hiện tại của mình thông qua tài khoản cá nhân trên nền tảng
                            JobTrans.</p>
                        <p>- Bên C có trách nhiệm đảm bảo tính chính xác và minh bạch của hệ thống điểm.</p>

                        <div class="section-title-contract">ĐIỀU 13. ĐIỀU KHOẢN CHUNG</div>
                        <p>- Hai bên cam kết thực hiện đầy đủ các điều khoản của hợp đồng này. Nếu tranh chấp phát sinh
                            trong quá trình thực hiện hợp đồng sẽ được giải quyết bằng thương lượng và hòa giải. Trường
                            hợp các bên thương lượng, hòa giải không thành, tranh chấp sẽ được giải quyết tại Tòa án
                            nhân dân.</p>
                        <p>- Hợp đồng này được lập thành 02 bản và có giá trị pháp lý như nhau, mỗi bên giữ một bản.</p>
                        <p>- Hợp đồng này có hiệu lực kể từ ngày... tháng... năm...</p>
                        <br>
                        <div class="signature-area-contract">
                            <div class="signature-box">
                                <div class="signature-title" style="margin-bottom: 0px;">NGƯỜI LAO ĐỘNG</div>
                                <div class="signature-note">(Ký, ghi rõ họ tên)</div>
                                <div class="signature-date">Ngày... Tháng... Năm...</div>
                                <div class="signature-img"><img src="../wp-includes/images/media/signature-My-Duyen.jpg"
                                        alt=""></div>
                                <div class="signature-JobTrans"><img
                                        src="../wp-includes/images/media/signature-JobTrans.jpg" alt=""></div>
                                <div class="signature-name"><strong>Võ Thị Mỹ Duyên</strong></div>
                            </div>
                            <div class="signature-box">
                                <div class="signature-title" style="margin-bottom: 0px;">NGƯỜI SỬ DỤNG LAO ĐỘNG</div>
                                <div class="signature-note">(Ký, ghi rõ họ tên)</div>
                                <div class="signature-date">Ngày... Tháng... Năm...</div>
                                <div class="signature-img"><img src="../wp-includes/images/media/signature-My-Duyen.jpg"
                                        alt=""></div>
                                <div class="signature-JobTrans"><img
                                        src="../wp-includes/images/media/signature-JobTrans.jpg" alt=""></div>
                                <div class="signature-name"><strong>Võ Thị Mỹ Duyên</strong></div>
                            </div>
                            <div class="signature-box">
                                <div class="signature-title" style="margin-bottom: 0px;">ĐẠI DIỆN NỀN TẢNG</div>
                                <div class="signature-note">(Ký, ghi rõ họ tên)</div>
                                <div class="signature-date">Ngày... Tháng... Năm...</div>
                                <div class="signature-img"><img src="../wp-includes/images/media/signature-My-Duyen.jpg"
                                        alt=""></div>
                                <div class="signature-JobTrans"><img
                                        src="../wp-includes/images/media/signature-JobTrans.jpg" alt=""></div>
                                <div class="signature-name"><strong>Võ Thị Mỹ Duyên</strong></div>
                            </div>
                        </div>
                        <div class="footer-pdf">
                            <p>Trang 1/1 - Hợp đồng dịch vụ freelance - Mã hợp đồng: CON-2025-0001</p>
                        </div>
                    </div>
                </div>


                <script>
                    // Sử dụng thư viện jsPDF và html2canvas để chuyển đổi nội dung hợp đồng thành PDF
                    function exportContractToPDF() {
                        // Hiển thị thông báo đang xử lý
                        showProcessingModal();

                        try {
                            // Chuẩn bị nội dung để xuất PDF
                            const contractElement = document.getElementById('contract-content-for-pdf');

                            const { jsPDF } = window.jspdf;

                            // Sử dụng html2canvas để chuyển đổi phần tử HTML thành canvas
                            html2canvas(contractElement, {
                                scale: 2, // Tăng độ phân giải
                                useCORS: true, // Cho phép tải hình ảnh từ các nguồn khác
                                logging: false,
                                onclone: function (clonedDoc) {
                                    // Thêm các kiểu CSS cần thiết vào bản sao trước khi render
                                    const style = clonedDoc.createElement('style');
                                    style.innerHTML = `
        body {
            font-family: 'Arial', sans-serif;
            color: #000000;
            line-height: 1.5;
            margin: 0;
            padding: 60px 0;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .contract-header {
            text-align: center;
            margin-bottom: 30px;
            display: block;
        }
        .national-title {
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 10px;
            text-transform: uppercase;
        }
        .independence-title {
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 60px;
        }
        .contract-title {
            font-size: 22px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 10px;
            text-transform: uppercase;
            color: #000000;
        }
        .contract-number {
            text-align: center;
            margin-bottom: 20px;
        }
        .legal-basis {
            margin-bottom: 20px;
            text-align: justify;
        }
        .section-title-contract {
            font-size: 18px;
            font-weight: bold;
            color: #000000;
            margin-top: 25px;
            margin-bottom: 15px;
            text-transform: uppercase;
        }
            .section-subtitle{
            font-weight: 500;
            color: #000000;

            }
        .party-info p {
            margin: 5px 0;
        }
        .signature-area-contract {
            margin-top: 40px;
            display: flex;
            justify-content: space-between;
        }
        .signature-box {
            position: relative;
            width: 30%;
            text-align: center;
        }
        .signature-title {
            font-weight: bold;
            margin-bottom: 70px;
        }
        .signature-date {
            margin-bottom: 100px;
        }
        .signature-img {
            position: absolute;
            top: 90px;
            left: 50%;
            transform: translateX(-50%);
            width: 220px;
            height: auto;
            z-index: 2; 
        }
        .signature-JobTrans {
            z-index: 1; 
            position: absolute;
            top: 30px;
            left: 40%;
            transform: translateX(-50%) rotate(2deg);
            width: 200px;
            height: auto;
        }
        .signature-name strong {
            color: black;
        }
        .footer-pdf {
            text-align: center;
            font-size: 12px;
            color: #666;
            bottom: 0;
        } 
      `;
                                    clonedDoc.head.appendChild(style);
                                }
                            }).then(canvas => {
                                const imgData = canvas.toDataURL('image/png');
                                const pdf = new jsPDF('p', 'mm', 'a4');
                                const imgWidth = 210; // A4 width in mm
                                const pageHeight = 297; // A4 height in mm
                                const imgHeight = canvas.height * imgWidth / canvas.width;
                                let heightLeft = imgHeight;
                                let position = 0;

                                // Thêm trang đầu tiên
                                pdf.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                                heightLeft -= pageHeight;

                                // Thêm các trang tiếp theo nếu nội dung dài
                                while (heightLeft >= 0) {
                                    position = heightLeft - imgHeight;
                                    pdf.addPage();
                                    pdf.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                                    heightLeft -= pageHeight;
                                }


                                const filename = `Hop_Dong_1.pdf`;

                                // Lưu file PDF
                                pdf.save(filename);

                                // Ẩn thông báo đang xử lý
                                hideProcessingModal();

                                // Hiển thị thông báo thành công
                                showSuccessModal('Xuất PDF thành công!', 'File PDF đã được tải xuống.');
                            }).catch(error => {
                                console.error('Lỗi khi xuất PDF:', error);
                                hideProcessingModal();
                                showErrorModal('Có lỗi xảy ra', 'Không thể xuất file PDF. Vui lòng thử lại sau.');
                            });
                        } catch (error) {
                            console.error('Lỗi trong quá trình xử lý:', error);
                            hideProcessingModal();
                            showErrorModal('Có lỗi xảy ra', 'Không thể khởi tạo quá trình xuất PDF. Vui lòng thử lại sau.');
                        }
                    }

                    // Hiển thị modal đang xử lý
                    function showProcessingModal() {
                        const modal = document.createElement('div');
                        modal.id = 'processing-modal';
                        modal.style.cssText = `
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9999;
  `;

                        const modalContent = document.createElement('div');
                        modalContent.style.cssText = `
    background-color: white;
    padding: 30px;
    border-radius: 8px;
    text-align: center;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  `;

                        modalContent.innerHTML = `
    <div class="spinner" style="margin-bottom: 20px;">
      <i class="fas fa-spinner fa-spin" style="font-size: 40px; color: #4a6def;"></i>
    </div>
    <h3 style="margin: 0; font-size: 18px;">Đang tạo file PDF...</h3>
    <p style="margin-top: 10px; color: #666;">Vui lòng đợi trong giây lát.</p>
  `;

                        modal.appendChild(modalContent);
                        document.body.appendChild(modal);
                    }

                    // Ẩn modal đang xử lý
                    function hideProcessingModal() {
                        const modal = document.getElementById('processing-modal');
                        if (modal) {
                            document.body.removeChild(modal);
                        }
                    }

                    // Hiển thị modal thành công
                    function showSuccessModal(title, message) {
                        showModal(title, message, 'success');
                    }

                    // Hiển thị modal lỗi
                    function showErrorModal(title, message) {
                        showModal(title, message, 'error');
                    }

                    // Hiển thị modal chung
                    function showModal(title, message, type) {
                        const modal = document.createElement('div');
                        modal.style.cssText = `
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9999;
  `;

                        const iconClass = type === 'success' ? 'fa-check-circle' : 'fa-exclamation-circle';
                        const iconColor = type === 'success' ? '#28a745' : '#dc3545';

                        const modalContent = document.createElement('div');
                        modalContent.style.cssText = `
    background-color: white;
    padding: 30px;
    border-radius: 8px;
    text-align: center;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    max-width: 400px;
    width: 90%;
  `;

                        modalContent.innerHTML = `
    <div style="margin-bottom: 20px;">
      <i class="fas ${iconClass}" style="font-size: 48px; color: ${iconColor};"></i>
    </div>
    <h3 style="margin: 0; font-size: 20px;">${title}</h3>
    <p style="margin-top: 10px; color: #666;">${message}</p>
    <button id="close-modal" style="
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #4a6def;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    ">Đóng</button>
  `;

                        modal.appendChild(modalContent);
                        document.body.appendChild(modal);

                        document.getElementById('close-modal').addEventListener('click', function () {
                            document.body.removeChild(modal);
                        });
                    }

                    // Thêm sự kiện cho nút xuất PDF
                    document.addEventListener('DOMContentLoaded', function () {
                        const exportPdfButton = document.getElementById('export-pdf-button');
                        if (exportPdfButton) {
                            exportPdfButton.addEventListener('click', exportContractToPDF);
                        }
                    });
                </script>


                <%@include file="includes/footer.jsp" %>
                    <!--======= Back to Top =======-->
                    <div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
        </body>

        <!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

        </html>