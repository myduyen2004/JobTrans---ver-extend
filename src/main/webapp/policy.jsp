<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hướng dẫn và Chính sách</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<style>
    :root {
        --primary-color: #4361ee;
        --secondary-color: #3f37c9;
        --accent-color: #4895ef;
        --light-color: #f8f9fa;
        --dark-color: #212529;
        --success-color: #4cc9f0;
        --warning-color: #f72585;
        --border-radius: 12px;
        --box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
        --transition: all 0.3s ease;
    }

    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f5f7ff;
        margin: 0;
        padding: 0;
        color: var(--dark-color);
        line-height: 1.6;
    }

    .container_policy {
        display: flex;
        justify-content: center;
        gap: 40px;
        padding: 40px 20px;
        max-width: 1400px;
        margin: 0 auto;
    }

    .box {
        flex: 1;
        min-width: 0;
        background: white;
        border-radius: var(--border-radius);
        box-shadow: var(--box-shadow);
        position: relative;
        overflow: hidden;
        transition: var(--transition);
    }

    .box:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
    }

    .box-header {
        background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        color: white;
        font-weight: 500;
        padding: 18px 25px;
        font-size: 18px;
        position: relative;
        text-align: center;
        border-radius: var(--border-radius) var(--border-radius) 0 0;
    }

    .box-header:after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 4px;
        background: linear-gradient(90deg, var(--accent-color), var(--success-color));
    }

    .box-content {
        padding: 25px;
    }

    .box-content ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .box-content li {
        margin-bottom: 20px;
        position: relative;
        padding-left: 30px;
        transition: var(--transition);
    }

    .box-content li:before {
        content: '';
        position: absolute;
        left: 0;
        top: 8px;
        width: 12px;
        height: 12px;
        background-color: var(--accent-color);
        border-radius: 50%;
    }

    .box-content li:hover {
        transform: translateX(5px);
    }

    .box-content a {
        text-decoration: none;
        color: var(--dark-color);
        font-size: 16px;
        font-weight: 500;
        display: block;
        padding: 8px 0;
        transition: var(--transition);
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
    }

    .box-content a:hover {
        color: var(--primary-color);
        border-bottom-color: var(--accent-color);
    }

    .box-content a i {
        margin-right: 10px;
        color: var(--accent-color);
    }

    .huong-dan {
        background-color: white;
        border-radius: var(--border-radius);
        box-shadow: var(--box-shadow);
        padding: 30px;

        position: relative;
        border-left: 5px solid var(--accent-color);
        max-width: 500px;
    }

    .huong-dan-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .title-huong-dan {
        font-size: 22px;
        font-weight: 600;
        color: var(--primary-color);
        margin: 0;
    }

    .close-icon {
        font-size: 20px;
        cursor: pointer;
        color: #999;
        transition: var(--transition);
    }

    .close-icon:hover {
        color: var(--warning-color);
        transform: rotate(90deg);
    }

    .huong-dan-content {
        color: #555;
    }

    .huong-dan-content p {
        margin-bottom: 15px;
    }

    .huong-dan-content strong {
        color: var(--dark-color);
        font-weight: 500;
    }

    .step {
        display: flex;
        margin-bottom: 15px;
        align-items: flex-start;
    }

    .step-number {
        background-color: var(--accent-color);
        color: white;
        width: 24px;
        height: 24px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 15px;
        flex-shrink: 0;
        font-size: 14px;
        font-weight: bold;
    }

    .step-content {
        flex: 1;
    }

    @media (max-width: 992px) {
        .container_policy {
            flex-direction: column;
            gap: 30px;
        }

        .box {
            width: 100%;
            margin-bottom: 0;
        }
    }

    /* Animation */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .box {
        animation: fadeIn 0.6s ease forwards;
    }

    .box:nth-child(2) {
        animation-delay: 0.2s;
    }
</style>
<body>
<%@include file="includes/header-01.jsp" %>

