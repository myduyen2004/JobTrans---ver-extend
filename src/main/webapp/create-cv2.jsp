<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:useBean id="CVDAO" class="jobtrans.dal.CvDAO" scope="session"></jsp:useBean>
    <title>Professional CV Builder</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Montserrat:wght@600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #34495e;
            --accent: #3498db;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --text: #333;
            --border: #ddd;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            --radius: 8px;
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f7fa;
            color: var(--text);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            padding: 40px 0;
        }

        .cv-container {
            margin-left: 12%;
            width: 1200px;
            display: flex;
            box-shadow: var(--shadow);
            background: white;
            border-radius: var(--radius);
            overflow: hidden;
            position: relative;
        }

        /* Sidebar Styles */
        .cv-sidebar {
            width: 350px;
            background: var(--primary);
            color: white;
            padding: 40px 30px;
            position: relative;
            z-index: 1;
        }

        .avatar-container {
            width: 250px;
            height: 250px;
            border-radius: 50%;
            margin: 0 auto 30px;
            border: 4px solid white;
            overflow: hidden;
            position: relative;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            transition: var(--transition);
        }

        .avatar-container:hover {
            transform: scale(1.03);
        }

        .avatar-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .avatar-upload {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 14px;
            opacity: 0;
            transition: var(--transition);
        }

        .avatar-container:hover .avatar-upload {
            opacity: 1;
        }

        .section-title {
            font-family: 'Montserrat', sans-serif;
            font-size: 20px;
            font-weight: 700;
            margin: 30px 0 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
            color: white;
            position: relative;
        }

        .section-title:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -2px;
            width: 50px;
            height: 2px;
            background: var(--accent);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius);
            background: rgba(255, 255, 255, 0.1);
            color: white;
            font-size: 15px;
            transition: var(--transition);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--accent);
            background: rgba(255, 255, 255, 0.2);
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        textarea.form-control {
            min-height: 100px;
            resize: vertical;
        }

        /* Main Content Styles */
        .cv-content {
            flex: 1;
            padding: 50px;
            background: white;
            position: relative;
        }

        .header-section {
            text-align: center;
            margin-bottom: 50px;
        }

        .name-input {
            font-size: 32px;
            font-weight: 700;
            color: var(--dark);
            border: none;
            border-bottom: 2px solid var(--accent);
            padding: 10px 0;
            text-align: center;
            width: 80%;
            margin: 0 auto 15px;
            font-family: 'Montserrat', sans-serif;
            transition: var(--transition);
        }

        .name-input:focus {
            outline: none;
            border-bottom-color: var(--primary);
        }

        .position-input {
            font-size: 20px;
            color: var(--secondary);
            border: none;
            text-align: center;
            width: 80%;
            margin: 0 auto;
            padding: 5px 0;
            transition: var(--transition);
        }

        .position-input:focus {
            outline: none;
            color: var(--primary);
        }

        .content-section {
            margin-bottom: 40px;
        }

        .content-title {
            font-family: 'Montserrat', sans-serif;
            font-size: 24px;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--light);
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .content-title:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -2px;
            width: 50px;
            height: 2px;
            background: var(--accent);
        }

        .btn-group {
            display: flex;
            gap: 10px;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: var(--radius);
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .btn-primary {
            background: var(--accent);
            color: white;
        }

        .btn-primary:hover {
            background: #2980b9;
            transform: translateY(-2px);
        }

        .btn-danger {
            background: #e74c3c;
            color: white;
        }

        .btn-danger:hover {
            background: #c0392b;
        }

        .date-group {
            display: flex;
            gap: 20px;
            margin-bottom: 15px;
        }

        .date-group .form-control {
            flex: 1;
        }

        /* Main content form controls */
        .main-form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border);
            border-radius: var(--radius);
            font-size: 15px;
            transition: var(--transition);
            margin-bottom: 15px;
            background: white;
        }

        .main-form-control:focus {
            outline: none;
            border-color: var(--accent);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }

        textarea.main-form-control {
            min-height: 120px;
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

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .cv-sidebar > div,
        .cv-content > div {
            animation: fadeIn 0.5s ease-out forwards;
        }

        .cv-sidebar > div:nth-child(1) { animation-delay: 0.1s; }
        .cv-sidebar > div:nth-child(2) { animation-delay: 0.2s; }
        .cv-sidebar > div:nth-child(3) { animation-delay: 0.3s; }
        .cv-content > div:nth-child(1) { animation-delay: 0.2s; }
        .cv-content > div:nth-child(2) { animation-delay: 0.3s; }
        .cv-content > div:nth-child(3) { animation-delay: 0.4s; }
        .cv-content > div:nth-child(4) { animation-delay: 0.5s; }


        .cv-content {
            transition: var(--transition);
            margin-right: 0;
        }

        .dashboard-sidebar.expanded ~ .cv-content {
            margin-right: 350px;
        }

        @media (max-width: 992px) {
            .dashboard-sidebar.expanded ~ .cv-content {
                margin-right: 0;
                transform: translateX(-100px);
            }
        }
    </style>
</head>
<body>
<%@include file="./includes/sidebar_createCV.jsp" %>
<form action="cv?action=create" method="POST" enctype="multipart/form-data">


    <input type="hidden" name="typeId" value="${param.typeId}">

    <div class="cv-container">
        <!-- Left Sidebar -->
        <div class="cv-sidebar">
            <div style="width: 250px; height: 250px" class="avatar-container">
                <img id="avatar-preview" src="https://via.placeholder.com/200" alt="Profile Photo">
                <label for="avatar_cv" class="avatar-upload">
                    <i class="fas fa-camera"></i> Change Photo
                </label>
                <input type="file" id="avatar_cv" name="avatar_cv" accept="image/*" style="display: none;">
            </div>

            <h2 class="section-title">Contact Info</h2>
            <div class="form-group">
                <input type="text" class="form-control" name="sex" placeholder="Gender">
            </div>
            <div class="form-group">
                <input type="date" class="form-control" name="date_of_birth" placeholder="Date of Birth">
            </div>
            <div class="form-group">
                <input type="tel" class="form-control" name="sdt" placeholder="Phone Number">
            </div>
            <div class="form-group">
                <input type="email" class="form-control" name="email" placeholder="Email Address">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="address" placeholder="Address">
            </div>

            <h2 class="section-title">Skills</h2>
            <div class="skills-section">
                <div class="btn-group">
                    <button style="margin-bottom: 15px" type="button" class="btn btn-primary" id="add-skill">
                        <i class="fas fa-plus"></i> Add
                    </button>
                </div>
                <div class="skill-item">
                    <select class="form-control" name="mainSkillId[]" required style="margin-bottom: 10px;">
                        <option value="">Select Skill Category</option>
                        <c:forEach items="${CVDAO.allMainSkill}" var="o">
                            <option value="${o.mainSkillId}">${o.mainSkillName}</option>
                        </c:forEach>
                    </select>

                    <select class="form-control" name="skillId[]" required style="margin-bottom: 10px;">
                        <option value="">Select Skill</option>
                        <c:forEach items="${CVDAO.allMainSkill}" var="o">
                            <optgroup label="${o.mainSkillName}">
                                <c:forEach items="${CVDAO.getSkillByMainSkill(o.mainSkillId)}" var="h">
                                    <option value="${h.skillId}" data-mainskill="${o.mainSkillId}">${h.skillName}</option>
                                </c:forEach>
                            </optgroup>
                        </c:forEach>
                        <option value="31">Other</option>
                    </select>

                    <div class="form-group">
                        <input type="text" name="otherSkillName[]" placeholder="Other Skill Name"
                               class="form-control other-skill-input" style="display: none;">
                    </div>

                    <select class="form-control" name="levelSkill[]" required>
                        <option value="">Select Proficiency</option>
                        <% for (int i = 1; i <= 100; i++) { %>
                        <option value="<%= i %>"><%= i %>%</option>
                        <% } %>
                    </select>
                </div>
            </div>

            <h2 class="section-title">Additional Info</h2>
            <textarea class="form-control" name="more_infor" placeholder="Any additional information"></textarea>
        </div>

        <!-- Main Content -->
        <div class="cv-content">
            <div class="header-section">
                <input type="text" class="name-input" name="cvname" placeholder="Your Full Name">
                <input type="text" class="position-input" name="position" placeholder="Professional Title">
            </div>

            <div class="content-section">
                <div class="content-title">
                    Professional Summary
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                    </div>
                </div>
                <textarea class="main-form-control" name="experienceDescription" placeholder="Write a short summary about your professional background and key skills"></textarea>
            </div>

            <div class="content-section">
                <div class="experience-section">
                    <div class="content-title">
                        Work Experience
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary" id="add-experience">
                                <i class="fas fa-plus"></i> Add
                            </button>
                        </div>
                    </div>

                    <div class="experience-item">
                        <select class="main-form-control" name="Company[]" required>
                            <option value="">Select Company</option>
                            <c:forEach items="${CVDAO.allCompanyName}" var="o">
                                <option value="${CVDAO.getCompanyIdByName(o)}">${o}</option>
                            </c:forEach>
                            <option value="32">Other</option>
                        </select>

                        <div class="form-group">
                            <input type="text" name="otherCompanyName[]" placeholder="Other Company Name"
                                   class="main-form-control other-company-input" style="display: none;">
                        </div>

                        <div class="date-group">
                            <input type="date" class="main-form-control" name="companyStartDate[]" required>
                            <input type="date" class="main-form-control" name="companyEndDate[]">
                        </div>
                        <input type="text" class="main-form-control" name="position[]" placeholder="Job Position" required>
                        <input type="text" class="main-form-control" name="description[]" placeholder="Job Description">
                        <textarea class="main-form-control" name="work_achievements[]" placeholder="Achievements"></textarea>
                        <input type="text" class="main-form-control" name="address[]" placeholder="Company Address">
                    </div>
                </div>
            </div>

            <div class="content-section">
                <div class="educations-section">
                    <div class="content-title">
                        Education
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary" id="add-education">
                                <i class="fas fa-plus"></i> Add
                            </button>
                        </div>
                    </div>

                    <div class="education-item">
                        <select class="main-form-control" name="schoolId[]">
                            <option value="">Select Institution</option>
                            <c:forEach items="${CVDAO.allSchoolNames}" var="o">
                                <option value="${CVDAO.getSchoolIdByName(o)}">${o}</option>
                            </c:forEach>
                        </select>

                        <div class="form-group">
                            <input type="text" name="otherSchoolName[]" placeholder="Other Institution Name"
                                   class="main-form-control other-school-input" style="display: none;">
                        </div>

                        <div class="date-group">
                            <input type="date" class="main-form-control" name="educationStartDate[]">
                            <input type="date" class="main-form-control" name="educationEndDate[]">
                        </div>
                        <input type="text" class="main-form-control" name="major[]" placeholder="Major">
                        <input type="text" class="main-form-control" name="degree[]" placeholder="Degree">
                        <textarea class="main-form-control" name="school_Description[]" placeholder="Additional Information"></textarea>
                    </div>
                </div>
            </div>

            <div class="content-section">
                <div class="certification-section">
                    <div class="content-title">
                        Certification
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary" id="add-certification">
                                <i class="fas fa-plus"></i> Add
                            </button>
                        </div>
                    </div>

                    <div class="certification-item">
                        <select class="main-form-control" name="certificationId[]">
                            <option value="">Select Certification</option>
                            <c:forEach items="${CVDAO.allCertificationNames}" var="o">
                                <option value="${CVDAO.getCertificationIdByName(o)}">${o}</option>
                            </c:forEach>
                        </select>

                        <div class="form-group">
                            <input type="text" name="otherCertificationName[]" placeholder="Other Certification Name"
                                   class="main-form-control other-certification-input" style="display: none;">
                        </div>

                        <div class="date-group">
                            <input type="date" class="main-form-control" name="awardYear[]">
                        </div>
                        <textarea class="main-form-control" name="prizeDescription[]" placeholder="Certification Information"></textarea>
                    </div>

                </div>

            </div>

            <button type="submit" class="submit-btn">
                <i class="fas fa-download"></i> Download CV
            </button>

        </div>
    </div>
</form>
<%@include file="./includes/gpt_sidebar.jsp" %>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Avatar Upload Preview
        const avatarUpload = document.getElementById('avatar_cv');
        const avatarPreview = document.getElementById('avatar-preview');

        avatarUpload.addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(event) {
                    avatarPreview.src = event.target.result;
                };
                reader.readAsDataURL(file);
            }
        });

        // Add Experience Section
        const addExperienceBtn = document.getElementById('add-experience');
        const experienceContainer = document.querySelector('.experience-section');

        addExperienceBtn.addEventListener('click', function() {
            const newExperience = document.createElement('div');
            newExperience.classList.add('experience-item');
            newExperience.innerHTML = `
        <select class="main-form-control" name="Company[]" required>
          <option value="">Select Company</option>
          <c:forEach items="${CVDAO.allCompanyName}" var="o">
            <option value="${CVDAO.getCompanyIdByName(o)}">${o}</option>
          </c:forEach>
          <option value="32">Other</option>
        </select>

        <div class="form-group">
          <input type="text" name="otherCompanyName[]" placeholder="Other Company Name"
                 class="main-form-control other-company-input" style="display: none;">
        </div>

        <div class="date-group">
          <input type="date" class="main-form-control" name="companyStartDate[]" required>
          <input type="date" class="main-form-control" name="companyEndDate[]">
        </div>
        <input type="text" class="main-form-control" name="position[]" placeholder="Job Position" required>
        <input type="text" class="main-form-control" name="description[]" placeholder="Job Description">
        <textarea class="main-form-control" name="work_achievements[]" placeholder="Achievements"></textarea>
        <input type="text" class="main-form-control" name="address[]" placeholder="Company Address">
        <div class="text-right" style="margin-top: 10px;">
          <button type="button" class="btn btn-danger remove-experience">
            <i class="fas fa-trash"></i> Remove
          </button>
        </div>
      `;

            experienceContainer.appendChild(newExperience);
        });

        // Remove Experience
        experienceContainer.addEventListener('click', function(e) {
            if (e.target.classList.contains('remove-experience')) {
                e.target.closest('.experience-item').remove();
            }
        });

        // Add Education Section
        const addEducationBtn = document.getElementById('add-education');
        const educationContainer = document.querySelector('.educations-section');

        addEducationBtn.addEventListener('click', function() {
            const newEducation = document.createElement('div');
            newEducation.classList.add('education-item');
            newEducation.innerHTML = `
        <select class="main-form-control" name="schoolId[]">
          <option value="">Select Institution</option>
          <c:forEach items="${CVDAO.allSchoolNames}" var="o">
            <option value="${CVDAO.getSchoolIdByName(o)}">${o}</option>
          </c:forEach>
        </select>

        <div class="form-group">
          <input type="text" name="otherSchoolName[]" placeholder="Other Institution Name"
                 class="main-form-control other-school-input" style="display: none;">
        </div>

        <div class="date-group">
          <input type="date" class="main-form-control" name="educationStartDate[]">
          <input type="date" class="main-form-control" name="educationEndDate[]">
        </div>
        <input type="text" class="main-form-control" name="major[]" placeholder="Major">
        <input type="text" class="main-form-control" name="degree[]" placeholder="Degree">
        <textarea class="main-form-control" name="school_Description[]" placeholder="Additional Information"></textarea>
        <div class="text-right" style="margin-top: 10px;">
          <button type="button" class="btn btn-danger remove-education">
            <i class="fas fa-trash"></i> Remove
          </button>
        </div>
      `;

            educationContainer.appendChild(newEducation);
        });

        // Remove Education
        educationContainer.addEventListener('click', function(e) {
            if (e.target.classList.contains('remove-education')) {
                e.target.closest('.education-item').remove();
            }
        });

        // Add Certification Section
        const addCertificationBtn = document.getElementById('add-certification');
        const certificationContainer = document.querySelector('.certification-section');

        addCertificationBtn.addEventListener('click', function() {
            const newCertification = document.createElement('div');
            newCertification.classList.add('certification-item');
            newCertification.innerHTML = `
        <select class="main-form-control" name="certificationId[]">
          <option value="">Select Certification</option>
          <c:forEach items="${CVDAO.allCertificationNames}" var="o">
            <option value="${CVDAO.getCertificationIdByName(o)}">${o}</option>
          </c:forEach>
        </select>

        <div class="form-group">
          <input type="text" name="otherCertificationName[]" placeholder="Other Certification Name"
                 class="main-form-control other-certification-input" style="display: none;">
        </div>

        <div class="date-group">
          <input type="date" class="main-form-control" name="awardYear[]">
        </div>
        <textarea class="main-form-control" name="prizeDescription[]" placeholder="Certification Information"></textarea>
        <div class="text-right" style="margin-top: 10px;">
          <button type="button" class="btn btn-danger remove-certification">
            <i class="fas fa-trash"></i> Remove
          </button>
        </div>
      `;

            certificationContainer.appendChild(newCertification);
        });

        // Remove Certification
        certificationContainer.addEventListener('click', function(e) {
            if (e.target.classList.contains('remove-certification')) {
                e.target.closest('.certification-item').remove();
            }
        });

        // Add Skill Section
        const addSkillBtn = document.getElementById('add-skill');
        const skillsContainer = document.querySelector('.skills-section');

        addSkillBtn.addEventListener('click', function() {
            const newSkill = document.createElement('div');
            newSkill.classList.add('skill-item');
            newSkill.style.marginTop = '15px';
            newSkill.innerHTML = `
        <select class="form-control" name="mainSkillId[]" required style="margin-bottom: 10px;">
          <option value="">Select Skill Category</option>
          <c:forEach items="${CVDAO.allMainSkill}" var="o">
            <option value="${o.mainSkillId}">${o.mainSkillName}</option>
          </c:forEach>
        </select>

        <select class="form-control" name="skillId[]" required style="margin-bottom: 10px;">
          <option value="">Select Skill</option>
          <c:forEach items="${CVDAO.allMainSkill}" var="o">
            <optgroup label="${o.mainSkillName}">
              <c:forEach items="${CVDAO.getSkillByMainSkill(o.mainSkillId)}" var="h">
                <option value="${h.skillId}" data-mainskill="${o.mainSkillId}">${h.skillName}</option>
              </c:forEach>
            </optgroup>
          </c:forEach>
          <option value="31">Other</option>
        </select>

        <div class="form-group">
          <input type="text" name="otherSkillName[]" placeholder="Other Skill Name"
                 class="form-control other-skill-input" style="display: none;">
        </div>

        <select class="form-control" name="levelSkill[]" required>
          <option value="">Select Proficiency</option>
          <% for (int i = 1; i <= 100; i++) { %>
          <option value="<%= i %>"><%= i %>%</option>
          <% } %>
        </select>

        <div class="text-right" style="margin-top: 10px;">
          <button type="button" class="btn btn-danger remove-skill">
            <i class="fas fa-trash"></i> Remove
          </button>
        </div>
      `;

            skillsContainer.appendChild(newSkill);
        });

        // Remove Skill
        skillsContainer.addEventListener('click', function(e) {
            if (e.target.classList.contains('remove-skill')) {
                e.target.closest('.skill-item').remove();
            }
        });

        // Show "Other" input fields when "Other" is selected
        document.addEventListener('change', function(e) {
            // For skills
            if (e.target && e.target.name === 'skillId[]') {
                const skillItem = e.target.closest('.skill-item');
                const otherInput = skillItem.querySelector('.other-skill-input');
                if (e.target.value === "31") {
                    otherInput.style.display = 'block';
                    otherInput.required = true;
                } else {
                    otherInput.style.display = 'none';
                    otherInput.required = false;
                    otherInput.value = '';
                }
            }

            // For companies
            if (e.target && e.target.name === 'Company[]') {
                const experienceItem = e.target.closest('.experience-item');
                const otherInput = experienceItem.querySelector('.other-company-input');
                if (e.target.value === "32") {
                    otherInput.style.display = 'block';
                    otherInput.required = true;
                } else {
                    otherInput.style.display = 'none';
                    otherInput.required = false;
                    otherInput.value = '';
                }
            }

            // For schools
            if (e.target && e.target.name === 'schoolId[]') {
                const educationItem = e.target.closest('.education-item');
                const otherInput = educationItem.querySelector('.other-school-input');
                if (e.target.value === "") {
                    otherInput.style.display = 'block';
                    otherInput.required = true;
                } else {
                    otherInput.style.display = 'none';
                    otherInput.required = false;
                    otherInput.value = '';
                }
            }

            // For certifications
            if (e.target && e.target.name === 'certificationId[]') {
                const certificationItem = e.target.closest('.certification-item');
                const otherInput = certificationItem.querySelector('.other-certification-input');
                if (e.target.value === "") {
                    otherInput.style.display = 'block';
                    otherInput.required = true;
                } else {
                    otherInput.style.display = 'none';
                    otherInput.required = false;
                    otherInput.value = '';
                }
            }
        });
    });
</script>
</body>
</html>