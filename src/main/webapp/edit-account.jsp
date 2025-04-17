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
            width: 100%;
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
                        <input type="text" id="name" class="form-input" value="${account.accountName}" required>
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
                        <input type="date" id="dob" class="form-input" value="${account.dateOfBirth}">
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
                        <textarea id="bio" class="form-textarea">
                            ${account.bio}
                        </textarea>
                    </div>
                </div>
            </div>

            <div class="section-divider"></div>

            <!-- Professional info -->
            <div class="form-section">
                <h2 class="section-title">Thông tin chuyên môn</h2>
                <div class="form-grid">
                    <div class="form-row">
                        <label for="specialty" class="form-label">Chuyên môn</label>
                        <div class="autocomplete-container">
                            <input type="text" id="specialty" class="form-input" value="${account.specialist}">
                            <div class="autocomplete-results" id="specialty-results"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="experience" class="form-label">Kinh nghiệm (năm)</label>
                        <input type="number" id="experience" class="form-input" value="${account.experienceYears}"
                               min="0" max="50">
                    </div>
                    <div class="form-row">
                        <label for="education" class="form-label">Học vấn</label>
                        <div class="autocomplete-container">
                            <input type="text" id="education" class="form-input" value="${account.education}">
                            <div class="autocomplete-results" id="education-results"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="status" class="form-label">Trạng thái</label>
                        <select id="status" class="form-select">
                            <option value="Đang hoạt động" ${account.status == 'Đang hoạt động' ? 'selected' : ''}>Đang
                                hoạt động
                            </option>
                            <option value="Bị cấm" ${account.status == 'Bị cấm' ? 'selected' : ''}>Bị cấm</option>
                            <option value="Tạm nghỉ" ${account.status == 'Tạm nghỉ' ? 'selected' : ''}>Tạm nghỉ</option>
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
                            <input type="text" id="skills" class="tags-input" placeholder="Thêm kỹ năng...">
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
                        <input type="tel" id="phone" class="form-input" value="${account.phone}">
                    </div>
                    <div class="form-row form-full-width">
                        <label for="address" class="form-label">Địa chỉ</label>
                        <input type="text" id="address" class="form-input" value="${account.address}">
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
                            </c:if>
                        </div>
                        <div class="signature-actions">
                            <label for="signature-upload" class="upload-btn">Tải ảnh chữ ký lên</label>
                            <input type="file" id="signature-upload" class="file-input" accept="image/*">
                        </div>
                    </div>
                    <p class="help-text">Chữ ký hình ảnh sẽ hiển thị dưới thông tin hồ sơ của bạn. Cho phép PNG, JPG
                        hoặc GIF, tối đa 1MB
                    </p>
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
    document.addEventListener('DOMContentLoaded', function() {
        const tagsContainer = document.getElementById('tags-container');
        const input = document.getElementById('skills');
        const resultsContainer = document.getElementById('skills-results');

        // Store all existing skills for reference
        const existingTags = new Set();
        document.querySelectorAll('.tag').forEach(tag => {
            const tagText = tag.textContent.trim().replace('×', '').trim();
            existingTags.add(tagText.toLowerCase());
        });

        // Sample data from database - in real implementation, you'd fetch this from your API
        const specialists = [
            { id: 1, name: 'Photoshop', category: 'Design' },
            { id: 2, name: 'Illustrator', category: 'Design' },
            { id: 3, name: 'UI/UX', category: 'Design' },
            { id: 4, name: 'Web Design', category: 'Design' },
            { id: 5, name: 'JavaScript', category: 'Programming' },
            { id: 6, name: 'HTML/CSS', category: 'Programming' },
            { id: 7, name: 'React', category: 'Programming' },
            { id: 8, name: 'Node.js', category: 'Programming' },
            { id: 9, name: 'SQL', category: 'Database' },
            { id: 10, name: 'Content Writing', category: 'Content' },
            { id: 11, name: 'SEO', category: 'Marketing' },
            { id: 12, name: 'Digital Marketing', category: 'Marketing' }
        ];

        // Initialize event listeners
        setupEventListeners();

        function setupEventListeners() {
            // Handle input when typing
            input.addEventListener('input', showAutocompleteResults);

            // Handle keyboard navigation in autocomplete
            input.addEventListener('keydown', handleKeyDown);

            // Handle clicks on autocomplete items
            resultsContainer.addEventListener('click', handleAutocompleteClick);

            // Handle clicks on close button for tags
            tagsContainer.addEventListener('click', function(e) {
                if (e.target.classList.contains('tag-close')) {
                    const tag = e.target.parentElement;
                    const tagText = tag.textContent.trim().replace('×', '').trim();
                    existingTags.delete(tagText.toLowerCase());
                    tag.remove();
                }
            });

            // Close autocomplete when clicking outside
            document.addEventListener('click', function(e) {
                if (!tagsContainer.contains(e.target) && !resultsContainer.contains(e.target)) {
                    resultsContainer.style.display = 'none';
                }
            });
        }

        function showAutocompleteResults() {
            const inputValue = input.value.trim().toLowerCase();

            if (inputValue === '') {
                resultsContainer.style.display = 'none';
                return;
            }

            // Filter specialists based on input
            const filteredResults = specialists.filter(specialist => {
                return specialist.name.toLowerCase().includes(inputValue) &&
                    !existingTags.has(specialist.name.toLowerCase());
            });

            // Clear previous results
            resultsContainer.innerHTML = '';

            if (filteredResults.length > 0) {
                // Add filtered results to the dropdown
                filteredResults.forEach(result => {
                    const resultItem = document.createElement('div');
                    resultItem.className = 'autocomplete-item';
                    resultItem.dataset.specialistId = result.id;
                    resultItem.dataset.specialistName = result.name;
                    resultItem.textContent = result.name;
                    resultsContainer.appendChild(resultItem);
                });

                resultsContainer.style.display = 'block';
            } else {
                resultsContainer.style.display = 'none';
            }
        }

        function handleKeyDown(e) {
            const items = resultsContainer.querySelectorAll('.autocomplete-item');
            let activeItem = resultsContainer.querySelector('.autocomplete-item.active');
            let activeIndex = -1;

            // Find current active index
            if (activeItem) {
                Array.from(items).forEach((item, index) => {
                    if (item === activeItem) activeIndex = index;
                });
            }

            switch (e.key) {
                case 'Enter':
                    e.preventDefault();

                    if (activeItem) {
                        // Add the selected item as a tag
                        addTag(activeItem.dataset.specialistName, activeItem.dataset.specialistId);
                    } else if (input.value.trim() !== '') {
                        // Add the current input as a custom tag
                        addTag(input.value.trim());
                    }

                    input.value = '';
                    resultsContainer.style.display = 'none';
                    break;

                case 'ArrowDown':
                    e.preventDefault();

                    if (items.length > 0) {
                        if (activeItem) activeItem.classList.remove('active');

                        activeIndex = (activeIndex + 1) % items.length;
                        items[activeIndex].classList.add('active');
                        items[activeIndex].scrollIntoView({ block: 'nearest' });
                    }
                    break;

                case 'ArrowUp':
                    e.preventDefault();

                    if (items.length > 0) {
                        if (activeItem) activeItem.classList.remove('active');

                        activeIndex = activeIndex <= 0 ? items.length - 1 : activeIndex - 1;
                        items[activeIndex].classList.add('active');
                        items[activeIndex].scrollIntoView({ block: 'nearest' });
                    }
                    break;

                case 'Escape':
                    resultsContainer.style.display = 'none';
                    break;
            }
        }

        function handleAutocompleteClick(e) {
            if (e.target.classList.contains('autocomplete-item')) {
                addTag(e.target.dataset.specialistName, e.target.dataset.specialistId);
                input.value = '';
                resultsContainer.style.display = 'none';
                input.focus();
            }
        }

        function addTag(text, id) {
            const tagText = text.trim();
            const tagLower = tagText.toLowerCase();

            // Skip if tag is empty or already exists
            if (tagText === '' || existingTags.has(tagLower)) {
                return;
            }

            // Create new tag element
            const tag = document.createElement('div');
            tag.className = 'tag';
            tag.textContent = tagText;

            if (id) {
                tag.dataset.specialistId = id;
            }

            // Create close button for tag
            const closeBtn = document.createElement('span');
            closeBtn.className = 'tag-close';
            closeBtn.innerHTML = '&times;';
            tag.appendChild(closeBtn);

            // Add tag before the input field
            tagsContainer.insertBefore(tag, input);

            // Add to tracking set
            existingTags.add(tagLower);

            // In a real application, you would save this to the database
            saveTagToDatabase(tagText, id);
        }

        function saveTagToDatabase(tagName, specialistId) {
            // This is a placeholder for the actual implementation
            // In a real application, you would make an AJAX call to save to your database
            console.log('Saving tag:', tagName, 'with specialist ID:', specialistId || 'new');

            // Sample AJAX call (commented out)
            /*
            fetch('/api/account-specialist', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    accountId: currentAccountId, // You'd need to get this from your page context
                    specialistId: specialistId,
                    specialistName: tagName // For new specialists without an existing ID
                })
            })
            .then(response => response.json())
            .then(data => {
                console.log('Tag saved successfully:', data);
            })
            .catch(error => {
                console.error('Error saving tag:', error);
            });
            */
        }
    });
