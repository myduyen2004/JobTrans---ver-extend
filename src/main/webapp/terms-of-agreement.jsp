<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobTrans</title>
    <link href="css/terms-of-agreement.css" rel="stylesheet">
    <style>
        /* Buttons */
        .btn-container {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            margin-top: 30px;
        }

        .btn-a {
            padding: 12px 24px;
            border-radius: var(--radius);
            font-weight: 500;
            font-size: 18px;
            cursor: pointer;
            transition: var(--transition);
            border: none;
            outline: none;
            text-decoration: none;
        }

        .btn-outline {
            background-color: transparent;
            border: 1px solid var(--primary-color);
            color: var(--primary-color);
        }

        .btn-outline:hover {
            background-color: rgba(39, 64, 179, 0.05);
        }

        .btn-a:not(.btn-outline) {
            background: var(--primary-gradient);
            color: var(--white);
            box-shadow: 0 4px 10px rgba(39, 64, 179, 0.3);
        }

        .btn-a:not(.btn-outline):hover {
            box-shadow: 0 6px 15px rgba(39, 64, 179, 0.4);
            transform: translateY(-2px);
        }
        /* Style for form validation */
        .form-control.is-invalid {
            border-color: #dc3545;
            padding-right: calc(1.5em + 0.75rem);
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right calc(0.375em + 0.1875rem) center;
            background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
        }

        .error-message {
            color: #dc3545;
            font-size: 12px;
            margin-top: 5px;
        }

        /* Required field indicator */
        .form-label.required:after {
            content: " *";
            color: #dc3545;
        }


    </style>
