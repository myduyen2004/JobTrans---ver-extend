
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm thành viên mới</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/edit-member.css">

</head>
<body>
<%@include file="includes/header-01.jsp"%>
<div class="page-header text-center">
    <div class="parallax-bg">
        <div class="parallax-circle circle-1"></div>
        <div class="parallax-circle circle-2"></div>
    </div>
    <div class="header-container">
        <h1 class="display-4 fw-bold animate__animated animate__fadeInDown">Cập nhật thông tin thành viên</h1>
        <p class="lead animate__animated animate__fadeInUp animate__delay-1s">Chỉnh sửa và cập nhật thông tin cho thành viên</p>
    </div>
</div>

<div class="container pb-5">
    <div class="card">
        <div class="card-header d-flex align-items-center">
            <h3 class="card-title">Thông tin thành viên</h3>
        </div>
        <div class="card-body">
            <form action="group" method="POST" id="memberForm" accept-charset="UTF-8" enctype="multipart/form-data">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="memberId" value="${member.memberId}">

                <div class="row">
                    <div class="col-md-3 animate__animated animate__fadeIn animate__delay-1s">
                        <div class="avatar-upload">

                            <div class="avatar-edit">
                                <input type='file' id="avatar" name="avatar" accept=".png, .jpg, .jpeg" />
                                <label for="avatar"><i class="fas fa-camera"></i></label>
                            </div>

                            <div class="avatar-preview">
                                <img src="${member.avatarMember}" id="imagePreview" alt="Ảnh đại diện">
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
                                        <input type="text" class="form-control" id="memberName" name="memberName" value="${member.memberName}">
                                        <label for="memberName">Họ và tên</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" value="${member.dateOfBirth}" required>
                                        <label for="dateOfBirth">Ngày sinh</label>
                                        <small id="dob-error" class="error-message" style="color: red; display: none;"></small>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <select class="form-select" id="position" name="position">
                                            <option value="">Chọn vai trò</option>
                                            <option value="Trưởng nhóm" ${member.position == 'Trưởng nhóm' ? 'selected' : ''}>Trưởng nhóm</option>
                                            <option value="Phó nhóm" ${member.position == 'Phó nhóm' ? 'selected' : ''}>Phó nhóm</option>
                                            <option value="Thành viên" ${member.position == 'Thành viên' ? 'selected' : ''}>Thành viên</option>
                                        </select>
                                        <label for="position">Vai trò</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <select class="form-select" id="gender" name="gender">
                                            <option value="">Chọn giới tính</option>
                                            <option value="Nam" ${member.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                            <option value="Nữ" ${member.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                            <option value="Khác" ${member.gender == 'Khác' ? 'selected' : ''}>Khác</option>
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
                                        <input type="text" class="form-control" id="speciality" name="speciality" value="${member.speciality}">
                                        <label for="speciality">Chuyên môn</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="number" class="form-control" id="experienceYears" name="experienceYears" value="${member.experienceYears}" required>
                                        <label for="experienceYears">Số năm kinh nghiệm</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="education" name="education" value="${member.education}">
                                        <label for="education">Học vấn</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input class="form-control" id="skills" name="skills" value="${member.skills}">
                                        <label for="skills">Kỹ năng (cách nhau bởi dấu phẩy)</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-section animate__animated animate__fadeInRight animate__delay-3s">
                            <h4 class="form-section-title"><i class="fas fa-address-card"></i> Thông tin liên hệ</h4>

                            <div class="row">
<%--                                <div class="col-md-6">--%>
<%--                                    <div class="form-floating">--%>
<%--                                        <input type="email" class="form-control" id="email" name="email" placeholder="${member.email}">--%>
<%--                                        <label for="email">Email</label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input type="tel" class="form-control" id="phone" name="phone" value="${member.phone}">
                                        <label for="phone">Số điện thoại</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="address" name="address" value="${member.address}">
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
                                        <textarea class="form-control" id="bio" style="height: 120px" name="bio">${member.bio}</textarea>
                                        <label for="bio">Tiểu sử ngắn</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="my-4 d-flex justify-content-between align-items-center">
                            <div class="form-check animate__animated animate__fadeIn animate__delay-3s">
<%--                                <input class="form-check-input" type="checkbox" id="sendWelcomeEmail" name="sendWelcomeEmail">--%>
<%--                                <label class="form-check-label" for="sendWelcomeEmail">--%>
<%--                                    Gửi email chào mừng--%>
<%--                                </label>--%>
                            </div>

                            <div class="btn-container animate__animated animate__fadeIn animate__delay-3s">
                                <button type="button" class="btn btn-outline-secondary btn-action" onclick="history.back()" id="btnCancel" style="border-radius: 30px; padding: 10px 20px;">
                                    <i class="fas fa-times"></i> Hủy bỏ
                                </button>
                                <button type="submit" class="btn btn-primary btn-action" id="btnSubmit" style="background-image: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));color: white; border-radius: 30px; padding: 10px 20px;">
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

<%--Validate các trường--%>
<script>
    // Validation cho form thông tin cá nhân
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.querySelector('form');
        const nameInput = document.getElementById('memberName'); // Thêm trường tên thành viên
        const dobInput = document.getElementById('dateOfBirth');
        const dobError = document.getElementById('dob-error');
        const specialityInput = document.getElementById('speciality');
        const skillsInput = document.getElementById('skills');
        const educationInput = document.getElementById('education');
        const experienceYearsInput = document.getElementById('experienceYears');
        let addressInput = document.getElementById('address');
        const phoneInput = document.getElementById('phone');

        // Kiểm tra các phần tử có tồn tại không
        if (!form) {
            console.error('Không tìm thấy form trong trang');
            return;
        }

        // Pattern để kiểm tra ký tự đặc biệt
        // Cho phép chữ cái, số, dấu cách, dấu phẩy, dấu chấm và dấu tiếng Việt
        const specialCharsPattern = /[^\p{L}\p{N}\s\.,]/u;

        // Pattern đặc biệt cho tên - chỉ cho phép chữ cái, dấu cách và dấu tiếng Việt
        const nameSpecialCharsPattern = /[^\p{L}\s]/u;

        // Hàm kiểm tra ký tự đặc biệt
        function hasSpecialChars(value) {
            return specialCharsPattern.test(value);
        }

        // Hàm kiểm tra ký tự đặc biệt cho tên (không cho phép số)
        function hasNameSpecialChars(value) {
            return nameSpecialCharsPattern.test(value);
        }

        // Danh sách 63 tỉnh thành Việt Nam
        const vietnamProvinces = [
            "An Giang", "Bà Rịa - Vũng Tàu", "Bắc Giang", "Bắc Kạn", "Bạc Liêu",
            "Bắc Ninh", "Bến Tre", "Bình Định", "Bình Dương", "Bình Phước",
            "Bình Thuận", "Cà Mau", "Cần Thơ", "Cao Bằng", "Đà Nẵng",
            "Đắk Lắk", "Đắk Nông", "Điện Biên", "Đồng Nai", "Đồng Tháp",
            "Gia Lai", "Hà Giang", "Hà Nam", "Hà Nội", "Hà Tĩnh",
            "Hải Dương", "Hải Phòng", "Hậu Giang", "Hòa Bình", "Hưng Yên",
            "Khánh Hòa", "Kiên Giang", "Kon Tum", "Lai Châu", "Lâm Đồng",
            "Lạng Sơn", "Lào Cai", "Long An", "Nam Định", "Nghệ An",
            "Ninh Bình", "Ninh Thuận", "Phú Thọ", "Phú Yên", "Quảng Bình",
            "Quảng Nam", "Quảng Ngãi", "Quảng Ninh", "Quảng Trị", "Sóc Trăng",
            "Sơn La", "Tây Ninh", "Thái Bình", "Thái Nguyên", "Thanh Hóa",
            "Thừa Thiên Huế", "Tiền Giang", "TP Hồ Chí Minh", "Trà Vinh", "Tuyên Quang",
            "Vĩnh Long", "Vĩnh Phúc", "Yên Bái"
        ];

        // Hàm tạo và hiển thị thông báo lỗi
        function showError(element, message) {
            if (!element) return false;

            // Kiểm tra xem đã có thông báo lỗi chưa
            let errorElement = element.nextElementSibling;
            if (!errorElement || !errorElement.classList.contains('error-message')) {
                // Tạo phần tử thông báo lỗi mới
                errorElement = document.createElement('small');
                errorElement.classList.add('error-message');
                errorElement.style.color = 'red';
                errorElement.style.display = 'block';
                errorElement.style.marginTop = '5px';
                // Chèn sau input
                element.parentNode.insertBefore(errorElement, element.nextSibling);
            }

            errorElement.textContent = message;
            errorElement.style.display = 'block';
            return false;
        }

        // Hàm ẩn thông báo lỗi
        function hideError(element) {
            if (!element) return true;

            const errorElement = element.nextElementSibling;
            if (errorElement && errorElement.classList.contains('error-message')) {
                errorElement.style.display = 'none';
            }
            return true;
        }

        // Hàm viết hoa chữ cái đầu của mỗi từ
        function capitalizeFirstLetter(string) {
            return string.toLowerCase() // Chuyển toàn bộ về chữ thường trước
                .split(' ')   // Tách thành các từ
                .map(word => word.charAt(0).toUpperCase() + word.slice(1)) // Viết hoa chữ cái đầu mỗi từ
                .join(' ');    // Ghép lại thành chuỗi
        }

        // Hàm kiểm tra tuổi từ ngày sinh
        function validateAge(dobValue) {
            const dobDate = new Date(dobValue);
            const today = new Date();

            // Kiểm tra ngày sinh hợp lệ
            if (isNaN(dobDate.getTime())) {
                return { valid: false, age: 0, message: 'Ngày sinh không hợp lệ' };
            }

            // Tính tuổi
            let age = today.getFullYear() - dobDate.getFullYear();
            const monthDiff = today.getMonth() - dobDate.getMonth();
            if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dobDate.getDate())) {
                age--;
            }

            // Kiểm tra tuổi >= 18 và không phải ngày ở tương lai
            if (dobDate > today) {
                return { valid: false, age: age, message: 'Ngày sinh không thể là ngày trong tương lai' };
            } else if (age < 18) {
                return { valid: false, age: age, message: 'Bạn phải đủ 18 tuổi trở lên' };
            }

            return { valid: true, age: age, message: '' };
        }

        // Thêm datalist cho tỉnh thành Việt Nam
        if (addressInput) {
            // Lấy giá trị hiện tại từ input (đây là giá trị từ database)
            const currentAddress = addressInput.value;

            // Tạo hoặc thay thế input text bằng dropdown select
            const parentElement = addressInput.parentElement;
            const labelText = parentElement.querySelector('label') ? parentElement.querySelector('label').textContent : 'Địa chỉ';

            // Tạo select element mới
            const selectElement = document.createElement('select');
            selectElement.id = addressInput.id;
            selectElement.name = addressInput.name;
            selectElement.className = addressInput.className;
            selectElement.required = addressInput.required;

            // Thêm option mặc định
            const defaultOption = document.createElement('option');
            defaultOption.value = "";
            defaultOption.textContent = "-- Chọn tỉnh thành --";
            defaultOption.disabled = true;

            // Chỉ chọn option mặc định nếu không có giá trị từ database
            if (!currentAddress || currentAddress.trim() === "") {
                defaultOption.selected = true;
            }

            selectElement.appendChild(defaultOption);

            // Thêm các option cho tỉnh thành
            vietnamProvinces.forEach(province => {
                const option = document.createElement('option');
                option.value = province;
                option.textContent = province;

                // Chọn option nếu trùng với giá trị từ database
                if (province === currentAddress) {
                    option.selected = true;
                }

                selectElement.appendChild(option);
            });

            // Thay thế input cũ bằng select mới
            parentElement.replaceChild(selectElement, addressInput);

            // Cập nhật biến addressInput để trỏ đến select mới
            addressInput = selectElement;

            // Thêm CSS để làm đẹp select
            const style = document.createElement('style');
            style.textContent = `
        select#${addressInput.id} {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23333' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 16px;
            cursor: pointer;
        }
        select#${addressInput.id}:focus {
            outline: none;
            border-color: #4299e1;
            box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.5);
        }
        select#${addressInput.id} option {
            padding: 8px;
        }
    `;
            document.head.appendChild(style);

            // Cập nhật event listener cho select thay vì input
            addressInput.addEventListener('change', function() {
                const addressValue = this.value.trim();
                if (addressValue === "") {
                    showError(this, 'Vui lòng chọn tỉnh thành');
                } else {
                    hideError(this);
                }
            });
        }

        // Thực hiện validation ban đầu cho các trường bắt buộc
        function initialValidation() {
            // Kiểm tra các trường bắt buộc khi trang được tải
            if (nameInput && nameInput.required && nameInput.value.trim() === '') {
                showError(nameInput, 'Vui lòng nhập tên thành viên');
            }

            if (dobInput && dobInput.required && dobInput.value.trim() === '') {
                showError(dobInput, 'Vui lòng nhập ngày sinh');
            }

            if (addressInput && addressInput.required && addressInput.value.trim() === '') {
                showError(addressInput, 'Vui lòng chọn tỉnh thành');
            }

            if (phoneInput && phoneInput.required && phoneInput.value.trim() === '') {
                showError(phoneInput, 'Vui lòng nhập số điện thoại');
            }

            if (experienceYearsInput && experienceYearsInput.required && experienceYearsInput.value.trim() === '') {
                showError(experienceYearsInput, 'Vui lòng nhập số năm kinh nghiệm');
            }
        }

        // Validation khi submit form
        form.addEventListener('submit', function(event) {
            let isValid = true;

            // Kiểm tra tên thành viên
            if (nameInput) {
                const nameValue = nameInput.value.trim();
                if (nameValue === '') {
                    isValid = showError(nameInput, 'Vui lòng nhập tên thành viên');
                } else if (hasNameSpecialChars(nameValue)) {
                    isValid = showError(nameInput, 'Tên không được chứa ký tự đặc biệt hoặc số');
                } else {
                    hideError(nameInput);
                }
            }

            // Kiểm tra ngày sinh
            if(dobInput) {
                if (dobInput.value === "") {
                    isValid = showError(dobInput, 'Vui lòng nhập ngày sinh');
                } else {
                    const ageCheck = validateAge(dobInput.value);
                    if (!ageCheck.valid) {
                        if (dobError) {
                            dobError.textContent = ageCheck.message;
                            dobError.style.display = 'block';
                        } else {
                            showError(dobInput, ageCheck.message);
                        }
                        isValid = false;
                    } else if (dobError) {
                        dobError.style.display = 'none';
                    } else {
                        hideError(dobInput);
                    }
                }
            }

            // Kiểm tra chuyên môn không chỉ chứa số và không có ký tự đặc biệt
            if(specialityInput && specialityInput.value.trim() !== '') {
                if(/^\d+$/.test(specialityInput.value.trim())) {
                    isValid = showError(specialityInput, 'Chuyên môn không được chỉ chứa số');
                } else if (hasSpecialChars(specialityInput.value.trim())) {
                    isValid = showError(specialityInput, 'Chuyên môn không được chứa ký tự đặc biệt');
                } else {
                    hideError(specialityInput);
                }
            }

            // Kiểm tra kĩ năng không chỉ chứa số và không có ký tự đặc biệt
            if(skillsInput && skillsInput.value.trim() !== '') {
                if(/^\d+$/.test(skillsInput.value.trim())) {
                    isValid = showError(skillsInput, 'Kĩ năng không được chỉ chứa số');
                } else if (hasSpecialChars(skillsInput.value.trim())) {
                    isValid = showError(skillsInput, 'Kĩ năng không được chứa ký tự đặc biệt');
                } else {
                    hideError(skillsInput);
                }
            }

            // Kiểm tra học vấn không chỉ chứa số và không có ký tự đặc biệt
            if(educationInput && educationInput.value.trim() !== '') {
                if(/^\d+$/.test(educationInput.value.trim())) {
                    isValid = showError(educationInput, 'Học vấn không được chỉ chứa số');
                } else if (hasSpecialChars(educationInput.value.trim())) {
                    isValid = showError(educationInput, 'Học vấn không được chứa ký tự đặc biệt');
                } else {
                    hideError(educationInput);
                }
            }

            // Kiểm tra địa chỉ được chọn
            if(addressInput && addressInput.value.trim() === '') {
                isValid = showError(addressInput, 'Vui lòng chọn tỉnh thành');
            } else if(addressInput) {
                hideError(addressInput);
            }

            // Kiểm tra số điện thoại
            if(phoneInput) {
                if(phoneInput.value.trim() === '') {
                    isValid = showError(phoneInput, 'Vui lòng nhập số điện thoại');
                } else if(!/^\d{10}$/.test(phoneInput.value.trim())) {
                    isValid = showError(phoneInput, 'Số điện thoại phải có đúng 10 chữ số');
                } else {
                    hideError(phoneInput);
                }
            }

            // Kiểm tra số năm kinh nghiệm
            if (experienceYearsInput) {
                const expValue = experienceYearsInput.value.trim();

                if (expValue === '') {
                    isValid = showError(experienceYearsInput, 'Vui lòng nhập số năm kinh nghiệm');
                } else if (!/^\d+$/.test(expValue)) {
                    isValid = showError(experienceYearsInput, 'Số năm kinh nghiệm phải là số nguyên dương');
                } else {
                    // Nếu có dobInput và hợp lệ, kiểm tra so với tuổi
                    if (dobInput && dobInput.value) {
                        const ageCheck = validateAge(dobInput.value);
                        if (ageCheck.valid) {
                            const experience = parseInt(expValue);

                            if (experience < 0) {
                                isValid = showError(experienceYearsInput, 'Số năm kinh nghiệm không thể âm');
                            } else if (experience >= ageCheck.age) {
                                isValid = showError(experienceYearsInput, 'Số năm kinh nghiệm phải nhỏ hơn tuổi của bạn');
                            } else {
                                hideError(experienceYearsInput);
                            }
                        }
                    } else {
                        // Chỉ kiểm tra có phải là số nguyên dương không
                        const experience = parseInt(expValue);
                        if (experience < 0) {
                            isValid = showError(experienceYearsInput, 'Số năm kinh nghiệm không thể âm');
                        } else {
                            hideError(experienceYearsInput);
                        }
                    }
                }
            }

            if(!isValid) {
                event.preventDefault();
            }
        });

        // Validation cho trường tên thành viên
        if (nameInput) {
            nameInput.addEventListener('input', function() {
                hideError(this);
            });

            nameInput.addEventListener('blur', function() {
                const nameValue = this.value.trim();
                if (nameValue === '') {
                    showError(this, 'Vui lòng nhập tên thành viên');
                } else if (hasNameSpecialChars(nameValue)) {
                    showError(this, 'Tên không được chứa ký tự đặc biệt hoặc số');
                } else {
                    hideError(this);
                    // Viết hoa chữ cái đầu
                    this.value = capitalizeFirstLetter(nameValue);
                }
            });
        }

        // Thêm validation khi bắt đầu nhập dữ liệu (input event)
        if(dobInput) {
            // Xử lý khi người dùng bắt đầu nhập (xóa thông báo lỗi ngay lập tức)
            dobInput.addEventListener('input', function() {
                // Xóa thông báo lỗi ngay khi người dùng bắt đầu nhập
                if (dobError) {
                    dobError.style.display = 'none';
                }
                hideError(this);
            });

            // Validation khi người dùng thay đổi giá trị hoặc rời khỏi trường
            dobInput.addEventListener('change', function() {
                if(this.value === "") {
                    // Xóa thông báo lỗi cũ trước khi hiển thị thông báo lỗi mới
                    if (dobError) {
                        dobError.style.display = 'none';
                    }
                    showError(this, 'Vui lòng nhập ngày sinh');
                    return;
                }

                const ageCheck = validateAge(this.value);
                if (!ageCheck.valid) {
                    // Xóa thông báo lỗi cũ trước khi hiển thị thông báo lỗi mới
                    hideError(this);

                    if (dobError) {
                        dobError.textContent = ageCheck.message;
                        dobError.style.display = 'block';
                    } else {
                        showError(this, ageCheck.message);
                    }
                } else {
                    // Nếu ngày sinh hợp lệ, ẩn cả thông báo lỗi chính và error-message
                    if (dobError) {
                        dobError.style.display = 'none';
                    }
                    hideError(this);
                }
            });
        }

        // Chuyên môn - viết hoa chữ cái đầu và kiểm tra ký tự đặc biệt
        if(specialityInput) {
            specialityInput.addEventListener('input', function() {
                hideError(this);
            });

            specialityInput.addEventListener('blur', function() {
                if(this.value.trim() !== '') {
                    if(/^\d+$/.test(this.value.trim())) {
                        showError(this, 'Chuyên môn không được chỉ chứa số');
                    } else if (hasSpecialChars(this.value.trim())) {
                        showError(this, 'Chuyên môn không được chứa ký tự đặc biệt');
                    } else {
                        hideError(this);
                        this.value = capitalizeFirstLetter(this.value.trim());
                    }
                }
            });
        }

        // Kĩ năng - viết hoa chữ cái đầu và kiểm tra ký tự đặc biệt
        if(skillsInput) {
            skillsInput.addEventListener('input', function() {
                hideError(this);
            });

            skillsInput.addEventListener('blur', function() {
                if(this.value.trim() !== '') {
                    if(/^\d+$/.test(this.value.trim())) {
                        showError(this, 'Kĩ năng không được chỉ chứa số');
                    } else if (hasSpecialChars(this.value.trim())) {
                        showError(this, 'Kĩ năng không được chứa ký tự đặc biệt');
                    } else {
                        hideError(this);
                        this.value = capitalizeFirstLetter(this.value.trim());
                    }
                }
            });
        }

        // Học vấn - viết hoa chữ cái đầu và kiểm tra ký tự đặc biệt
        if(educationInput) {
            educationInput.addEventListener('input', function() {
                hideError(this);
            });

            educationInput.addEventListener('blur', function() {
                if(this.value.trim() !== '') {
                    if(/^\d+$/.test(this.value.trim())) {
                        showError(this, 'Học vấn không được chỉ chứa số');
                    } else if (hasSpecialChars(this.value.trim())) {
                        showError(this, 'Học vấn không được chứa ký tự đặc biệt');
                    } else {
                        hideError(this);
                        this.value = capitalizeFirstLetter(this.value.trim());
                    }
                }
            });
        }

        // Validation cho số điện thoại - chỉ cho phép nhập số
        if(phoneInput) {
            // Loại bỏ ký tự không phải số khi nhập
            phoneInput.addEventListener('input', function() {
                this.value = this.value.replace(/\D/g, '');

                // Giới hạn độ dài tối đa 10 số
                if(this.value.length > 10) {
                    this.value = this.value.slice(0, 10);
                }

                hideError(this);
            });

            // Kiểm tra đúng 10 chữ số khi blur
            phoneInput.addEventListener('blur', function() {
                if(this.value.trim() === '') {
                    showError(this, 'Vui lòng nhập số điện thoại');
                } else if(!/^\d{10}$/.test(this.value.trim())) {
                    showError(this, 'Số điện thoại phải có đúng 10 chữ số');
                } else {
                    hideError(this);
                }
            });
        }

        // Validation cho số năm kinh nghiệm
        if (experienceYearsInput) {
            // Chỉ cho phép nhập số và loại bỏ các ký tự khác
            experienceYearsInput.addEventListener('input', function() {
                this.value = this.value.replace(/\D/g, '');

                // Giới hạn tối đa 2 chữ số (99 năm kinh nghiệm)
                if (this.value.length > 2) {
                    this.value = this.value.slice(0, 2);
                }

                hideError(this);
            });

            // Kiểm tra so với tuổi khi blur
            experienceYearsInput.addEventListener('blur', function() {
                const expValue = this.value.trim();

                if (expValue === '') {
                    showError(this, 'Vui lòng nhập số năm kinh nghiệm');
                    return;
                }

                if (!/^\d+$/.test(expValue)) {
                    showError(this, 'Số năm kinh nghiệm phải là số nguyên dương');
                    return;
                }

                const experience = parseInt(expValue);

                if (experience < 0) {
                    showError(this, 'Số năm kinh nghiệm không thể âm');
                    return;
                }

                // Nếu có ngày sinh và hợp lệ, kiểm tra so với tuổi
                if (dobInput && dobInput.value) {
                    const ageCheck = validateAge(dobInput.value);
                    if (ageCheck.valid) {
                        if (experience >= ageCheck.age) {
                            showError(this, 'Số năm kinh nghiệm phải nhỏ hơn tuổi của bạn');
                        } else {
                            hideError(this);
                        }
                    }
                } else {
                    hideError(this);
                }
            });
        }

        // Chạy validation ban đầu
        initialValidation();
    });
</script>

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