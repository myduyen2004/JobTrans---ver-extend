<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:useBean id="CVDAO" class="jobtrans.dal.CvDAO" scope="session"></jsp:useBean>
  <title>Chỉnh sửa CV</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&family=Roboto:wght@300;400;500;700&display=swap"
        rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <style>
    :root {
      --primary: #4361ee;
      --primary-light: #e0e7ff;
      --secondary: #3f37c9;
      --dark: #1e1e1e;
      --light: #f8f9fa;
      --gray: #6c757d;
      --border: #dee2e6;
      --shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
      --radius: 8px;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Roboto', sans-serif;
    }

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
      font-family: 'Poppins', sans-serif;
      font-weight: 600;
      font-size: 22px;
      color: var(--primary);
    }

    .logo-icon {
      font-size: 26px;
    }

    .header-actions {
      margin-left: auto;
      display: flex;
      gap: 15px;
      align-items: center;
    }

    .btn {
      padding: 8px 16px;
      border-radius: var(--radius);
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s;
      display: inline-flex;
      align-items: center;
      gap: 8px;
      font-size: 14px;
    }

    .btn-outline {
      border: 1px solid var(--primary);
      color: var(--primary);
      background: transparent;
    }

    .btn-outline:hover {
      background: var(--primary-light);
    }

    .btn-primary {
      background: var(--primary);
      color: white;
      border: none;
    }

    .btn-primary:hover {
      background: var(--secondary);
      transform: translateY(-2px);
    }

    .user-avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: var(--primary);
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: 600;
      cursor: pointer;
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
      transition: all 0.3s;
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
      transition: all 0.2s;
      color: var(--gray);
      text-decoration: none;
    }

    .menu-item:hover {
      background: var(--primary-light);
      color: var(--primary);
    }

    .menu-item.active {
      background: var(--primary-light);
      color: var(--primary);
      font-weight: 500;
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
      margin-top: 25px;
      flex: 1;
      padding: 30px;
      background-color: #f5f7fb;
    }

    .cv-box {
      background: white;
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      overflow: hidden;
      max-width: 1000px;
      margin: 0 auto;
      display: flex;
    }

    .cv-sidebar {
      margin-top: 20px;
      margin-left: 30px;
      width: 300px;
      background: ${CV.backroundColor};
      color: white;
      padding: 30px 20px;
      height: 250px;
      border-top-left-radius:20px ;
      border-bottom-left-radius:20px ;
    }

    .cv-main {
      flex: 1;
      padding: 30px;
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
      transition: opacity 0.3s;
    }

    .cv-picture-avatar:hover .upload-label {
      opacity: 1;
    }

    #avatar_cv {
      display: none;
    }

    /* Form Elements */
    .form-group {
      margin-bottom: 15px;
    }

    .form-control {
      width: 100%;
      padding: 10px 12px;
      border: 1px solid var(--border);
      border-radius: var(--radius);
      font-size: 14px;
      transition: all 0.2s;
    }

    .form-control:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);
    }

    textarea.form-control {
      min-height: 100px;
      resize: vertical;
    }

    /* Section Styles */
    .section-title {
      font-family: 'Poppins', sans-serif;
      font-size: 18px;
      font-weight: 600;
      margin: 25px 0 15px;
      color: #0a0a2b;
      padding-bottom: 8px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    }

    .main-section-title {
      font-family: 'Poppins', sans-serif;
      font-size: 20px;
      font-weight: 600;
      margin: 20px 0;
      color: var(--dark);
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .section-divider {
      height: 1px;
      background: var(--border);
      margin: 15px 0;
    }

    /* Button Styles */
    .btn-add {
      background: #0d9d89;
      color: white;
      border: none;
      padding: 6px 12px;
      border-radius: 4px;
      font-size: 13px;
      cursor: pointer;
      transition: all 0.2s;
    }

    .btn-add:hover {
      background: #57F9FA;
    }

    .btn-remove {
      background: #e74c3c;
      color: white;
      border: none;
      padding: 6px 12px;
      border-radius: 4px;
      font-size: 13px;
      cursor: pointer;
      transition: all 0.2s;
      margin-left: 10px;
    }

    .btn-remove:hover {
      background: #c0392b;
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
    }

    .submit-btn:hover {
      background: var(--secondary);
      transform: translateY(-3px);
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    }

    .main-info {
      background-color: #8492a6;
      height: 250px;
      margin: -30px;
      margin-top: -10px;
      margin-right: -0px;
      border-top-right-radius: 20px;
      border-bottom-right-radius: 20px;
    }

    /* Error styles */
    .error-input {
      border-color: #e74c3c !important;
    }

    .error-message {
      color: #e74c3c;
      font-size: 12px;
      margin-top: 4px;
      margin-bottom: 8px;
    }
  </style>
</head>
<body>

<%@include file="includes/header-01.jsp" %>
<div style="margin-top: 100px">
  <%@include file="includes/header_cv.jsp" %>
</div>
<div style="margin-top:140px;display: flex">
  <%@include file="./includes/sidebar_createCV.jsp" %>

  <!-- CV Content Area -->
  <main class="cv-content">
    <form action="cv?action=update" method="POST" enctype="multipart/form-data">

      <input type="hidden" name="cvId" value="${param.cvId}">
      <input type="hidden" name="typeId" value="${CV.cvType}">

      <div class="cv-box">
        <!-- Left Sidebar (CV Personal Info) -->
        <div class="cv-sidebar">
          <div class="cv-picture-avatar">
            <img id="avatar-preview" src="${not empty CV.avatarCv ? CV.avatarCv : 'https://via.placeholder.com/200'}" alt="Profile Photo">
            <label for="avatar_cv" class="upload-label">
              <i class="fas fa-camera"></i> Change Photo
            </label>
            <input type="file" id="avatar_cv" name="avatar_cv" accept="image/*">
          </div>
          <div style="margin-top:50px;border:1px solid #0a0a2b;border-radius:20px; padding:30px;margin-left: -19px">
            <h2 class="section-title">Liên hệ</h2>

            <div class="form-group">
              <select class="form-control" name="sex" id="sex">
                <option value="">-- Chọn giới tính --</option>
                <option class="indented-option" value="nam" ${CV.sex eq 'nam' ? 'selected' : ''}> Nam</option>
                <option value="nữ" ${CV.sex eq 'nữ' ? 'selected' : ''}> Nữ</option>
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
            <input name="color" type="hidden" value="${CV.backroundColor}">
          </div>
          <div style="border-radius: 20px; margin-top:40px;padding:30px;border: 1px #0a0a2b solid; margin-left: -19px " class="skill-section">
            <h2 id="skillTitle" class="section-title">Kỹ Năng</h2>
            <c:forEach items="${CV.skillList}" var="o">
              <div class="skill-item">
                <div class="form-group">
                  <select class="form-control" name="mainSkillId[]" required>
                    <option value="">Chọn tiêu đề kỹ năng</option>
                    <c:forEach items="${CVDAO.allMainSkill}" var="ms">
                      <option value="${ms.mainSkillId}" ${ms.mainSkillId eq o.mainSkillId ? 'selected' : ''}>${ms.mainSkillName}</option>
                    </c:forEach>
                  </select>
                </div>

                <div class="form-group">
                  <select class="form-control" name="skillId[]" id="skillSelect" required>
                    <option value="">Chọn kỹ năng</option>
                    <c:forEach items="${CVDAO.allMainSkill}" var="ms">
                      <optgroup label="${ms.mainSkillName}">
                        <c:forEach items="${CVDAO.getSkillByMainSkill(ms.mainSkillId)}" var="s">
                          <option value="${s.skillId}"
                                  data-mainskill="${ms.mainSkillId}"
                            ${s.skillId eq o.skillId ? 'selected' : ''}>${s.skillName}</option>
                        </c:forEach>
                      </optgroup>
                    </c:forEach>
                  </select>
                </div>

                <div class="form-group">
                  <input type="text" name="otherSkillName[]" value="${o.skillCustom}" placeholder="Tên kỹ năng khác"
                         class="form-control other-skill-input" style="${o.skillId eq 1 ? 'display: block;' : 'display: none;'}">
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
          <div style="border-radius: 20px; margin-top:40px;padding:30px;border: 1px #0a0a2b solid; margin-left: -19px">
            <h2 id="extraInfoTitle" class="section-title">Thông tin bổ sung</h2>
            <div class="form-group">
              <textarea name="more_infor" class="form-control" placeholder="Thông tin bổ sung">${CV.moreInfo}</textarea>
            </div>
          </div>
        </div>

        <!-- Main CV Content -->
        <div class="cv-main">
          <div class="main-info">
            <div style="padding-left:100px;padding-top: 60px;width: 500px">
              <input type="text" name="cvname" value="${CV.cvName}" class="form-control" placeholder="Họ và tên"
                     style="font-size: 24px; font-weight: 600; border: none; border-bottom: 2px solid #eee; padding: 10px 0; margin-bottom: 15px;">
              <input type="text" name="position" value="${CV.jobPosition}" class="form-control" placeholder="Vị trí ứng tuyển"
                     style="font-size: 18px; border: none; padding: 5px 0;">
            </div>
          </div>

          <div style="border-radius: 20px; margin-top:40px;padding:30px;border: 1px solid"
               class="career-goal-section">
            <h3 class="main-section-title" id="careerGoalTitle">Mục tiêu nghề nghiệp</h3>
            <div class="section-divider"></div>
            <textarea name="experienceDescription" class="form-control"
                      placeholder="Mô tả mục tiêu nghề nghiệp của bạn">${CV.summary}</textarea>
          </div>

          <div style="margin-top:20px;border:1px solid;border-radius:20px; padding:30px"
               class="education-section">
            <div style="display: flex; justify-content: space-between; align-items: center">
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
                    <c:forEach items="${CVDAO.allSchoolNames}" var="school">
                      <option value="${CVDAO.getSchoolIdByName(school)}"
                        ${CVDAO.getSchoolIdByName(school) eq o.educationId ? 'selected' : ''}>
                          ${school}
                      </option>
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

          <div style="margin-top:20px;border:1px solid;border-radius:20px; padding:30px"
               class="experience-section">
            <div style="display: flex; justify-content: space-between; align-items: center">
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
                    <c:forEach items="${CVDAO.allCompanyName}" var="company">
                      <option value="${CVDAO.getCompanyIdByName(company)}"
                        ${CVDAO.getCompanyIdByName(company) eq o.experienceId ? 'selected' : ''}>
                          ${company}
                      </option>
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

          <div style="margin-top:20px;border:1px solid;border-radius:20px;padding: 30px"
               class="certification-section">
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
                    <c:forEach items="${CVDAO.allCertificationNames}" var="cert">
                      <option value="${CVDAO.getCertificationIdByName(cert)}"
                        ${CVDAO.getCertificationIdByName(cert) eq o.certificationId ? 'selected' : ''}>
                          ${cert}
                      </option>
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
        <i class="fas fa-save"></i> Lưu thay đổi
      </button>
    </form>

    <%@include file="./includes/gpt_sidebar.jsp" %>
  </main>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Company Select Logic
    const companySelect = document.getElementById('companySelect');
    const otherCompanyInput = document.querySelector('.other-company-input');

    if (companySelect && otherCompanyInput) {
      companySelect.addEventListener('change', function() {
        if (this.value === '1') {
          otherCompanyInput.style.display = 'block';
        } else {
          otherCompanyInput.style.display = 'none';
          otherCompanyInput.value = '';
        }
      });

      // Set initial state
      if (companySelect.value === '1') {
        otherCompanyInput.style.display = 'block';
      }
    }

    // Certification Select Logic
    const certificationSelect = document.getElementById('certificationSelect');
    const otherCertificationInput = document.querySelector('.other-certification-input');

    if (certificationSelect && otherCertificationInput) {
      certificationSelect.addEventListener('change', function() {
        if (this.value === '1') {
          otherCertificationInput.style.display = 'block';
        } else {
          otherCertificationInput.style.display = 'none';
          otherCertificationInput.value = '';
        }
      });

      // Set initial state
      if (certificationSelect.value === '1') {
        otherCertificationInput.style.display = 'block';
      }
    }

    // School Select Logic
    const schoolSelect = document.getElementById('schoolSelect');
    const otherSchoolInput = document.querySelector('.other-school-input');

    if (schoolSelect && otherSchoolInput) {
      schoolSelect.addEventListener('change', function() {
        if (this.value === '1') {
          otherSchoolInput.style.display = 'block';
        } else {
          otherSchoolInput.style.display = 'none';
          otherSchoolInput.value = '';
        }
      });

      // Set initial state
      if (schoolSelect.value === '1') {
        otherSchoolInput.style.display = 'block';
      }
    }

    // Skill Select Logic
    const skillSelect = document.querySelector('select[name="skillId[]"]');
    const otherSkillInput = document.querySelector('.other-skill-input');

    if (skillSelect && otherSkillInput) {
      skillSelect.addEventListener('change', function() {
        if (this.value === '1') {
          otherSkillInput.style.display = 'block';
        } else {
          otherSkillInput.style.display = 'none';
          otherSkillInput.value = '';
        }
      });

      // Set initial state
      if (skillSelect.value === '1') {
        otherSkillInput.style.display = 'block';
      }
    }
  });
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
        `;
    skillContainer.appendChild(newSkill);
  });
</script>
</body>
</html>