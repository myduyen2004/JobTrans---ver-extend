<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jobtrans.model.CV" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <jsp:useBean id="CvDAO" class="jobtrans.dal.CvDAO" scope="session"></jsp:useBean>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">
    <title>Quản lí Công việc [Tên công việc] - JobTrans</title>
    <meta name='robots' content='max-image-preview:large'/>
    <link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background-color: #f5f7fb;
        }

        /* Main layout containers */
        .main-container {
            display: flex;
            min-height: 100vh;
        }

        .content-wrapper {
            display: flex;
            width: 100%;
            padding: 20px;
        }

        .cv-container {
            flex: 1;
            padding: 20px;
        }

        /* CV Box Styling */
        .cv_box {
            display: flex;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
            overflow: hidden;
            max-width: 1000px;
            margin: 0 auto;
            min-height: 1000px;
        }

        /* Sidebar (Left Section) */
        .cv_header {
            width: 320px;
            background: #5D7B6F;
            color: white;
            padding: 40px 25px;
            position: relative;
        }

        .cv_picture_avatar {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            overflow: hidden;
            border: 5px solid rgba(255, 255, 255, 0.8);
            margin: 0 auto 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .cv_picture_avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Contact Section */
        .cv_header h2 {
            font-family: 'Poppins', sans-serif;
            font-size: 22px;
            font-weight: 600;
            margin: 30px 0 15px;
            color: #EAE7D6;
            padding-bottom: 8px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            text-align: left;
        }

        .info-card {
            padding-left: 0;
            margin-bottom: 30px;
        }

        .info-item {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
        }

        .info-item i {
            width: 25px;
            font-size: 14px;
            color: #EAE7D6;
            margin-right: 10px;
        }

        .info-text {
            font-size: 15px;
            line-height: 1.4;
        }

        /* Skills Section */
        .skills-container {
            margin-bottom: 20px;
        }

        .skill {
            margin-bottom: 12px;
        }

        .skill-name {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
            font-size: 15px;
        }

        .progress-bar {
            height: 8px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 4px;
            overflow: hidden;
        }

        .progress {
            height: 100%;
            background: #EAE7D6;
        }

        .more_infor {
            margin-top: 30px;
        }

        .more_infor h2 {
            font-size: 22px;
            margin-bottom: 15px;
        }

        .infor {
            font-size: 15px;
            line-height: 1.6;
            color: rgba(255, 255, 255, 0.9);
        }

        /* Main Content (Right Section) */
        .cv_body {
            flex: 1;
            padding: 40px;
            color: #333;
        }

        .main-infor h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 32px;
            font-weight: 700;
            color: #333;
            margin-bottom: 5px;
        }

        .title {
            font-size: 18px;
            color: #5D7B6F;
            font-weight: 500;
            margin-bottom: 30px;
        }

        .cv_body h2 {
            font-family: 'Poppins', sans-serif;
            font-size: 22px;
            font-weight: 600;
            color: #333;
            margin: 30px 0 15px;
            display: flex;
            align-items: center;
        }

        .cv_body h2::before {
            content: "";
            display: inline-block;
            width: 6px;
            height: 22px;
            background-color: #5D7B6F;
            margin-right: 10px;
            border-radius: 3px;
        }

        .cv_body hr {
            height: 1px;
            background: #e0e0e0;
            border: none;
            margin: 10px 0 20px;
        }

        /* Education Section */
        .education, .company, .chung_chi {
            margin-bottom: 30px;
        }

        .school, .name_conpany, .name_cc {
            font-weight: 600;
            font-size: 18px;
            color: #333;
            margin-top: 20px;
        }

        .date {
            font-size: 14px;
            color: #666;
            font-style: italic;
            margin: 5px 0;
        }

        .timeline {
            position: relative;
            padding-left: 20px;
            margin-bottom: 20px;
        }

        .timeline::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 2px;
            height: 100%;
            background-color: #e0e0e0;
        }

        .content {
            font-weight: 500;
            font-size: 16px;
            color: #5D7B6F;

        }


        .timeline ul {
            list-style-type: none;
            padding-left: 20px;
        }

        .timeline ul li {
            position: relative;
            margin-bottom: 10px;
            line-height: 1.6;
        }

        .timeline ul li::before {
            content: "•";
            position: absolute;
            left: -20px;
            color: #5D7B6F;
        }

        /* Responsive adjustments */
        @media (max-width: 992px) {
            .cv_box {
                flex-direction: column;
                max-width: 700px;
            }

            .cv_header {
                width: 100%;
                padding: 30px;
            }

            .cv_picture_avatar {
                width: 150px;
                height: 150px;
            }
        }

        @media (max-width: 576px) {
            .content-wrapper {
                flex-direction: column;
            }

            .cv_body {
                padding: 30px 20px;
            }

            .main-infor h1 {
                font-size: 26px;
            }
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

<body class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">

<%@include file="includes/header-01.jsp" %>

<div class="py-4 banner_title">
    <h1 class="text-white font-weight-bold" style="padding-left: 50px;">Danh sách công việc</h1>
</div>
<%@include file="./includes/sidebar.jsp" %>

<div class="main-container">
    <div class="content-wrapper">
        <div class="cv-container">
            <div class="cv_box">
                <div class="cv_header">
                    <div class="cv_picture_avatar">
                        <img src="${CV.avatarCv}" alt="Avatar">
                    </div>
                    <h2>Liên hệ</h2>

                    <div class="info-card">
                        <div class="info-item">
                            <i class="fas fa-venus-mars"></i>
                            <span class="info-text">${CV.sex}</span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-birthday-cake"></i>
                            <span class="info-text">${CV.dateOfBirth}</span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-envelope"></i>
                            <span class="info-text">${CV.email}</span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-phone"></i>
                            <span class="info-text">${CV.sdt}</span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-map-marker-alt"></i>
                            <span class="info-text">${CV.address}</span>
                        </div>
                    </div>

                    <c:forEach items="${CV.skillList}" var="o">
                        <div class="skills-container">
                            <h2>${CvDAO.getMainSkillByMainSkillId(o.mainSkillId)}</h2>
                            <div class="skill">
                                <c:if test="${o.skillId != 1}">
                                    <div class="skill-name">${CvDAO.getSkillBySkillId(o.skillId)}</div>
                                </c:if>
                                <c:if test="${o.skillId == 1}">
                                    <div class="skill-name">${o.skillCustom}</div>
                                </c:if>
                                <div class="progress-bar">
                                    <div class="progress" style="width: ${o.levelSkill}%;"></div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="more_infor">
                        <h2>Thông tin bổ sung</h2>
                        <p class="infor">${CV.moreInfo}</p>
                    </div>
                </div>

                <div class="cv_body">
                    <div class="main-infor">
                        <h1>${CV.cvName}</h1>
                        <p class="title">${CV.jobPosition}</p>
                    </div>

                    <div class="career-goal">
                        <h2>Mục tiêu nghề nghiệp</h2>
                        <hr>
                        <div>
                            <p>${CV.summary}</p>
                        </div>
                    </div>

                    <div class="education">
                        <h2>Học vấn</h2>
                        <hr>
                        <c:forEach items="${CV.educationList}" var="o">
                            <div>
                                <c:if test="${o.educationId == 504}">
                                    <div class="school">${o.customSchool}</div>
                                </c:if>
                                <c:if test="${o.educationId != 504}">
                                    <div class="school">${CvDAO.getSchoolNameById(o.educationId)}</div>
                                </c:if>
                                <div class="date">${o.startDate} - ${o.endDate}</div>
                            </div>
                            <div class="timeline">
                                <div>
                                    <div class="content">Chuyên ngành ${o.fieldOfStudy}</div>
                                    <ul>
                                        <li>Bằng cấp: ${o.degree}</li>
                                        <li>${o.moreInfor}</li>
                                    </ul>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="company">
                        <h2>Kinh nghiệm làm việc</h2>
                        <hr>
                        <c:forEach items="${CV.experienceList}" var="o">
                            <div>
                                <c:if test="${o.experienceId != 1}">
                                    <div class="name_conpany">${CvDAO.getCompanyNameById(o.experienceId)}</div>
                                </c:if>
                                <c:if test="${o.experienceId == 1}">
                                    <div class="name_conpany">${o.customCompany}</div>
                                </c:if>
                                <div class="date">${o.startAt} - ${o.endAt}</div>
                            </div>
                            <div class="timeline">
                                <div>
                                    <div class="content">${o.jobPosition}</div>
                                    <ul>
                                        <li>Thông tin chi tiết: ${o.description}</li>
                                        <li>Thành tựu: ${o.achievement}</li>
                                        <li>Địa chỉ: ${o.address}</li>
                                    </ul>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="chung_chi">
                        <h2>Chứng chỉ & giải thưởng</h2>
                        <hr>
                        <c:forEach items="${CV.certificationList}" var="o">
                            <div>
                                <c:if test="${o.certificationId != 1}">
                                    <div class="name_cc">${CvDAO.getCertificationNameById(o.certificationId)}</div>
                                </c:if>
                                <c:if test="${o.certificationId == 1}">
                                    <div class="name_cc">${o.customCertification}</div>
                                </c:if>
                                <div class="date">${o.awardYear}</div>
                            </div>
                            <div class="timeline">
                                <div>
                                    <ul>
                                        <li>Thông tin về cuộc thi: ${o.description}</li>
                                    </ul>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <%--        <div style="margin-right: 20px">--%>
        <%--            <%@include file="includes/sidebar_cv.jsp" %>--%>
        <%--        </div>--%>
    </div>
</div>

<%@include file="includes/footer.jsp" %>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

</body>
</html>