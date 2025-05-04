<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobTrans</title>
    <link rel="stylesheet" href="css/sign-contract.css">
    <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="session" />
    <jsp:useBean id="now" class="java.util.Date" />

    <style>
        .btn-a {
            padding: 12px 24px;
            border-radius: var(--radius);
            font-weight: 500;
            font-size: 18px;
            cursor: pointer;
            transition: var(--transition);
            border: none;
            outline: none;
        }

        .btn-outline {
            background-color: transparent;
            border: 1px solid var(--primary-color);
            color: var(--primary-color);
        }

        .btn-outline:hover {
            background-color: rgba(39, 64, 179, 0.05);
        }

        .btn-reject {
            padding: 12px 24px;
            border-radius: var(--radius);
            font-weight: 500;
            font-size: 18px;
            cursor: pointer;
            background-color: transparent;
            border: 1px solid var(--danger-color);
            color: var(--danger-color);
        }

        .btn-reject:hover {
            background-color: var(--danger-color);
            color: #FFFFFF;
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
                    <div class="contract-status status-signing">${contract.status}</div>
                </div>

                <div class="contract-progress">
                    <div class="progress-step completed">
                        <div class="step-number"></div>
                        <div class="step-label">Thông tin dự án</div>
                    </div>
                    <div class="progress-step active">
                        <div class="step-number">2</div>
                        <div class="step-label">Ký kết</div>
                    </div>
                    <div class="progress-step">
                        <div class="step-number">3</div>
                        <div class="step-label">Hoàn thành</div>
                    </div>
                </div>

                <div class="contract-body">
                    <form id="contract-signing-form" action="contract" method="post">
                        <input type="hidden" name="action" value="b-add-signature">
                        <input type="hidden" name="contractId" value="${contract.contractId}">


                        <div class="form-section">
                            <div class="section-title">Tóm tắt hợp đồng</div>

                            <div class="contract-summary">
                                <div class="summary-header">Thông tin chung</div>

                                <div class="summary-section">
                                    <div class="summary-section-title">Thông tin dự án</div>
                                    <div class="summary-item">
                                        <div class="summary-label">Tên dự án:</div>
                                        <div class="summary-value">${job.jobTitle}</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Mô tả công việc:</div>
                                        <div class="summary-value">${contract.jobGoal}</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Yêu cầu cho công việc:</div>
                                        <div class="summary-value">${contract.jobRequirement}</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Ngày bắt đầu:</div>
                                        <div class="summary-value">${contract.startDate}</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Ngày kết thúc:</div>
                                        <div class="summary-value">${contract.endDate}</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Địa điểm làm việc:</div>
                                        <div class="summary-value">${contract.jobAddress}</div>
                                    </div>
                                </div>

                                <div class="summary-section">
                                    <div class="summary-section-title">Giá trị hợp đồng</div>
                                    <div class="summary-item">
                                        <div class="summary-label">Tổng giá trị:</div>
                                        <div class="summary-value"><fmt:formatNumber value="${contract.jobFee}" type="number" /> VNĐ</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Lịch thanh toán:</div>
                                        <div class="summary-value">Đặt cọc + Thanh toán lần cuối sau khi bàn giao dự án</div>
                                    </div>
                                </div>

                                <div class="summary-section">
                                    <div class="summary-section-title">Thanh khoản của 2 bên</div>
                                    <div class="summary-item">
                                        <div class="summary-label">Số tiền bên A đặt cọc (Bằng số):</div>
                                        <div class="summary-value"><fmt:formatNumber value="${contract.jobDepositA}" type="number" /> VNĐ</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Số tiền A đặt cọc (Bằng chữ):</div>
                                        <div class="summary-value">${contract.jobDepositAText}</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Ngày bên A đặt cọc:</div>
                                        <div class="summary-value">${contract.jobDepositADate}</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Số tiền bên B đặt cọc (Bằng số):</div>
                                        <div class="summary-value"><fmt:formatNumber value="${contract.jobDepositB}" type="number" /> VNĐ</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Số tiền B đặt cọc (Bằng chữ):</div>
                                        <div class="summary-value">${contract.jobDepositBText}</div>
                                    </div>
                                    <div class="summary-item">
                                        <div class="summary-label">Ngày bên B đặt cọc:</div>
                                        <div class="summary-value">${contract.jobDepositBDate}</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-section">
                            <div class="section-title">Thông tin các bên</div>

                            <div class="contract-parties">
                                <div class="party-info">
                                    <h3 style="font-size: 20px; margin-bottom: 20px">Bên A (Employer - Người sử dụng lao động)</h3>
                                    <p><strong>Tên:</strong> ${contract.aName}</p>
                                    <c:if test="${not empty contract.aRepresentative}">
                                        <p><strong>Đại diện:</strong> ${contract.aRepresentative}</p>
                                    </c:if>
                                    <p><strong>Số CCCD:</strong> ${contract.aIdentity}</p>
                                    <p><strong>Cấp ngày:</strong> ${contract.aIdentityDate}</p>
                                    <p><strong>Cấp tại:</strong> ${contract.aIdentityAddress}</p>
                                    <p><strong>Mã số thuế:</strong> ${contract.aTaxCode}</p>
                                    <p><strong>Sinh ngày:</strong> ${contract.aBirthday}</p>
                                    <p><strong>Địa chỉ:</strong> ${contract.aAddress}</p>
                                    <p><strong>Email:</strong> ${contract.aEmail}</p>
                                    <p><strong>Điện thoại:</strong> ${contract.aPhoneNumber}</p>
                                </div>
                                <div class="party-info">
                                    <h3 style="font-size: 20px; margin-bottom: 20px">Bên B (Freelancer - Người lao động)</h3>
                                    <p><strong>Tên:</strong> ${contract.bName}</p>
                                    <c:if test="${not empty contract.bRepresentative}">
                                        <p><strong>Đại diện:</strong> ${contract.bRepresentative}</p>
                                    </c:if>
                                    <p><strong>Số CCCD:</strong> ${contract.bIdentity}</p>
                                    <p><strong>Cấp ngày:</strong> ${contract.bIdentityDate}</p>
                                    <p><strong>Cấp tại:</strong> ${contract.bIdentityAddress}</p>
                                    <p><strong>Sinh ngày:</strong> ${contract.bBirthday}</p>
                                    <p><strong>Địa chỉ:</strong> ${contract.bAddress}</p>
                                    <p><strong>Email:</strong> ${contract.bEmail}</p>
                                    <p><strong>Điện thoại:</strong> ${contract.bPhoneNumber}</p>
                                </div>
                            </div>
                        </div>

                        <!-- Rest of your JSP content remains the same, just replace session attributes with request attributes -->
                        <!-- For example: -->
                        <div class="form-section">
                            <div class="section-title">Xem xét nội dung hợp đồng</div>
                            <div class="document-preview">
                                <div class="document-icon">📄</div>
                                <div class="info-value">Hợp đồng dịch vụ ${job.jobTitle}</div>
                                <div style="margin-top: 20px;">
                                    <a class="btn-a btn-outline" id="openPopupBtn" style="text-decoration: none">Xem toàn bộ hợp đồng</a>
                                </div>
                            </div>
                            <div class="checkbox-group">
                                <input type="checkbox" class="checkbox-input" id="agreement" required>
                                <label class="checkbox-label" for="agreement">Tôi đã đọc và đồng ý với các điều khoản trong hợp đồng</label>
                            </div>
                            <div class="checkbox-group">
                                <input type="checkbox" class="checkbox-input" id="confirmation" required>
                                <label class="checkbox-label" for="confirmation">Tôi xác nhận thông tin cung cấp là chính xác và đầy đủ</label>
                            </div>
                        </div>

                        <c:if test="${account.signature != null}">
                            <div class="form-section">
                                <div class="section-title">Chữ ký của các bên</div>
                                <div class="signature-container">
                                    <div class="signature-box">
                                        <h4 class="signature-box-title">Bên A (Bên Thuê)</h4>
                                        <c:if test="${not empty contract.aSignature}">
                                            <div class="signature-canvas-container">
                                                <img class="signature-image" alt="Chữ ký bên thuê" src="${contract.aSignature}">
                                            </div>
                                            <div style="text-align: center">
                                                <div class="signature-date">Ngày ký: </div>
                                                <h6>Họ và tên người kí</h6>
                                                <p style="font-weight: lighter">${contract.aName}</p>
                                            </div>
                                        </c:if>
                                        <c:if test="${empty contract.aSignature}">
                                            <div class="signature-canvas-container">
                                                <p class="signature-placeholder">Chưa có chữ ký</p>
                                            </div>
                                        </c:if>
                                    </div>

                                    <div class="signature-box">
                                        <h4 class="signature-box-title">Bên B (Freelancer)</h4>
                                        <c:if test="${not empty contract.bSignature}">
                                            <div class="signature-canvas-container">
                                                <img class="signature-image" alt="Chữ ký freelancer" src="${contract.bSignature}">
                                            </div>
                                            <div style="text-align: center">
                                                <div class="signature-date">Ngày ký: </div>
                                                <h6>Họ và tên người kí</h6>
                                                <p style="font-weight: lighter">${contract.bName}</p>
                                            </div>
                                        </c:if>
                                        <c:if test="${empty contract.bSignature}">
                                            <div class="signature-canvas-container">
                                                <p class="signature-placeholder">Chưa có chữ ký</p>
                                            </div>
                                        </c:if>
                                    </div>

                                    <div class="signature-box">
                                        <h4 class="signature-box-title">Bên C (Nền tảng JobTrans)</h4>
                                        <div class="signature-canvas-container">
                                            <img class="signature-image" alt="Chữ ký nền tảng JobTrans" src="img/contract/signature-My-Duyen.jpg">
                                        </div>
                                        <div style="text-align: center">
                                            <div class="signature-date">Ngày ký: </div>
                                            <h6>Họ và tên người kí</h6>
                                            <p style="font-weight: lighter">Võ Thị Mỹ Duyên</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="checkbox-group">
                                    <input type="checkbox" class="checkbox-input" id="sign-contract" required>
                                    <label class="checkbox-label" for="sign-contract">Tôi xác nhận đồng ý kí kết hợp đồng và chấp nhận những điều khoản đã nêu ra</label>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${account.signature == null}">
                            <div class="form-section">
                                <div style=" text-align: center; padding: 30px 20px;">
                                    <i class="fas fa-exclamation-circle" style="font-size: 50px; color: #ff9800; margin-bottom: 55px; margin-right: 30px;"></i>
                                    <h3 style="margin-bottom: 10px; color: #555;">Hiện tại bạn chưa có chữ ký</h3>
                                    <p style="color: #777; margin-bottom: 20px;">Hãy tiến hành thêm chữ ký cho tài khoản của mình</p>
                                    <a href="profile?action=showUpdateForm" class="btn-a" style="text-decoration: none ;background: linear-gradient(to right, #ff9800, #ff5722);">
                                        <i class="fas fa-plus"></i> Thêm chữ ký mới
                                    </a>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${not empty error}">
                            <div class="custom-alert custom-alert-danger">
                                <i class="fas fa-exclamation-circle custom-alert-icon"></i>
                                <div class="custom-alert-content">
                                    <div class="custom-alert-title">${error}</div>

                                    <c:if test="${not empty missingAmount}">
                                        <div class="missing-amount">
                                            <span>Số tiền cần nạp thêm: </span>
                                            <span class="missing-amount-value"><fmt:formatNumber value="${missingAmount}" pattern="#,##0" /> VNĐ</span>
                                        </div>
                                        <div>
                                            <a href="profile?action=wallet" class="action-btn">
                                                <i class="fas fa-coins"></i> Nạp tiền ngay
                                            </a>
                                        </div>
                                    </c:if>
                                </div>
                                <button type="button" class="close-btn" onclick="this.parentElement.style.display='none';">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </c:if>

                        <div class="btn-container">
                            <a href="contract?action=reject-contract&contractId=${contract.contractId}" type="button" class="btn-reject" style="text-decoration: none">Từ chối ký kết</a>

                            <button id="btn-submit" class="btn-a">Hoàn tất ký kết</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </div>
</section>

<div class="popup-overlay" id="contractPopup" style="display: none;">
    <div class="popup-container">
        <div class="popup-header">
            <div class="popup-title">Hợp Đồng Dịch Vụ JobTrans</div>
            <div class="popup-buttons">
                <div class="popup-close" id="closePopupBtn">&times;</div>
            </div>
        </div>
        <div class="popup-content">
            <div id="contract-content">
                <div class="container">
                    <div class="contract-header-a">
                        <div class="national-title">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</div>
                        <div class="independence-title">Độc lập - Tự do - Hạnh phúc</div>
                        <div class="contract-title-a">HỢP ĐỒNG DỊCH VỤ</div>
                        <div class="contract-number">Số: ......</div>
                    </div>

                    <div class="legal-basis">
                        <p>Căn cứ Bộ luật Dân sự 2015 số 91/2015/QH13 và các văn bản hướng dẫn thi hành;</p>
                        <p>Căn cứ nhu cầu và thỏa thuận giữa các bên</p>
                        <p>Hôm nay, vào <fmt:formatDate value="${now}" pattern="'ngày' dd 'tháng' MM 'năm' yyyy" /> tại Công ty JobTrans, các bên bao gồm:</p>
                    </div>

                    <div class="party-info-a">
                        <p><strong style="color: #000000; font-size: 22px;">BÊN A: ${contract.aName} (EMPLOYER)</strong></p>
                        <c:if test="${not empty contract.aRepresentative}">
                            <p>Đại diện là Ông/bà: ${contract.aRepresentative}</p>
                        </c:if>
                        <c:if test="${empty contract.aRepresentative}">
                            <p>Đại diện là Ông/bà (nếu có): ............................................</p>
                        </c:if>
                        <p>Số CCCD: ${contract.aIdentity} Cấp ngày: ${contract.aIdentityDate} Tại: ${contract.aIdentityAddress}</p>
                        <p>Mã số thuế: ${contract.aTaxCode}</p>
                        <p>Sinh ngày: ${contract.aBirthday}</p>
                        <p>Địa chỉ thường trú: ${contract.aAddress}</p>
                        <p>Số điện thoại: ${contract.aPhoneNumber}</p>
                        <p>Email: ${contract.aEmail}</p>
                    </div>

                    <div class="party-info-a">
                        <p><strong style="color: #000000; font-size: 22px;">BÊN B: ${contract.bName} (FREELANCER)</strong></p>
                        <c:if test="${not empty contract.bRepresentative}">
                            <p>Đại diện là Ông/bà: ${contract.bRepresentative}</p>
                        </c:if>
                        <c:if test="${empty contract.bRepresentative}">
                            <p>Đại diện là Ông/bà (nếu có): ............................................</p>
                        </c:if>
                        <p>Số CCCD: ${contract.bIdentity} Cấp ngày: ${contract.bIdentityDate} Tại: ${contract.bIdentityAddress}</p>
                        <p>Sinh ngày: ${contract.bBirthday}</p>
                        <p>Địa chỉ thường trú: ${contract.bAddress}</p>
                        <p>Số điện thoại: ${contract.bPhoneNumber}</p>
                        <p>Email: ${contract.bEmail}</p>
                    </div>

                    <div class="party-info-a">
                        <p><strong style="color: #000000; font-size: 22px;">BÊN C: NỀN TẢNG JOBTRANS</strong></p>
                        <p>Công ty: JobTrans - Nền tảng hỗ trợ tuyển dụng và tìm kiếm việc làm.</p>
                        <p>Địa chỉ: Khu đô thị FPT Đà Nẵng - Ngũ Hành Sơn - Đà Nẵng</p>
                        <p>MSDN: 0932551005</p>
                        <p>Điện thoại: 0935280706</p>
                        <p>Đại diện: Võ Thị Mỹ Duyên</p>
                        <p>Chức vụ: Quản trị viên nền tảng</p>
                        <p>Quốc tịch: Việt Nam</p>
                    </div>

                    <p>Sau khi bàn bạc và thỏa thuận, hai bên đã thống nhất những nội dung như sau:</p>

                    <div class="section-title-contract">ĐIỀU 1. NỘI DUNG CÔNG VIỆC</div>
                    <p class="section-subtitle">1.1. Bên B nhận thực hiện cho bên A các công việc sau: ${contract.jobGoal}</p>
                    <p class="section-subtitle">1.2. Yêu cầu về chất lượng công việc: ${contract.jobRequirement}</p>

                    <div class="section-title-contract">ĐIỀU 2. THỜI GIAN, ĐỊA ĐIỂM THỰC HIỆN HỢP ĐỒNG VÀ ĐIỀU KHOẢN</div>
                    <p class="section-subtitle">2.1. Thời gian thực hiện:</p>
                    <p>Bên B thực hiện công việc cho Bên A trong thời hạn từ ngày ${contract.startDate} đến ngày ${contract.endDate}.</p>
                    <p class="section-subtitle">2.2. Địa điểm thực hiện: Tự do</p>
                    <p class="section-subtitle">2.3. Ngày thanh lý hợp đồng phải cách ngày dự kiến hoàn thành công việc tối đa sau 5 ngày.</p>
                    <p class="section-subtitle">2.4. Điều khoản:</p>
                    <p>Thời hạn bên B hoàn thành công việc chậm tối đa là 5 ngày kể từ ngày phải hoàn thành (${contract.endDate}). Sau ngày thứ 5 chậm hoàn thành công việc, Bên B bồi thường mất toàn bộ tiền đặt cọc và bị trừ điểm trên hệ thống (35 điểm bao gồm những lần nhắc nhở trong quá trình hoàn thành chậm -- <em>chính sách điểm trừ JobTrans</em>). Ngoài ra, bên B phải chịu phạt lãi chậm thanh toán theo mức lãi suất 0,1%/ngày (trên thù lao dự tính được nhận cho dự án đó) chậm thanh toán và phải bồi thường thiệt hại (nếu có) theo quy định của pháp luật. Trường hợp chậm tiến độ hoàn thành (đã nêu tại Điều 2.1) sau 15 ngày, Bên A có quyền đơn phương chấm dứt hợp đồng.</p>

                    <div class="section-title-contract">ĐIỀU 3. PHÍ DỊCH VỤ, HÌNH THỨC, THỜI HẠN THANH TOÁN VÀ ĐẶT CỌC TRƯỚC KHI BẮT ĐẦU CÔNG VIỆC</div>
                    <p class="section-subtitle">3.1. Phí dịch vụ:</p>
                    <p>Bên A phải thanh toán cho Bên B phí dịch vụ là <fmt:formatNumber value="${contract.jobFee}" type="number" /> VNĐ. (1000 VNĐ tương đương 1000 Coins)</p>
                    <p>Bên A sẽ thực hiện khấu trừ thuế TNCN 10% tại nguồn đối với các khoản thu nhập từ 2.000.000 VNĐ (bằng chữ: Hai triệu đồng) trở lên.</p>
                    <p class="section-subtitle">3.2. Hình thức thanh toán: Bằng ví điện tử của nền tảng.</p>
                    <p class="section-subtitle">3.3. Thời hạn thanh toán:</p>
                    <p>Bên A thanh toán cho Bên B theo 02 đợt:</p>
                    <p>- Lần 1: Bên A đặt cọc cho Bên B là: <fmt:formatNumber value="${contract.jobDepositA}" type="number" /> VNĐ (1000 VNĐ tương đương 1000 Coins)</p>
                    <p>- Lần 2: Bên A thanh toán phần giá trị hợp đồng còn lại cho Bên B sau khi đã trừ đi giá trị tạm ứng và thuế thu nhập cá nhân của Bên B vào ngày hoàn thành việc cung cấp dịch vụ ở Điều 2.4.</p>
                    <p>Thời hạn bên A thanh toán chậm tối đa là 5 ngày kể từ ngày phải thanh toán. Sau ngày thứ 5 chậm thanh toán, Bên A bồi thường mất toàn bộ tiền đặt cọc và bị trừ điểm trên hệ thống (35 điểm bao gồm những lần nhắc nhở trong quá trình thanh toán chậm - <em>chính sách điểm trừ JobTrans</em>). Ngoài ra, bên A phải chịu phạt lãi chậm thanh toán theo mức lãi suất 0,1%/ngày chậm thanh toán và phải bồi thường thiệt hại (nếu có) theo quy định của pháp luật. Trường hợp chậm thanh toán (đã nêu tại điều 2.3) sau 15 ngày, Bên B có quyền đơn phương chấm dứt hợp đồng.</p>
                    <p class="section-subtitle">3.4. Đặt cọc trước khi bắt đầu công việc:</p>
                    <p>- Bên A và Bên B có nghĩa vụ đặt cọc trước khi bắt đầu công việc với số tiền cụ thể như sau:</p>
                    <p>+ Bên A đặt cọc: <fmt:formatNumber value="${contract.jobDepositA}" type="number" /> VNĐ (bằng chữ: ${contract.jobDepositAText}) vào ngày ${contract.jobDepositADate}</p>
                    <p>+ Bên B đặt cọc: <fmt:formatNumber value="${contract.jobDepositB}" type="number" /> VNĐ (bằng chữ: ${contract.jobDepositBText}) vào ngày ${contract.jobDepositBDate}</p>
                    <p>- Sau khi đã đặt cọc, các bên không được phép rút lại tiền đặt cọc với bất kỳ lý do gì trừ khi được quy định trong hợp đồng này.</p>
                    <p>- Việc xử lý tiền đặt cọc sẽ tuân theo các điều khoản liên quan đến việc hoàn thành công việc, vi phạm hợp đồng hoặc chấm dứt hợp đồng như đã quy định tại Điều 2.4, Điều 3.3 và Điều 6 của hợp đồng này.</p>
                    <p>- Bên C có nghĩa vụ phải đảm bảo số tiền đã đặt cọc của Bên A và Bên B. Bên C sẽ phải chịu hoàn toàn trách nhiệm nếu số tiền xảy ra mất mát.</p>

                    <p class="section-subtitle">3.5. Sau khi công việc hoàn thành:</p>
                    <p>+ Số tiền đặt cọc của Bên A sẽ được dùng để trả tiền lương cho Bên B sau khi Bên B hoàn tất công việc theo đúng yêu cầu công việc đã nêu ở Điều 1.</p>
                    <p>+ Số tiền đặt cọc của Bên B sẽ được hoàn trả lại cho Bên B.</p>
                    <p>- Trường hợp không hoàn thành công việc hoặc vi phạm hợp đồng:</p>
                    <p>+ Nếu Bên B không hoàn thành công việc theo đúng yêu cầu và thời hạn, số tiền đặt cọc của Bên B sẽ bị xử lý theo quy định tại Điều 2.4.</p>
                    <p>+ Nếu Bên A không thanh toán đúng hạn sau khi công việc hoàn thành, số tiền đặt cọc của Bên A sẽ bị xử lý theo quy định tại Điều 3.3.</p>

                    <!-- Các điều khoản tiếp theo (4-12) giữ nguyên cấu trúc, chỉ thay đổi các giá trị động bằng EL expressions -->
                    <!-- ... -->

                    <div class="signature-area-contract-a">
                        <div class="signature-box-a">
                            <div class="signature-title">NGƯỜI LAO ĐỘNG</div>
                            <div class="signature-note">(Ký, ghi rõ họ tên)</div>
                            <div class="signature-date-a"><fmt:formatDate value="${now}" pattern="'Ngày' dd 'Tháng' MM 'Năm' yyyy" /></div>
                            <c:if test="${not empty contract.bSignature}">
                                <div class="signature-img">
                                    <img src="${contract.bSignature}" alt="Chữ ký Bên B">
                                </div>
                            </c:if>
                            <div class="signature-name"><strong>${contract.bName}</strong></div>
                        </div>
                        <br>
                        <div class="signature-box-a">
                            <div class="signature-title">NGƯỜI SỬ DỤNG LAO ĐỘNG</div>
                            <div class="signature-note">(Ký, ghi rõ họ tên)</div>
                            <div class="signature-date-a"><fmt:formatDate value="${now}" pattern="'Ngày' dd 'Tháng' MM 'Năm' yyyy" /></div>
                            <c:if test="${not empty contract.aSignature}">
                                <div class="signature-img">
                                    <img src="${contract.aSignature}" alt="Chữ ký Bên A">
                                </div>
                            </c:if>
                            <div class="signature-name"><strong>${contract.aName}</strong></div>
                        </div>
                        <div class="signature-box-a">
                            <div class="signature-title">ĐẠI DIỆN NỀN TẢNG</div>
                            <div class="signature-note">(Ký, ghi rõ họ tên)</div>
                            <div class="signature-date-a"><fmt:formatDate value="${now}" pattern="'Ngày' dd 'Tháng' MM 'Năm' yyyy" /></div>
                            <div class="signature-img">
                                <img src="img/contract/signature-My-Duyen.jpg" alt="Chữ ký">
                            </div>
                            <div class="signature-JobTrans">
                                <img src="img/contract/signature-JobTrans.jpg" alt="Con dấu">
                            </div>
                            <div class="signature-name"><strong>Võ Thị Mỹ Duyên</strong></div>
                        </div>
                    </div>
                    <div class="footer-pdf">
                        <p>Hợp đồng dịch vụ JobTrans - Mã hợp đồng: CON-2025-0001</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="includes/footer.jsp"%>

<script>
    let balanceSocket;

    function connectWebSocket(accountId) {
        const protocol = window.location.protocol === 'https:' ? 'wss://' : 'ws://';
        const socketUrl = protocol + window.location.host + '/your-app-context/balance/' + accountId;

        balanceSocket = new WebSocket(socketUrl);

        balanceSocket.onmessage = (event) => {
            const balance = parseFloat(event.data);
            updateBalanceUI(balance);
            checkDepositRequirement(balance);
        };

        balanceSocket.onclose = () => {
            console.log('WebSocket disconnected. Reconnecting...');
            setTimeout(() => connectWebSocket(accountId), 5000);
        };
    }

    function updateBalanceUI(balance) {
        document.getElementById('current-balance').textContent =
            balance.toLocaleString('vi-VN') + ' VNĐ';
    }

    function checkDepositRequirement(currentBalance) {
        const depositB = parseFloat(document.getElementById('depositBAmount').value);
        const submitBtn = document.getElementById('btn-submit');

        if (currentBalance < depositB) {
            submitBtn.disabled = true;
            showBalanceWarning(depositB, currentBalance);
        } else {
            submitBtn.disabled = false;
            hideBalanceWarning();
        }
    }

    // Gọi khi trang load
    connectWebSocket(${sessionScope.accountId});
</script>


<script>
    // Mở popup khi nhấn nút
    document.getElementById('openPopupBtn').addEventListener('click', function() {
        document.getElementById('contractPopup').style.display = 'flex';
        document.body.style.overflow = 'hidden'; // Ngăn không cho cuộn trang khi popup đang mở
    });

    // Đóng popup
    document.getElementById('closePopupBtn').addEventListener('click', function() {
        document.getElementById('contractPopup').style.display = 'none';
        document.body.style.overflow = 'auto'; // Cho phép cuộn trang trở lại
    });

    // Tải PDF
    document.getElementById('downloadPdfBtn').addEventListener('click', function() {
        // Hiển thị modal đang xử lý
        document.getElementById('processingModal').style.display = 'flex';

        // Mô phỏng quá trình tạo PDF (thực tế sẽ có xử lý tạo PDF)
        setTimeout(function() {
            // Ẩn modal đang xử lý
            document.getElementById('processingModal').style.display = 'none';

            // Hiển thị thông báo thành công
            alert('Xuất PDF thành công! File PDF đã được tải xuống.');

            // Thực tế sẽ cần triển khai logic tạo và tải PDF ở đây
            // Có thể sử dụng thư viện jsPDF và html2canvas như trong mã gốc
        }, 2000);
    });

    // Đóng popup khi nhấn ra ngoài
    window.addEventListener('click', function(event) {
        if (event.target === document.getElementById('contractPopup')) {
            document.getElementById('contractPopup').style.display = 'none';
            document.body.style.overflow = 'auto';
        }
    });
</script>

</body>
</html>