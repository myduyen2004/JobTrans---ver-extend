
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm thành viên mới</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #6787fe;
            --secondary-color: #6c63ff;
            --accent-color: #f0f4ff;
            --light-color: #f8f9fa;
            --dark-color: #343a40;
            --success-color: #4caf50;
            --warning-color: #ff9800;
            --danger-color: #f44336;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            padding: 0;
            margin: 0;
            overflow-x: hidden;
        }

        .page-header {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            padding: 30px 0;
            margin-bottom: 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }

        .page-header::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
            animation: rotate 25s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .header-container {
            position: relative;
            z-index: 1;
        }

        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
            overflow: hidden;
            animation: slideInUp 0.8s ease-out;
        }

        @keyframes slideInUp {
            from {
                transform: translate3d(0, 40px, 0);
                opacity: 0;
            }
            to {
                transform: translate3d(0, 0, 0);
                opacity: 1;
            }
        }

        .card-header {
            background: linear-gradient(45deg, var(--accent-color) 0%, white 100%);
            padding: 20px;
            border-bottom: 1px solid rgba(0,0,0,0.05);
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--dark-color);
            margin-bottom: 0;
            padding-left: 15px;
            border-left: 4px solid var(--primary-color);
            animation: fadeIn 1s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .form-floating {
            margin-bottom: 20px;
        }

        .form-floating > label {
            padding-left: 1rem;
            color: #6c757d;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(78, 84, 200, 0.25);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 12px 25px;
            border-radius: 50px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            background-color: #3a40b5;
            border-color: #3a40b5;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(78, 84, 200, 0.3);
        }

        .btn-action {
            border-radius: 50px;
            padding: 12px 25px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .btn-action i {
            margin-right: 8px;
        }

        .btn-outline-secondary {
            border-color: #ced4da;
            color: #6c757d;
            background-color: white;
        }

        .btn-outline-secondary:hover {
            background-color: #f8f9fa;
            color: #343a40;
            border-color: #ced4da;
        }

        .avatar-upload {
            position: relative;
            max-width: 180px;
            margin: 0 auto 30px;
        }

        .avatar-edit {
            position: absolute;
            right: 0;
            z-index: 1;
            bottom: 0;
        }

        .avatar-edit input {
            display: none;
        }

        .avatar-edit label {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--primary-color);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            color: white;
            transition: all 0.3s;
        }

        .avatar-edit label:hover {
            background: #3a40b5;
            transform: scale(1.1);
        }

        .avatar-preview {
            width: 180px;
            height: 180px;
            position: relative;
            border-radius: 20px;
            border: 5px solid white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .avatar-preview img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .form-section {
            padding: 20px;
            animation: fadeInRight 0.8s ease-out;
        }

        @keyframes fadeInRight {
            from {
                transform: translate3d(20px, 0, 0);
                opacity: 0;
            }
            to {
                transform: translate3d(0, 0, 0);
                opacity: 1;
            }
        }

        .form-section-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: var(--dark-color);
            display: flex;
            align-items: center;
        }

        .form-section-title i {
            margin-right: 10px;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: var(--accent-color);
            color: var(--primary-color);
            border-radius: 8px;
        }

        .btn-container {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }

        .divider {
            height: 1px;
            background: linear-gradient(to right, transparent, rgba(0,0,0,0.05), transparent);
            margin: 25px 0;
        }

        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .toggle-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 34px;
        }

        .toggle-slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .toggle-slider {
            background-color: var(--success-color);
        }

        input:checked + .toggle-slider:before {
            transform: translateX(26px);
        }

        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .input-group-text {
            background-color: var(--accent-color);
            color: var(--primary-color);
            border: 1px solid #ced4da;
        }

        .floating-buttons {
            position: fixed;
            bottom: 30px;
            right: 30px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            z-index: 1000;
        }

        .floating-button {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: all 0.3s;
            font-size: 1.4rem;
            animation: pulse 2s infinite;
            text-align: center;
        }

        .floating-button i {
            margin-top: 18px;
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(78, 84, 200, 0.4);
            }
            70% {
                box-shadow: 0 0 0 10px rgba(78, 84, 200, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(78, 84, 200, 0);
            }
        }

        .floating-button:hover {
            transform: scale(1.1);
        }

        .floating-button-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .floating-button-secondary {
            background-color: white;
            color: var(--dark-color);
        }

        /* Animation khi nhập liệu */
        .form-control:focus + label {
            color: var(--primary-color);
            font-weight: 500;
        }

        .form-control:not(:placeholder-shown) + label {
            color: var(--primary-color);
        }

        /* Animation khi scroll */
        .scroll-animation {
            animation: fadeInUp 0.8s ease-out;
        }

        @keyframes fadeInUp {
            from {
                transform: translate3d(0, 40px, 0);
                opacity: 0;
            }
            to {
                transform: translate3d(0, 0, 0);
                opacity: 1;
            }
        }

        /* Animation cho các phần tử */
        .animate-delay-1 {
            animation-delay: 0.2s;
        }

        .animate-delay-2 {
            animation-delay: 0.4s;
        }

        .animate-delay-3 {
            animation-delay: 0.6s;
        }

        /* Animation cho nút checkbox */
        .form-check-input {
            transition: all 0.3s;
        }

        .form-check-input:checked {
            transform: scale(1.1);
        }

        /* Loading animation */
        .loader {
            width: 48px;
            height: 48px;
            border: 5px solid var(--primary-color);
            border-bottom-color: transparent;
            border-radius: 50%;
            display: none;
            box-sizing: border-box;
            animation: rotation 1s linear infinite;
        }

        @keyframes rotation {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        /* Parallax effect */
        .parallax-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            overflow: hidden;
        }

        .parallax-circle {
            position: absolute;
            border-radius: 50%;
            opacity: 0.05;
            background: white;
        }

        .circle-1 {
            width: 300px;
            height: 300px;
            top: -100px;
            right: -50px;
            animation: float 15s ease-in-out infinite;
        }

        .circle-2 {
            width: 200px;
            height: 200px;
            bottom: -50px;
            left: 10%;
            animation: float 20s ease-in-out infinite reverse;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-20px);
            }
        }

        /* Tooltip custom animation */
        .custom-tooltip {
            position: relative;
            display: inline-block;
        }

        .custom-tooltip .tooltip-text {
            visibility: hidden;
            width: 120px;
            background-color: var(--dark-color);
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 5px 0;
            position: absolute;
            z-index: 1;
            bottom: 125%;
            left: 50%;
            margin-left: -60px;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .custom-tooltip .tooltip-text::after {
            content: "";
            position: absolute;
            top: 100%;
            left: 50%;
            margin-left: -5px;
            border-width: 5px;
            border-style: solid;
            border-color: var(--dark-color) transparent transparent transparent;
        }

        .custom-tooltip:hover .tooltip-text {
            visibility: visible;
            opacity: 1;
            animation: fadeInUp 0.3s;
        }

        /* Progress Bar Animation */
        .progress-bar {
            transition: width 1.5s ease-in-out;
        }

        .progress {
            margin-bottom: 20px;
            height: 10px;
            background-color: #e9ecef;
            border-radius: 5px;
            overflow: hidden;
        }

        /* Card flip animation */
        .card-flip {
            perspective: 1000px;
            margin-bottom: 20px;
        }

        .card-flip-inner {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.8s;
            transform-style: preserve-3d;
        }

        .card-flip:hover .card-flip-inner {
            transform: rotateY(180deg);
        }

        .card-flip-front, .card-flip-back {
            width: 100%;
            height: 100%;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            border-radius: 15px;
            overflow: hidden;
        }

        .card-flip-back {
            background-color: var(--accent-color);
            transform: rotateY(180deg);
            position: absolute;
            top: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
<div class="page-header text-center">
    <div class="parallax-bg">
        <div class="parallax-circle circle-1"></div>
        <div class="parallax-circle circle-2"></div>
    </div>
    <div class="header-container">
        <h1 class="display-4 fw-bold animate__animated animate__fadeInDown">Thêm thành viên mới</h1>
        <p class="lead animate__animated animate__fadeInUp animate__delay-1s">Nhập thông tin chi tiết của thành viên mới</p>
    </div>
</div>

<div class="container pb-5">
    <div class="card">
        <div class="card-header d-flex align-items-center">
            <h3 class="card-title">Thông tin thành viên</h3>
        </div>
        <div class="card-body">
            <form id="memberForm">
                <div class="row">
                    <div class="col-md-3 animate__animated animate__fadeIn animate__delay-1s">
                        <div class="avatar-upload">
                            <div class="avatar-edit">
                                <input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
                                <label for="imageUpload"><i class="fas fa-camera"></i></label>
                            </div>
                            <div class="avatar-preview">
                                <img src="img\avatar-default.jpg" id="imagePreview" alt="Ảnh đại diện">
                            </div>
                        </div>

                        <div class="text-center">
                            <div class="form-check form-switch d-flex justify-content-center align-items-center mb-4">
                                <label class="toggle-switch ms-2">
                                    <input type="checkbox" checked>
                                    <span class="toggle-slider"></span>
                                </label>
                                <span class="ms-2">Hoạt động</span>
                            </div>
                        </div>

                        <div class="progress">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <p class="text-center text-muted small">Hoàn thành hồ sơ: <span id="completionRate">0%</span></p>

                        <div class="card-flip">
                            <div class="card-flip-inner">
                                <div class="card-flip-front p-3 bg-light">
                                    <i class="fas fa-info-circle fa-2x text-primary"></i>
                                    <p class="mt-2 mb-0">Xem gợi ý</p>
                                </div>
                                <div class="card-flip-back">
                                    <p class="mb-0">Hãy điền đầy đủ thông tin để dễ dàng quản lý và phân công công việc sau này.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-9">
                        <div class="form-section animate__animated animate__fadeInRight animate__delay-1s">
                            <h4 class="form-section-title"><i class="fas fa-user"></i> Thông tin cơ bản</h4>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="memberName" placeholder="Họ và tên">
                                        <label for="memberName">Họ và tên</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="memberCode" placeholder="Mã thành viên">
                                        <label for="memberCode">Mã thành viên</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <select class="form-select" id="memberRole">
                                            <option value="">Chọn vai trò</option>
                                            <option value="leader">Trưởng nhóm</option>
                                            <option value="deputy">Phó nhóm</option>
                                            <option value="member">Thành viên</option>
                                        </select>
                                        <label for="memberRole">Vai trò</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <select class="form-select" id="memberGender">
                                            <option value="">Chọn giới tính</option>
                                            <option value="male">Nam</option>
                                            <option value="female">Nữ</option>
                                            <option value="other">Khác</option>
                                        </select>
                                        <label for="memberGender">Giới tính</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-section animate__animated animate__fadeInRight animate__delay-2s">
                            <h4 class="form-section-title"><i class="fas fa-briefcase"></i> Thông tin chuyên môn</h4>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="specialty" placeholder="Chuyên môn">
                                        <label for="specialty">Chuyên môn</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <select class="form-select" id="experience">
                                            <option value="">Chọn kinh nghiệm</option>
                                            <option value="1">Dưới 1 năm</option>
                                            <option value="1-3">1-3 năm</option>
                                            <option value="3-5">3-5 năm</option>
                                            <option value="5+">Trên 5 năm</option>
                                        </select>
                                        <label for="experience">Kinh nghiệm</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="education" placeholder="Học vấn">
                                        <label for="education">Học vấn</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <textarea class="form-control" id="skills" style="height: 100px" placeholder="Kỹ năng"></textarea>
                                        <label for="skills">Kỹ năng (cách nhau bởi dấu phẩy)</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-section animate__animated animate__fadeInRight animate__delay-3s">
                            <h4 class="form-section-title"><i class="fas fa-address-card"></i> Thông tin liên hệ</h4>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="email" class="form-control" id="email" placeholder="Email">
                                        <label for="email">Email</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="tel" class="form-control" id="phone" placeholder="Số điện thoại">
                                        <label for="phone">Số điện thoại</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="address" placeholder="Địa chỉ">
                                        <label for="address">Địa chỉ</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-section animate__animated animate__fadeInRight animate__delay-3s">
                            <h4 class="form-section-title"><i class="fas fa-user-circle"></i> Tiểu sử</h4>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <textarea class="form-control" id="bio" style="height: 120px" placeholder="Tiểu sử"></textarea>
                                        <label for="bio">Tiểu sử ngắn</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="my-4 d-flex justify-content-between align-items-center">
                            <div class="form-check animate__animated animate__fadeIn animate__delay-3s">
                                <input class="form-check-input" type="checkbox" id="sendWelcomeEmail">
                                <label class="form-check-label" for="sendWelcomeEmail">
                                    Gửi email chào mừng
                                </label>
                            </div>

                            <div class="btn-container animate__animated animate__fadeIn animate__delay-3s">
                                <button type="button" class="btn btn-outline-secondary btn-action" id="btnCancel">
                                    <i class="fas fa-times"></i> Hủy bỏ
                                </button>
                                <button type="submit" class="btn btn-primary btn-action" id="btnSubmit">
                                    <i class="fas fa-save"></i> Lưu thành viên
                                    <span class="loader ms-2" id="submitLoader"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="floating-buttons animate__animated animate__fadeInRight">
    <div class="floating-button floating-button-primary custom-tooltip">
        <i class="fas fa-question"></i>
        <span class="tooltip-text">Trợ giúp</span>
    </div>
    <div class="floating-button floating-button-secondary custom-tooltip">
        <i class="fas fa-arrow-left"></i>
        <span class="tooltip-text">Quay lại</span>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    // Progress bar animation
    document.addEventListener('DOMContentLoaded', function() {
        setTimeout(function() {
            document.querySelector('.progress-bar').style.width = '25%';
            document.getElementById('completionRate').textContent = '25%';
        }, 500);

        // Form validation và progress bar
        const formInputs = document.querySelectorAll('input, select, textarea');
        let totalFields = formInputs.length;

        formInputs.forEach(input => {
            input.addEventListener('change', updateProgress);
        });

        function updateProgress() {
            let filledFields = 0;
            formInputs.forEach(input => {
                if (input.value.trim() !== '') {
                    filledFields++;
                }
            });

            let percentage = Math.round((filledFields / totalFields) * 100);
            document.querySelector('.progress-bar').style.width = percentage + '%';
            document.getElementById('completionRate').textContent = percentage + '%';
        }

        // Animation khi submit form
        document.getElementById('memberForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const submitBtn = document.getElementById('btnSubmit');
            const loader = document.getElementById('submitLoader');

            submitBtn.disabled = true;
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xử lý...';

            // Giả lập xử lý form
            setTimeout(function() {
                submitBtn.innerHTML = '<i class="fas fa-check"></i> Đã lưu thành công';
                submitBtn.classList.remove('btn-primary');
                submitBtn.classList.add('btn-success');

                // Hiển thị thông báo thành công
                alert('Đã thêm thành viên mới thành công!');

                // Reset form sau khi lưu thành công
                setTimeout(function() {
                    document.getElementById('memberForm').reset();
                    submitBtn.disabled = false;
                    submitBtn.innerHTML = '<i class="fas fa-save"></i> Lưu thành viên';
                    submitBtn.classList.remove('btn-success');
                    submitBtn.classList.add('btn-primary');
                    document.querySelector('.progress-bar').style.width = '0%';
                    document.getElementById('completionRate').textContent = '0%';
                    document.getElementById('imagePreview').src = '/api/placeholder/180/180';
                }, 3000);
            }, 2000);
        });

        // Xử lý việc tải lên hình ảnh
        document.getElementById('imageUpload').addEventListener('change', function(e) {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('imagePreview').src = e.target.result;
                    updateProgress();
                }
                reader.readAsDataURL(file);
            }
        });

        // Xử lý nút hủy bỏ
        document.getElementById('btnCancel').addEventListener('click', function() {
            if(confirm('Bạn có chắc muốn hủy bỏ việc thêm thành viên mới?')) {
                document.getElementById('memberForm').reset();
                document.querySelector('.progress-bar').style.width = '0%';
                document.getElementById('completionRate').textContent = '0%';
                document.getElementById('imagePreview').src = '/api/placeholder/180/180';
            }
        });

        // Tooltip tùy chỉnh
        const tooltips = document.querySelectorAll('.custom-tooltip');
        tooltips.forEach(tooltip => {
            tooltip.addEventListener('mouseenter', function() {
                this.querySelector('.tooltip-text').style.visibility = 'visible';
                this.querySelector('.tooltip-text').style.opacity = '1';
            });

            tooltip.addEventListener('mouseleave', function() {
                this.querySelector('.tooltip-text').style.visibility = 'hidden';
                this.querySelector('.tooltip-text').style.opacity = '0';
            });
        });

        // Animation cho floating buttons
        const floatingButtons = document.querySelectorAll('.floating-button');
        floatingButtons.forEach(button => {
            button.addEventListener('mouseenter', function() {
                this.classList.add('animate__animated', 'animate__pulse');
            });

            button.addEventListener('mouseleave', function() {
                this.classList.remove('animate__animated', 'animate__pulse');
            });

            button.addEventListener('click', function() {
                if(this.querySelector('i').classList.contains('fa-arrow-left')) {
                    if(confirm('Bạn có chắc muốn quay lại trang trước?')) {
                        window.history.back();
                    }
                } else if(this.querySelector('i').classList.contains('fa-question')) {
                    alert('Hệ thống trợ giúp đang được phát triển. Vui lòng liên hệ admin@example.com để được hỗ trợ.');
                }
            });
        });
    });
</script>
</body>
</html>