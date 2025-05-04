<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jobtrans.model.CV" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <jsp:useBean id="CvDAO" class="jobtrans.dal.CvDAO" scope="session"></jsp:useBean>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Xem CV - JobTrans</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
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

        .main-container {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
        }

        .content-wrapper {
            display: flex;
            width: 100%;
            padding: 20px;
            margin-top: 80px;
        }

        .cv-container {
            flex: 1;
            margin-bottom: 30px;
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
        }

        /* CV Box Styling */
        .cv-box {
            display: flex;
            background: white;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
            overflow: hidden;
            max-width: 1000px;
            margin: 0 auto;
            min-height: 1000px;
            border: 1px solid black;
        }

        /* Sidebar (Left Section) */
        .cv-sidebar {
            width: 250px;
            background:${CV.backroundColor};

            padding: 30px 20px;
            height: 250px;
            border-radius: 20px;
            margin: 30px;
        }

        .cv-avatar {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            overflow: hidden;
            border: 4px solid white;
            margin: 0 auto 25px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .cv-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Contact Section */
        .cv-sidebar h2 {
            font-family: 'Poppins', sans-serif;
            font-size: 18px;
            font-weight: 600;
            margin: 25px 0 15px;
            color: #4a6fa5;
            padding-bottom: 8px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .contact-info p {
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            font-size: 14px;
        }

        .contact-info i {
            width: 20px;
            margin-right: 10px;
            color: #4a6fa5;
        }

        /* Skills Section */
        .skills-container {
            margin-bottom: 20px;
        }

        .skill-item {
            margin-bottom: 12px;
        }

        .skill-name {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
            font-size: 14px;
        }

        .skill-bar {
            height: 8px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 4px;
            overflow: hidden;
        }

        .skill-level {
            height: 100%;
            background: #0b1638;
            border-radius: 4px;
        }

        .additional-info {
            font-size: 14px;
            line-height: 1.5;
            color: #EAE7D6;
        }

        /* Main Content (Right Section) */
        .cv-main {
            flex: 1;
            padding: 30px;
            background-color: white;
        }

        .name-title {
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 2px solid #4a6fa5;
        }

        .full-name {
            font-size: 28px;
            font-weight: 700;
            color: #2d3436;
            margin-bottom: 5px;
            letter-spacing: 0.5px;
        }

        .position {
            font-size: 18px;
            color: #4a6fa5;
            font-weight: 500;
        }

        .main-section-title {
            font-family: 'Poppins', sans-serif;
            font-size: 20px;
            font-weight: 600;
            margin: 20px 0;
            color: #4a6fa5;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .section-divider {
            height: 1px;
            background: #dfe6e9;
            margin: 15px 0;
        }

        .experience-item, .education-item, .certification-item {
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px dashed #dfe6e9;
        }

        .item-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }

        .item-title {
            font-weight: 600;
            color: #2d3436;
            font-size: 16px;
        }

        .item-period {
            color: #636e72;
            font-size: 14px;
            font-weight: 500;
        }

        .item-subtitle {
            color: #636e72;
            font-style: italic;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .item-description {
            color: #2d3436;
            line-height: 1.5;
            font-size: 14px;
        }

        .item-achievements {
            margin-top: 8px;
            padding: 8px 12px;
            background-color: #e8f0fe;
            border-radius: 6px;
            font-size: 14px;
        }

        .item-achievements strong {
            color: #4a6fa5;
        }

        .skill-group {
            margin-bottom: 15px;

        }

        .skill-group h3 {
            font-size: 16px;
            margin-bottom: 8px;

            font-weight: 500;
            color: #4a6fa5;
        }

        /* Action buttons */
        .action-buttons {
            display: flex;
            margin-left: 242px;
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
<body>

<%@include file="includes/header-01.jsp" %>

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

            <div class="cv-box">
                <!-- Left Sidebar -->
                <div class="cv-sidebar">
                    <div class="cv-avatar">
                        <img src="${CV.avatarCv}" alt="Profile Photo">
                    </div>

                    <h2 style="margin-top: 80px">Liên hệ</h2>
                    <div class="contact-info">
                        <p><i class="fas fa-venus-mars"></i> ${CV.sex}</p>
                        <p><i class="fas fa-birthday-cake"></i> ${CV.dateOfBirth}</p>
                        <p><i class="fas fa-phone"></i> ${CV.sdt}</p>
                        <p><i class="fas fa-envelope"></i> ${CV.email}</p>
                        <p><i class="fas fa-map-marker-alt"></i> ${CV.address}</p>
                    </div>

                    <h2>Kỹ Năng</h2>
                    <div class="skills-container">
                        <c:forEach items="${CV.skillList}" var="o">
                            <div class="skill-group">
                                <h3>${CvDAO.getMainSkillByMainSkillId(o.mainSkillId)}</h3>
                                <div class="skill-item">
                                    <div class="skill-name">
                                        <span>
                                            <c:choose>
                                                <c:when test="${o.skillId == 1}">${o.skillCustom}</c:when>
                                                <c:otherwise>${CvDAO.getSkillBySkillId(o.skillId)}</c:otherwise>
                                            </c:choose>
                                        </span>
                                        <span>${o.levelSkill}%</span>
                                    </div>
                                    <div class="skill-bar">
                                        <div class="skill-level" style="width: ${o.levelSkill}%"></div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <h2>Thông tin bổ sung</h2>
                    <div class="additional-info">
                        <p style="color: #4a5568">${CV.moreInfo}</p>
                    </div>
                </div>

                <!-- Main CV Content -->
                <div class="cv-main">
                    <div class="name-title">
                        <h1 class="full-name">${CV.cvName}</h1>
                        <div class="position">${CV.jobPosition}</div>
                    </div>

                    <h3 class="main-section-title">Mục tiêu nghề nghiệp</h3>
                    <div class="section-divider"></div>
                    <p class="item-description">${CV.summary}</p>

                    <h3 class="main-section-title">Kinh nghiệm làm việc</h3>
                    <div class="section-divider"></div>

                    <c:forEach items="${CV.experienceList}" var="o">
                        <div class="experience-item">
                            <div class="item-header">
                                <div class="item-title">
                                    <c:choose>
                                        <c:when test="${o.experienceId == 1}">${o.customCompany}</c:when>
                                        <c:otherwise>${CvDAO.getCompanyNameById(o.experienceId)}</c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="item-period">${o.startAt} - ${o.endAt}</div>
                            </div>
                            <div class="item-subtitle">${o.jobPosition} | ${o.address}</div>
                            <div class="item-description">
                                    ${o.description}
                                <ul style="margin-top: 8px; padding-left: 20px;">
                                    <li>Thành tích: ${o.achievement}</li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>

                    <h3 class="main-section-title">Học vấn</h3>
                    <div class="section-divider"></div>

                    <c:forEach items="${CV.educationList}" var="o">
                        <div class="education-item">
                            <div class="item-header">
                                <div class="item-title">
                                    <c:choose>
                                        <c:when test="${o.educationId == 1}">${o.customSchool}</c:when>
                                        <c:otherwise>${CvDAO.getSchoolNameById(o.educationId)}</c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="item-period">${o.startDate} - ${o.endDate}</div>
                            </div>
                            <div class="item-subtitle">Chuyên ngành: ${o.fieldOfStudy}</div>
                            <div class="item-description">
                                Bằng cấp: ${o.degree}
                                <ul style="margin-top: 8px; padding-left: 20px;">
                                    <li>${o.moreInfor}</li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>

                    <h3 class="main-section-title">Chứng chỉ & giải thưởng</h3>
                    <div class="section-divider"></div>

                    <c:forEach items="${CV.certificationList}" var="o">
                        <div class="certification-item">
                            <div class="item-header">
                                <div class="item-title">
                                    <c:choose>
                                        <c:when test="${o.certificationId == 1}">${o.customCertification}</c:when>
                                        <c:otherwise>${CvDAO.getCertificationNameById(o.certificationId)}</c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="item-period">${o.awardYear}</div>
                            </div>
                            <div class="item-description">
                                    ${o.description}
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>

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
            const element = document.querySelector('.cv-box');
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