<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa thông tin cá nhân</title>
    <link rel="stylesheet" href="css/edit-account.css">

</head>
<body>
<%@include file="includes/header-01.jsp"%>
    <div class="container">
        <!-- Header -->
        <div class="edit-header">
            <div>
                <h1 class="header-title">Chỉnh sửa thông tin cá nhân</h1>
                <p class="header-subtitle">Cập nhật thông tin hồ sơ của bạn để hiển thị cho người khác</p>
            </div>
        </div>

        <form action="profile" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
            <input type="hidden" name="accountId" value="${account.accountId}">
            <!-- Avatar section -->
            <div class="form-container">
                <div class="avatar-upload">
                    <img class="avatar" src="${account.avatar}" alt="Ảnh đại diện">
                    <div class="avatar-actions">
                        <label for="avatar-upload" class="upload-btn">Tải ảnh lên</label>
                        <input id="avatar-upload" class="file-upload" type="file" name="avatar" accept="image/*"
                               style="display: none;"/>
                        <input type="hidden" name="avatemp" value="${account.avatar}" accept="image/*"/>
                        <p class="upload-note">Cho phép PNG, JPG hoặc GIF, tối đa 2MB</p>
                    </div>
                </div>
            </div>

            <!-- Basic information -->
            <div class="form-container">
                <div class="form-section">
                    <h2 class="section-title">Thông tin cơ bản</h2>
                    <div class="form-grid">
                        <div class="form-row form-full-width">
                            <label for="name" class="form-label required-label">Tên tài khoản</label>
                            <input type="text" id="name" class="form-input" name="name" value="${account.accountName}" required>
                        </div>
                        <%--                    <div class="form-row">--%>
                        <%--                        <label for="display-name" class="form-label required-label">Tên hiển thị</label>--%>
                        <%--                        <input type="text" id="display-name" class="form-input" value="Nguyễn Văn A" required>--%>
                        <%--                    </div>--%>
                        <%--                    <div class="form-row">--%>
                        <%--                        <label for="role" class="form-label">Vai trò</label>--%>
                        <%--                        <div class="autocomplete-container">--%>
                        <%--                            <input type="text" id="role" class="form-input" value="Freelancer - Thiết kế đồ họa">--%>
                        <%--                            <div class="autocomplete-results" id="role-results"></div>--%>
                        <%--                        </div>--%>
                        <%--                    </div>--%>

                        <c:if test="${account.typeAccount == 'Cá nhân'}">
                            <div class="form-row">
                                <label for="dob" class="form-label">Ngày sinh</label>
                                <input type="date" id="dob" class="form-input" name="dob" value="${account.dateOfBirth}">
                                <small id="dob-error" class="error-message" style="color: red; display: none;"></small>
                            </div>
                            <div class="form-row">
                                <label for="gender" class="form-label">Giới tính</label>
                                <select id="gender" name="gender" class="form-select" style="padding: 12px 15px;">
                                    <option value="Nam" ${account.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                    <option value="Nữ" ${account.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                    <option value="Khác" ${account.gender == 'Khác' ? 'selected' : ''}>Khác</option>
                                </select>
                            </div>
                        </c:if>
                        <div class="form-row form-full-width">
                            <label for="bio" class="form-label">Giới thiệu</label>
                            <textarea id="bio" name="bio" class="form-textarea">${account.bio}</textarea>
                        </div>
                    </div>
                </div>

                <div class="section-divider"></div>

                <!-- Professional info -->
                <div class="form-section">
                    <h2 class="section-title">Thông tin chuyên môn</h2>
                    <div class="form-grid">

                        <div class="form-row">
                            <label for="experience" class="form-label">Kinh nghiệm (năm)</label>
                            <input type="number" id="experience" class="form-input" name="experienceYears" value="${account.experienceYears}"
                                   min="0" max="50">
                        </div>
                        <div class="form-row">
                            <label for="status" class="form-label">Trạng thái</label>
                            <select id="status" class="form-select" name="status" style="padding: 12px 15px;">
                                <option value="Đang hoạt động" ${account.status == 'Đang hoạt động' ? 'selected' : ''}>Đang
                                    hoạt động
                                </option>
                                <option value="Bị cấm" ${account.status == 'Bị cấm' ? 'selected' : ''}>Bị cấm</option>
                                <option value="Chờ xử lí" ${account.status == 'Chờ xử lí' ? 'selected' : ''}>Chờ xử lí</option>
                            </select>
                        </div>
                        <c:if test="${account.typeAccount == 'Cá nhân'}">
                            <div class="form-row form-full-width">
                                <label for="education" class="form-label">Học vấn</label>
                                <div class="autocomplete-container">
                                    <input type="text" id="education" class="form-input" name="education" value="${account.education}">
                                    <div class="autocomplete-results" id="education-results"></div>
                                </div>
                            </div>
                        </c:if>
                        <div class="form-row form-full-width">
                            <label for="speciality" class="form-label">Chuyên môn</label>
                            <div class="autocomplete-container">
                                <input type="text" id="speciality" class="form-input" name="speciality" value="${account.speciality}">
                                <div class="autocomplete-results" id="specialty-results"></div>
                            </div>
                        </div>
                        <c:if test="${account.typeAccount == 'Cá nhân'}">
<%--                            <div class="form-row form-full-width">--%>
<%--                                <label for="skills" class="form-label">Kỹ năng</label>--%>
<%--                                <div class="tags-input-container">--%>
<%--                                    <div class="tag">--%>
<%--                                        Photoshop--%>
<%--                                        <span class="tag-close">&times;</span>--%>
<%--                                    </div>--%>
<%--                                    <div class="tag">--%>
<%--                                        Illustrator--%>
<%--                                        <span class="tag-close">&times;</span>--%>
<%--                                    </div>--%>
<%--                                    <div class="tag">--%>
<%--                                        UI/UX--%>
<%--                                        <span class="tag-close">&times;</span>--%>
<%--                                    </div>--%>
<%--                                    <div class="tag">--%>
<%--                                        Web Design--%>
<%--                                        <span class="tag-close">&times;</span>--%>
<%--                                    </div>--%>
<%--                                    <input type="text" id="skills" class="tags-input" name="skills" placeholder="Thêm kỹ năng...">--%>
<%--                                </div>--%>
<%--                                <div class="autocomplete-results" id="skills-results"></div>--%>
<%--                                <p class="help-text">Nhấn Enter để thêm kỹ năng mới</p>--%>
<%--                            </div>--%>
                            <div class="form-row form-full-width">
                                <label for="skills-display" class="form-label">Kỹ năng</label>
                                <div class="tags-input-container">
                                    <input type="text" id="skills-display" class="tags-input" placeholder="Thêm kỹ năng...">
                                    <input type="hidden" id="skills" name="skills" value="${account.skills}">
                                </div>
                                <div class="autocomplete-results" id="skills-results"></div>
                                <p class="help-text">Nhấn Enter để thêm kỹ năng mới</p>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="section-divider"></div>

                <!-- Contact info -->
                <div class="form-section">
                    <h2 class="section-title">Thông tin liên hệ</h2>
                    <div class="form-grid">
                        <div class="form-row">
                            <label for="email" class="form-label required-label">Email</label>
                            <input type="email" id="email" class="form-input" value="${account.email}" required>
                        </div>
                        <div class="form-row">
                            <label for="phone" class="form-label">Điện thoại</label>
                            <input type="tel" id="phone" class="form-input" name="phone" value="${account.phone}">
                        </div>
                        <div class="form-row form-full-width">
                            <label for="address" class="form-label">Địa chỉ</label>
                            <input type="text" id="address" class="form-input" name="address" value="${account.address}">
                        </div>
                    </div>
                </div>

                <div class="section-divider"></div>

                <!-- Social media -->
    <%--            <div class="form-section">--%>
    <%--                <h2 class="section-title">Mạng xã hội</h2>--%>
    <%--                <div class="form-grid">--%>
    <%--                    <div class="form-row">--%>
    <%--                        <label for="facebook" class="form-label">Facebook</label>--%>
    <%--                        <input type="url" id="facebook" class="form-input" placeholder="https://facebook.com/username">--%>
    <%--                    </div>--%>
    <%--                    <div class="form-row">--%>
    <%--                        <label for="linkedin" class="form-label">LinkedIn</label>--%>
    <%--                        <input type="url" id="linkedin" class="form-input"--%>
    <%--                               placeholder="https://linkedin.com/in/username">--%>
    <%--                    </div>--%>
    <%--                    <div class="form-row">--%>
    <%--                        <label for="instagram" class="form-label">Instagram</label>--%>
    <%--                        <input type="url" id="instagram" class="form-input"--%>
    <%--                               placeholder="https://instagram.com/username">--%>
    <%--                    </div>--%>
    <%--                    <div class="form-row">--%>
    <%--                        <label for="portfolio" class="form-label">Website/Portfolio</label>--%>
    <%--                        <input type="url" id="portfolio" class="form-input" placeholder="https://yourportfolio.com">--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>

    <%--            <div class="section-divider"></div>--%>

                <!-- Signature as image -->
                <div class="form-section">
                    <h2 class="section-title">Chữ ký hình ảnh</h2>
                    <div class="form-row">
                        <label class="form-label">Chữ ký của bạn</label>
                        <div class="signature-upload">

                                <c:if test="${account.signature != null}">
                                    <div class="signature-preview">
                                        <img class="signature-placeholder" src="${account.signature}" alt="Chữ ký của ${account.accountName}">
                                    </div>
                                    <div class="signature-actions">
                                        <label for="signature-upload-a" class="upload-btn">Tải ảnh chữ ký lên</label>
                                        <input type="file" id="signature-upload-a" class="file-input" name="signature" accept="image/*">
                                    </div>
                                    <p class="help-text">Chữ ký hình ảnh sẽ hiển thị dưới thông tin hồ sơ của bạn. Cho phép PNG, JPG
                                        hoặc GIF, tối đa 1MB
                                    </p>
                                </c:if>
                                <c:if test="${account.signature == null}">
                                    <div class="signature-preview">
                                        <img class="signature-placeholder" src="${account.signature}" alt="Chưa có chữ ký">
                                    </div>
                                    <div class="signature-actions">
                                        <label for="signature-upload" class="upload-btn">Tải ảnh chữ ký lên</label>
                                        <input type="file" id="signature-upload" class="file-input" name="signature" accept="image/*">
                                    </div>
                                    <p class="help-text">Chữ ký hình ảnh sẽ hiển thị dưới thông tin hồ sơ của bạn. Cho phép PNG, JPG
                                        hoặc GIF, tối đa 1MB
                                    </p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="section-divider"></div>

                <!-- Privacy settings -->
                <div class="form-section">
                    <h2 class="section-title">Cài đặt riêng tư</h2>
                    <div class="form-row">
                        <div class="toggle-container">
                            <span class="toggle-label">Hiển thị thông tin liên hệ</span>
                            <label class="toggle-switch">
                                <input type="checkbox" checked>
                                <span class="toggle-slider"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="toggle-container">
                            <span class="toggle-label">Hiển thị báo cáo nhận được</span>
                            <label class="toggle-switch">
                                <input type="checkbox">
                                <span class="toggle-slider"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="toggle-container">
                            <span class="toggle-label">Hiển thị trạng thái hoạt động</span>
                            <label class="toggle-switch">
                                <input type="checkbox" checked>
                                <span class="toggle-slider"></span>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="button" class="btn btn-secondary">Hủy</button>
                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                </div>
        </form>
    </div>
<%@include file="includes/footer.jsp"%>
<%--Xử lý list Skills--%>
<script>
    // JavaScript để xử lý tags
    document.addEventListener('DOMContentLoaded', function() {
        const tagsContainer = document.querySelector('.tags-input-container');
        const tagsInput = document.getElementById('skills-display'); // Input hiển thị
        const hiddenInput = document.getElementById('skills'); // Input ẩn đã có trong HTML
        const autocompleteResults = document.getElementById('skills-results');

        // Danh sách gợi ý
        const suggestions = [
            'Photoshop', 'Illustrator', 'UI/UX', 'Web Design', 'HTML', 'CSS',
            'JavaScript', 'React', 'Angular', 'Vue.js', 'Node.js', 'PHP',
            'WordPress', 'Figma', 'Sketch', 'Adobe XD', 'Typography',
            'Responsive Design', 'Mobile Design', 'Logo Design', 'Branding'
        ];

        // Khởi tạo tags từ database
        initTagsFromDatabase();

        // Xử lý khi người dùng nhập vào input
        tagsInput.addEventListener('input', function() {
            const value = this.value.trim();

            if (value) {
                // Lọc các gợi ý phù hợp
                const filteredSuggestions = suggestions.filter(suggestion =>
                    suggestion.toLowerCase().includes(value.toLowerCase()) &&
                    !isTagExists(suggestion)
                );

                // Hiển thị danh sách gợi ý
                showSuggestions(filteredSuggestions);
            } else {
                // Ẩn danh sách gợi ý nếu input trống
                autocompleteResults.innerHTML = '';
                autocompleteResults.style.display = 'none';
            }
        });

        // Xử lý khi nhấn phím trong input
        tagsInput.addEventListener('keydown', function(e) {
            if (e.key === 'Enter' && this.value.trim() !== '') {
                e.preventDefault(); // Ngăn form submit khi nhấn Enter
                const tagText = this.value.trim();
                addTag(tagText);
                this.value = '';
                autocompleteResults.innerHTML = '';
                autocompleteResults.style.display = 'none';
            }
        });

        // Xử lý khi click vào bất kỳ đâu trên trang
        document.addEventListener('click', function(e) {
            if (!autocompleteResults.contains(e.target) && e.target !== tagsInput) {
                autocompleteResults.style.display = 'none';
            }
        });

        // Hàm hiển thị danh sách gợi ý
        function showSuggestions(filteredSuggestions) {
            if (filteredSuggestions.length === 0) {
                autocompleteResults.innerHTML = '';
                autocompleteResults.style.display = 'none';
                return;
            }

            autocompleteResults.innerHTML = '';

            filteredSuggestions.forEach(suggestion => {
                const div = document.createElement('div');
                div.textContent = suggestion;
                div.classList.add('autocomplete-item');

                div.addEventListener('click', function() {
                    addTag(suggestion);
                    tagsInput.value = '';
                    autocompleteResults.innerHTML = '';
                    autocompleteResults.style.display = 'none';
                    tagsInput.focus();
                });

                autocompleteResults.appendChild(div);
            });

            autocompleteResults.style.display = 'block';
        }

        // Hàm thêm tag mới
        function addTag(text) {
            if (isTagExists(text)) {
                return;
            }

            const tag = document.createElement('div');
            tag.classList.add('tag');

            const closeButton = document.createElement('span');
            closeButton.classList.add('tag-close');
            closeButton.innerHTML = '&times;';

            const textNode = document.createTextNode(text);
            tag.appendChild(textNode);
            tag.appendChild(closeButton);

            closeButton.addEventListener('click', function() {
                tagsContainer.removeChild(tag);
                updateHiddenField(); // Cập nhật input ẩn sau khi xóa tag
            });

            // Thêm tag vào trước input display
            tagsContainer.insertBefore(tag, tagsInput);

            // Cập nhật input ẩn sau khi thêm tag
            updateHiddenField();
        }

        // Kiểm tra xem tag đã tồn tại chưa
        function isTagExists(text) {
            const existingTags = document.querySelectorAll('.tag');
            for (let i = 0; i < existingTags.length; i++) {
                const tagText = existingTags[i].firstChild.textContent.trim();
                if (tagText.toLowerCase() === text.toLowerCase()) {
                    return true;
                }
            }
            return false;
        }

        // Hàm cập nhật input ẩn
        function updateHiddenField() {
            const tags = [];
            const existingTags = document.querySelectorAll('.tag');

            existingTags.forEach(tag => {
                const tagText = tag.firstChild.textContent.trim();
                tags.push(tagText);
            });

            // Cập nhật giá trị của input ẩn
            hiddenInput.value = tags.join(',');
            console.log("Hidden input updated:", hiddenInput.value); // Log để debug
        }

        // Hàm khởi tạo tags từ dữ liệu đã có trong database
        function initTagsFromDatabase() {
            // Lấy giá trị từ input ẩn
            const skillsValue = hiddenInput.value;

            if (skillsValue && skillsValue.trim() !== '') {
                // Xóa các tag mặc định nếu có
                const existingTags = document.querySelectorAll('.tag');
                existingTags.forEach(tag => {
                    tag.remove();
                });

                // Tách chuỗi kỹ năng thành mảng
                const skillsArray = skillsValue.split(',');

                // Tạo tag cho mỗi kỹ năng
                skillsArray.forEach(skill => {
                    const skillTrimmed = skill.trim();
                    if (skillTrimmed) {
                        addTag(skillTrimmed);
                    }
                });
            }
        }

        // Đảm bảo form được cập nhật trước khi submit
        const form = document.querySelector('form');
        if (form) {
            form.addEventListener('submit', function() {
                // Cập nhật input ẩn một lần nữa trước khi submit
                updateHiddenField();
            });
        }
    });
</script>
<%--Validate các trường--%>
<script>
    // Validation cho form thông tin cá nhân
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.querySelector('form');
        const dobInput = document.getElementById('dob');
        const dobError = document.getElementById('dob-error');
        const specialityInput = document.getElementById('speciality');
        const educationInput = document.getElementById('education');
        let addressInput = document.getElementById('address');
        const phoneInput = document.getElementById('phone');

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
            const errorElement = element.nextElementSibling;
            if (errorElement && errorElement.classList.contains('error-message')) {
                errorElement.style.display = 'none';
            }
            return true;
        }

        // Hàm viết hoa chữ cái đầu của mỗi từ
        function capitalizeFirstLetter(string) {
            return string.replace(/\b\w/g, function(l) { return l.toUpperCase(); });
        }

        // Thêm datalist cho tỉnh thành Việt Nam
        if (addressInput) {
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
            defaultOption.selected = true;
            defaultOption.disabled = true;
            selectElement.appendChild(defaultOption);

            // Thêm các option cho tỉnh thành
            vietnamProvinces.forEach(province => {
                const option = document.createElement('option');
                option.value = province;
                option.textContent = province;
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

        // Validation khi submit form
        form.addEventListener('submit', function(event) {
            let isValid = true;

            // Kiểm tra ngày sinh
            if(dobInput) {
                const dobValue = new Date(dobInput.value);
                const today = new Date();

                // Tính tuổi
                let age = today.getFullYear() - dobValue.getFullYear();
                const monthDiff = today.getMonth() - dobValue.getMonth();
                if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dobValue.getDate())) {
                    age--;
                }

                // Kiểm tra tuổi >= 18 và không phải ngày ở tương lai
                if (dobInput.value === "") {
                    isValid = showError(dobInput, 'Vui lòng nhập ngày sinh');
                } else if (age < 18 || dobValue > today) {
                    dobError.textContent = age < 18 ? 'Bạn phải đủ 18 tuổi trở lên.' : 'Ngày sinh không thể là ngày trong tương lai.';
                    dobError.style.display = 'block';
                    isValid = false;
                } else {
                    dobError.style.display = 'none';
                }
            }

            // Kiểm tra chuyên môn không chỉ chứa số
            if(specialityInput && specialityInput.value.trim() !== '') {
                if(/^\d+$/.test(specialityInput.value.trim())) {
                    isValid = showError(specialityInput, 'Chuyên môn không được chỉ chứa số');
                } else {
                    hideError(specialityInput);
                }
            }

            // Kiểm tra học vấn không chỉ chứa số
            if(educationInput && educationInput.value.trim() !== '') {
                if(/^\d+$/.test(educationInput.value.trim())) {
                    isValid = showError(educationInput, 'Học vấn không được chỉ chứa số');
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

            if(!isValid) {
                event.preventDefault();
            }
        });

        // Validation khi nhập dữ liệu
        if(dobInput) {
            dobInput.addEventListener('change', function() {
                if(this.value === "") {
                    showError(this, 'Vui lòng nhập ngày sinh');
                    return;
                }

                const dobValue = new Date(this.value);
                const today = new Date();

                // Tính tuổi
                let age = today.getFullYear() - dobValue.getFullYear();
                const monthDiff = today.getMonth() - dobValue.getMonth();
                if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dobValue.getDate())) {
                    age--;
                }

                // Kiểm tra tuổi >= 18 và không phải ngày ở tương lai
                if (age < 18 || dobValue > today) {
                    dobError.textContent = age < 18 ? 'Bạn phải đủ 18 tuổi trở lên.' : 'Ngày sinh không thể là ngày trong tương lai.';
                    dobError.style.display = 'block';
                } else {
                    dobError.style.display = 'none';
                }
            });
        }

        // Chuyên môn - viết hoa chữ cái đầu
        if(specialityInput) {
            specialityInput.addEventListener('blur', function() {
                if(this.value.trim() !== '') {
                    if(/^\d+$/.test(this.value.trim())) {
                        showError(this, 'Chuyên môn không được chỉ chứa số');
                    } else {
                        hideError(this);
                        this.value = capitalizeFirstLetter(this.value);
                    }
                }
            });
        }

        // Học vấn - viết hoa chữ cái đầu
        if(educationInput) {
            educationInput.addEventListener('blur', function() {
                if(this.value.trim() !== '') {
                    if(/^\d+$/.test(this.value.trim())) {
                        showError(this, 'Học vấn không được chỉ chứa số');
                    } else {
                        hideError(this);
                        this.value = capitalizeFirstLetter(this.value);
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
    });
</script>
<%--Cập Nhật Avatar--%>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const fileInput = document.getElementById("avatar-upload");
        const avatarImage = document.querySelector(".avatar");

        fileInput.addEventListener("change", function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    avatarImage.src = e.target.result; // gán ảnh tạm thời
                }
                reader.readAsDataURL(file); // đọc file ảnh
            }
        });
    });
