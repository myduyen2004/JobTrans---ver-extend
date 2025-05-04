<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <jsp:useBean id="CVDAO" class="jobtrans.dal.CvDAO" scope="session"></jsp:useBean>
  <title>Professional CV Builder</title>
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

    .
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
      width: 300px;
      background: #7a785c;
      color: white;
      padding: 30px 20px;
    }

    .cv-main {
      flex: 1;
      padding: 30px;
      border:1px solid #7a785c;
      margin: 20px;
      border-radius: 10px;
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
      color: #EAE7D6;
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
    <form action="cv?action=create" method="POST" enctype="multipart/form-data">
      <input type="hidden" id="backGroundColor" name="backGroundColor" value="#ffffff">


      <input type="hidden" name="typeId" value="${param.typeId}">


      <%--        <p>${typeId}</p>--%>
      <div class="cv-box">
        <!-- Left Sidebar (CV Personal Info) -->
        <div id="cv-sidebar" class="cv-sidebar">
          <div class="cv-picture-avatar">
            <img id="avatar-preview" src="https://via.placeholder.com/200" alt="Profile Photo">
            <label for="avatar_cv" class="upload-label">
              <i class="fas fa-camera"></i> Change Photo
            </label>
            <input type="file" id="avatar_cv" name="avatar_cv" accept="image/*">
          </div>

          <h2  class="section-title">Liên hệ</h2>


          <div class="form-group">
            <select class="form-control" name="sex" id="sex">
              <option value="">-- Chọn giới tính --</option>

              <option class="indented-option" value="nam"> Nam</option>
              <option value="nữ"> Nữ</option>

            </select>
          </div>
          <div class="form-group">
            <input type="date" class="form-control" name="date_of_birth" placeholder="Ngày sinh">
          </div>
          <div class="form-group">
            <input type="tel" class="form-control" name="sdt" placeholder="Số điện thoại">
          </div>
          <div class="form-group">
            <input type="email" class="form-control" name="email" placeholder="Email">
          </div>
          <div class="form-group">
            <input type="text" class="form-control" name="address" placeholder="Địa chỉ">
          </div>

          <div class="skill-section">
            <h2 id="skillTitle" class="section-title">Kỹ Năng</h2>
            <div class="skill-item">
              <div class="form-group">
                <select class="form-control" id="mainSkillSelect" name="mainSkillId[]" >
                  <option value="">Chọn tiêu đề kỹ năng</option>
                  <c:forEach items="${CVDAO.allMainSkill}" var="o">
                    <option value="${o.mainSkillId}">${o.mainSkillName}</option>
                  </c:forEach>
                </select>
              </div>

              <div class="form-group">
                <select class="form-control" name="skillId[]" id="skillSelect" >
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

              <script>
                document.getElementById('skillSelect').addEventListener('change', function () {
                  var otherInput = document.querySelector('.other-skill-input');
                  if (this.value === '1') {
                    otherInput.style.display = 'block';
                  } else {
                    otherInput.style.display = 'none';
                    otherInput.value = ''; // Xóa giá trị khi không chọn "Khác"
                  }
                });
              </script>

              <div class="form-group">
                <select class="form-control" name="levelSkill[]" >
                  <option value="">Chọn level</option>
                  <% for (int i = 1; i <= 100; i++) { %>
                  <option value="<%= i %>"><%= i %>%</option>
                  <% } %>
                </select>
              </div>

            </div>

            <div style="text-align: right;">
              <button type="button" id="add-skill" class="btn-add">
                <i class="fas fa-plus"></i> Thêm kỹ năng
              </button>
            </div>
          </div>

          <h2 id="extraInfoTitle" class="section-title">Thông tin bổ sung</h2>
          <div class="form-group">
            <textarea name="more_infor" class="form-control" placeholder="Thông tin bổ sung"></textarea>
          </div>
        </div>

        <!-- Main CV Content -->
        <div class="cv-main">
          <div class="main-info">
            <input type="text" name="cvname" class="form-control" placeholder="Họ và tên"
                   style="font-size: 24px; font-weight: 600; border: none; border-bottom: 2px solid #eee; padding: 10px 0; margin-bottom: 15px;">
            <input type="text" name="position" class="form-control" placeholder="Vị trí ứng tuyển"
                   style="font-size: 18px; border: none; padding: 5px 0;">
          </div>

          <div class="career-goal-section">
            <h3 class="main-section-title" id="careerGoalTitle">Mục tiêu nghề nghiệp</h3>
            <div class="section-divider"></div>
            <textarea name="experienceDescription" class="form-control"
                      placeholder="Mô tả mục tiêu nghề nghiệp của bạn"></textarea>
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
            <div class="education-item">
              <div class="form-group">
                <select class="form-control" name="schoolId[]" id="schoolSelect">
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

              <script>
                document.getElementById('schoolSelect').addEventListener('change', function () {
                  var otherInput = document.querySelector('.other-school-input');
                  if (this.value === '1') {
                    otherInput.style.display = 'block';
                  } else {
                    otherInput.style.display = 'none';
                    otherInput.value = ''; // Xóa giá trị khi không chọn "Khác"
                  }
                });
              </script>
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
            </div>
          </div>

          <div class="experience-section">
            <!-- ... existing header ... -->
            <div style="display: flex; justify-content: space-between; align-items: center;">
              <h3 id="experienceTitle" class="main-section-title">Kinh nghiệm làm việc</h3>
              <div>
                <button type="button" id="add-experience" class="btn-add">
                  <i class="fas fa-plus"></i> Thêm
                </button>
              </div>
            </div>
            <div class="experience-item">
              <div class="form-group">
                <select class="form-control" name="Company[]" id="companySelect">
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
                <input type="date" class="form-control" name="companyStartDate[]" >
                <input type="date" class="form-control" name="companyEndDate[]">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="position[]" placeholder="Vị trí"
                       >
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
            </div>
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
            <div class="certification-item">
              <div class="form-group">
                <select class="form-control" name="certificationId[]" id="certificationSelect">
                  <option value="">Chọn chứng chỉ</option>
                  <c:forEach items="${CVDAO.allCertificationNames}" var="o">
                    <option value="${CVDAO.getCertificationIdByName(o)}">${o}</option>
                  </c:forEach>
                  <!-- Thêm lựa chọn "Khác" -->
                </select>
              </div>
              <div class="form-group">
                <input type="text" name="otherCertificationName[]" placeholder="Chứng chỉ khác"
                       class="form-control other-certification-input" style="display: none;">
              </div>

              <script>



                document.getElementById('certificationSelect').addEventListener('change', function () {
                  var otherInput = document.querySelector('.other-certification-input');
                  if (this.value === '1') {
                    otherInput.style.display = 'block';
                  } else {
                    otherInput.style.display = 'none';
                    otherInput.value = ''; // Xóa giá trị khi không chọn "Khác"
                  }
                });
              </script>
              <div class="form-group">
                <input type="date" class="form-control" name="awardYear[]">
              </div>
              <div class="form-group">
                            <textarea class="form-control" name="prizeDescription[]"
                                      placeholder="Mô tả giải thưởng"></textarea>
              </div>
            </div>
          </div>
        </div>


      </div>
      <button type="submit" class="submit-btn">
        <i class="fas fa-download"></i> Tạo CV
      </button>

    </form>

    <%@include file="./includes/gpt_sidebar.jsp" %>

  </main>

</div>


</div>

</body>



<script>
  document.getElementById('companySelect').addEventListener('change', function () {
    var otherInput = document.querySelector('.other-company-input');
    if (this.value === '1') {
      otherInput.style.display = 'block';
    } else {
      otherInput.style.display = 'none';
      otherInput.value = ''; // Clear the input when not selecting "Other"
    }
  });


  $(document).ready(function () {
    // Add new skill field
    $('#add-skill').click(function () {
      const newItem = $('.skill-item').first().clone();
      newItem.find('input, select').val('');
      newItem.find('.other-skill-input').hide();
      $('.skill-item').last().after(newItem);
    });

    // Remove skill field
    $(document).on('click', '.btn-remove-skill', function () {
      if ($('.skill-item').length > 1) {
        $(this).closest('.skill-item').remove();
      }
    });

    // Show "Other Skill" input when "Other" is selected
    $(document).on('change', 'select[name="skillId[]"]', function () {
      const otherInput = $(this).closest('.skill-item').find('.other-skill-input');
      if ($(this).val() === "1") {
        otherInput.show().prop('required', true);
      } else {
        otherInput.hide().prop('required', false).val('');
      }
    });

    // Auto-set mainSkillId when skill is selected
    $(document).on('change', 'select[name="skillId[]"]', function () {
      const selectedOption = $(this).find('option:selected');
      const mainSkillId = selectedOption.data('mainskill');
      if (mainSkillId) {
        $(this).closest('.skill-item').find('select[name="mainSkillId[]"]').val(mainSkillId);
      }
    });
  });
</script>


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
                            <input type="text"  class="form-control" name="address[]"
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
                            <select class="form-control" id="mainSkillSelect" name="mainSkillId[]" required>
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


  // Add this JavaScript code at the end of your page or in a separate file
  document.addEventListener('DOMContentLoaded', function () {
    // Get the form element
    const cvForm = document.querySelector('form[action="cv?action=create"]');

    // Function to add error message
    function addErrorMessage(element, message) {
      // Add error class to input
      element.classList.add('error-input');

      // Create error message element
      const errorDiv = document.createElement('div');
      errorDiv.className = 'error-message';
      errorDiv.textContent = message;

      // Insert error message after the element
      element.parentNode.insertBefore(errorDiv, element.nextSibling);
    }

    // Function to clear all error messages
    function clearErrorMessages() {
      // Remove error classes
      const errorInputs = document.querySelectorAll('.error-input');
      errorInputs.forEach(input => input.classList.remove('error-input'));

      // Remove error message elements
      const errorMessages = document.querySelectorAll('.error-message');
      errorMessages.forEach(msg => msg.remove());
    }

    // Validation functions
    function validateRequired(element, message) {
      if (!element.value.trim()) {
        addErrorMessage(element, message);
        return false;
      }
      return true;
    }

    function validateLength(element, min, max, message) {
      const value = element.value.trim();
      if (value.length < min || value.length > max) {
        addErrorMessage(element, message);
        return false;
      }
      return true;
    }

    function validateEmail(element, message) {
      const value = element.value.trim();
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(value)) {
        addErrorMessage(element, message);
        return false;
      }
      return true;
    }

    function validatePhone(element, message) {
      const value = element.value.trim();
      const phoneRegex = /^(0|\+84)\d{9,10}$/;
      if (!phoneRegex.test(value)) {
        addErrorMessage(element, message);
        return false;
      }
      return true;
    }

    function validateAge(element, min, max, message) {
      const birthDate = new Date(element.value);
      const today = new Date();

      let age = today.getFullYear() - birthDate.getFullYear();
      const monthDiff = today.getMonth() - birthDate.getMonth();

      if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
        age--;
      }

      if (age < min || age > max) {
        addErrorMessage(element, message);
        return false;
      }
      return true;
    }

    function validateDateRange(startElement, endElement, message) {
      if (startElement.value && endElement.value) {
        const startDate = new Date(startElement.value);
        const endDate = new Date(endElement.value);

        if (endDate <= startDate) {
          addErrorMessage(endElement, message);
          return false;
        }
      }
      return true;
    }

    // Add submit event listener to the form
    cvForm.addEventListener('submit', function (event) {
      // Reset previous error messages
      clearErrorMessages();
      localStorage.clear();
      // Validate form
      let isValid = true;

      // Validate personal information
      const fullName = document.querySelector('input[name="cvname"]');
      if (!validateRequired(fullName, 'Họ và tên không được để trống')) {
        isValid = false;
      } else if (!validateLength(fullName, 2, 50, 'Họ và tên phải có từ 2 đến 50 ký tự')) {
        isValid = false;
      }

      const position = document.querySelector('input[name="position"]');
      if (!validateRequired(position, 'Vị trí ứng tuyển không được để trống')) {
        isValid = false;
      }

      const sex = document.querySelector('select[name="sex"]');
      if (!validateRequired(sex, 'Vui lòng chọn giới tính')) {
        isValid = false;
      }

      const dateOfBirth = document.querySelector('input[name="date_of_birth"]');
      if (!validateRequired(dateOfBirth, 'Ngày sinh không được để trống')) {
        isValid = false;
      } else if (!validateAge(dateOfBirth, 18, 65, 'Độ tuổi phải từ 18 đến 65')) {
        isValid = false;
      }

      const phone = document.querySelector('input[name="sdt"]');
      if (!validateRequired(phone, 'Số điện thoại không được để trống')) {
        isValid = false;
      } else if (!validatePhone(phone, 'Số điện thoại không hợp lệ')) {
        isValid = false;
      }

      const email = document.querySelector('input[name="email"]');
      if (!validateRequired(email, 'Email không được để trống')) {
        isValid = false;
      } else if (!validateEmail(email, 'Email không hợp lệ')) {
        isValid = false;
      }

      const address = document.querySelector('input[name="address"]');
      if (!validateRequired(address, 'Địa chỉ không được để trống')) {
        isValid = false;
      }

      // Validate experience items
      const experienceItems = document.querySelectorAll('.experience-item');
      experienceItems.forEach(function (item, index) {
        const company = item.querySelector('select[name="Company[]"]');
        const startDate = item.querySelector('input[name="companyStartDate[]"]');
        const endDate = item.querySelector('input[name="companyEndDate[]"]');
        const position = item.querySelector('input[name="position[]"]');

        // if (!validateRequired(company, 'Vui lòng chọn công ty')) {
        //   isValid = false;
        // }
        //
        // if (!validateRequired(startDate, 'Ngày bắt đầu không được để trống')) {
        //   isValid = false;
        // }

        if (endDate.value && !validateDateRange(startDate, endDate, 'Ngày kết thúc phải sau ngày bắt đầu')) {
          isValid = false;
        }

        if (!validateRequired(position, 'Vị trí không được để trống')) {
          isValid = false;
        }
      });

      // Validate education items
      const educationItems = document.querySelectorAll('.education-item');
      educationItems.forEach(function (item) {
        const school = item.querySelector('select[name="schoolId[]"]');
        const startDate = item.querySelector('input[name="educationStartDate[]"]');
        const endDate = item.querySelector('input[name="educationEndDate[]"]');
        //
        // if (!validateRequired(school, 'Vui lòng chọn trường học')) {
        //   isValid = false;
        // }

        if (startDate.value && endDate.value && !validateDateRange(startDate, endDate, 'Ngày kết thúc phải sau ngày bắt đầu')) {
          isValid = false;
        }
      });

      // Check if form is valid before submission
      if (!isValid) {
        event.preventDefault();

        // Scroll to first error
        const firstError = document.querySelector('.error-input');
        if (firstError) {
          firstError.scrollIntoView({behavior: 'smooth', block: 'center'});
          firstError.focus();
        }
      }
    });

    // Add custom styles for error messages
    const style = document.createElement('style');
    style.textContent = `
        .error-input {
            border-color: #e74c3c !important;
        }

        .error-message {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 4px;
            margin-bottom: 8px;
        }
    `;
    document.head.appendChild(style);

    // Event listeners for "Other" options


  });

