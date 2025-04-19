<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_fullwidth by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>
    <jsp:useBean id="CvDAO" class="jobtrans.dal.CvDAO" scope="session"></jsp:useBean>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">

    <title>Quản lí Công việc [Tên công việc] &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large'/>
    <link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

</head>
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

        justify-content: center;
        padding: 40px 0;
    }

    .cv-container {
        width: 1200px;
        display: flex;
        box-shadow: var(--shadow);
        background: white;
        border-radius: var(--radius);
        overflow: hidden;
        position: relative;
        margin-top: 20px;
        margin-left: 10%;
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
        width: 200px;
        height: 200px;
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
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .cv-sidebar > div,
    .cv-content > div {
        animation: fadeIn 0.5s ease-out forwards;
    }

    .cv-sidebar > div:nth-child(1) {
        animation-delay: 0.1s;
    }

    .cv-sidebar > div:nth-child(2) {
        animation-delay: 0.2s;
    }

    .cv-sidebar > div:nth-child(3) {
        animation-delay: 0.3s;
    }

    .cv-content > div:nth-child(1) {
        animation-delay: 0.2s;
    }

    .cv-content > div:nth-child(2) {
        animation-delay: 0.3s;
    }

    .cv-content > div:nth-child(3) {
        animation-delay: 0.4s;
    }

    .cv-content > div:nth-child(4) {
        animation-delay: 0.5s;
    }
</style>
<body class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">

<!-- Preloading -->
<div id="preloader">
    <div class="spinner">
        <div class="uil-ripple-css">
            <div></div>
            <div></div>
        </div>
    </div>
</div>


<%@include file="includes/header-01.jsp" %>


<!--Mobile Navigation Toggler-->


<div style="display: flex">
    <div>
        <div class="cv-container">


            <!-- Left Sidebar -->
            <div class="cv-sidebar">
                <div style="width: 240px; height: 240px" class="avatar-container">
                    <img id="avatar-preview" src="${CV.avatarCv}" alt="">
                </div>

                <h2 class="section-title">Contact Info</h2>

                <div class="form-group">
                    <div class="contact-info"><i class="fas fa-phone"></i> ${CV.sdt}</div>
                </div>
                <div class="form-group">
                    <div class="contact-info"><i class="fas fa-envelope"></i> ${CV.email}</div>
                </div>
                <div class="contact-info">
                    <i class="fas fa-venus"></i>
                    <span>${CV.sex}</span>
                </div>
                <div class="form-group">
                    <div class="contact-info"><i class="fas fa-map-marker-alt"></i> ${CV.address}</div>
                </div>
                <div class="form-group">
                    <div class="contact-info"><i class="fas fa-birthday-cake"></i> <fmt:formatDate
                            value="${CV.dateOfBirth}" pattern="dd/MM/yyyy"/></div>
                </div>


                <h2 class="section-title">Skill</h2>
                <div class="skills-section">
                    <c:forEach items="${CV.skillList}" var="skill">
                        <div style="display: flex" class="skill-item">
                            <div class="skill-name">
                                <c:choose>
                                    <c:when test="${skill.skillId != 31}">
                                        ${CvDAO.getSkillBySkillId(skill.skillId)}
                                    </c:when>
                                    <c:otherwise>
                                        ${skill.skillCustom}
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div style="margin-left: auto" class="skill-proficiency">
                                <div class="proficiency-bar"
                                     style="width: ${skill.levelSkill * 10}%;">${skill.levelSkill}%
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>


                <c:if test="${not empty CV.moreInfo}">
                    <h2 class="section-title">Thông tin thêm</h2>
                    <div class="content-text" style="color: white;">
                        <p>${CV.moreInfo}</p>
                    </div>
                </c:if>
            </div>


            <!-- Main Content -->
            <div class="cv-content">
                <div class="header-section">
                    <h1 class="name">${CV.cvName}</h1>
                    <h2 class="position">${CV.jobPosition}</h2>

                </div>

                <div class="content-section">
                    <div class="content-title">Professional Summary</div>
                    <div class="content-text">
                        <p>${CV.summary}.</p>

                    </div>
                </div>


                <div class="content-section">
                    <div class="content-title">Work Experience</div>
                    <div style="margin-left: 40px">
                        <c:forEach items="${CV.experienceList}" var="exp">
                            <div class="experience-item">
                                <div class="experience-header">
                                    <h3 class="company">
                                        <c:choose>
                                            <c:when test="${exp.experienceId != 32}">
                                                ${CvDAO.getCompanyNameById(exp.experienceId)}
                                            </c:when>
                                            <c:otherwise>
                                                ${exp.customCompany}
                                            </c:otherwise>
                                        </c:choose>
                                    </h3>
                                    <div class="position-date">
                                        <span class="position">${exp.jobPosition}</span>
                                        <span class="date">
                                <fmt:formatDate value="${exp.startAt}" pattern="MM/yyyy"/> -
                                <fmt:formatDate value="${exp.endAt}" pattern="MM/yyyy"/>
                            </span>
                                    </div>
                                </div>
                                <ul class="experience-details">
                                    <c:if test="${not empty exp.description}">
                                        <li>${exp.description}</li>
                                    </c:if>
                                    <c:if test="${not empty exp.achievement}">
                                        <li>Thành tích: ${exp.achievement}</li>
                                    </c:if>
                                    <c:if test="${not empty exp.address}">
                                        <li>Địa điểm: ${exp.address}</li>
                                    </c:if>
                                </ul>
                            </div>
                        </c:forEach>
                    </div>

                </div>

                <div class="content-section">
                    <div class="content-title">Education</div>
                    <div style="margin-left: 40px">
                        <c:forEach items="${CV.educationList}" var="edu">
                            <div class="education-item">
                                <div class="education-header">
                                    <h3 class="institution">

                                        <c:choose>
                                            <c:when test="${edu.educationId != 95}">
                                                ${CvDAO.getSchoolNameById(edu.educationId)}
                                            </c:when>
                                            <c:otherwise>
                                                ${edu.customSchool}
                                            </c:otherwise>
                                        </c:choose>
                                    </h3>
                                    <div class="degree-date">
                                        <span class="degree">${edu.fieldOfStudy} - ${edu.degree}</span>
                                        <span class="date">
                                <fmt:formatDate value="${edu.startDate}" pattern="MM/yyyy"/> -
                                <fmt:formatDate value="${edu.endDate}" pattern="MM/yyyy"/>
                            </span>
                                    </div>
                                </div>
                                <div class="education-details">
                                    <c:if test="${not empty edu.moreInfor}">
                                        <p>${edu.moreInfor}</p>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>

                <div class="content-section">
                    <div class="content-title">Certifications</div>


                    <div style="margin-left: 40px">

                        <c:forEach items="${CV.certificationList}" var="cert">
                            <div class="certification-item">
                                <div class="certification-header">
                                    <h3 class="certification-name">
                                        <c:choose>
                                            <c:when test="${cert.certificationId != 35}">
                                                ${CvDAO.getCertificationNameById(cert.certificationId)}
                                            </c:when>
                                            <c:otherwise>
                                                ${cert.customCertification}
                                            </c:otherwise>
                                        </c:choose>
                                    </h3>
                                    <span class="date">
                                <fmt:formatDate value="${cert.awardYear}" pattern="yyyy"/>
                            </span>
                                </div>
                                <c:if test="${not empty cert.description}">
                                    <div class="education-details">
                                        <p>${cert.description}</p>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>


            </form>

        </div>


    </div>
    <div style="margin-left: 270px">
        <%@include file="includes/sidebar_cv.jsp" %>
    </div>
</div>
</div>


<%@include file="includes/footer.jsp" %>


<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
</body>
</html>