</script>
<%--Cập nhật chữ ký--%>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const fileInput = document.getElementById('signature-upload');
        const signaturePreview = document.querySelector('.signature-preview');
        const signaturePlaceholder = document.querySelector('.signature-placeholder');

        fileInput.addEventListener('change', function(e) {
            const file = e.target.files[0];

            if (!file) return;

            // Kiểm tra file có phải là ảnh không
            if (!file.type.match('image.*')) {
                alert('Vui lòng chọn file ảnh!');
                return;
            }

            // Kiểm tra kích thước file (giới hạn ở 2MB)
            if (file.size > 2 * 1024 * 1024) {
                alert('Kích thước file quá lớn! Vui lòng chọn file nhỏ hơn 2MB.');
                return;
            }

            const reader = new FileReader();

            reader.onload = function(event) {
                // Cập nhật hiển thị ảnh chữ ký
                if (signaturePlaceholder) {
                    signaturePlaceholder.src = event.target.result;
                    signaturePlaceholder.alt = 'Chữ ký của bạn';

                    // Xóa class placeholder nếu có
                    signaturePlaceholder.classList.remove('signature-placeholder');
                } else {
                    // Trường hợp không có placeholder, tạo mới img
                    const img = document.createElement('img');
                    img.src = event.target.result;
                    img.alt = 'Chữ ký của bạn';
                    img.className = 'signature-image';

                    signaturePreview.innerHTML = '';
                    signaturePreview.appendChild(img);
                }

                // Gửi ảnh lên server (Bạn cần thêm code xử lý AJAX tại đây)
                uploadSignatureToServer(file);
            };

            reader.readAsDataURL(file);
        });

        function uploadSignatureToServer(file) {
            // Tạo đối tượng FormData để gửi file
            const formData = new FormData();
            formData.append('signature', file);

            // Sử dụng Fetch API để gửi dữ liệu
            fetch('/upload-signature', {
                method: 'POST',
                body: formData
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Lỗi khi tải lên chữ ký');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Tải lên thành công:', data);
                    // Hiển thị thông báo thành công nếu cần
                    alert('Tải lên chữ ký thành công!');
                })
                .catch(error => {
                    console.error('Lỗi:', error);
                    // Hiển thị thông báo lỗi
                    alert('Có lỗi xảy ra khi tải lên chữ ký. Vui lòng thử lại sau.');
                });
        }
    });

    document.addEventListener('DOMContentLoaded', function() {
        const fileInput = document.getElementById('signature-upload-a');
        const signaturePreview = document.querySelector('.signature-preview');
        const signaturePlaceholder = document.querySelector('.signature-placeholder');

        fileInput.addEventListener('change', function(e) {
            const file = e.target.files[0];

            if (!file) return;

            // Kiểm tra file có phải là ảnh không
            if (!file.type.match('image.*')) {
                alert('Vui lòng chọn file ảnh!');
                return;
            }

            // Kiểm tra kích thước file (giới hạn ở 2MB)
            if (file.size > 2 * 1024 * 1024) {
                alert('Kích thước file quá lớn! Vui lòng chọn file nhỏ hơn 2MB.');
                return;
            }

            const reader = new FileReader();

            reader.onload = function(event) {
                // Cập nhật hiển thị ảnh chữ ký
                if (signaturePlaceholder) {
                    signaturePlaceholder.src = event.target.result;
                    signaturePlaceholder.alt = 'Chữ ký của bạn';

                    // Xóa class placeholder nếu có
                    signaturePlaceholder.classList.remove('signature-placeholder');
                } else {
                    // Trường hợp không có placeholder, tạo mới img
                    const img = document.createElement('img');
                    img.src = event.target.result;
                    img.alt = 'Chữ ký của bạn';
                    img.className = 'signature-image';

                    signaturePreview.innerHTML = '';
                    signaturePreview.appendChild(img);
                }

                // Gửi ảnh lên server (Bạn cần thêm code xử lý AJAX tại đây)
                uploadSignatureToServer(file);
            };

            reader.readAsDataURL(file);
        });

        function uploadSignatureToServer(file) {
            // Tạo đối tượng FormData để gửi file
            const formData = new FormData();
            formData.append('signature', file);

            // Sử dụng Fetch API để gửi dữ liệu
            fetch('/upload-signature', {
                method: 'POST',
                body: formData
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Lỗi khi tải lên chữ ký');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Tải lên thành công:', data);
                    // Hiển thị thông báo thành công nếu cần
                    alert('Tải lên chữ ký thành công!');
                })
                .catch(error => {
                    console.error('Lỗi:', error);
                    // Hiển thị thông báo lỗi
                    alert('Có lỗi xảy ra khi tải lên chữ ký. Vui lòng thử lại sau.');
                });
        }
    });
</script>

<script>
    function isOver18(dobValue) {
        const dob = new Date(dobValue);
        const today = new Date();
        const age = today.getFullYear() - dob.getFullYear();
        const m = today.getMonth() - dob.getMonth();
        const d = today.getDate() - dob.getDate();
        return age > 18 || (age === 18 && (m > 0 || (m === 0 && d >= 0)));
    }

    const dobInput = document.getElementById('dob');
    const dobError = document.getElementById('dob-error');
    const form = document.getElementById('myForm');

    dobInput.addEventListener('change', function () {
        dobError.style.display = isOver18(this.value) ? 'none' : 'block';
    });

    form.addEventListener('submit', function (e) {
        if (!isOver18(dobInput.value)) {
            e.preventDefault();
            dobError.style.display = 'block';
        }
    });
</script>
</body>
</html>