</script>
<script>
    // Mock API for autocomplete suggestions
    const mockAPI = {
        specialties: [
            'Thiết kế đồ họa',
            'Phát triển web',
            'Nghiên cứu người dùng',
            'Digital Marketing',
            'Lập trình di động',
            'Quản lý dự án',
            'Thiết kế UI/UX',
            'Phân tích dữ liệu'
        ],
        education: [
            'Đại học Mỹ thuật TP.HCM',
            'Đại học Bách Khoa TP.HCM',
            'Đại học FPT',
            'Đại học Kinh tế TP.HCM',
            'Đại học Khoa học Tự nhiên TP.HCM',
            'Đại học Quốc tế RMIT'
        ],
        skills: [
            'Photoshop', 'Illustrator', 'InDesign', 'Figma', 'UI/UX', 'Web Design',
            'HTML', 'CSS', 'JavaScript', 'React', 'Vue.js', 'Angular',
            'PHP', 'Node.js', 'Python', 'Java', 'Ruby on Rails',
            'WordPress', 'Shopify', 'WooCommerce',
            'SEO', 'SEM', 'Google Analytics', 'Content Marketing',
            'Adobe XD', 'Sketch', 'Premiere Pro', 'After Effects',
            'Product Management', 'Agile', 'Scrum', 'Jira'
        ]
    };

    // Function to query the API for suggestions
    function fetchSuggestions(query, category) {
        return new Promise((resolve) => {
            // Simulate API delay
            setTimeout(() => {
                const data = mockAPI[category] || [];
                if (Array.isArray(data)) {
                    const results = data.filter(item =>
                        item.toLowerCase().includes(query.toLowerCase())
                    );
                    resolve(results);
                } else {
                    resolve([]);
                }
            }, 300);
        });
    }

    // Function to fetch district suggestions based on selected city
    function fetchDistrictSuggestions(query, city) {
        return new Promise((resolve) => {
            setTimeout(() => {
                const districts = mockAPI.districts[city] || [];
                const results = districts.filter(district =>
                    district.toLowerCase().includes(query.toLowerCase())
                );
                resolve(results);
            }, 300);
        });
    }

    // Setup autocomplete for all fields that need it
    function setupAutocomplete(inputId, resultsId, category, selectCallback) {
        const inputElement = document.getElementById(inputId);
        const resultsElement = document.getElementById(resultsId);

        if (!inputElement || !resultsElement) return;

        let debounceTimeout;

        inputElement.addEventListener('input', function () {
            clearTimeout(debounceTimeout);
            const query = this.value.trim();

            if (query.length < 2) {
                resultsElement.classList.remove('show');
                return;
            }

            debounceTimeout = setTimeout(async () => {
                let suggestions;

                if (inputId === 'district') {
                    const cityValue = document.getElementById('city').value;
                    suggestions = await fetchDistrictSuggestions(query, cityValue);
                } else {
                    suggestions = await fetchSuggestions(query, category);
                }

                if (suggestions.length > 0) {
                    displaySuggestions(suggestions, resultsElement, inputElement, selectCallback);
                } else {
                    resultsElement.classList.remove('show');
                }
            }, 300);
        });

        // Hide results when clicking outside
        document.addEventListener('click', function (e) {
            if (e.target !== inputElement && e.target !== resultsElement) {
                resultsElement.classList.remove('show');
            }
        });
    }

    // Display suggestions in the results container
    function displaySuggestions(suggestions, resultsElement, inputElement, selectCallback) {
        resultsElement.innerHTML = '';
        suggestions.forEach(suggestion => {
            const itemElement = document.createElement('div');
            itemElement.classList.add('autocomplete-item');
            itemElement.textContent = suggestion;

            itemElement.addEventListener('click', function () {
                if (selectCallback) {
                    selectCallback(suggestion);
                } else {
                    inputElement.value = suggestion;
                }
                resultsElement.classList.remove('show');
            });

            resultsElement.appendChild(itemElement);
        });

        resultsElement.classList.add('show');
    }

    // Setup tags input for skills
    function setupTagsInput() {
        const tagsContainer = document.querySelector('.tags-input-container');
        const tagsInput = document.getElementById('skills-input');
        const resultsElement = document.getElementById('skills-results');

        tagsInput.addEventListener('keydown', function (e) {
            if (e.key === 'Enter' && this.value.trim() !== '') {
                e.preventDefault();
                addTag(this.value.trim());
                this.value = '';
                resultsElement.classList.remove('show');
            }
        });

        // Setup autocomplete for skills
        let debounceTimeout;
        tagsInput.addEventListener('input', function () {
            clearTimeout(debounceTimeout);
            const query = this.value.trim();

            if (query.length < 2) {
                resultsElement.classList.remove('show');
                return;
            }

            debounceTimeout = setTimeout(async () => {
                const suggestions = await fetchSuggestions(query, 'skills');

                if (suggestions.length > 0) {
                    displaySuggestions(suggestions, resultsElement, tagsInput, function (selectedSkill) {
                        addTag(selectedSkill);
                        tagsInput.value = '';
                    });
                } else {
                    resultsElement.classList.remove('show');
                }
            }, 300);
        });

        // Function to add a new tag
        function addTag(text) {
            const tag = document.createElement('div');
            tag.classList.add('tag');
            tag.textContent = text;

            const closeBtn = document.createElement('span');
            closeBtn.classList.add('tag-close');
            closeBtn.innerHTML = '&times;';
            closeBtn.addEventListener('click', function () {
                tagsContainer.removeChild(tag);
            });

            tag.appendChild(closeBtn);
            tagsContainer.insertBefore(tag, tagsInput);
        }

        // Handle remove existing tags
        document.querySelectorAll('.tag-close').forEach(closeBtn => {
            closeBtn.addEventListener('click', function () {
                const tag = this.parentElement;
                tagsContainer.removeChild(tag);
            });
        });
    }

    // Handle avatar upload preview
    function setupImageUpload(uploadId, previewSelector, placeholderClass) {
        const fileInput = document.getElementById(uploadId);
        const previewElement = document.querySelector(previewSelector);
        const placeholderElement = previewElement.querySelector(placeholderClass);

        fileInput.addEventListener('change', function () {
            if (this.files && this.files[0]) {
                const reader = new FileReader();

                reader.onload = function (e) {
                    if (placeholderElement) {
                        placeholderElement.style.display = 'none';
                    }

                    if (previewSelector === '.avatar-preview') {
                        // For avatar preview
                        previewElement.src = e.target.result;
                    } else {
                        // For signature preview
                        if (previewElement.querySelector('img')) {
                            previewElement.querySelector('img').src = e.target.result;
                        } else {
                            const img = document.createElement('img');
                            img.src = e.target.result;
                            img.alt = "Chữ ký";
                            previewElement.appendChild(img);
                        }
                    }
                }

                reader.readAsDataURL(this.files[0]);
            }
        });
    }


    // Initialize all autocomplete fields
    document.addEventListener('DOMContentLoaded', function() {
        setupAutocomplete('role', 'role-results', 'roles');
        setupAutocomplete('specialty', 'specialty-results', 'specialties');
        setupAutocomplete('education', 'education-results', 'education');
        setupAutocomplete('city', 'city-results', 'cities');

        // Connect city and district selectors
        const cityInput = document.getElementById('city');
        cityInput.addEventListener('change', function() {
            // Clear district when city changes
            document.getElementById('district').value = '';
        });

        setupAutocomplete('district', 'district-results', null);

        // Setup tags input for skills
        setupTagsInput();

        // Setup avatar upload
        setupImageUpload('avatar-upload', '.avatar-preview');

        // Setup signature image upload
        setupImageUpload('signature-upload', '.signature-preview', '.signature-placeholder');

        // Form submission handler
        document.querySelector('form').addEventListener('submit', function(e) {
            e.preventDefault();

            // Here you would normally send the form data to your server
            // For demo purposes, just show an alert
            alert('Thông tin đã được lưu thành công!');
        });
    });
</script>
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