</script>
<script>

  function showCVInstruction(title, htmlContent) {
    const instructionContainer = document.getElementById("cvInstructions");
    const container = document.getElementById("cvTemplates");

    // Kiểm tra nếu hướng dẫn chưa hiển thị => không làm gì
    if ((instructionContainer.style.display !== "block") && ((container.style.display === "none"))) {
      alert("Vui lòng nhấn vào 'Hướng dẫn tạo CV' trước khi xem nội dung chi tiết.");
      return;
    }

    // Nếu đang hiển thị hướng dẫn, ẩn nó và hiển thị nội dung tương ứng
    if ((instructionContainer.style.display === "block") || (container.style.display === "block")) {
      instructionContainer.style.display = "none";
      container.innerHTML = htmlContent;
      container.style.display = "block";
    }
  }

  document.getElementById("careerGoalTitle").addEventListener("click", function () {
    const htmlContent = `
            <div class="template">
                <h2 class="template-heading">Hướng dẫn viết Mục tiêu nghề nghiệp</h2>
                <div style="padding: 20px; color: #333; line-height: 1.6">
                    <p><strong>Mục tiêu ngắn hạn:</strong> Nêu rõ bạn muốn học hỏi và phát triển kỹ năng gì trong 6 tháng đến 1 năm đầu làm việc.</p>
                    <p><strong>Mục tiêu dài hạn:</strong> Mô tả định hướng sự nghiệp bạn muốn đạt được trong 3-5 năm tới.</p>
                    <p><strong>Lưu ý:</strong> Hãy viết mục tiêu rõ ràng, thực tế và phù hợp với vị trí ứng tuyển.</p>
                </div>
            </div>
        `;
    showCVInstruction("careerGoal", htmlContent);
  });

  document.getElementById("educationTitle").addEventListener("click", function () {
    const htmlContent = `
        <div class="template">
                <h2 class="template-heading">Hướng dẫn viết Học vấn</h2>
                <div style="padding: 20px; color: #333; line-height: 1.6">
                    <div style="border: 1px solid #e0e0e0; border-radius: 10px; padding: 20px; font-family: Arial, sans-serif; color: #333; max-width: 500px;">
                        <h3 style="font-weight: bold; margin-bottom: 10px;">Gợi ý nội dung cho</h3>
                        <div style="background-color: #f5f7fa; padding: 10px 15px; border-radius: 6px; font-weight: bold; margin-bottom: 15px;">Nhân viên kinh doanh</div>
                        <div>
                            <strong>Đại học TopCV</strong><br>
                            Quản trị kinh doanh<br>
                            2014 - 2019<br>
                            Chuyên ngành Quản trị doanh nghiệp
                        </div>
                        <h4 style="margin-top: 20px; font-weight: bold;">Cách viết</h4>
                        <div style="margin-bottom: 10px; font-weight: bold; color: #1d8348;">👍 Cách viết học vấn hay:</div>
                        <ul style="padding-left: 20px; line-height: 1.6;">
                            <li>Chỉ đưa thông tin học vấn từ sau THPT + các khoá học ngắn hạn, chứng chỉ.</li>
                            <li>Ghi rõ tên ngành học, tên trường, thời gian bắt đầu và kết thúc.</li>
                            <li>Có thể bổ sung điểm số nếu cao hoặc liên quan.</li>
                            <li>Thêm học vấn online nếu liên quan công việc ứng tuyển.</li>
                        </ul>
                        <a href="https://www.vietnamworks.com/hrinsider/cach-viet-trinh-do-hoc-van-trong-cv.html" style="display: inline-block; margin-top: 10px; background-color: #e8f0fe; color: #1a73e8; padding: 8px 12px; border-radius: 6px; text-decoration: none; font-weight: bold;">
                            📘 Tham khảo hướng dẫn chi tiết
                        </a>
                    </div>
                </div>
            </div>`;
    showCVInstruction("education", htmlContent);
  });

  document.getElementById("experienceTitle").addEventListener("click", function () {
    const htmlContent = `<div class="template">
                <h2 class="template-heading">Hướng dẫn viết Kinh nghiệm làm việc</h2>
                <div style="padding: 20px; color: #333; line-height: 1.6">
                    <div style="border: 1px solid #e0e0e0; border-radius: 10px; padding: 20px; font-family: Arial, sans-serif; color: #333; max-width: 600px;">
                        <h3 style="font-weight: bold;">Gợi ý nội dung cho</h3>
                        <div style="background-color: #f5f7fa; padding: 10px 15px; border-radius: 6px; font-weight: bold; margin-bottom: 15px;">Nhân viên kinh doanh</div>
                        <div>
                            <strong>Công ty ABC</strong><br>
                            Vị trí: Nhân viên Kinh doanh<br>
                            06/2020 - 12/2023<br>
                            - Tìm kiếm, tư vấn khách hàng và ký kết hợp đồng dịch vụ.<br>
                            - Đạt doanh số trung bình 120% mục tiêu hàng quý.<br>
                            - Phối hợp phòng Marketing để triển khai chiến dịch khuyến mãi.
                        </div>
                        <h4 style="margin-top: 20px; font-weight: bold;">Cách viết</h4>
                        <div style="margin-bottom: 10px; font-weight: bold; color: #1d8348;">👍 Cách viết kinh nghiệm làm việc hay:</div>
                        <ul style="padding-left: 20px; line-height: 1.6;">
                            <li>Chỉ nên liệt kê những công việc liên quan.</li>
                            <li>Ghi rõ công ty, chức danh, thời gian, mô tả nhiệm vụ.</li>
                            <li>Dùng số liệu để chứng minh kết quả.</li>
                            <li>Ưu tiên viết từ mới nhất đến cũ nhất.</li>
                        </ul>
                        <a href="https://thuvienphapluat.vn/lao-dong-tien-luong/kinh-nghiem-lam-viec-la-gi-cach-viet-kinh-nghiem-lam-viec-trong-cv-an-tuong-10108.html" style="display: inline-block; margin-top: 10px; background-color: #e8f0fe; color: #1a73e8; padding: 8px 12px; border-radius: 6px; text-decoration: none; font-weight: bold;">
                            📘 Tham khảo hướng dẫn chi tiết
                        </a>
                    </div>
                </div>
            </div>`;
    showCVInstruction("experience", htmlContent);
  });

  document.getElementById("certificateTitle").addEventListener("click", function () {
    const htmlContent = ` <div class="template">
                <h2 class="template-heading">Hướng dẫn viết Chứng chỉ - Giải thưởng</h2>
                <div style="padding: 20px; color: #333; line-height: 1.6">
                    <div style="border: 1px solid #e0e0e0; border-radius: 10px; padding: 20px; font-family: Arial, sans-serif; color: #333; max-width: 600px;">
                        <h3 style="font-weight: bold;">Gợi ý nội dung cho</h3>
                        <div style="background-color: #f5f7fa; padding: 10px 15px; border-radius: 6px; font-weight: bold; margin-bottom: 15px;">Nhân viên kinh doanh</div>
                        <div>
                            <strong>Chứng chỉ:</strong><br>
                            - Chứng chỉ Kỹ năng bán hàng chuyên nghiệp (VietED) - 2022<br>
                            - IELTS 6.5 - 2021<br><br>
                            <strong>Giải thưởng:</strong><br>
                            - Nhân viên kinh doanh xuất sắc quý III - Công ty ABC (2023)<br>
                            - Top 5 cá nhân có doanh số cao nhất năm - Công ty XYZ (2022)
                        </div>
                        <h4 style="margin-top: 20px; font-weight: bold;">Cách viết</h4>
                        <div style="margin-bottom: 10px; font-weight: bold; color: #1d8348;">👍 Cách viết chứng chỉ - giải thưởng hay:</div>
                        <ul style="padding-left: 20px; line-height: 1.6;">
                            <li>Chỉ liệt kê chứng chỉ liên quan công việc ứng tuyển.</li>
                            <li>Ghi rõ tên chứng chỉ/giải thưởng, đơn vị cấp và thời gian nhận.</li>
                            <li>Không nên liệt kê quá nhiều nếu không liên quan.</li>
                            <li>Chứng chỉ nên còn hiệu lực hoặc giá trị thực tiễn.</li>
                        </ul>
                        <a href="https://timviec365.vn/blog/cach-viet-chung-chi-trong-cv-new13314.html" style="display: inline-block; margin-top: 10px; background-color: #e8f0fe; color: #1a73e8; padding: 8px 12px; border-radius: 6px; text-decoration: none; font-weight: bold;">
                            📘 Tham khảo hướng dẫn chi tiết
                        </a>
                    </div>
                </div>
            </div>`;
    showCVInstruction("certificate", htmlContent);
  });
  document.getElementById("skillTitle").addEventListener("click", function () {
    const htmlContent = `
    <div class="template">
        <h2 class="template-heading">Hướng dẫn viết Kỹ năng</h2>
        <div style="padding: 20px; color: #333; line-height: 1.6">
            <div style="border: 1px solid #e0e0e0; border-radius: 10px; padding: 20px; font-family: Arial, sans-serif; color: #333; max-width: 500px;">
                <h3 style="font-weight: bold; margin-bottom: 10px;">Gợi ý nội dung cho</h3>
                <div style="background-color: #f5f7fa; padding: 10px 15px; border-radius: 6px; font-weight: bold; margin-bottom: 15px;">Nhân viên kinh doanh</div>
                <div>
                    <ul style="padding-left: 20px; line-height: 1.6;">
                        <li>Kỹ năng giao tiếp</li>
                        <li>Đàm phán và thuyết phục khách hàng</li>
                        <li>Phân tích thị trường</li>
                        <li>Kỹ năng làm việc nhóm và độc lập</li>
                        <li>Sử dụng phần mềm CRM, Excel tốt</li>
                    </ul>
                </div>
                <h4 style="margin-top: 20px; font-weight: bold;">Cách viết</h4>
                <div style="margin-bottom: 10px; font-weight: bold; color: #1d8348;">👍 Cách viết kỹ năng hiệu quả:</div>
                <ul style="padding-left: 20px; line-height: 1.6;">
                    <li>Liệt kê ngắn gọn các kỹ năng liên quan đến công việc ứng tuyển.</li>
                    <li>Ưu tiên kỹ năng mềm (giao tiếp, lãnh đạo,...) và kỹ năng chuyên môn (tin học, phần mềm,...).</li>
                    <li>Có thể phân loại theo nhóm: mềm – chuyên môn – ngôn ngữ.</li>
                    <li>Đánh giá khả năng kỹ năng qua %</li>
                </ul>
                <a href="#" style="display: inline-block; margin-top: 10px; background-color: #e8f0fe; color: #1a73e8; padding: 8px 12px; border-radius: 6px; text-decoration: none; font-weight: bold;">
                    📘 Tham khảo hướng dẫn chi tiết
                </a>
            </div>
        </div>
    </div>`;
    showCVInstruction("skill", htmlContent);
  });
  document.getElementById("extraInfoTitle").addEventListener("click", function () {
    const htmlContent = `
    <div class="template">
        <h2 class="template-heading">Hướng dẫn viết Thông tin bổ sung</h2>
        <div style="padding: 20px; color: #333; line-height: 1.6">
            <div style="border: 1px solid #e0e0e0; border-radius: 10px; padding: 20px; font-family: Arial, sans-serif; color: #333; max-width: 500px;">
                <h3 style="font-weight: bold; margin-bottom: 10px;">Gợi ý nội dung</h3>
                <div style="background-color: #f5f7fa; padding: 10px 15px; border-radius: 6px; font-weight: bold; margin-bottom: 15px;">Nhân viên kinh doanh</div>
                <div>
                    <ul style="padding-left: 20px; line-height: 1.6;">
                        <li>Sở thích: Đọc sách về marketing, chạy bộ</li>
                        <li>Hoạt động tình nguyện tại các sự kiện cộng đồng</li>
                        <li>Thành viên CLB Kỹ năng mềm trường đại học</li>
                        <li>Tham gia các khoá học online về kỹ năng bán hàng</li>
                    </ul>
                </div>
                <h4 style="margin-top: 20px; font-weight: bold;">Cách viết</h4>
                <div style="margin-bottom: 10px; font-weight: bold; color: #1d8348;">👍 Gợi ý khi viết phần này:</div>
                <ul style="padding-left: 20px; line-height: 1.6;">
                    <li>Viết ngắn gọn các hoạt động, sở thích, thành tích ngoài lề nhưng có liên quan đến công việc.</li>
                    <li>Tránh liệt kê sở thích quá riêng tư hoặc không phù hợp với môi trường chuyên nghiệp.</li>
                    <li>Nên thể hiện những điều giúp nổi bật tính cách tích cực hoặc khả năng học hỏi.</li>
                </ul>
                <a href="https://careerviet.vn/vi/talentcommunity/cac-ky-nang-trong-cv-giup-chinh-phuc-moi-nha-tuyen-dung.35A52053.html?gad_source=1&gbraid=0AAAAADNFRf-XSX-5jdUhuhKWOFRPloyTu&gclid=Cj0KCQjwlMfABhCWARIsADGXdy-uMy_ya9aSFBplVUCzuTXmxY0RFhWwWpFIAp3_xRJo3GgmantJyI4aAgppEALw_wcB" style="display: inline-block; margin-top: 10px; background-color: #e8f0fe; color: #1a73e8; padding: 8px 12px; border-radius: 6px; text-decoration: none; font-weight: bold;">
                    📘 Tham khảo hướng dẫn chi tiết
                </a>
            </div>
        </div>
    </div>`;
    showCVInstruction("extraInfo", htmlContent);
  });
  ///
  ///

  ///
  ///
  ///
  window.getFullCVData = function() {
    const cvBox = document.querySelector('.cv-box');
    if (!cvBox) return null;

    // Hàm helper để lấy giá trị từ selector
    const getValue = (selector) => cvBox.querySelector(selector)?.value || '';
    const getText = (selector) => cvBox.querySelector(selector)?.textContent || '';

    return {
      // === THÔNG TIN CÁ NHÂN ===
      personalInfo: {
        name: getValue('input[name="cvname"]'),
        position: getValue('input[name="position"]'),
        sex: getValue('select[name="sex"]'),
        dateOfBirth: getValue('input[name="date_of_birth"]'),
        phone: getValue('input[name="sdt"]'),
        email: getValue('input[name="email"]'),
        address: getValue('input[name="address"]'),
        avatar: cvBox.querySelector('#avatar-preview')?.src || ''
      },

      // === MỤC TIÊU NGHỀ NGHIỆP ===
      careerGoal: getValue('textarea[name="experienceDescription"]'),

      // === KỸ NĂNG ===
      skills: Array.from(cvBox.querySelectorAll('.skill-item')).map(skill => ({
        mainSkill: skill.querySelector('select[name="mainSkillId[]"]')?.value || '',
        mainSkillName: skill.querySelector('select[name="mainSkillId[]"] option:checked')?.text || '',
        skill: skill.querySelector('select[name="skillId[]"]')?.value || '',
        skillName: skill.querySelector('select[name="skillId[]"] option:checked')?.text || '',
        otherSkill: skill.querySelector('input[name="otherSkillName[]"]')?.value || '',
        level: skill.querySelector('select[name="levelSkill[]"]')?.value || ''
      })),

      // === HỌC VẤN ===
      educations: Array.from(cvBox.querySelectorAll('.education-item')).map(edu => ({
        schoolId: getValue.call(edu, 'select[name="schoolId[]"]'),
        schoolName: edu.querySelector('select[name="schoolId[]"] option:checked')?.text || '',
        otherSchool: getValue.call(edu, 'input[name="otherSchoolName[]"]'),
        startDate: getValue.call(edu, 'input[name="educationStartDate[]"]'),
        endDate: getValue.call(edu, 'input[name="educationEndDate[]"]'),
        major: getValue.call(edu, 'input[name="major[]"]'),
        degree: getValue.call(edu, 'input[name="degree[]"]'),
        description: getValue.call(edu, 'textarea[name="school_Description[]"]')
      })),

      // === KINH NGHIỆM ===
      experiences: Array.from(cvBox.querySelectorAll('.experience-item')).map(exp => ({
        companyId: getValue.call(exp, 'select[name="Company[]"]'),
        companyName: exp.querySelector('select[name="Company[]"] option:checked')?.text || '',
        otherCompany: getValue.call(exp, 'input[name="otherCompanyName[]"]'),
        startDate: getValue.call(exp, 'input[name="companyStartDate[]"]'),
        endDate: getValue.call(exp, 'input[name="companyEndDate[]"]'),
        position: getValue.call(exp, 'input[name="position[]"]'),
        description: getValue.call(exp, 'input[name="description[]"]'),
        achievements: getValue.call(exp, 'textarea[name="work_achievements[]"]'),
        address: getValue.call(exp, 'input[name="address[]"]')
      })),

      // === CHỨNG CHỈ ===
      certifications: Array.from(cvBox.querySelectorAll('.certification-item')).map(cert => ({
        certificationId: getValue.call(cert, 'select[name="certificationId[]"]'),
        certificationName: cert.querySelector('select[name="certificationId[]"] option:checked')?.text || '',
        otherCertification: getValue.call(cert, 'input[name="otherCertificationName[]"]'),
        year: getValue.call(cert, 'input[name="awardYear[]"]'),
        description: getValue.call(cert, 'textarea[name="prizeDescription[]"]')
      })),

      // === THÔNG TIN KHÁC ===
      additionalInfo: getValue('textarea[name="more_infor"]')
    };
  };

  window.addEventListener('message', function(event) {
    if (event.data.type === 'colorChange') {
      applyBackgroundColor(event.data.color);
      // Lưu màu vào localStorage để duy trì qua các lần truy cập
      localStorage.setItem('cvBackgroundColor', event.data.color);
    }
  });

  // Áp dụng màu nền cho CV
  function applyBackgroundColor(color) {
    const cvSidebar = document.getElementById('cv-sidebar');
    if (cvSidebar) {
      cvSidebar.style.backgroundColor = color || '#5D7B6F';

      // Đồng thời cập nhật input ẩn để gửi về server
      const colorInput = document.getElementById('backGroundColor');
      if (colorInput) {
        colorInput.value = color || '#5D7B6F';
      }

      // Cập nhật màu chữ cho phù hợp
      updateTextColor(color || '#5D7B6F');
    }
  }

  // Hàm cập nhật màu chữ tương phản
  function updateTextColor(bgColor) {
    const sectionTitles = document.querySelectorAll('.section-title');
    const brightness = calculateBrightness(bgColor || '#5D7B6F');
    const textColor = brightness > 128 ? '#000000' : '#FFFFFF';

    sectionTitles.forEach(title => {
      title.style.color = textColor;
    });
  }

  // Hàm tính độ sáng màu
  function calculateBrightness(hexColor) {
    const r = parseInt(hexColor.substr(1, 2), 16);
    const g = parseInt(hexColor.substr(3, 2), 16);
    const b = parseInt(hexColor.substr(5, 2), 16);
    return (r * 299 + g * 587 + b * 114) / 1000;
  }

  // Áp dụng màu mặc định #5D7B6F khi tải trang
  document.addEventListener('DOMContentLoaded', function() {
    // Lấy màu từ localStorage nếu có, nếu không thì dùng màu mặc định #5D7B6F
    const savedColor = localStorage.getItem('cvBackgroundColor') || '#5D7B6F';
    applyBackgroundColor(savedColor);

    // Debug - kiểm tra xem màu đã được áp dụng chưa
    console.log('Applied color:', savedColor);
  });
  document.getElementById("mainSkillSelect").addEventListener("change", function () {
    const selectedMainSkill = this.value;
    const skillSelect = document.getElementById("skillSelect");

    // Lấy tất cả option (trừ option đầu tiên mặc định)
    const options = Array.from(skillSelect.querySelectorAll("option[data-mainskill]"));
    const defaultOption = skillSelect.querySelector("option[value='']");

    // Lọc option theo selected mainSkill
    const matchedOptions = options.filter(opt => opt.getAttribute("data-mainskill") === selectedMainSkill);
    const unmatchedOptions = options.filter(opt => opt.getAttribute("data-mainskill") !== selectedMainSkill);

    // Reset select
    skillSelect.innerHTML = ""; // Xoá tất cả option
    skillSelect.appendChild(defaultOption); // Thêm lại option mặc định

    // Thêm option khớp trước (hiển thị), sau đó option không khớp (ẩn)
    matchedOptions.forEach(opt => {
      opt.style.display = "block";
      opt.disabled = false;
      skillSelect.appendChild(opt);
    });

    // Đảm bảo rằng option có value = "1" luôn được hiển thị
    unmatchedOptions.forEach(opt => {
      // Nếu option có value = 1, thì luôn luôn hiển thị
      if (opt.value === "1") {
        opt.style.display = "block";
        opt.disabled = false;
      } else {
        opt.style.display = "none";
        opt.disabled = true;
      }
      skillSelect.appendChild(opt);
    });

    // Reset chọn
    skillSelect.value = "";
  });
</script>

</body>
</html>