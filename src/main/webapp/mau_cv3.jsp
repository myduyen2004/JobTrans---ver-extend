<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mẫu CV 3</title>
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
            background: #8492a6;
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

        /* Thêm style cho các phần có border giống create-cv3.jsp */
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
            margin-top: 20px;
            padding: 30px;
            border: 1px solid;
        }
    </style>
</head>
<body>

<%@include file="./includes/header-01.jsp" %>

<div class="cv-container">
    <!-- Left Sidebar -->
    <div class="cv-sidebar">
        <img src="https://via.placeholder.com/180" alt="Profile Photo" class="profile-img">

        <div class="contact-box">
            <h2 class="section-title">Liên hệ</h2>
            <div class="contact-info">
                <p><i class="fas fa-venus-mars"></i> Nam</p>
                <p><i class="fas fa-birthday-cake"></i> 15/07/1995</p>
                <p><i class="fas fa-phone"></i> 098 765 4321</p>
                <p><i class="fas fa-envelope"></i> nguyen.van.a@gmail.com</p>
                <p><i class="fas fa-map-marker-alt"></i> Quận 1, TP. Hồ Chí Minh</p>
            </div>
        </div>

        <div class="skill-box">
            <h2 class="section-title">Kỹ Năng</h2>
            <div class="skills-container">
                <div class="skill-item">
                    <div class="skill-name">
                        <span>Java</span>
                        <span>85%</span>
                    </div>
                    <div class="skill-bar">
                        <div class="skill-level" style="width: 85%"></div>
                    </div>
                </div>

                <div class="skill-item">
                    <div class="skill-name">
                        <span>Spring Framework</span>
                        <span>75%</span>
                    </div>
                    <div class="skill-bar">
                        <div class="skill-level" style="width: 75%"></div>
                    </div>
                </div>

                <div class="skill-item">
                    <div class="skill-name">
                        <span>SQL</span>
                        <span>80%</span>
                    </div>
                    <div class="skill-bar">
                        <div class="skill-level" style="width: 80%"></div>
                    </div>
                </div>

                <div class="skill-item">
                    <div class="skill-name">
                        <span>Tiếng Anh</span>
                        <span>90%</span>
                    </div>
                    <div class="skill-bar">
                        <div class="skill-level" style="width: 90%"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="extra-info-box">
            <h2 class="section-title">Thông tin bổ sung</h2>
            <p style="line-height: 1.5;color: black">Tôi là người có khả năng làm việc độc lập và theo nhóm, có khả năng quản lý thời
                gian hiệu quả và chịu được áp lực công việc cao. Tôi luôn tìm kiếm cơ hội phát triển bản thân và học hỏi
                những điều mới.</p>
        </div>
    </div>

    <!-- Main CV Content -->
    <div class="cv-main">
        <div class="main-info">
            <h1 class="full-name">Nguyễn Văn A</h1>
            <div class="position">Kỹ sư phần mềm Java</div>
        </div>

        <div style="margin-top: 70px" class="section-box">
            <h3 class="main-section-title">Mục tiêu nghề nghiệp</h3>
            <div class="section-divider"></div>
            <p class="item-description">Trở thành một Senior Java Developer giỏi trong vòng 3 năm tới, đóng góp vào sự phát
                triển của công ty bằng kỹ năng chuyên môn cao và góp phần xây dựng các hệ thống phần mềm chất lượng, hiệu
                suất và đáp ứng nhu cầu kinh doanh.</p>
        </div>

        <div class="section-box">
            <h3 class="main-section-title">Học vấn</h3>
            <div class="section-divider"></div>

            <div class="education-item">
                <div class="item-header">
                    <div class="item-title">Đại học Bách Khoa TP. Hồ Chí Minh</div>
                    <div class="item-period">08/2013 - 06/2017</div>
                </div>
                <div class="item-subtitle">Kỹ sư Công nghệ thông tin</div>
                <div class="item-description">
                    Tốt nghiệp loại Giỏi với điểm trung bình 8.5/10. Chuyên ngành phát triển phần mềm.
                </div>
            </div>
        </div>

        <div class="section-box">
            <h3 class="main-section-title">Kinh nghiệm làm việc</h3>
            <div class="section-divider"></div>

            <div class="experience-item">
                <div class="item-header">
                    <div class="item-title">FPT Software</div>
                    <div class="item-period">07/2019 - Hiện tại</div>
                </div>
                <div class="item-subtitle">Java Developer | TP. Hồ Chí Minh</div>
                <div class="item-description">
                    Phát triển các ứng dụng web sử dụng Java, Spring Boot, Hibernate và RESTful API. Tham gia vào các dự án
                    phát triển hệ thống ngân hàng và fintech.
                </div>
                <div class="item-achievements">
                    <strong>Thành tích:</strong> Nhận giải Nhân viên xuất sắc quý 2 năm 2022. Hoàn thành dự án trước thời
                    hạn 2 tuần.
                </div>
            </div>

            <div class="experience-item">
                <div class="item-header">
                    <div class="item-title">TMA Solutions</div>
                    <div class="item-period">08/2017 - 06/2019</div>
                </div>
                <div class="item-subtitle">Junior Developer | TP. Hồ Chí Minh</div>
                <div class="item-description">
                    Phát triển và bảo trì các ứng dụng web sử dụng Java, JSP, Servlet. Tham gia vào quá trình kiểm thử và
                    triển khai phần mềm.
                </div>
            </div>
        </div>

        <div class="section-box">
            <h3 class="main-section-title">Chứng chỉ & giải thưởng</h3>
            <div class="section-divider"></div>

            <div class="certification-item">
                <div class="item-header">
                    <div class="item-title">Oracle Certified Professional, Java SE 11 Developer</div>
                    <div class="item-period">05/2020</div>
                </div>
                <div class="item-description">
                    Đạt chứng chỉ Java SE 11 Developer với điểm số 89/100.
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>

</body>
</html>