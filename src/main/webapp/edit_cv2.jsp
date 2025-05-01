<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:useBean id="CVDAO" class="jobtrans.dal.CvDAO" scope="session"></jsp:useBean>
    <title>Professional CV Builder - Modern Style</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        :root {
            --primary: #4a6fa5;
            --primary-light: #e8f0fe;
            --secondary: #3a5a8a;
            --accent: #ff6b6b;
            --dark: #2d3436;
            --light: #f9f9f9;
            --gray: #636e72;
            --light-gray: #dfe6e9;
            --border: #dfe6e9;
            --shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            --radius: 6px;
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Open Sans', sans-serif;
        }

        body {
            background-color: #f5f7fa;
            color: var(--dark);
            line-height: 1.6;
        }

        /* Header Styles */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 70px;
            background: white;
            box-shadow: var(--shadow);
            display: flex;
            align-items: center;
            padding: 0 30px;
            z-index: 1000;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
            font-size: 22px;
            color: var(--primary);
            letter-spacing: 0.5px;
        }

        .logo-icon {
            font-size: 26px;
            color: var(--accent);
        }

        /* Main CV Container */
        .cv-builder-container {
            display: flex;
            margin-top: 70px;
            min-height: calc(100vh - 70px);
        }

        /* Sidebar Navigation */
        .sidebar {
            width: 250px;
            background: white;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.05);
            padding: 20px 0;
            transition: var(--transition);
            z-index: 900;
        }

        .sidebar-menu {
            list-style: none;
            padding: 0 15px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            margin: 5px 0;
            border-radius: var(--radius);
            cursor: pointer;
            transition: var(--transition);
            color: var(--gray);
            text-decoration: none;
            font-weight: 500;
        }

        .menu-item:hover {
            background: var(--primary-light);
            color: var(--primary);
        }

        .menu-item.active {
            background: var(--primary-light);
            color: var(--primary);
            font-weight: 600;
        }

        .menu-icon {
            font-size: 18px;
            width: 24px;
            text-align: center;
            margin-right: 12px;
        }

        .divider {
            height: 1px;
            background: var(--border);
            margin: 15px 20px;
        }

        /* CV Content Area */
        .cv-content {
            flex: 1;
            padding: 30px;
            background-color: #f5f7fb;
            margin-top: -100px;
        }

        .cv-box {
            background: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            max-width: 1000px;
            margin: 0 auto;
            display: flex;
            border: 1px solid var(--border);
            margin-top: 30px;
        }

        .cv-sidebar {
            width: 300px;
            background: linear-gradient(135deg, #4a6fa5 0%, #3a5a8a 100%);
            color: white;
            padding: 30px 20px;
            height: 270px;
            border-radius: 20px;
        }

        .cv-main {
            flex: 1;
            padding: 30px;
            background-color: white;
        }

        /* Avatar Styles */
        .cv-picture-avatar {
            position: relative;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            overflow: hidden;
            border: 4px solid white;
            margin: 0 auto 25px;
            background-color: #f5f5f5;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: var(--transition);
        }

        .cv-picture-avatar:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }

        .cv-picture-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .upload-label {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 8px;
            text-align: center;
            font-size: 12px;
            opacity: 0;
            transition: var(--transition);
        }

        .cv-picture-avatar:hover .upload-label {
            opacity: 1;
        }

        #avatar_cv {
            display: none;
        }

        /* Form Elements */
        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border);
            border-radius: var(--radius);
            font-size: 14px;
            transition: var(--transition);
            background-color: var(--light);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(74, 111, 165, 0.1);
            background-color: white;
        }

        textarea.form-control {
            min-height: 100px;
            resize: vertical;
        }

        /* Section Styles */
        .section-title {
            font-family: 'Montserrat', sans-serif;
            font-size: 18px;
            font-weight: 600;
            margin: 25px 0 15px;
            color:#4a6fa5;
            padding-bottom: 8px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            letter-spacing: 0.5px;
        }

        .main-section-title {
            font-family: 'Montserrat', sans-serif;
            font-size: 20px;
            font-weight: 600;
            margin: 20px 0;
            color: #4a6fa5 ;
            display: flex;
            justify-content: space-between;
            align-items: center;
            letter-spacing: 0.5px;
        }

        .section-divider {
            height: 1px;
            background: var(--border);
            margin: 15px 0;
        }

        /* Button Styles */
        .btn-add {
            background: var(--primary);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: var(--radius);
            font-size: 13px;
            cursor: pointer;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 5px;
            font-weight: 500;
        }

        .btn-add:hover {
            background: var(--secondary);
            transform: translateY(-2px);
        }

        .btn-remove {
            background: var(--accent);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: var(--radius);
            font-size: 13px;
            cursor: pointer;
            transition: var(--transition);
            margin-left: 10px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            font-weight: 500;
        }

        .btn-remove:hover {
            background: #ff5252;
            transform: translateY(-2px);
        }

        /* Date Group */
        .date-group {
            display: flex;
            gap: 15px;
            margin: 10px 0;
        }

        .date-group .form-control {
            flex: 1;
        }

        /* Submit Button */
        .submit-btn {
            background: var(--primary);
            color: white;
            padding: 14px 30px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: var(--radius);
            cursor: pointer;
            transition: var(--transition);
            display: block;
            margin: 40px auto 0;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 4px 10px rgba(74, 111, 165, 0.2);
        }

        .submit-btn:hover {
            background: var(--secondary);
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .cv-box {
                flex-direction: column;
            }

            .cv-sidebar {
                width: 100%;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
            }

            .menu-text {
                display: none;
            }

            .menu-icon {
                margin-right: 0;
                font-size: 20px;
            }
        }

        /* Modern Select Styling */
        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 15px;
        }

        /* Modern Checkbox Styling */
        input[type="checkbox"] {
            appearance: none;
            width: 18px;
            height: 18px;
            border: 2px solid var(--border);
            border-radius: 3px;
            margin-right: 8px;
            position: relative;
            top: 3px;
            cursor: pointer;
            transition: var(--transition);
        }

        input[type="checkbox"]:checked {
            background-color: var(--primary);
            border-color: var(--primary);
        }

        input[type="checkbox"]:checked::after {
            content: "✓";
            color: white;
            position: absolute;
            left: 2px;
            top: -2px;
            font-size: 12px;
        }

        /* Animation for sections */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .education-item, .experience-item, .certification-item, .skill-item {
            animation: fadeIn 0.3s ease-out forwards;
        }

        /* Hover effects */
        .form-group:hover .form-control {
            border-color: var(--primary);
        }

        /* Error styling */
        .error-input {
            border-color: #ff6b6b !important;
        }

        .error-message {
            color: #ff6b6b;
            font-size: 12px;
            margin-top: 5px;
        }

        .banner_title {
            background-image: url(./img/anh1/anh1.png);
            background-size: 100%;
            font-size: 40px;
            height: 200px;
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>

<%@include file="includes/header-01.jsp" %>
<div style="margin-top: 100px">
    <%@include file="includes/header_cv.jsp" %>
</div>
<div style="margin-top:140px;display: flex">
    <div style="margin-top: -100px">
    <%@include file="./includes/sidebar_createCV.jsp" %>
    </div>
    <!-- CV Content Area -->
    <main class="cv-content">
        <form action="cv?action=update" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="cvId" value="${param.cvId}">
            <input type="hidden" name="typeId" value="${CV.cvType}">

            <div class="cv-box">
                <!-- Left Sidebar (CV Personal Info) -->
                <div class="cv-sidebar">
                    <div class="cv-picture-avatar">
                        <img id="avatar-preview" src="${CV.avatarCv != null ? CV.avatarCv : 'https://via.placeholder.com/200'}" alt="Profile Photo">
                        <label for="avatar_cv" class="upload-label">
                            <i class="fas fa-camera"></i> Change Photo
                        </label>
                        <input type="file" id="avatar_cv" name="avatar_cv" accept="image/*">
                    </div>

                    <h2 style="margin-top: 80px" class="section-title">Liên hệ</h2>

                    <div class="form-group">
                        <select class="form-control" name="sex" id="sex">
                            <option value="">-- Chọn giới tính --</option>
                            <option value="nam" ${CV.sex == 'nam' ? 'selected' : ''}> Nam</option>
                            <option value="nữ" ${CV.sex == 'nữ' ? 'selected' : ''}> Nữ</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" name="date_of_birth" value="${CV.dateOfBirth}" placeholder="Ngày sinh">
                    </div>
                    <div class="form-group">
                        <input type="tel" class="form-control" name="sdt" value="${CV.sdt}" placeholder="Số điện thoại">
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" name="email" value="${CV.email}" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="address" value="${CV.address}" placeholder="Địa chỉ">
                    </div>

                    <div class="skill-section">
                        <h2 id="skillTitle" class="section-title">Kỹ Năng</h2>
                        <c:forEach items="${CV.skillList}" var="o">
                            <div class="skill-item">
                                <div class="form-group">
                                    <select class="form-control" name="mainSkillId[]" required>
                                        <option value="">Chọn tiêu đề kỹ năng</option>
                                        <c:forEach items="${CVDAO.allMainSkill}" var="h">
                                            <option value="${h.mainSkillId}" ${h.mainSkillId == o.mainSkillId ? 'selected' : ''}>${h.mainSkillName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <select class="form-control" name="skillId[]" id="skillSelect" required>
                                        <option value="">Chọn kỹ năng</option>
                                        <c:forEach items="${CVDAO.allMainSkill}" var="k">
                                            <optgroup label="${k.mainSkillName}">
                                                <c:forEach items="${CVDAO.getSkillByMainSkill(k.mainSkillId)}" var="h">
                                                    <option value="${h.skillId}" data-mainskill="${k.mainSkillId}" ${h.skillId == o.skillId ? 'selected' : ''}>${h.skillName}</option>
                                                </c:forEach>
                                            </optgroup>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <input type="text" name="otherSkillName[]" value="${o.skillCustom}" placeholder="Tên kỹ năng khác"
                                           class="form-control other-skill-input" style="display: none;">
                                </div>

                                <div class="form-group">
                                    <select class="form-control" name="levelSkill[]" required>
                                        <c:forEach var="i" begin="1" end="100">
                                            <option value="${i}" ${i == o.levelSkill ? 'selected' : ''}>${i}%</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div style="text-align: right;">
                                    <button type="button" class="btn-remove remove-skill">
                                        <i class="fas fa-trash"></i> Xóa
                                    </button>
                                </div>
                            </div>
                        </c:forEach>

                        <div style="text-align: right;">
                            <button type="button" id="add-skill" class="btn-add">
                                <i class="fas fa-plus"></i> Thêm kỹ năng
                            </button>
                        </div>
                    </div>

                    <h2 id="extraInfoTitle" class="section-title">Thông tin bổ sung</h2>
                    <div class="form-group">
                        <textarea name="more_infor" class="form-control" placeholder="Thông tin bổ sung">${CV.moreInfo}</textarea>
                    </div>
                </div>

                <!-- Main CV Content -->
                <div class="cv-main">
                    <div class="main-info">
                        <input type="text" name="cvname" class="form-control" value="${CV.cvName}" placeholder="Họ và tên"
                               style="height:50px;width: 300px; margin-left: 100px;font-size: 24px; font-weight: 600; border: none; border-bottom: 2px solid var(--border); padding: 10px 0; margin-bottom: 15px;">
                        <input type="text" name="position" class="form-control" value="${CV.jobPosition}" placeholder="Vị trí ứng tuyển"
                               style="height:50px;width: 300px; margin-left: 100px;font-size: 18px; border: none; padding: 5px 0;">
                    </div>

                    <div class="career-goal-section">
                        <h3 class="main-section-title" id="careerGoalTitle">Mục tiêu nghề nghiệp</h3>
                        <div class="section-divider"></div>
                        <textarea name="experienceDescription" class="form-control"
                                  placeholder="Mô tả mục tiêu nghề nghiệp của bạn">${CV.summary}</textarea>
                    </div>

                    <div class="education-section">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <h3 id="educationTitle" class="main-section-title">Học vấn</h3>
                            <div>
                                <button type="button" id="add-education" class="btn-add">
                                    <i class="fas fa-plus"></i> Thêm
                                </button>
                            </div>
                        </div>
                        <c:forEach items="${CV.educationList}" var="o">
                            <div class="education-item">
                                <div class="form-group">
                                    <select class="form-control" name="schoolId[]" id="schoolSelect">
                                        <option value="">Chọn trường học</option>
                                        <c:forEach items="${CVDAO.allSchoolNames}" var="h">
                                            <option value="${CVDAO.getSchoolIdByName(h)}" ${CVDAO.getSchoolIdByName(h) == o.educationId ? 'selected' : ''}>${h}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="otherSchoolName[]" value="${o.customSchool}" placeholder="Tên trường khác"
                                           class="form-control other-school-input" style="display: none;">
                                </div>
                                <div class="date-group">
                                    <input type="date" class="form-control" name="educationStartDate[]" value="${o.startDate}">
                                    <input type="date" class="form-control" name="educationEndDate[]" value="${o.endDate}">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="major[]" value="${o.fieldOfStudy}" placeholder="Chuyên ngành">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="degree[]" value="${o.degree}" placeholder="Bằng cấp">
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" name="school_Description[]"
                                              placeholder="Thông tin thêm">${o.moreInfor}</textarea>
                                </div>
                                <div style="text-align: right;">
                                    <button type="button" class="btn-remove remove-education">
                                        <i class="fas fa-trash"></i> Xóa
                                    </button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="experience-section">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <h3 id="experienceTitle" class="main-section-title">Kinh nghiệm làm việc</h3>
                            <div>
                                <button type="button" id="add-experience" class="btn-add">
                                    <i class="fas fa-plus"></i> Thêm
                                </button>
                            </div>
                        </div>
                        <c:forEach items="${CV.experienceList}" var="o">
                            <div class="experience-item">
                                <div class="form-group">
                                    <select class="form-control" name="Company[]" id="companySelect" required>
                                        <option value="">Chọn công ty</option>
                                        <c:forEach items="${CVDAO.allCompanyName}" var="h">
                                            <option value="${CVDAO.getCompanyIdByName(h)}" ${CVDAO.getCompanyIdByName(h) == o.experienceId ? 'selected' : ''}>${h}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="otherCompanyName[]" value="${o.customCompany}" placeholder="Tên công ty khác"
                                           class="form-control other-company-input" style="display: none;">
                                </div>
                                <div class="date-group">
                                    <input type="date" class="form-control" name="companyStartDate[]" value="${o.startAt}" required>
                                    <input type="date" class="form-control" name="companyEndDate[]" value="${o.endAt}">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="position[]" value="${o.jobPosition}" placeholder="Vị trí"
                                           required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="description[]" value="${o.description}"
                                           placeholder="Thông tin công việc">
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" name="work_achievements[]"
                                              placeholder="Thành tích">${o.achievement}</textarea>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="address[]" value="${o.address}"
                                           placeholder="địa chỉ">
                                </div>
                                <div style="text-align: right;">
                                    <button type="button" class="btn-remove remove-experience">
                                        <i class="fas fa-trash"></i> Xóa
                                    </button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="certification-section">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <h3 id="certificateTitle" class="main-section-title">Chứng chỉ & giải thưởng</h3>
                            <div>
                                <button type="button" id="add-certification" class="btn-add">
                                    <i class="fas fa-plus"></i> Thêm
                                </button>
                            </div>
                        </div>
                        <div class="section-divider"></div>
                        <c:forEach items="${CV.certificationList}" var="o">
                            <div class="certification-item">
                                <div class="form-group">
                                    <select class="form-control" name="certificationId[]" id="certificationSelect">
                                        <option value="">Chọn chứng chỉ</option>
                                        <c:forEach items="${CVDAO.allCertificationNames}" var="h">
                                            <option value="${CVDAO.getCertificationIdByName(h)}" ${CVDAO.getCertificationIdByName(h) == o.certificationId ? 'selected' : ''}>${h}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="otherCertificationName[]" value="${o.customCertification}" placeholder="Chứng chỉ khác"
                                           class="form-control other-certification-input" style="display: none;">
                                </div>
                                <div class="form-group">
                                    <input type="date" class="form-control" name="awardYear[]" value="${o.awardYear}">
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" name="prizeDescription[]"
                                              placeholder="Mô tả giải thưởng">${o.description}</textarea>
                                </div>
                                <div style="text-align: right;">
                                    <button type="button" class="btn-remove remove-certification">
                                        <i class="fas fa-trash"></i> Xóa
                                    </button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <button type="submit" class="submit-btn">
                <i class="fas fa-save"></i> Cập nhật CV
            </button>
        </form>

        <%@include file="./includes/gpt_sidebar.jsp" %>
    </main>
</div>

<script>
    // Avatar Upload Preview
    document.getElementById('avatar_cv').addEventListener('change', function (e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (event) {
                document.getElementById('avatar-preview').src = event.target.result;
            };
            reader.readAsDataURL(file);
        }
    });

    // Add Education Section
    document.getElementById('add-education').addEventListener('click', function () {
        const educationContainer = document.querySelector('.education-section');
        const newEducation = document.createElement('div');
        newEducation.classList.add('education-item');
        newEducation.innerHTML = `
            <div class="section-divider"></div>
            <div class="form-group">
                <select class="form-control" name="schoolId[]">
                    <option value="">Chọn trường học</option>
                    <c:forEach items="${CVDAO.allSchoolNames}" var="o">
                        <option value="${CVDAO.getSchoolIdByName(o)}">${o}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <input type="text" name="otherSchoolName[]" placeholder="Tên trường khác"
                       class="form-control other-school-input" style="display: none;">
            </div>
            <div class="date-group">
                <input type="date" class="form-control" name="educationStartDate[]">
                <input type="date" class="form-control" name="educationEndDate[]">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="major[]" placeholder="Chuyên ngành">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="degree[]" placeholder="Bằng cấp">
            </div>
            <div class="form-group">
                <textarea class="form-control" name="school_Description[]"
                          placeholder="Thông tin thêm"></textarea>
            </div>
            <div style="text-align: right;">
                <button type="button" class="btn-remove remove-education">
                    <i class="fas fa-trash"></i> Xóa
                </button>
            </div>
        `;
        educationContainer.appendChild(newEducation);
    });

    // Remove Education
    document.addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-education')) {
            e.target.closest('.education-item').remove();
        }
    });

    // Add Experience Section
    document.getElementById('add-experience').addEventListener('click', function () {
        const experienceContainer = document.querySelector('.experience-section');
        const newExperience = document.createElement('div');
        newExperience.classList.add('experience-item');
        newExperience.innerHTML = `
            <div class="section-divider"></div>
            <div class="form-group">
                <select class="form-control" name="Company[]" required>
                    <option value="">Chọn công ty</option>
                    <c:forEach items="${CVDAO.allCompanyName}" var="o">
                        <option value="${CVDAO.getCompanyIdByName(o)}">${o}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <input type="text" name="otherCompanyName[]" placeholder="Tên công ty khác"
                       class="form-control other-company-input" style="display: none;">
            </div>
            <div class="date-group">
                <input type="date" class="form-control" name="companyStartDate[]" required>
                <input type="date" class="form-control" name="companyEndDate[]">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="position[]" placeholder="Vị trí" required>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="description[]"
                       placeholder="Thông tin công việc">
            </div>
            <div class="form-group">
                <textarea class="form-control" name="work_achievements[]"
                          placeholder="Thành tích"></textarea>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="address[]"
                       placeholder="địa chỉ">
            </div>
            <div style="text-align: right;">
                <button type="button" class="btn-remove remove-experience">
                    <i class="fas fa-trash"></i> Xóa
                </button>
            </div>
        `;
        experienceContainer.appendChild(newExperience);
    });

    // Remove Experience
    document.addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-experience')) {
            e.target.closest('.experience-item').remove();
        }
    });

    // Add Certification Section
    document.getElementById('add-certification').addEventListener('click', function () {
        const certificationContainer = document.querySelector('.certification-section');
        const newCertification = document.createElement('div');
        newCertification.classList.add('certification-item');
        newCertification.innerHTML = `
            <div class="section-divider"></div>
            <div class="form-group">
                <select class="form-control" name="certificationId[]">
                    <option value="">Chọn chứng chỉ</option>
                    <c:forEach items="${CVDAO.allCertificationNames}" var="o">
                        <option value="${CVDAO.getCertificationIdByName(o)}">${o}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <input type="text" name="otherCertificationName[]" placeholder="Chứng chỉ khác"
                       class="form-control other-certification-input" style="display: none;">
            </div>
            <div class="form-group">
                <input type="date" class="form-control" name="awardYear[]">
            </div>
            <div class="form-group">
                <textarea class="form-control" name="prizeDescription[]"
                          placeholder="Mô tả giải thưởng"></textarea>
            </div>
            <div style="text-align: right;">
                <button type="button" class="btn-remove remove-certification">
                    <i class="fas fa-trash"></i> Xóa
                </button>
            </div>
        `;
        certificationContainer.appendChild(newCertification);
    });

    // Remove Certification
    document.addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-certification')) {
            e.target.closest('.certification-item').remove();
        }
    });
    // Add Skill Section
    document.getElementById('add-skill').addEventListener('click', function () {
        const skillContainer = document.querySelector('.skill-section');
        const newSkill = document.createElement('div');
        newSkill.classList.add('skill-item');
        newSkill.innerHTML = `
            <div class="form-group">
                <select class="form-control" name="mainSkillId[]" required>
                    <option value="">Chọn tiêu đề kỹ năng</option>
                    <c:forEach items="${CVDAO.allMainSkill}" var="o">
                        <option value="${o.mainSkillId}">${o.mainSkillName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <select class="form-control" name="skillId[]" required>
                    <option value="">Chọn kỹ năng</option>
                    <c:forEach items="${CVDAO.allMainSkill}" var="o">
                        <optgroup label="${o.mainSkillName}">
                            <c:forEach items="${CVDAO.getSkillByMainSkill(o.mainSkillId)}" var="h">
                                <option value="${h.skillId}"
                                        data-mainskill="${o.mainSkillId}">${h.skillName}</option>
                            </c:forEach>
                        </optgroup>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <input type="text" name="otherSkillName[]" placeholder="Tên kỹ năng khác"
                       class="form-control other-skill-input" style="display: none;">
            </div>
            <div class="form-group">
                <select class="form-control" name="levelSkill[]" required>
                    <option value="">Chọn level</option>
                    <% for (int i = 1; i <= 100; i++) { %>
                    <option value="<%= i %>"><%= i %>%</option>
                    <% } %>
                </select>
            </div>
            <div style="text-align: right;">
                <button type="button" class="btn-remove remove-skill">
                    <i class="fas fa-trash"></i> Xóa
                </button>
            </div>
        `;
        skillContainer.appendChild(newSkill);
    });

    // Remove Skill
    document.addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-skill')) {
            e.target.closest('.skill-item').remove();
        }
    });

    // Show "Other" input fields when "Other" option is selected
    document.addEventListener('change', function(e) {
        if (e.target.id === 'schoolSelect' || e.target.classList.contains('other-school-input')) {
            const otherInput = e.target.closest('.education-item').querySelector('.other-school-input');
            if (e.target.value === '1') {
                otherInput.style.display = 'block';
            } else {
                otherInput.style.display = 'none';
                otherInput.value = '';
            }
        }

        if (e.target.id === 'companySelect' || e.target.classList.contains('other-company-input')) {
            const otherInput = e.target.closest('.experience-item').querySelector('.other-company-input');
            if (e.target.value === '1') {
                otherInput.style.display = 'block';
            } else {
                otherInput.style.display = 'none';
                otherInput.value = '';
            }
        }

        if (e.target.id === 'certificationSelect' || e.target.classList.contains('other-certification-input')) {
            const otherInput = e.target.closest('.certification-item').querySelector('.other-certification-input');
            if (e.target.value === '1') {
                otherInput.style.display = 'block';
            } else {
                otherInput.style.display = 'none';
                otherInput.value = '';
            }
        }

        if (e.target.id === 'skillSelect' || e.target.classList.contains('other-skill-input')) {
            const otherInput = e.target.closest('.skill-item').querySelector('.other-skill-input');
            if (e.target.value === '1') {
                otherInput.style.display = 'block';
            } else {
                otherInput.style.display = 'none';
                otherInput.value = '';
            }
        }
    });

</script>
