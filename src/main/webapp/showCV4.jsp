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
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&family=Roboto:wght@300;400;500;700&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
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
            margin-bottom: 30px;
            width: 1000px;
            margin-left: 125px;
            margin-top: 15px;
        }

        /* CV Box Styling */
        .cv_box {
            display: flex;
            background: white;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
            overflow: hidden;
            max-width: 1000px;
            margin: 0 auto;
            min-height: 1000px;
        }

        /* Sidebar (Left Section) */
        .cv_header {
            width: 320px;
            background: #7a785c;
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
            border:1px solid #7a785c;
            margin: 20px;
            border-radius: 10px;
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

        .menu-section2 {
            margin-bottom: 24px;
        }

        .menu-item2 {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            margin: 30px 8px;
            border-radius: 8px;
            cursor: pointer;
            transition: var(--transition);
            background: linear-gradient(to right, #152070, #2740b3);
            text-decoration: none;
            white-space: nowrap;
            flex-direction: column;
            border: 1px solid wheat;
            width: 90px;
            height: 90px;


        }
        .menu-text2 {

            font-size: 12px;
            padding-top: 15px;
            font-weight: 500;
            color: white;
            transition: var(--transition);
        }
        .menu-icon{
            color: whitesmoke;
        }
        .action-buttons {
            display: flex;
            margin-left: 180px;
            gap: 15px;
            margin-top: 20px;
            margin-bottom: 30px;
        }

        .action-btn {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            font-weight: 500;
        }

        .download-pdf {
            background: linear-gradient(to right, #152070, #2740b3);
            color: white;
            border: none;
        }

        .download-pdf:hover {
            background: linear-gradient(to right, #2740b3, #152070);
            transform: translateY(-2px);
        }

        .edit-cv {
            background: #4a6fa5;
            color: white;
            border: none;
        }

        .edit-cv:hover {
            background: #3a5a8a;
            transform: translateY(-2px);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .cv-box {
                flex-direction: column;
            }

            .cv-sidebar {
                width: 100%;
                border-radius: 0;
            }

            .item-header {
                flex-direction: column;
            }

            .item-period {
                margin-top: 3px;
            }
        }
    </style>
</head>

<body class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">

<%@include file="includes/header-01.jsp" %>

<h1 class="text-white font-weight-bold" style="padding-left: 50px;">Chỉnh sửa CV</h1>
</div>

<div >



    <div class="main-container">
        <div class="content-wrapper">
            <div class="cv-container">
                <div class="action-buttons">
                    <a href="#" id="downloadPdfBtn" class="action-btn download-pdf">
                        <i class="fas fa-file-pdf" style="margin-right: 8px;"></i>
                        Tải CV dạng PDF
                    </a>
                    <a href="cv?action=load-editing&cvId=${CV.cvId}" class="action-btn edit-cv">
                        <i class="fas fa-edit" style="margin-right: 8px;"></i>
                        Chỉnh sửa CV
                    </a>
                </div>
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
                                    <c:if test="${o.educationId == 1}">
                                        <div class="school">${o.customSchool}</div>
                                    </c:if>
                                    <c:if test="${o.educationId != 1}">
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
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Gắn sự kiện click cho nút download PDF
        const downloadBtn = document.getElementById('downloadPdfBtn');
        if (downloadBtn) {
            downloadBtn.addEventListener('click', function(e) {
                e.preventDefault();
                generatePDF();
            });
        } else {
            console.error('Download PDF button not found');
        }
    });

    function generatePDF() {
        try {
            const element = document.querySelector('.cv_box');
            if (!element) {
                throw new Error('CV content not found');
            }

            // Tạo options cho PDF
            const opt = {
                margin: 10,
                filename: 'my_cv.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: {
                    scale: 2,
                    logging: true,
                    useCORS: true
                },
                jsPDF: {
                    unit: 'mm',
                    format: 'a4',
                    orientation: 'portrait'
                }
            };

            // Hiển thị thông báo loading
            const loading = document.createElement('div');
            loading.style.position = 'fixed';
            loading.style.top = '0';
            loading.style.left = '0';
            loading.style.width = '100%';
            loading.style.height = '100%';
            loading.style.backgroundColor = 'rgba(0,0,0,0.5)';
            loading.style.display = 'flex';
            loading.style.justifyContent = 'center';
            loading.style.alignItems = 'center';
            loading.style.zIndex = '9999';
            loading.innerHTML = '<div style="color: white; font-size: 24px;">Đang tạo PDF...</div>';
            document.body.appendChild(loading);

            // Tạo PDF
            html2pdf()
                .set(opt)
                .from(element)
                .save()
                .then(() => {
                    document.body.removeChild(loading);
                })
                .catch(err => {
                    document.body.removeChild(loading);
                    console.error('Lỗi khi tạo PDF:', err);
                    alert('Không thể tạo PDF. Vui lòng thử lại.');
                });

        } catch (error) {
            console.error('Lỗi trong generatePDF:', error);
            alert('Đã xảy ra lỗi khi tạo PDF: ' + error.message);
        }
    }
</script>

</body>

</html>