<div class="container_policy">
    <div id="huongdan" style="display: none;"></div>

    <div class="box">
        <div class="box-header">Hướng dẫn sử dụng</div>
        <div class="box-content">
            <ul>
                <li><a id="1" href="#"><i class="fas fa-wallet"></i> Hướng dẫn nạp tiền vào tài khoản</a></li>
                <li><a id="2" href="#"><i class="fas fa-file-alt"></i> Hướng dẫn tạo CV trên hệ thống</a></li>
                <li><a id="3" href="#"><i class="fas fa-handshake"></i> Hướng dẫn hệ với đối tác</a></li>
                <li><a id="4" href="#"><i class="fas fa-star"></i> Hướng dẫn đánh giá đối tác</a></li>
                <li><a id="5" href="#"><i class="fas fa-paint-brush"></i> Hướng dẫn thiết kế profile</a></li>
                <li><a id="6" href="#"><i class="fas fa-money-bill-wave"></i> Hướng dẫn rút tiền về tài khoản</a></li>
                <li><a id="7" href="#"><i class="fas fa-times-circle"></i> Hướng dẫn hủy dự án (Trường hợp bắt buộc)</a></li>
            </ul>
        </div>
    </div>

    <div class="box">
        <div class="box-header">Điều khoản & chính sách</div>
        <div class="box-content">
            <ul>
                <li><a href="add-point.jsp"><i class="fas fa-plus-circle"></i> Điều khoản cộng điểm</a></li>
                <li><a href="diem-tru.jsp"><i class="fas fa-minus-circle"></i> Điều khoản trừ điểm/ block</a></li>
                <li><a href="#"><i class="fas fa-level-up-alt"></i> Điều khoản thăng hạng</a></li>
                <li><a href="#"><i class="fas fa-hands-helping"></i> Chính sách hỗ trợ người mới tham gia</a></li>
            </ul>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>

<script>
    function showCVInstruction(title, htmlContent) {
        const container = document.getElementById("huongdan");
        container.innerHTML = htmlContent;
        container.style.display = "block";

        // Scroll to the guide section
        container.scrollIntoView({ behavior: 'smooth' });
    }

    document.getElementById("1").addEventListener("click", function() {
        const htmlContent = `
                <div class="huong-dan">
                    <div class="huong-dan-header">
                        <h2 class="title-huong-dan"><i class="fas fa-wallet"></i> Hướng dẫn nạp tiền vào hệ thống</h2>
                        <span class="close-icon" onclick="document.getElementById('huongdan').style.display='none'">
                            <i class="fas fa-times"></i>
                        </span>
                    </div>
                    <div class="huong-dan-content">
                        <div class="step">
                            <div class="step-number">1</div>
                            <div class="step-content">
                                <strong>Truy cập trang nạp tiền:</strong> Đăng nhập vào tài khoản và chọn mục "Nạp tiền" trong menu tài khoản.
                            </div>
                        </div>
                        <div class="step">
                            <div class="step-number">2</div>
                            <div class="step-content">
                                <strong>Chọn phương thức thanh toán:</strong> Hệ thống hỗ trợ nhiều phương thức như chuyển khoản ngân hàng, ví điện tử, hoặc thẻ quốc tế.
                            </div>
                        </div>
                        <div class="step">
                            <div class="step-number">3</div>
                            <div class="step-content">
                                <strong>Nhập số tiền:</strong> Nhập số tiền bạn muốn nạp (tối thiểu 50,000 VND).
                            </div>
                        </div>
                        <div class="step">
                            <div class="step-number">4</div>
                            <div class="step-content">
                                <strong>Xác nhận giao dịch:</strong> Kiểm tra thông tin và xác nhận giao dịch. Tiền sẽ được cộng vào tài khoản trong vòng 1-5 phút.
                            </div>
                        </div>
                        <p><strong>Lưu ý:</strong> Mọi thắc mắc về giao dịch, vui lòng liên hệ bộ phận hỗ trợ qua email support@yourdomain.com hoặc hotline 1900 1234.</p>
                    </div>
                </div>
            `;
        showCVInstruction("careerGoal", htmlContent);
    });

    // Add similar event listeners for other menu items
    [2,3,4,5,6,7].forEach(id => {
        document.getElementById(id).addEventListener("click", function() {
            const htmlContent = `
                    <div class="huong-dan">
                        <div class="huong-dan-header">
                            <h2 class="title-huong-dan">Hướng dẫn chi tiết</h2>
                            <span class="close-icon" onclick="document.getElementById('huongdan').style.display='none'">
                                <i class="fas fa-times"></i>
                            </span>
                        </div>
                        <div class="huong-dan-content">
                            <p>Nội dung hướng dẫn đang được cập nhật. Vui lòng quay lại sau.</p>
                        </div>
                    </div>
                `;
            showCVInstruction("guide", htmlContent);
        });
    });
</script>
</body>
</html>