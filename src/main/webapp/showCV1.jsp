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
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Thêm CSS để căn chỉnh layout */
        .main-container {
            display: flex;
            min-height: 100vh;
        }

        .content-wrapper {
            display: flex;
            width: 100%;
        }

        .cv-container {
            flex: 1;
            padding: 20px;
            /* Điều chỉnh theo width sidebar */
        }

        .cv_box {
            display: flex;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            max-width: 1200px;
            margin: 0 auto;
            width: 4000px;
        }

        .cv_header {
            width: 300px;
            background: #5D7B6F;
            color: white;
            padding: 30px 20px;
        }

        .cv_body {
            flex: 1;
            padding: 30px;
        }

        .cv_picture_avatar {
            width: 230px;
            height: 230px;
            border-radius: 50%;
            overflow: hidden;
            border: 4px solid white;
            margin-left: 67px;

        }

        .cv_picture_avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Các style khác giữ nguyên hoặc điều chỉnh theo nhu cầu */
    </style>
</head>

<body class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">

<!-- Preloading -->


<%@include file="includes/header-01.jsp" %>



<div class="main-container">
<%--    <%@include file="./includes/sidebar.jsp" %>--%>

    <div class="content-wrapper">
        <div class="cv-container">
            <div style="margin-left: 60px; margin-top: 0px" class="cv_box">
                <div style="background-color: #5D7B6F; width: 820px;" class="cv_header">
                    <div class="cv_picture_avatar">
                        <img src="${CV.avatarCv}" alt="Avatar">
                    </div>
                    <h2 style="margin-top: 35px; color: white; font-size: 22px; margin-left: 11%;">Liên hệ</h2>

                    <div style="width: 350px ; margin-left: 15px" class="info-card">
                        <div class="info-item">
                            <i class="fas fa-venus"></i>
                            <span class="info-text">${CV.sex}</span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-calendar"></i>
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
                            <h2 style="margin-top: 20px; color: white; font-size: 19px; margin-left: 12%;">
                                    ${CvDAO.getMainSkillByMainSkillId(o.mainSkillId)}
                            </h2>
                            <div  class="skill">
                                <c:if test="${o.skillId != 31}">
                                    <div class="skill-name">${CvDAO.getSkillBySkillId(o.skillId)}</div>
                                </c:if>
                                <c:if test="${o.skillId == 31}">
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
                        <div style="margin-left: 30px">
                            <p>${CV.summary}</p>
                        </div>
                    </div>
                    <div class="education">
                        <h2>Học vấn</h2>
                        <hr>
                        <div style="margin-left: 30px">
                            <c:forEach items="${CV.educationList}" var="o">


                                <div>
                                    <c:if test="${o.educationId == 95}">
                                        <div class="school">${o.customSchool}</div>
                                    </c:if>
                                    <c:if test="${o.educationId != 95}">
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
                    </div>
                    <div class="company">
                        <h2>Kinh nghiệm làm việc</h2>
                        <div style="margin-left: 30px">
                            <c:forEach items="${CV.experienceList}" var="o">

                                <hr>
                                <div>
                                    <c:if test="${o.experienceId != 32}">
                                        <div class="name_conpany"> ${CvDAO.getCompanyNameById(o.experienceId)}</div>
                                    </c:if>
                                    <c:if test="${o.experienceId == 32}">
                                        <br>
                                        <div class="name_conpany">Chuyên ngành ${o.customCompany}</div>
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
                    </div>
                    <div class="chung_chi">
                        <h2>Chứng chỉ & giải thưởng</h2>
                        <div style="margin-left: 30px">
                            <c:forEach items="${CV.certificationList}" var="o">

                                <hr>
                                <div>
                                    <c:if test="${o.certificationId != 35}">
                                        <div class="name_cc">${CvDAO.getCertificationNameById(o.certificationId)}</div>
                                    </c:if>
                                    <c:if test="${o.certificationId == 35}">
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
        </div>
        <div style="margin-right: 20px">
        <%@include file="includes/sidebar_cv.jsp" %>
        </div>

    </div>
</div>

<%@include file="includes/footer.jsp" %>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

</body>
</html>
