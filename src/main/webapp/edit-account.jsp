<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa thông tin cá nhân</title>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header section */
        .edit-header {
            background-image: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            border-radius: 8px;
            padding: 30px;
            color: white;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
        }

        .header-title {
            font-size: 24px;
            font-weight: bold;
        }

        .header-subtitle {
            opacity: 0.9;
            margin-top: 5px;
        }

        /* Form layout */
        .form-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            padding: 30px;
            margin-bottom: 20px;
        }

        .form-section {
            margin-bottom: 30px;
        }

        .form-section:last-child {
            margin-bottom: 0;
        }

        .section-title {
            font-size: 20px;
            font-weight: bold;
            color: rgb(21, 32, 112);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #e5e7eb;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
        }

        .form-row {
            margin-bottom: 20px;
        }

        .form-full-width {
            grid-column: span 2;
        }

        @media (max-width: 768px) {
            .form-full-width {
                grid-column: span 1;
            }
        }

        .form-label {
            display: block;
            font-weight: 500;
            margin-bottom: 8px;
            color: #374151;
        }

        .form-input,
        .form-select,
        .form-textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #d1d5db;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.2s;
        }

        .form-input:focus,
        .form-select:focus,
        .form-textarea:focus {
            border-color: rgb(39, 64, 179);
            outline: none;
            box-shadow: 0 0 0 2px rgba(39, 64, 179, 0.1);
        }

        .form-textarea {
            min-height: 120px;
            resize: vertical;
        }

        .required-label::after {
            content: "*";
            color: #dc2626;
            margin-left: 4px;
        }

        /* Avatar upload */
        .avatar-upload {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }

        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #e5e7eb;
        }

        .avatar-actions {
            margin-left: 20px;
        }

        .upload-btn {
            display: inline-block;
            background-color: #f3f4f6;
            color: #374151;
            padding: 10px 15px;
            border-radius: 5px;
            margin-bottom: 10px;
            font-size: 14px;
            cursor: pointer;
            border: 1px solid #d1d5db;
        }

        .upload-btn:hover {
            background-color: #e5e7eb;
        }

        .upload-note {
            font-size: 12px;
            color: #6b7280;
        }

        .file-input {
            display: none;
        }

        /* Form actions */
        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 20px;
        }

        .btn {
            padding: 12px 20px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            border: none;
            transition: all 0.2s;
        }

        .btn-primary {
            background-image: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            color: white;
        }

        .btn-primary:hover {
            box-shadow: 0 4px 8px rgba(21, 32, 112, 0.2);
        }

        .btn-secondary {
            background-color: #f3f4f6;
            color: #374151;
            border: 1px solid #d1d5db;
        }

        .btn-secondary:hover {
            background-color: #e5e7eb;
        }

        /* Toggle switch */
        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 28px;
            margin-left: 10px;
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
            background-color: #cbd5e1;
            transition: .4s;
            border-radius: 34px;
        }

        .toggle-slider:before {
            position: absolute;
            content: "";
            height: 20px;
            width: 20px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .toggle-slider {
            background-color: rgb(39, 64, 179);
        }

        input:checked + .toggle-slider:before {
            transform: translateX(22px);
        }

        .toggle-container {
            display: flex;
            align-items: center;
        }

        .toggle-label {
            font-size: 16px;
            color: #374151;
        }

        /* Help text */
        .help-text {
            font-size: 13px;
            color: #6b7280;
            margin-top: 5px;
        }

        /* Tags input */
        .tags-input-container {
            border: 1px solid #d1d5db;
            border-radius: 5px;
            padding: 8px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
        }

        .tags-input-container:focus-within {
            border-color: rgb(39, 64, 179);
            box-shadow: 0 0 0 2px rgba(39, 64, 179, 0.1);
        }

        .tag {
            background-color: #e0e7ff;
            color: rgb(39, 64, 179);
            padding: 5px 10px;
            border-radius: 15px;
            margin: 3px;
            display: flex;
            align-items: center;
            font-size: 14px;
        }

        .tag-close {
            margin-left: 5px;
            cursor: pointer;
            color: rgb(39, 64, 179);
            font-weight: bold;
            font-size: 16px;
        }

        .tags-input {
            flex: 1;
            border: none;
            outline: none;
            padding: 5px;
            font-size: 14px;
        }

        /* Autocomplete */
        .autocomplete-container {
            position: relative;
        }

        .autocomplete-results {
            position: absolute;
            z-index: 1000;
            width: 88%;
            max-height: 200px;
            overflow-y: auto;
            background-color: white;
            border: 1px solid #d1d5db;
            border-radius: 5px;
            margin-top: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: none;
        }

        .autocomplete-results.show {
            display: block;
        }

        .autocomplete-item {
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .autocomplete-item:hover {
            background-color: #f3f4f6;
        }

        /* Section divider */
        .section-divider {
            border-top: 1px solid #e5e7eb;
            margin: 40px 0;
        }

        /* Signature image upload */
        .signature-upload {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        .signature-preview {
            width: 300px;
            height: 130px;
            border: 1px solid #d1d5db;
            border-radius: 5px;
            margin: 10px auto;
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: center;

        }

        .signature-preview img {
            max-width: 100%;
            max-height: 80px;
        }

        .signature-placeholder {
            color: #6b7280;
            font-style: italic;
        }

        .signature-actions {
            display: flex;
            gap: 10px;
        }

        @media (min-width: 1536px) {
            .container {
                max-width: 1536px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Header -->
    <div class="edit-header">
        <div>
            <h1 class="header-title">Chỉnh sửa thông tin cá nhân</h1>
            <p class="header-subtitle">Cập nhật thông tin hồ sơ của bạn để hiển thị cho người khác</p>
        </div>
    </div>

    <form action="profile" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
        <%--        <input type="hidden" name="action" value="update">--%>
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
                        <label for="name" class="form-label required-label">Tên</label>
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
                    <div class="form-row">
                        <label for="dob" class="form-label">Ngày sinh</label>
                        <input type="date" id="dob" class="form-input" name="dob" value="${account.dateOfBirth}">
                    </div>
                    <div class="form-row">
                        <label for="gender" class="form-label">Giới tính</label>
                        <select id="gender" name="gender" class="form-select">
                            <option value="Nam" ${account.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                            <option value="Nữ" ${account.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                            <option value="Khác" ${account.gender == 'Khác' ? 'selected' : ''}>Khác</option>
                        </select>
                    </div>

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
                        <label for="speciality" class="form-label">Chuyên môn</label>
                        <div class="autocomplete-container">
                            <input type="text" id="speciality" class="form-input" name="speciality" value="${account.speciality}">
                            <div class="autocomplete-results" id="specialty-results"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="experience" class="form-label">Kinh nghiệm (năm)</label>
                        <input type="number" id="experience" class="form-input" name="experienceYears" value="${account.experienceYears}"
                               min="0" max="50">
                    </div>
                    <div class="form-row">
                        <label for="education" class="form-label">Học vấn</label>
                        <div class="autocomplete-container">
                            <input type="text" id="education" class="form-input" name="education" value="${account.education}">
                            <div class="autocomplete-results" id="education-results"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="status" class="form-label">Trạng thái</label>
                        <select id="status" class="form-select" name="status">
                            <option value="Đang hoạt động" ${account.status == 'Đang hoạt động' ? 'selected' : ''}>Đang
                                hoạt động
                            </option>
                            <option value="Bị cấm" ${account.status == 'Bị cấm' ? 'selected' : ''}>Bị cấm</option>
                            <option value="Chờ xử lí" ${account.status == 'Chờ xử lí' ? 'selected' : ''}>Chờ xử lí</option>
                        </select>
                    </div>
                    <div class="form-row form-full-width">
                        <label for="skills" class="form-label">Kỹ năng</label>
                        <div class="tags-input-container">
                            <div class="tag">
                                Photoshop
                                <span class="tag-close">&times;</span>
                            </div>
                            <div class="tag">
                                Illustrator
                                <span class="tag-close">&times;</span>
                            </div>
                            <div class="tag">
                                UI/UX
                                <span class="tag-close">&times;</span>
                            </div>
                            <div class="tag">
                                Web Design
                                <span class="tag-close">&times;</span>
                            </div>
                            <input type="text" id="skills" class="tags-input" name="skills" placeholder="Thêm kỹ năng...">
                        </div>
                        <div class="autocomplete-results" id="skills-results"></div>
                        <p class="help-text">Nhấn Enter để thêm kỹ năng mới</p>
                    </div>
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
            <div class="form-section">
                <h2 class="section-title">Mạng xã hội</h2>
                <div class="form-grid">
                    <div class="form-row">
                        <label for="facebook" class="form-label">Facebook</label>
                        <input type="url" id="facebook" class="form-input" placeholder="https://facebook.com/username">
                    </div>
                    <div class="form-row">
                        <label for="linkedin" class="form-label">LinkedIn</label>
                        <input type="url" id="linkedin" class="form-input"
                               placeholder="https://linkedin.com/in/username">
                    </div>
                    <div class="form-row">
                        <label for="instagram" class="form-label">Instagram</label>
                        <input type="url" id="instagram" class="form-input"
                               placeholder="https://instagram.com/username">
                    </div>
                    <div class="form-row">
                        <label for="portfolio" class="form-label">Website/Portfolio</label>
                        <input type="url" id="portfolio" class="form-input" placeholder="https://yourportfolio.com">
                    </div>
                </div>
            </div>

            <div class="section-divider"></div>

            <!-- Signature as image -->
            <div class="form-section">
                <h2 class="section-title">Chữ ký hình ảnh</h2>
                <div class="form-row">
                    <label class="form-label">Chữ ký của bạn</label>
                    <div class="signature-upload">
                        <div class="signature-preview">
                            <c:if test="${account.signature != null}">
                                <span class="signature-placeholder">${account.signature}</span>
                            </c:if>
                            <c:if test="${account.signature == null}">
                                <span class="signature-placeholder">Chưa có chữ ký</span>
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
        </div>
    </form>
</div>

<script>
    function initTagsFromDatabase() {
        // Lấy giá trị từ input ẩn (được điền từ database)
        const skillsValue = document.getElementById('skills').value;

        // Nếu có giá trị
        if (skillsValue) {
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

    document.addEventListener('DOMContentLoaded', function() {
        const tagsContainer = document.querySelector('.tags-input-container');
        const tagsInput = document.querySelector('.tags-input');
        const autocompleteResults = document.querySelector('#skills-results');
        const hiddenInput = document.querySelector('#skills'); // Input ẩn để lưu giá trị


        // Danh sách gợi ý (có thể thay thế bằng API hoặc nguồn dữ liệu khác)
        const suggestions = [
            'Photoshop', 'Illustrator', 'UI/UX', 'Web Design', 'HTML', 'CSS',
            'JavaScript', 'React', 'Angular', 'Vue.js', 'Node.js', 'PHP',
            'WordPress', 'Figma', 'Sketch', 'Adobe XD', 'Typography',
            'Responsive Design', 'Mobile Design', 'Logo Design', 'Branding'
        ];

        // Khởi tạo sự kiện cho các tag đã có sẵn
        initExistingTags();

        updateHiddenField();


        // Xử lý khi người dùng nhập vào input
        tagsInput.addEventListener('input', function() {
            const value = this.value.trim();

            if (value) {
                // Lọc các gợi ý phù hợp với từ khóa đang nhập
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
                e.preventDefault();
                addTag(this.value.trim());
                this.value = '';
                autocompleteResults.innerHTML = '';
                autocompleteResults.style.display = 'none';
            }
        });

        // Xử lý khi click vào bất kỳ đâu trên trang
        document.addEventListener('click', function(e) {
            // Nếu click bên ngoài khu vực gợi ý, ẩn gợi ý
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

                // Xử lý khi click vào một gợi ý
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
            // Kiểm tra nếu tag đã tồn tại
            if (isTagExists(text)) {
                return;
            }

            const tag = document.createElement('div');
            tag.classList.add('tag');

            // Tạo nút đóng
            const closeButton = document.createElement('span');
            closeButton.classList.add('tag-close');
            closeButton.innerHTML = '&times;';

            // Thêm nội dung văn bản trước
            const textNode = document.createTextNode(text);
            tag.appendChild(textNode);

            // Sau đó thêm nút đóng
            tag.appendChild(closeButton);

            // Thêm sự kiện xóa tag khi click vào dấu x
            closeButton.addEventListener('click', function() {
                tagsContainer.removeChild(tag);
            });

            updateHiddenField();

            // Thêm tag vào trước input
            tagsContainer.insertBefore(tag, tagsInput);
        }

        // Kiểm tra xem tag đã tồn tại chưa
        function isTagExists(text) {
            const existingTags = document.querySelectorAll('.tag');
            for (let i = 0; i < existingTags.length; i++) {
                // Lấy nội dung text mà không bao gồm dấu × (thay vì dùng textContent)
                const tagText = existingTags[i].firstChild.textContent.trim();
                if (tagText === text) {
                    return true;
                }
            }
            return false;
        }

        function updateHiddenField() {
            const tags = [];
            const existingTags = document.querySelectorAll('.tag');

            existingTags.forEach(tag => {
                // Lấy nội dung text không bao gồm nút đóng
                const tagText = tag.firstChild.textContent.trim();
                tags.push(tagText);
            });

            // Cập nhật giá trị của input ẩn
            hiddenInput.value = tags.join(',');
        }

        // Khởi tạo sự kiện cho các tag đã có sẵn
        function initExistingTags() {
            const existingTags = document.querySelectorAll('.tag .tag-close');
            existingTags.forEach(closeBtn => {
                closeBtn.addEventListener('click', function() {
                    const tag = this.parentElement;
                    tagsContainer.removeChild(tag);
                });
            });
        }
    });</script>
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
<script>
    // Lấy ngày hôm nay
    const today = new Date();
    const yyyy = today.getFullYear();
    const mm = String(today.getMonth() + 1).padStart(2, '0');
    const dd = String(today.getDate()).padStart(2, '0');

    const maxDate = `${yyyy}-${mm}-${dd}`;

    // Gán giá trị max vào input
    document.getElementById("dob").setAttribute("max", maxDate);
</script>
</body>
</html>