</head>
<body>
<%@include file="includes/header-01.jsp"%>
<section>
    <div class="container section-padding">
        <div class="justify-content-center">
            <main class="container">
                <div class="contract-header">
                    <div class="contract-title">Hợp Đồng Dịch Vụ JobTrans</div>
                    <div class="contract-status status-active">Đang xác lập</div>
                </div>

                <div class="contract-progress">
                    <div class="progress-step completed">
                        <div class="step-number"></div>
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
                    <form action="contract" method="post" id="contract-terms-form">
                        <input type="hidden" name="action" value="add-terms">
                        <input type="hidden" name="greetingId" value="${jobGreeting.greetingId}">

                        <%--                        <div class="form-section">--%>
                        <%--                            <div class="section-title">Điều khoản chung</div>--%>
                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Thời gian bảo hành sau bàn giao--%>
                        <%--                                    <span class="tooltip">--%>
                        <%--                                            <span class="tooltip-icon"></span>--%>
                        <%--                                            <span class="tooltip-text">Thời gian hỗ trợ kỹ thuật sau khi bàn giao sản phẩm</span>--%>
                        <%--                                        </span>--%>
                        <%--                                </label>--%>
                        <%--                                <select class="form-select" name="warranty_period">--%>
                        <%--                                    <option value="1">1 tháng</option>--%>
                        <%--                                    <option value="3" selected>3 tháng</option>--%>
                        <%--                                    <option value="6">6 tháng</option>--%>
                        <%--                                    <option value="12">12 tháng</option>--%>
                        <%--                                </select>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Phạm vi bảo hành</label>--%>
                        <%--                                <textarea class="form-control" name="warranty_scope" rows="4" placeholder="Mô tả phạm vi bảo hành sau bàn giao...">Sửa lỗi phát sinh, hỗ trợ kỹ thuật và vận hành website trong thời gian bảo hành. Không bao gồm các thay đổi về chức năng hoặc thiết kế.</textarea>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Thời gian phản hồi khi có sự cố</label>--%>
                        <%--                                <select class="form-select" name="response_time">--%>
                        <%--                                    <option value="4">Trong vòng 4 giờ làm việc</option>--%>
                        <%--                                    <option value="8">Trong vòng 8 giờ làm việc</option>--%>
                        <%--                                    <option value="24" selected>Trong vòng 24 giờ</option>--%>
                        <%--                                    <option value="48">Trong vòng 48 giờ</option>--%>
                        <%--                                </select>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <!-- Thông tin Bên A - Employer -->
                        <div class="form-section">
                            <div class="section-title">Thông tin Bên A (Employer)</div>
                            <div class="form-group">
                                <label class="form-label">Tên đầy đủ</label>
                                <input type="text" class="form-control" name="employer_name" placeholder="Tên đầy đủ của Bên A">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Địa chỉ trụ sở (nếu có)</label>
                                <input type="text" class="form-control" name="employer_address" placeholder="Địa chỉ trụ sở của Bên A">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Đại diện (nếu có)</label>
                                <input type="text" class="form-control" name="employer_representative" placeholder="Họ tên người đại diện">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Số CMND/CCCD</label>
                                <input type="text" class="form-control" name="employer_id_number" placeholder="Số CMND/CCCD">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày cấp</label>
                                <input type="date" class="form-control" name="employer_id_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Nơi cấp</label>
                                <input type="text" class="form-control" name="employer_id_place" placeholder="Nơi cấp CMND/CCCD">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Mã số thuế</label>
                                <input type="text" class="form-control" name="employer_tax_code" placeholder="Mã số thuế">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày sinh</label>
                                <input type="date" class="form-control" name="employer_birth_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Địa chỉ liên hệ</label>
                                <input type="text" class="form-control" name="employer_contact_address" placeholder="Địa chỉ liên hệ">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Số điện thoại</label>
                                <input type="tel" class="form-control" name="employer_phone" placeholder="Số điện thoại">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" name="employer_email" placeholder="Địa chỉ email">
                            </div>
                        </div>

                        <!-- Thông tin Bên B - Freelancer -->
                        <div class="form-section">
                            <div class="section-title">Thông tin Bên B (Freelancer)</div>
                            <div class="form-group">
                                <label class="form-label">Tên đầy đủ</label>
                                <input type="text" class="form-control" name="freelancer_name" placeholder="Tên đầy đủ của Bên B">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Đại diện (nếu có)</label>
                                <input type="text" class="form-control" name="freelancer_representative" placeholder="Họ tên người đại diện">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Số CMND/CCCD</label>
                                <input type="text" class="form-control" name="freelancer_id_number" placeholder="Số CMND/CCCD">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày cấp</label>
                                <input type="date" class="form-control" name="freelancer_id_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Nơi cấp</label>
                                <input type="text" class="form-control" name="freelancer_id_place" placeholder="Nơi cấp CMND/CCCD">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày sinh</label>
                                <input type="date" class="form-control" name="freelancer_birth_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Địa chỉ liên hệ</label>
                                <input type="text" class="form-control" name="freelancer_contact_address" placeholder="Địa chỉ liên hệ">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Số điện thoại</label>
                                <input type="tel" class="form-control" name="freelancer_phone" placeholder="Số điện thoại">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" name="freelancer_email" placeholder="Địa chỉ email">
                            </div>
                        </div>

                        <!-- Nội dung công việc -->
                        <div class="form-section">
                            <div class="section-title">Điều 1: Nội dung công việc</div>
                            <div class="form-group">
                                <label class="form-label">Mô tả công việc</label>
                                <textarea class="form-control" name="job_goal" rows="4" placeholder="Mô tả chi tiết công việc mà Bên B sẽ thực hiện cho Bên A"></textarea>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Yêu cầu về chất lượng công việc</label>
                                <textarea class="form-control" name="job_requirement" rows="4" placeholder="Mô tả yêu cầu về chất lượng công việc"></textarea>
                            </div>
                        </div>

                        <!-- Thời gian và địa điểm thực hiện -->
                        <div class="form-section">
                            <div class="section-title">Điều 2: Thời gian và địa điểm thực hiện</div>
                            <div class="form-group">
                                <label class="form-label">Ngày bắt đầu</label>
                                <input type="date" class="form-control" name="start_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày kết thúc</label>
                                <input type="date" class="form-control" name="end_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Địa điểm thực hiện</label>
                                <input type="text" class="form-control" name="work_location" placeholder="Địa điểm thực hiện công việc">
                            </div>

                            <%--================================Để sau các kì sau mở rộng thêm cho dự án==================================--%>
                            <%--                            <div class="form-group">--%>
                            <%--                                <label class="form-label">Ngày thanh lý hợp đồng</label>--%>
                            <%--                                <input type="date" class="form-control" name="liquidation_date">--%>
                            <%--                                <small class="form-text">Không quá 5 ngày sau ngày dự kiến hoàn thành công việc</small>--%>
                            <%--                            </div>--%>
                        </div>

                        <!-- Phí dịch vụ và thanh toán -->
                        <div class="form-section">
                            <div class="section-title">Điều 3: Phí dịch vụ và thanh toán</div>
                            <div class="form-group">
                                <label class="form-label">Tổng phí dịch vụ (VNĐ)</label>
                                <input type="number" class="form-control" name="service_fee" placeholder="Nhập tổng phí dịch vụ (VNĐ)">
                                <small class="form-text">Thuế TNCN 10% sẽ được khấu trừ cho khoản thu nhập từ 2.000.000 VNĐ trở lên</small>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Đặt cọc của Bên A (VNĐ)</label>
                                <input type="number" class="form-control" name="employer_deposit" placeholder="Số tiền Bên A đặt cọc">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Đặt cọc của Bên A (Bằng chữ)</label>
                                <input type="text" class="form-control" name="employer_deposit_text" placeholder="Số tiền Bên A đặt cọc (Bằng chữ)">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày đặt cọc của Bên A</label>
                                <input type="date" class="form-control" name="employer_deposit_date">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Đặt cọc của Bên B (VNĐ)</label>
                                <input type="number" class="form-control" name="freelancer_deposit" placeholder="Số tiền Bên B đặt cọc">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Đặt cọc của Bên B (Bằng chữ)</label>
                                <input type="text" class="form-control" name="freelancer_deposit_text" placeholder="Số tiền Bên B đặt cọc (Bằng chữ)">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Ngày đặt cọc của Bên B</label>
                                <input type="date" class="form-control" name="freelancer_deposit_date">
                            </div>
                        </div>


                        <%--================================Để sau các kì sau mở rộng thêm cho dự án==================================--%>
                        <%--                        <!-- Điều khoản bảo hành -->--%>
                        <%--                        <div class="form-section">--%>
                        <%--                            <div class="section-title">Điều khoản bảo hành</div>--%>
                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Thời gian bảo hành sau bàn giao--%>
                        <%--                                    <span class="tooltip">--%>
                        <%--                <span class="tooltip-icon"></span>--%>
                        <%--                <span class="tooltip-text">Thời gian hỗ trợ kỹ thuật sau khi bàn giao sản phẩm</span>--%>
                        <%--            </span>--%>
                        <%--                                </label>--%>
                        <%--                                <select class="form-select" name="warranty_period">--%>
                        <%--                                    <option value="1">1 tháng</option>--%>
                        <%--                                    <option value="3" selected>3 tháng</option>--%>
                        <%--                                    <option value="6">6 tháng</option>--%>
                        <%--                                    <option value="12">12 tháng</option>--%>
                        <%--                                </select>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Phạm vi bảo hành</label>--%>
                        <%--                                <textarea class="form-control" name="warranty_scope" rows="4" placeholder="Mô tả phạm vi bảo hành sau bàn giao...">Sửa lỗi phát sinh, hỗ trợ kỹ thuật và vận hành trong thời gian bảo hành. Không bao gồm các thay đổi về chức năng hoặc thiết kế.</textarea>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Thời gian phản hồi khi có sự cố</label>--%>
                        <%--                                <select class="form-select" name="response_time">--%>
                        <%--                                    <option value="4">Trong vòng 4 giờ làm việc</option>--%>
                        <%--                                    <option value="8">Trong vòng 8 giờ làm việc</option>--%>
                        <%--                                    <option value="24" selected>Trong vòng 24 giờ</option>--%>
                        <%--                                    <option value="48">Trong vòng 48 giờ</option>--%>
                        <%--                                </select>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <%--                        <!-- Điều khoản vi phạm hợp đồng -->--%>
                        <%--                        <div class="form-section">--%>
                        <%--                            <div class="section-title">Điều khoản vi phạm hợp đồng</div>--%>
                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Thời gian gia hạn tối đa khi chậm hoàn thành</label>--%>
                        <%--                                <input type="number" class="form-control" name="max_delay_days" value="5" readonly>--%>
                        <%--                                <small class="form-text">Số ngày tối đa được phép chậm hoàn thành công việc</small>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Mức phạt lãi suất chậm hoàn thành/thanh toán</label>--%>
                        <%--                                <input type="text" class="form-control" name="penalty_rate" value="0.1%/ngày" readonly>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Điểm trừ trên hệ thống khi vi phạm</label>--%>
                        <%--                                <input type="number" class="form-control" name="penalty_points" value="35" readonly>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Thời gian tối đa trước khi chấm dứt hợp đồng</label>--%>
                        <%--                                <input type="number" class="form-control" name="max_contract_termination_days" value="15" readonly>--%>
                        <%--                                <small class="form-text">Số ngày chậm tối đa trước khi bên không vi phạm có quyền đơn phương chấm dứt hợp đồng</small>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <%--================================Để sau các kì sau mở rộng thêm cho dự án==================================--%>
                        <%--                        <div class="form-section">--%>
                        <%--                            <div class="section-title">Quyền sở hữu & bản quyền</div>--%>
                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Quyền sở hữu sản phẩm sau hoàn thành</label>--%>
                        <%--                                <div class="radio-group">--%>
                        <%--                                    <div class="radio-options">--%>
                        <%--                                        <div class="radio-option">--%>
                        <%--                                            <input type="radio" id="ownership_client" name="ownership" value="client" checked class="radio-input">--%>
                        <%--                                            <label for="ownership_client" class="radio-label">Khách hàng sở hữu toàn bộ</label>--%>
                        <%--                                        </div>--%>
                        <%--                                        <div class="radio-option">--%>
                        <%--                                            <input type="radio" id="ownership_shared" name="ownership" value="shared" class="radio-input">--%>
                        <%--                                            <label for="ownership_shared" class="radio-label">Sở hữu chung</label>--%>
                        <%--                                        </div>--%>
                        <%--                                        <div class="radio-option">--%>
                        <%--                                            <input type="radio" id="ownership_freelancer" name="ownership" value="freelancer" class="radio-input">--%>
                        <%--                                            <label for="ownership_freelancer" class="radio-label">Freelancer giữ bản quyền</label>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Chi tiết về quyền sở hữu trí tuệ</label>--%>
                        <%--                                <textarea class="form-control" name="intellectual_property_details" rows="4" placeholder="Mô tả chi tiết về quyền sở hữu...">Khách hàng sẽ sở hữu toàn bộ quyền đối với sản phẩm sau khi thanh toán đầy đủ, bao gồm mã nguồn, thiết kế và tất cả tài sản trí tuệ liên quan. Freelancer có thể sử dụng dự án trong portfolio của mình.</textarea>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Sử dụng tài nguyên của bên thứ ba</label>--%>
                        <%--                                <textarea class="form-control" name="third_party_resources" rows="3" placeholder="Liệt kê các tài nguyên của bên thứ ba sẽ được sử dụng...">Các plugin WordPress: WooCommerce, Yoast SEO, Contact Form 7. Thư viện JavaScript: jQuery, Bootstrap. Hình ảnh stock từ nguồn Unsplash (miễn phí sử dụng thương mại).</textarea>--%>
                        <%--                                <p class="info-text"><i class="fas fa-info-circle"></i> Cần liệt kê đầy đủ các thư viện, plugin, hình ảnh hoặc nội dung của bên thứ ba và bản quyền tương ứng</p>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <%--                        <div class="form-section">--%>
                        <%--                            <div class="section-title">Điều khoản bảo mật</div>--%>
                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Thỏa thuận không tiết lộ thông tin (NDA)</label>--%>
                        <%--                                <div class="checkbox-group">--%>
                        <%--                                    <input type="checkbox" id="nda_required" name="nda_required" class="checkbox-input" checked>--%>
                        <%--                                    <label for="nda_required" class="checkbox-label">Yêu cầu thỏa thuận bảo mật</label>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Nội dung thỏa thuận bảo mật</label>--%>
                        <%--                                <textarea class="form-control" name="nda_content" rows="4" placeholder="Mô tả chi tiết thỏa thuận bảo mật...">Freelancer đồng ý không tiết lộ bất kỳ thông tin kinh doanh, chiến lược, dữ liệu khách hàng hoặc thông tin độc quyền nào của khách hàng trong và sau quá trình thực hiện dự án. Thông tin bảo mật bao gồm nhưng không giới hạn: mã nguồn, tài liệu kinh doanh, chiến lược marketing, và thông tin người dùng.</textarea>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Thời hạn hiệu lực của thỏa thuận bảo mật</label>--%>
                        <%--                                <select class="form-select" name="nda_duration">--%>
                        <%--                                    <option value="1">1 năm sau khi kết thúc dự án</option>--%>
                        <%--                                    <option value="2" selected>2 năm sau khi kết thúc dự án</option>--%>
                        <%--                                    <option value="3">3 năm sau khi kết thúc dự án</option>--%>
                        <%--                                    <option value="5">5 năm sau khi kết thúc dự án</option>--%>
                        <%--                                    <option value="forever">Vô thời hạn</option>--%>
                        <%--                                </select>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Bảo vệ dữ liệu cá nhân</label>--%>
                        <%--                                <textarea class="form-control" name="data_protection" rows="3" placeholder="Mô tả biện pháp bảo vệ dữ liệu cá nhân...">Freelancer cam kết tuân thủ các quy định về bảo vệ dữ liệu cá nhân theo luật hiện hành. Mọi dữ liệu cá nhân được cung cấp trong quá trình thực hiện dự án sẽ được bảo mật, không chia sẻ với bên thứ ba và chỉ sử dụng cho mục đích hoàn thành dự án.</textarea>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <%--                        <div class="form-section">--%>
                        <%--                            <div class="section-title">Điều khoản thanh toán</div>--%>
                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Phương thức thanh toán</label>--%>
                        <%--                                <div class="radio-group">--%>
                        <%--                                    <div class="radio-options">--%>
                        <%--                                        <div class="radio-option">--%>
                        <%--                                            <input type="radio" id="payment_escrow" name="payment_method" value="escrow" checked class="radio-input">--%>
                        <%--                                            <label for="payment_escrow" class="radio-label">Qua ký quỹ ProLancer</label>--%>
                        <%--                                        </div>--%>
                        <%--                                        <div class="radio-option">--%>
                        <%--                                            <input type="radio" id="payment_direct" name="payment_method" value="direct" class="radio-input">--%>
                        <%--                                            <label for="payment_direct" class="radio-label">Thanh toán trực tiếp</label>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Lịch thanh toán</label>--%>
                        <%--                                <select class="form-select" name="payment_schedule">--%>
                        <%--                                    <option value="milestone">Theo cột mốc dự án</option>--%>
                        <%--                                    <option value="upfront_final" selected>Tạm ứng + Thanh toán cuối</option>--%>
                        <%--                                    <option value="equal">Chia đều các đợt</option>--%>
                        <%--                                    <option value="completion">Thanh toán khi hoàn thành</option>--%>
                        <%--                                </select>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Chi tiết lịch thanh toán</label>--%>
                        <%--                                <textarea class="form-control" name="payment_details" rows="4" placeholder="Mô tả chi tiết lịch thanh toán...">Đợt 1: 30% giá trị hợp đồng ngay sau khi ký hợp đồng.--%>
                        <%--Đợt 2: 30% sau khi hoàn thành giai đoạn thiết kế và được khách hàng phê duyệt.--%>
                        <%--Đợt 3: 40% sau khi hoàn thành toàn bộ dự án và bàn giao sản phẩm.</textarea>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Chính sách phạt trễ hạn thanh toán</label>--%>
                        <%--                                <textarea class="form-control" name="late_payment_penalty" rows="3" placeholder="Mô tả chính sách phạt khi trễ hạn thanh toán...">Nếu khách hàng chậm thanh toán quá 7 ngày so với thời hạn quy định, phí phạt 1% giá trị khoản thanh toán sẽ được áp dụng cho mỗi tuần chậm trễ. Nếu thanh toán chậm quá 30 ngày, freelancer có quyền tạm ngừng dự án cho đến khi thanh toán được thực hiện.</textarea>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <%--                        <div class="form-section">--%>
                        <%--                            <div class="section-title">Điều khoản chấm dứt hợp đồng</div>--%>
                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Điều kiện chấm dứt hợp đồng</label>--%>
                        <%--                                <textarea class="form-control" name="termination_conditions" rows="4" placeholder="Mô tả điều kiện chấm dứt hợp đồng...">Hợp đồng có thể bị chấm dứt trong các trường hợp sau:--%>
                        <%--1. Hai bên thỏa thuận chấm dứt bằng văn bản.--%>
                        <%--2. Một bên vi phạm nghiêm trọng các điều khoản hợp đồng và không khắc phục trong vòng 15 ngày sau khi nhận được thông báo bằng văn bản.--%>
                        <%--3. Khách hàng không thanh toán quá 45 ngày so với thời hạn quy định.--%>
                        <%--4. Freelancer không thể hoàn thành công việc sau khi đã gia hạn 30 ngày so với thời hạn ban đầu.</textarea>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Thanh toán khi chấm dứt sớm</label>--%>
                        <%--                                <textarea class="form-control" name="early_termination_payment" rows="3" placeholder="Mô tả chính sách thanh toán khi chấm dứt sớm...">Nếu hợp đồng bị chấm dứt sớm:--%>
                        <%--1. Khách hàng phải thanh toán cho tất cả công việc đã hoàn thành tính đến thời điểm chấm dứt.--%>
                        <%--2. Nếu chấm dứt do lỗi của khách hàng, khách hàng phải thanh toán thêm 20% giá trị còn lại của hợp đồng.--%>
                        <%--3. Nếu chấm dứt do lỗi của freelancer, freelancer phải hoàn trả các khoản đã nhận cho phần công việc chưa hoàn thành.</textarea>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Thông báo chấm dứt hợp đồng</label>--%>
                        <%--                                <select class="form-select" name="termination_notice">--%>
                        <%--                                    <option value="7">7 ngày trước bằng văn bản</option>--%>
                        <%--                                    <option value="14" selected>14 ngày trước bằng văn bản</option>--%>
                        <%--                                    <option value="30">30 ngày trước bằng văn bản</option>--%>
                        <%--                                </select>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <%--                        <div class="form-section">--%>
                        <%--                            <div class="section-title">Giải quyết tranh chấp</div>--%>
                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Phương thức giải quyết tranh chấp</label>--%>
                        <%--                                <div class="radio-group">--%>
                        <%--                                    <div class="radio-options">--%>
                        <%--                                        <div class="radio-option">--%>
                        <%--                                            <input type="radio" id="dispute_mediation" name="dispute_resolution" value="mediation" checked class="radio-input">--%>
                        <%--                                            <label for="dispute_mediation" class="radio-label">Hòa giải qua ProLancer</label>--%>
                        <%--                                        </div>--%>
                        <%--                                        <div class="radio-option">--%>
                        <%--                                            <input type="radio" id="dispute_arbitration" name="dispute_resolution" value="arbitration" class="radio-input">--%>
                        <%--                                            <label for="dispute_arbitration" class="radio-label">Trọng tài</label>--%>
                        <%--                                        </div>--%>
                        <%--                                        <div class="radio-option">--%>
                        <%--                                            <input type="radio" id="dispute_court" name="dispute_resolution" value="court" class="radio-input">--%>
                        <%--                                            <label for="dispute_court" class="radio-label">Tòa án có thẩm quyền</label>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Quy trình giải quyết tranh chấp</label>--%>
                        <%--                                <textarea class="form-control" name="dispute_process" rows="4" placeholder="Mô tả quy trình giải quyết tranh chấp...">1. Các bên sẽ nỗ lực giải quyết mọi tranh chấp thông qua đàm phán trực tiếp trong vòng 15 ngày kể từ khi phát sinh tranh chấp.--%>
                        <%--2. Nếu không thể giải quyết, các bên sẽ yêu cầu hòa giải thông qua dịch vụ hòa giải của ProLancer.--%>
                        <%--3. Nếu hòa giải không thành công trong vòng 30 ngày, vụ việc sẽ được đưa ra trọng tài theo quy tắc của Trung tâm Trọng tài Quốc tế Việt Nam (VIAC).--%>
                        <%--4. Quyết định của trọng tài là cuối cùng và có hiệu lực ràng buộc đối với các bên.</textarea>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Luật áp dụng</label>--%>
                        <%--                                <select class="form-select" name="governing_law">--%>
                        <%--                                    <option value="vietnam" selected>Luật pháp Việt Nam</option>--%>
                        <%--                                    <option value="international">Luật Thương mại Quốc tế</option>--%>
                        <%--                                    <option value="other">Khác (nêu rõ trong phần bổ sung)</option>--%>
                        <%--                                </select>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <%--                        <div class="form-section">--%>
                        <%--                            <div class="section-title">Điều khoản bổ sung</div>--%>

                        <%--                            <div class="term-box">--%>
                        <%--                                <button type="button" class="remove-term">×</button>--%>
                        <%--                                <div class="form-group">--%>
                        <%--                                    <label class="form-label">Tiêu đề điều khoản</label>--%>
                        <%--                                    <input type="text" class="form-control" name="additional_term_title_1" value="Quyền xem xét và yêu cầu sửa đổi">--%>
                        <%--                                </div>--%>
                        <%--                                <div class="form-group">--%>
                        <%--                                    <label class="form-label">Nội dung điều khoản</label>--%>
                        <%--                                    <textarea class="form-control" name="additional_term_content_1" rows="3">Khách hàng có quyền xem xét và yêu cầu sửa đổi trong vòng 7 ngày làm việc sau khi nhận được bản giao sản phẩm. Mỗi giai đoạn được phép yêu cầu tối đa 3 lần chỉnh sửa nhỏ nằm trong phạm vi ban đầu của dự án.</textarea>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="term-box">--%>
                        <%--                                <button type="button" class="remove-term">×</button>--%>
                        <%--                                <div class="form-group">--%>
                        <%--                                    <label class="form-label">Tiêu đề điều khoản</label>--%>
                        <%--                                    <input type="text" class="form-control" name="additional_term_title_2" value="Quy định về thay đổi phạm vi dự án">--%>
                        <%--                                </div>--%>
                        <%--                                <div class="form-group">--%>
                        <%--                                    <label class="form-label">Nội dung điều khoản</label>--%>
                        <%--                                    <textarea class="form-control" name="additional_term_content_2" rows="3">Bất kỳ thay đổi nào vượt quá phạm vi ban đầu của dự án sẽ được coi là yêu cầu thay đổi và cần có sự thống nhất bằng văn bản của cả hai bên. Các thay đổi này có thể dẫn đến điều chỉnh về thời gian và chi phí dự án.</textarea>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>

                        <%--                            <button type="button" class="add-term-btn">--%>
                        <%--                                <i class="fas fa-plus"></i> Thêm điều khoản bổ sung--%>
                        <%--                            </button>--%>
                        <%--                        </div>--%>

                        <%--                        <div class="form-section">--%>
                        <%--                            <div class="section-title">Tài liệu đính kèm</div>--%>
                        <%--                            <div class="file-upload">--%>
                        <%--                                <div class="file-input-container">--%>
                        <%--                                    <button type="button" class="file-upload-btn">--%>
                        <%--                                        <i class="fas fa-upload"></i> Tải lên tài liệu đính kèm--%>
                        <%--                                    </button>--%>
                        <%--                                    <input type="file" class="file-input" multiple>--%>
                        <%--                                </div>--%>
                        <%--                                <div class="file-name">Chưa có tài liệu nào được chọn</div>--%>
                        <%--                                <p class="info-text"><i class="fas fa-info-circle"></i> Hỗ trợ định dạng PDF, DOCX, JPG, PNG (tối đa 5MB/file)</p>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="form-group">--%>
                        <%--                                <label class="form-label">Ghi chú về tài liệu đính kèm</label>--%>
                        <%--                                <textarea class="form-control" name="attachment_notes" rows="2" placeholder="Mô tả về tài liệu đính kèm..."></textarea>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <%--                        <div class="form-section">--%>
                        <%--                            <div class="section-title">Xác nhận điều khoản</div>--%>
                        <%--                            <div class="summary-box">--%>
                        <%--                                <div class="summary-title">Tóm tắt điều khoản chính</div>--%>
                        <%--                                <div class="summary-item">--%>
                        <%--                                    <div class="summary-label">Thời gian bảo hành:</div>--%>
                        <%--                                    <div class="summary-value">3 tháng</div>--%>
                        <%--                                </div>--%>
                        <%--                                <div class="summary-item">--%>
                        <%--                                    <div class="summary-label">Quyền sở hữu:</div>--%>
                        <%--                                    <div class="summary-value">Khách hàng sở hữu toàn bộ</div>--%>
                        <%--                                </div>--%>
                        <%--                                <div class="summary-item">--%>
                        <%--                                    <div class="summary-label">Thỏa thuận bảo mật:</div>--%>
                        <%--                                    <div class="summary-value">Áp dụng (2 năm)</div>--%>
                        <%--                                </div>--%>
                        <%--                                <div class="summary-item">--%>
                        <%--                                    <div class="summary-label">Phương thức thanh toán:</div>--%>
                        <%--                                    <div class="summary-value">Qua ký quỹ ProLancer</div>--%>
                        <%--                                </div>--%>
                        <%--                                <div class="summary-item">--%>
                        <%--                                    <div class="summary-label">Giải quyết tranh chấp:</div>--%>
                        <%--                                    <div class="summary-value">Hòa giải qua ProLancer</div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="checkbox-group" style="margin-top: 20px;">--%>
                        <%--                                <input type="checkbox" id="terms_agreement" name="terms_agreement" class="checkbox-input" required>--%>
                        <%--                                <label for="terms_agreement" class="checkbox-label">Tôi đã đọc và đồng ý với tất cả các điều khoản trên</label>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <div class="btn-container">
                            <button onclick="history.back()" type="button" class="btn-a btn-outline">Quay lại</button>
                            <button type="submit" class="btn-a">Tiếp tục</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </div>
