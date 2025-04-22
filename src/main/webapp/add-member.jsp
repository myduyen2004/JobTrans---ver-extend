
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm thành viên mới</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/add-member.css">

</head>
<%@include file="includes/header-01.jsp"%>
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
            <form action="group" method="post" id="memberForm" accept-charset="UTF-8" enctype="multipart/form-data">
<%--                <input type="hidden" name="action" value="create">--%>
                <input type="hidden" name="accountId" value="${account.accountId}">

                <div class="row">
                    <div class="col-md-3 animate__animated animate__fadeIn animate__delay-1s">
                        <div class="avatar-upload">

                            <div class="avatar-edit">
                                <input type='file' id="avatar" name="avatar" accept=".png, .jpg, .jpeg" />
                                <label for="avatar"><i class="fas fa-camera"></i></label>
                            </div>

                            <div class="avatar-preview">
                                <img src="img/default-avatar.jpg" id="imagePreview" alt="Ảnh đại diện">
                            </div>

                        </div>

                        <div class="text-center">
                            <div class="form-check form-switch d-flex justify-content-center align-items-center mb-4">
                                <label class="toggle-switch ms-2">
                                    <input type="checkbox" name="status" checked>
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
                                        <input type="text" class="form-control" id="memberName" name="memberName" placeholder="Họ và tên">
                                        <label for="memberName">Họ và tên</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" placeholder="Ngày sinh">
                                        <label for="dateOfBirth">Ngày sinh</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <select class="form-select" id="position" name="position">
                                            <option value="">Chọn vai trò</option>
                                            <option value="Trưởng nhóm">Trưởng nhóm</option>
                                            <option value="Phó nhóm">Phó nhóm</option>
                                            <option value="Thành viên">Thành viên</option>
                                        </select>
                                        <label for="position">Vai trò</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <select class="form-select" id="gender" name="gender">
                                            <option value="">Chọn giới tính</option>
                                            <option value="Nam">Nam</option>
                                            <option value="Nữ">Nữ</option>
                                            <option value="Khác">Khác</option>
                                        </select>
                                        <label for="gender">Giới tính</label>
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
                                        <input type="text" class="form-control" id="speciality" name="speciality" placeholder="Chuyên môn">
                                        <label for="speciality">Chuyên môn</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="number" class="form-control" id="experienceYears" name="experienceYears" placeholder="Chuyên môn">
                                        <label for="experienceYears">Số năm kinh nghiệm</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="education" name="education" placeholder="Học vấn">
                                        <label for="education">Học vấn</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <textarea class="form-control" id="skills" name="skills" style="height: 100px" placeholder="Kỹ năng"></textarea>
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
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                                        <label for="email">Email</label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Số điện thoại">
                                        <label for="phone">Số điện thoại</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="address" name="address" placeholder="Địa chỉ">
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
                                        <textarea class="form-control" id="bio" style="height: 120px" name="bio" placeholder="Tiểu sử"></textarea>
                                        <label for="bio">Tiểu sử ngắn</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="my-4 d-flex justify-content-between align-items-center">
                            <div class="form-check animate__animated animate__fadeIn animate__delay-3s">
                                <input class="form-check-input" type="checkbox" id="sendWelcomeEmail" name="sendWelcomeEmail">
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
        // document.getElementById('memberForm').addEventListener('submit', function(e) {
        //     e.preventDefault();
        //     const submitBtn = document.getElementById('btnSubmit');
        //     const loader = document.getElementById('submitLoader');
        //
        //     submitBtn.disabled = true;
        //     submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xử lý...';
        //
        //     // Giả lập xử lý form
        //     setTimeout(function() {
        //         submitBtn.innerHTML = '<i class="fas fa-check"></i> Đã lưu thành công';
        //         submitBtn.classList.remove('btn-primary');
        //         submitBtn.classList.add('btn-success');
        //
        //         // Hiển thị thông báo thành công
        //         alert('Đã thêm thành viên mới thành công!');
        //
        //         // Reset form sau khi lưu thành công
        //         setTimeout(function() {
        //             document.getElementById('memberForm').reset();
        //             submitBtn.disabled = false;
        //             submitBtn.innerHTML = '<i class="fas fa-save"></i> Lưu thành viên';
        //             submitBtn.classList.remove('btn-success');
        //             submitBtn.classList.add('btn-primary');
        //             document.querySelector('.progress-bar').style.width = '0%';
        //             document.getElementById('completionRate').textContent = '0%';
        //             document.getElementById('imagePreview').src = '/api/placeholder/180/180';
        //         }, 3000);
        //     }, 2000);
        // });

        // Xử lý việc tải lên hình ảnh
        document.getElementById('avatar').addEventListener('change', function(e) {
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
<%@include file="includes/footer.jsp"%>
</body>
</html>