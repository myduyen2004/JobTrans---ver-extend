<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jobtrans.model.CV" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:useBean id="CvDAO" class="jobtrans.dal.CvDAO" scope="session"></jsp:useBean>
  <meta charset="UTF-8">
  <title>Xem CV - Mẫu 3</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&family=Roboto:wght@300;400;500;700&display=swap"
        rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
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

    body {
      background-color: #f5f7fb;
      padding: 30px;
    }

    .cv-container {
      max-width: 1000px;
      margin: 30px auto;
      background: white;
      box-shadow: var(--shadow);
      margin-bottom: 30px;
      overflow: hidden;
      display: flex;
      border-radius: 20px;
    }

    .cv-sidebar {
      width: 300px;
      background: ${CV.backroundColor};
      color: white;
      padding: 30px 20px;
      border-top-left-radius: 20px;
      border-bottom-left-radius: 20px;
      margin-top: 20px;
      margin-left: 30px;
      height: 250px;
    }

    .cv-main {
      flex: 1;
      padding: 30px;
      border-top-right-radius: 20px;
      border-bottom-right-radius: 20px;
    }

    .profile-img {
      width: 180px;
      height: 180px;
      border-radius: 50%;
      border: 4px solid white;
      margin: 0 auto 25px;
      display: block;
      object-fit: cover;
    }

    .section-title {
      font-family: 'Poppins', sans-serif;
      font-size: 18px;
      font-weight: 600;
      margin: 25px 0 15px;
      color: #8492a6;
      padding-bottom: 8px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    }

    .main-section-title {
      font-family: 'Poppins', sans-serif;
      font-size: 20px;
      font-weight: 600;
      margin: 20px 0;
      color: #8492a6;
    }

    .section-divider {
      height: 1px;
      background: var(--border);
      margin: 15px 0;
    }

    .contact-info p {
      margin-bottom: 8px;
      display: flex;
      align-items: center;
      color: black;
    }

    .contact-info i {
      width: 20px;
      margin-right: 10px;
      color: #8492a6;
    }

    .skill-item {
      margin-bottom: 12px;
      color: black;
    }

    .skill-name {
      display: flex;
      justify-content: space-between;
      margin-bottom: 5px;
      color: black;
    }

    .skill-bar {
      height: 8px;
      background: rgba(255, 255, 255, 0.2);
      border-radius: 4px;
      overflow: hidden;
    }

    .skill-level {
      height: 100%;
      background: white;
    }

    .main-info {
      background-color: #8492a6;
      height: 250px;
      margin: -30px;
      margin-top: -10px;
      margin-right: -0px;
      border-top-right-radius: 20px;
      border-bottom-right-radius: 20px;
      padding: 60px 100px;
    }

    .full-name {
      font-size: 50px;
      font-weight: 700;
      color: white;
      margin-bottom: 5px;
      margin-top: 15px;
    }

    .position {
      font-size: 18px;
      color: white;
      font-weight: 500;
    }

    .experience-item, .education-item, .certification-item {
      margin-bottom: 20px;
    }

    .item-header {
      display: flex;
      justify-content: space-between;
      margin-bottom: 5px;
    }

    .item-title {
      font-weight: 600;
      color: var(--dark);
    }

    .item-period {
      color: var(--gray);
      font-size: 14px;
    }

    .item-subtitle {
      color: var(--gray);
      font-style: italic;
      margin-bottom: 8px;
    }

    .item-description {
      color: var(--dark);
      line-height: 1.5;
    }

    .item-achievements {
      margin-top: 8px;
      padding: 8px;
      background-color: var(--primary-light);
      border-radius: var(--radius);
    }

    .contact-box {
      margin-top: 80px;
      border: 1px solid #0a0a2b;
      border-radius: 20px;
      padding: 30px;
      margin-left: -19px;
    }

    .skill-box {
      border-radius: 20px;
      margin-top: 40px;
      padding: 30px;
      border: 1px #0a0a2b solid;
      margin-left: -19px;
    }

    .extra-info-box {
      border-radius: 20px;
      margin-top: 40px;
      padding: 30px;
      border: 1px #0a0a2b solid;
      margin-left: -19px;
    }

    .section-box {
      border-radius: 20px;
      margin-top: 10px;
      padding: 10px;
      border: 1px solid;
    }

    .action-buttons {
      display: flex;
      margin-left: 230px;
      gap: 15px;
      margin-bottom: 20px;
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

    @media (max-width: 992px) {
      .cv-container {
        flex-direction: column;
      }

      .cv-sidebar {
        width: 100%;
        margin-left: 0;
        border-radius: 0;
      }
    }

    @media (max-width: 768px) {
      .main-info {
        padding: 40px 20px;
      }

      .full-name {
        font-size: 36px;
      }

      .position {
        font-size: 16px;
      }

      .action-buttons {
        flex-direction: column;
        align-items: center;
      }
    }
  </style>
</head>
<body>

<%@include file="./includes/header-01.jsp" %>
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
<div class="cv-container">


  <!-- Left Sidebar -->
  <div class="cv-sidebar">
    <img src="${CV.avatarCv}" alt="Profile Photo" class="profile-img">

    <div class="contact-box">
      <h2 class="section-title">Liên hệ</h2>
      <div class="contact-info">
        <p><i class="fas fa-venus-mars"></i> ${CV.sex}</p>
        <p><i class="fas fa-birthday-cake"></i> <fmt:formatDate value="${CV.dateOfBirth}" pattern="dd/MM/yyyy" /></p>
        <p><i class="fas fa-phone"></i> ${CV.sdt}</p>
        <p><i class="fas fa-envelope"></i> ${CV.email}</p>
        <p><i class="fas fa-map-marker-alt"></i> ${CV.address}</p>
      </div>
    </div>

    <div class="skill-box">
      <h2 class="section-title">Kỹ Năng</h2>
      <div class="skills-container">
        <c:forEach items="${CV.skillList}" var="o">
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
        </c:forEach>
      </div>
    </div>

    <div class="extra-info-box">
      <h2 class="section-title">Thông tin bổ sung</h2>
      <p style="line-height: 1.5;color: black">${CV.moreInfo}</p>
    </div>
  </div>

  <!-- Main CV Content -->
  <div class="cv-main">
    <div class="main-info">
      <h1 class="full-name">${CV.cvName}</h1>
      <div class="position">${CV.jobPosition}</div>
    </div>

    <div style="margin-top: 70px" class="section-box">
      <h3 class="main-section-title">Mục tiêu nghề nghiệp</h3>
      <div class="section-divider"></div>
      <p class="item-description">${CV.summary}</p>
    </div>

    <div class="section-box">
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
            <div class="item-period">
              <fmt:formatDate value="${o.startDate}" pattern="MM/yyyy" /> -
              <fmt:formatDate value="${o.endDate}" pattern="MM/yyyy" />
            </div>
          </div>
          <div class="item-subtitle">Chuyên ngành ${o.fieldOfStudy}</div>
          <div class="item-description">
            Bằng cấp: ${o.degree}
          </div>
          <div class="item-achievements">
            <strong>Thông tin thêm:</strong> ${o.moreInfor}
          </div>
        </div>
      </c:forEach>
    </div>

    <div class="section-box">
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
            <div class="item-period">
              <fmt:formatDate value="${o.startAt}" pattern="MM/yyyy" /> -
              <fmt:formatDate value="${o.endAt}" pattern="MM/yyyy" />
            </div>
          </div>
          <div class="item-subtitle">${o.jobPosition}</div>
          <div class="item-description">
              ${o.description}
          </div>
          <div class="item-achievements">
            <strong>Thành tích:</strong> ${o.achievement}
          </div>
          <div class="item-description">
            <strong>Địa chỉ:</strong> ${o.address}
          </div>
        </div>
      </c:forEach>
    </div>

    <div class="section-box">
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
            <div class="item-period">
              <fmt:formatDate value="${o.awardYear}" pattern="yyyy" />
            </div>
          </div>
          <div class="item-description">
              ${o.description}
          </div>
        </div>
      </c:forEach>
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
      const element = document.querySelector('.cv-container');
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