</section>
<%@include file="includes/footer.jsp"%>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Form validation setup
        const form = document.querySelector('form');

        // Custom validation rules
        const validationRules = {
            // Bên A (Employer) validation
            employer_name: {
                required: true,
                minLength: 2,
                maxLength: 100,
                notOnlyNumbers: true,
                noSpecialChars: true,
                message: 'Tên Bên A phải từ 2-100 ký tự, không thể chỉ là số và không chứa ký tự đặc biệt'
            },
            employer_address: {
                required: false,
                maxLength: 200,
                notOnlyNumbers: true,
                message: 'Địa chỉ không được vượt quá 200 ký tự và không thể chỉ là số'
            },
            employer_representative: {
                required: false,
                maxLength: 100,
                notOnlyNumbers: true,
                noSpecialChars: true,
                message: 'Tên đại diện không được vượt quá 100 ký tự, không thể chỉ là số và không chứa ký tự đặc biệt'
            },
            employer_id_number: {
                required: true,
                pattern: /^(\d{9}|\d{12})$/,
                message: 'Số CMND phải có 9 số hoặc CCCD phải có 12 số'
            },
            employer_id_date: {
                required: true,
                pastDate: true,
                message: 'Ngày cấp không hợp lệ hoặc trong tương lai'
            },
            employer_id_place: {
                required: true,
                maxLength: 100,
                notOnlyNumbers: true,
                message: 'Nơi cấp không được để trống, không thể chỉ là số và không vượt quá 100 ký tự'
            },
            employer_tax_code: {
                required: false,
                pattern: /^\d{10}(\-\d{3})?$/,
                message: 'Mã số thuế không hợp lệ (phải có 10 số hoặc 10-3 số)'
            },
            employer_birth_date: {
                required: true,
                adultAge: true,
                message: 'Ngày sinh không hợp lệ hoặc chưa đủ 18 tuổi'
            },
            employer_contact_address: {
                required: true,
                maxLength: 200,
                notOnlyNumbers: true,
                message: 'Địa chỉ liên hệ không được để trống, không thể chỉ là số và không vượt quá 200 ký tự'
            },
            employer_phone: {
                required: true,
                pattern: /^(0|\+84)[0-9]{9,10}$/,
                message: 'Số điện thoại không hợp lệ, phải bắt đầu bằng 0 hoặc +84 và có 10-11 số'
            },
            employer_email: {
                required: true,
                pattern: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
                message: 'Email không hợp lệ'
            },

            // Bên B (Freelancer) validation
            freelancer_name: {
                required: true,
                minLength: 2,
                maxLength: 100,
                notOnlyNumbers: true,
                noSpecialChars: true,
                message: 'Tên Bên B phải từ 2-100 ký tự, không thể chỉ là số và không chứa ký tự đặc biệt'
            },
            freelancer_representative: {
                required: false,
                maxLength: 100,
                notOnlyNumbers: true,
                noSpecialChars: true,
                message: 'Tên đại diện không được vượt quá 100 ký tự, không thể chỉ là số và không chứa ký tự đặc biệt'
            },
            freelancer_id_number: {
                required: true,
                pattern: /^(\d{9}|\d{12})$/,
                message: 'Số CMND phải có 9 số hoặc CCCD phải có 12 số'
            },
            freelancer_id_date: {
                required: true,
                pastDate: true,
                message: 'Ngày cấp không hợp lệ hoặc trong tương lai'
            },
            freelancer_id_place: {
                required: true,
                maxLength: 100,
                notOnlyNumbers: true,
                message: 'Nơi cấp không được để trống, không thể chỉ là số và không vượt quá 100 ký tự'
            },
            freelancer_birth_date: {
                required: true,
                adultAge: true,
                message: 'Ngày sinh không hợp lệ hoặc chưa đủ 18 tuổi'
            },
            freelancer_contact_address: {
                required: true,
                maxLength: 200,
                notOnlyNumbers: true,
                message: 'Địa chỉ liên hệ không được để trống, không thể chỉ là số và không vượt quá 200 ký tự'
            },
            freelancer_phone: {
                required: true,
                pattern: /^(0|\+84)[0-9]{9,10}$/,
                message: 'Số điện thoại không hợp lệ, phải bắt đầu bằng 0 hoặc +84 và có 10-11 số'
            },
            freelancer_email: {
                required: true,
                pattern: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
                message: 'Email không hợp lệ'
            },

            // Nội dung công việc validation
            job_goal: {
                required: true,
                minLength: 10,
                maxLength: 1000,
                message: 'Mô tả công việc phải từ 10-1000 ký tự'
            },
            job_requirement: {
                required: true,
                minLength: 10,
                maxLength: 1000,
                message: 'Yêu cầu công việc phải từ 10-1000 ký tự'
            },

            // Thời gian và địa điểm validation
            start_date: {
                required: true,
                futureDate: true,
                message: 'Ngày bắt đầu phải là ngày trong tương lai'
            },
            end_date: {
                required: true,
                afterDate: 'start_date',
                message: 'Ngày kết thúc phải sau ngày bắt đầu'
            },
            work_location: {
                required: true,
                maxLength: 200,
                notOnlyNumbers: true,
                message: 'Địa điểm thực hiện không được để trống, không thể chỉ là số và không vượt quá 200 ký tự'
            },

            // Phí dịch vụ và thanh toán validation
            service_fee: {
                required: true,
                min: 100000,
                max: 1000000000,
                positiveNumber: true,
                message: 'Phí dịch vụ phải từ 100,000 đến 1,000,000,000 VNĐ và không được là số âm'
            },
            employer_deposit: {
                required: true,
                min: 0,
                positiveNumber: true,
                lessThanOrEqualField: 'service_fee',
                message: 'Đặt cọc của Bên A phải lớn hơn hoặc bằng 0 và không được vượt quá tổng phí dịch vụ'
            },
            employer_deposit_text: {
                required: true,
                maxLength: 200,
                message: 'Số tiền bằng chữ không được để trống và không vượt quá 200 ký tự'
            },
            employer_deposit_date: {
                required: function() {
                    return document.querySelector('[name="employer_deposit"]').value > 0;
                },
                futureOrToday: true,
                message: 'Ngày đặt cọc phải là ngày hiện tại hoặc trong tương lai'
            },
            freelancer_deposit: {
                required: true,
                min: 0,
                positiveNumber: true,
                lessThanOrEqualField: 'service_fee',
                message: 'Đặt cọc của Bên B phải lớn hơn hoặc bằng 0 và không được vượt quá tổng phí dịch vụ'
            },
            freelancer_deposit_text: {
                required: function() {
                    return document.querySelector('[name="freelancer_deposit"]').value > 0;
                },
                maxLength: 200,
                message: 'Số tiền bằng chữ không được để trống và không vượt quá 200 ký tự'
            },
            freelancer_deposit_date: {
                required: function() {
                    return document.querySelector('[name="freelancer_deposit"]').value > 0;
                },
                futureOrToday: true,
                message: 'Ngày đặt cọc phải là ngày hiện tại hoặc trong tương lai'
            }
        };

        // Validate function
        function validateForm() {
            let isValid = true;
            const errorElements = document.querySelectorAll('.error-message');

            // Remove existing error messages
            errorElements.forEach(element => {
                element.remove();
            });

            // Validate each field
            for (const fieldName in validationRules) {
                const field = document.querySelector(`[name="${fieldName}"]`);
                if (!field) continue;

                const rules = validationRules[fieldName];
                const value = field.value.trim();

                // Check if field is conditionally required
                const isRequired = typeof rules.required === 'function' ? rules.required() : rules.required;

                // Check required fields
                if (isRequired && value === '') {
                    showError(field, rules.message || 'Trường này là bắt buộc');
                    isValid = false;
                    continue;
                }

                // Skip validation for empty non-required fields
                if (value === '' && !isRequired) continue;

                // Check minLength
                if (rules.minLength && value.length < rules.minLength) {
                    showError(field, rules.message);
                    isValid = false;
                    continue;
                }

                // Check maxLength
                if (rules.maxLength && value.length > rules.maxLength) {
                    showError(field, rules.message);
                    isValid = false;
                    continue;
                }

                // Check pattern
                if (rules.pattern && !rules.pattern.test(value)) {
                    showError(field, rules.message);
                    isValid = false;
                    continue;
                }

                // Check if value is only numbers when it shouldn't be
                if (rules.notOnlyNumbers && /^\d+$/.test(value)) {
                    showError(field, rules.message);
                    isValid = false;
                    continue;
                }

                // Check for special characters when not allowed
                if (rules.noSpecialChars && /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(value)) {
                    showError(field, rules.message);
                    isValid = false;
                    continue;
                }

                // Check if value is a positive number
                if (rules.positiveNumber && parseFloat(value) < 0) {
                    showError(field, rules.message);
                    isValid = false;
                    continue;
                }

                // Check min value
                if (rules.min !== undefined && parseFloat(value) < rules.min) {
                    showError(field, rules.message);
                    isValid = false;
                    continue;
                }

                // Check max value
                if (rules.max !== undefined && parseFloat(value) > rules.max) {
                    showError(field, rules.message);
                    isValid = false;
                    continue;
                }

                // Check less than another field
                if (rules.lessThanField) {
                    const compareField = document.querySelector(`[name="${rules.lessThanField}"]`);
                    if (compareField && parseFloat(value) >= parseFloat(compareField.value)) {
                        showError(field, rules.message);
                        isValid = false;
                        continue;
                    }
                }

                // Check less than or equal to another field
                if (rules.lessThanOrEqualField) {
                    const compareField = document.querySelector(`[name="${rules.lessThanOrEqualField}"]`);
                    if (compareField && parseFloat(value) > parseFloat(compareField.value)) {
                        showError(field, rules.message);
                        isValid = false;
                        continue;
                    }
                }

                // Check date is in the past
                if (rules.pastDate && new Date(value) > new Date()) {
                    showError(field, rules.message);
                    isValid = false;
                    continue;
                }

                // Check date is in the future
                if (rules.futureDate) {
                    const today = new Date();
                    today.setHours(0, 0, 0, 0);

                    if (new Date(value) < today) {
                        showError(field, rules.message);
                        isValid = false;
                        continue;
                    }
                }

                // Check date is future or today
                if (rules.futureOrToday) {
                    const today = new Date();
                    today.setHours(0, 0, 0, 0);

                    if (new Date(value) < today) {
                        showError(field, rules.message);
                        isValid = false;
                        continue;
                    }
                }

                // Check date is past or today
                if (rules.pastOrToday) {
                    const today = new Date();
                    today.setHours(23, 59, 59, 999);

                    if (new Date(value) > today) {
                        showError(field, rules.message);
                        isValid = false;
                        continue;
                    }
                }

                // Check if date is after another date
                if (rules.afterDate) {
                    const compareField = document.querySelector(`[name="${rules.afterDate}"]`);
                    if (compareField && new Date(value) <= new Date(compareField.value)) {
                        showError(field, rules.message);
                        isValid = false;
                        continue;
                    }
                }

                // Check if person is an adult (18+ years old)
                if (rules.adultAge) {
                    const birthDate = new Date(value);
                    const today = new Date();
                    const age = today.getFullYear() - birthDate.getFullYear();
                    const monthDiff = today.getMonth() - birthDate.getMonth();

                    if (age < 18 || (age === 18 && monthDiff < 0) ||
                        (age === 18 && monthDiff === 0 && today.getDate() < birthDate.getDate())) {
                        showError(field, rules.message);
                        isValid = false;
                        continue;
                    }
                }
            }

            return isValid;
        }

        // Function to show error message
        function showError(field, message) {
            const errorElement = document.createElement('div');
            errorElement.className = 'error-message';
            errorElement.style.color = 'red';
            errorElement.style.fontSize = '12px';
            errorElement.style.marginTop = '5px';
            errorElement.textContent = message;

            field.parentNode.appendChild(errorElement);
            field.classList.add('is-invalid');
        }

        // Add form submit event listener
        if (form) {
            form.addEventListener('submit', function(e) {
                if (!validateForm()) {
                    e.preventDefault();
                    // Scroll to first error
                    const firstError = document.querySelector('.error-message');
                    if (firstError) {
                        firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    }
                }
            });
        }

        // Add real-time validation on blur
        const formInputs = document.querySelectorAll('input, textarea');
        formInputs.forEach(input => {
            input.addEventListener('blur', function() {
                // Remove existing error for this field
                const existingError = input.parentNode.querySelector('.error-message');
                if (existingError) {
                    existingError.remove();
                }
                input.classList.remove('is-invalid');

                // Validate just this field
                const fieldName = input.getAttribute('name');
                if (fieldName && validationRules[fieldName]) {
                    const rules = validationRules[fieldName];
                    const value = input.value.trim();

                    // Check if field is conditionally required
                    const isRequired = typeof rules.required === 'function' ? rules.required() : rules.required;

                    // Check required fields
                    if (isRequired && value === '') {
                        showError(input, rules.message || 'Trường này là bắt buộc');
                        return;
                    }

                    // Skip validation for empty non-required fields
                    if (value === '' && !isRequired) return;

                    // Check minLength
                    if (rules.minLength && value.length < rules.minLength) {
                        showError(input, rules.message);
                        return;
                    }

                    // Check maxLength
                    if (rules.maxLength && value.length > rules.maxLength) {
                        showError(input, rules.message);
                        return;
                    }

                    // Check pattern
                    if (rules.pattern && !rules.pattern.test(value)) {
                        showError(input, rules.message);
                        return;
                    }

                    // Check if value is only numbers when it shouldn't be
                    if (rules.notOnlyNumbers && /^\d+$/.test(value)) {
                        showError(input, rules.message);
                        return;
                    }

                    // Check for special characters when not allowed
                    if (rules.noSpecialChars && /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(value)) {
                        showError(input, rules.message);
                        return;
                    }

                    // Check if value is a positive number
                    if (rules.positiveNumber && parseFloat(value) < 0) {
                        showError(input, rules.message);
                        return;
                    }

                    // Check min value
                    if (rules.min !== undefined && parseFloat(value) < rules.min) {
                        showError(input, rules.message);
                        return;
                    }

                    // Check max value
                    if (rules.max !== undefined && parseFloat(value) > rules.max) {
                        showError(input, rules.message);
                        return;
                    }

                    // Check less than another field
                    if (rules.lessThanField) {
                        const compareField = document.querySelector(`[name="${rules.lessThanField}"]`);
                        if (compareField && parseFloat(value) >= parseFloat(compareField.value)) {
                            showError(input, rules.message);
                            return;
                        }
                    }

                    // Check less than or equal to another field
                    if (rules.lessThanOrEqualField) {
                        const compareField = document.querySelector(`[name="${rules.lessThanOrEqualField}"]`);
                        if (compareField && parseFloat(value) > parseFloat(compareField.value)) {
                            showError(input, rules.message);
                            return;
                        }
                    }

                    // Check date is in the past
                    if (rules.pastDate && new Date(value) > new Date()) {
                        showError(input, rules.message);
                        return;
                    }

                    // Check date is in the future
                    if (rules.futureDate) {
                        const today = new Date();
                        today.setHours(0, 0, 0, 0);

                        if (new Date(value) < today) {
                            showError(input, rules.message);
                            return;
                        }
                    }

                    // Check date is future or today
                    if (rules.futureOrToday) {
                        const today = new Date();
                        today.setHours(0, 0, 0, 0);

                        if (new Date(value) < today) {
                            showError(input, rules.message);
                            return;
                        }
                    }

                    // Check date is past or today
                    if (rules.pastOrToday) {
                        const today = new Date();
                        today.setHours(23, 59, 59, 999);

                        if (new Date(value) > today) {
                            showError(input, rules.message);
                            return;
                        }
                    }

                    // Check if date is after another date
                    if (rules.afterDate) {
                        const compareField = document.querySelector(`[name="${rules.afterDate}"]`);
                        if (compareField && compareField.value && new Date(value) <= new Date(compareField.value)) {
                            showError(input, rules.message);
                            return;
                        }
                    }

                    // Check if person is an adult (18+ years old)
                    if (rules.adultAge) {
                        const birthDate = new Date(value);
                        const today = new Date();
                        const age = today.getFullYear() - birthDate.getFullYear();
                        const monthDiff = today.getMonth() - birthDate.getMonth();

                        if (age < 18 || (age === 18 && monthDiff < 0) ||
                            (age === 18 && monthDiff === 0 && today.getDate() < birthDate.getDate())) {
                            showError(input, rules.message);
                            return;
                        }
                    }
                }
            });
        });

        // Add CSS styles
        const style = document.createElement('style');
        style.textContent = `
        .form-control.is-invalid {
            border-color: #dc3545;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right calc(0.375em + 0.1875rem) center;
            background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
        }

        .error-message {
            color: #dc3545;
            font-size: 12px;
            margin-top: 5px;
        }
    `;
        document.head.appendChild(style);

        // Add dependency between fields
        // When service_fee changes, validate employer_deposit and freelancer_deposit
        const serviceFeeField = document.querySelector('[name="service_fee"]');
        const employerDepositField = document.querySelector('[name="employer_deposit"]');
        const freelancerDepositField = document.querySelector('[name="freelancer_deposit"]');
        if (serviceFeeField) {
            serviceFeeField.addEventListener('change', function() {
                if (employerDepositField) {
                    const event = new Event('blur');
                    employerDepositField.dispatchEvent(event);
                }
                if (freelancerDepositField) {
                    const event = new Event('blur');
                    freelancerDepositField.dispatchEvent(event);
                }
            });
        }

        // When employer_deposit changes, validate employer_deposit_date
        const employerDepositDateField = document.querySelector('[name="employer_deposit_date"]');
        if (employerDepositField && employerDepositDateField) {
            employerDepositField.addEventListener('change', function() {
                const event = new Event('blur');
                employerDepositDateField.dispatchEvent(event);
            });
        }

        // When freelancer_deposit changes, validate freelancer_deposit_date
        const freelancerDepositDateField = document.querySelector('[name="freelancer_deposit_date"]');
        if (freelancerDepositField && freelancerDepositDateField) {
            freelancerDepositField.addEventListener('change', function() {
                const event = new Event('blur');
                freelancerDepositDateField.dispatchEvent(event);
            });
        }

        // When start_date changes, validate end_date
        const startDateField = document.querySelector('[name="start_date"]');
        const endDateField = document.querySelector('[name="end_date"]');
        if (startDateField && endDateField) {
            startDateField.addEventListener('change', function() {
                const event = new Event('blur');
                endDateField.dispatchEvent(event);
            });
        }
    });
</script>

<script>
    // JavaScript để xử lý tương tác người dùng
    document.addEventListener('DOMContentLoaded', function() {
        // Thêm điều khoản bổ sung
        const addTermBtn = document.querySelector('.add-term-btn');
        const termsContainer = addTermBtn.parentElement;
        let termCount = document.querySelectorAll('.term-box').length + 1;

        addTermBtn.addEventListener('click', function() {
            const newTermBox = document.createElement('div');
            newTermBox.className = 'term-box';
            newTermBox.innerHTML = `
                    <button type="button" class="remove-term">×</button>
                    <div class="form-group">
                        <label class="form-label">Tiêu đề điều khoản</label>
                        <input type="text" class="form-control" name="additional_term_title_${termCount}" placeholder="Nhập tiêu đề điều khoản">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Nội dung điều khoản</label>
                        <textarea class="form-control" name="additional_term_content_${termCount}" rows="3" placeholder="Nhập nội dung điều khoản chi tiết..."></textarea>
                    </div>
                `;

            termsContainer.insertBefore(newTermBox, addTermBtn);
            termCount++;

            // Thêm sự kiện xóa cho nút xóa mới
            const removeBtn = newTermBox.querySelector('.remove-term');
            removeBtn.addEventListener('click', function() {
                newTermBox.remove();
            });
        });

        // Xử lý nút xóa điều khoản
        document.querySelectorAll('.remove-term').forEach(btn => {
            btn.addEventListener('click', function() {
                this.closest('.term-box').remove();
            });
        });

        // Xử lý tải lên tài liệu
        const fileInput = document.querySelector('.file-input');
        const fileName = document.querySelector('.file-name');

        fileInput.addEventListener('change', function() {
            if (this.files.length > 0) {
                let fileNames = '';
                for (let i = 0; i < this.files.length; i++) {
                    fileNames += this.files[i].name + (i < this.files.length - 1 ? ', ' : '');
                }
                fileName.textContent = fileNames;
            } else {
                fileName.textContent = 'Chưa có tài liệu nào được chọn';
            }
        });

        // Xử lý form submit
        const contractForm = document.getElementById('contract-terms-form');
        contractForm.addEventListener('submit', function(e) {
            e.preventDefault();

            // Kiểm tra đồng ý điều khoản
            const termsAgreement = document.getElementById('terms_agreement');
            if (!termsAgreement.checked) {
                alert('Vui lòng đọc và đồng ý với các điều khoản để tiếp tục');
                return;
            }

            // Chuyển đến bước tiếp theo (ký kết)
            alert('Đã lưu điều khoản. Chuyển đến bước ký kết hợp đồng.');
            // Điều hướng đến trang ký kết (trong thực tế)
            // window.location.href = 'contract-signing.html';
        });

        // Cập nhật tóm tắt khi thay đổi các trường chính
        const warrantyPeriod = document.querySelector('select[name="warranty_period"]');
        const ownershipOptions = document.querySelectorAll('input[name="ownership"]');
        const ndaRequired = document.getElementById('nda_required');
        const ndaDuration = document.querySelector('select[name="nda_duration"]');
        const paymentMethod = document.querySelectorAll('input[name="payment_method"]');
        const disputeResolution = document.querySelectorAll('input[name="dispute_resolution"]');

        const updateSummary = function() {
            // Cập nhật thời gian bảo hành
            document.querySelector('.summary-item:nth-child(1) .summary-value').textContent =
                warrantyPeriod.options[warrantyPeriod.selectedIndex].text;

            // Cập nhật quyền sở hữu
            let ownershipValue = '';
            ownershipOptions.forEach(option => {
                if (option.checked) {
                    if (option.value === 'client') ownershipValue = 'Khách hàng sở hữu toàn bộ';
                    else if (option.value === 'shared') ownershipValue = 'Sở hữu chung';
                    else if (option.value === 'freelancer') ownershipValue = 'Freelancer giữ bản quyền';
                }
            });
            document.querySelector('.summary-item:nth-child(2) .summary-value').textContent = ownershipValue;

            // Cập nhật thỏa thuận bảo mật
            let ndaValue = ndaRequired.checked ?
                `Áp dụng (${ndaDuration.options[ndaDuration.selectedIndex].text})` : 'Không áp dụng';
            document.querySelector('.summary-item:nth-child(3) .summary-value').textContent = ndaValue;

            // Cập nhật phương thức thanh toán
            let paymentValue = '';
            paymentMethod.forEach(option => {
                if (option.checked) {
                    if (option.value === 'escrow') paymentValue = 'Qua ký quỹ ProLancer';
                    else if (option.value === 'direct') paymentValue = 'Thanh toán trực tiếp';
                }
            });
            document.querySelector('.summary-item:nth-child(4) .summary-value').textContent = paymentValue;

            // Cập nhật giải quyết tranh chấp
            let disputeValue = '';
            disputeResolution.forEach(option => {
                if (option.checked) {
                    if (option.value === 'mediation') disputeValue = 'Hòa giải qua ProLancer';
                    else if (option.value === 'arbitration') disputeValue = 'Trọng tài';
                    else if (option.value === 'court') disputeValue = 'Tòa án có thẩm quyền';
                }
            });
            document.querySelector('.summary-item:nth-child(5) .summary-value').textContent = disputeValue;
        };

        // Thêm sự kiện thay đổi cho các trường này
        warrantyPeriod.addEventListener('change', updateSummary);
        ownershipOptions.forEach(option => option.addEventListener('change', updateSummary));
        ndaRequired.addEventListener('change', updateSummary);
        ndaDuration.addEventListener('change', updateSummary);
        paymentMethod.forEach(option => option.addEventListener('change', updateSummary));
        disputeResolution.forEach(option => option.addEventListener('change', updateSummary));
    });
</script>
</body>
</html>