<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Professional CV Template</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
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
            border-radius: var(--radius);
        }

        .cv-sidebar {
            width: 300px;
            background: linear-gradient(135deg, #4a6fa5 0%, #3a5a8a 100%);
            color: white;
            padding: 30px 20px;
            height: 250px;
            border-radius: 20px;
        }

        .cv-main {
            flex: 1;
            padding: 30px;
            background-color: white;
        }

        .profile-img {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            border: 4px solid white;
            margin: 0 auto 25px;
            display: block;
            object-fit: cover;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .section-title {
            font-family: 'Poppins', sans-serif;
            font-size: 18px;
            font-weight: 600;
            margin: 25px 0 15px;
            color: #4a6fa5;
            padding-bottom: 8px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
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
            background: var(--border);
            margin: 15px 0;
        }

        .contact-info p {
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #95a5a6;
        }

        .contact-info i {
            width: 20px;
            margin-right: 10px;
            color: #4a6fa5;
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
            background: #2a3b70;
            border-radius: 4px;
        }

        .name-title {
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 2px solid var(--primary);
        }

        .full-name {
            font-size: 28px;
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 5px;
            letter-spacing: 0.5px;
        }

        .position {
            font-size: 18px;
            color: var(--primary);
            font-weight: 500;
        }

        .experience-item, .education-item, .certification-item {
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px dashed var(--border);
        }

        .experience-item:last-child,
        .education-item:last-child,
        .certification-item:last-child {
            border-bottom: none;
        }

        .item-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }

        .item-title {
            font-weight: 600;
            color: var(--dark);
            font-size: 16px;
        }

        .item-period {
            color: var(--gray);
            font-size: 14px;
            font-weight: 500;
        }

        .item-subtitle {
            color: var(--gray);
            font-style: italic;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .item-description {
            color: var(--dark);
            line-height: 1.5;
            font-size: 14px;
        }

        .item-achievements {
            margin-top: 8px;
            padding: 8px 12px;
            background-color: var(--primary-light);
            border-radius: var(--radius);
            font-size: 14px;
        }

        .item-achievements strong {
            color: var(--primary);
        }

        .skill-group {
            margin-bottom: 15px;
        }

        .skill-group h3 {
            font-size: 16px;
            margin-bottom: 8px;
            color: #95a5a6;
            font-weight: 500;
        }

        .additional-info {
            font-size: 14px;
            line-height: 1.5;
            color: #EAE7D6;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .cv-container {
                flex-direction: column;
            }

            .cv-sidebar {
                width: 100%;
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
<%@include file="./includes/header-01.jsp" %>
<div class="cv-container">
    <!-- Left Sidebar -->
    <div class="cv-sidebar">
        <img src="https://via.placeholder.com/180" alt="Profile Photo" class="profile-img">

        <h2 style="margin-top: 80px" class="section-title">Liên hệ</h2>
        <div class="contact-info">
            <p><i class="fas fa-venus-mars"></i> Nam</p>
            <p><i class="fas fa-birthday-cake"></i> 15/07/1995</p>
            <p><i class="fas fa-phone"></i> 098 765 4321</p>
            <p><i class="fas fa-envelope"></i> nguyen.van.a@gmail.com</p>
            <p><i class="fas fa-map-marker-alt"></i> Quận 1, TP. Hồ Chí Minh</p>
        </div>

        <h2 class="section-title">Kỹ Năng</h2>
        <div class="skills-container">
            <!-- Technical Skills -->
            <div class="skill-group">
                <h3>Kỹ năng kỹ thuật</h3>

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
            </div>

            <!-- Language Skills -->
            <div class="skill-group">
                <h3>Ngoại ngữ</h3>

                <div class="skill-item">
                    <div class="skill-name">
                        <span>Tiếng Anh</span>
                        <span>90%</span>
                    </div>
                    <div class="skill-bar">
                        <div class="skill-level" style="width: 90%"></div>
                    </div>
                </div>

                <div class="skill-item">
                    <div class="skill-name">
                        <span>Tiếng Nhật</span>
                        <span>60%</span>
                    </div>
                    <div class="skill-bar">
                        <div class="skill-level" style="width: 60%"></div>
                    </div>
                </div>
            </div>
        </div>

        <h2 class="section-title">Thông tin bổ sung</h2>
        <div style="color: #4a5568" class="additional-info">
            <p>Tôi là người có khả năng làm việc độc lập và theo nhóm, có khả năng quản lý thời gian hiệu quả và chịu được áp lực công việc cao. Tôi luôn tìm kiếm cơ hội phát triển bản thân và học hỏi những điều mới.</p>
        </div>
    </div>

    <!-- Main CV Content -->
    <div class="cv-main">
        <div class="name-title">
            <h1 class="full-name">Nguyễn Văn A</h1>
            <div class="position">Kỹ sư phần mềm Java</div>
        </div>

        <h3 class="main-section-title">Mục tiêu nghề nghiệp</h3>
        <div class="section-divider"></div>
        <p class="item-description">Trở thành một Senior Java Developer giỏi trong vòng 3 năm tới, đóng góp vào sự phát triển của công ty bằng kỹ năng chuyên môn cao và góp phần xây dựng các hệ thống phần mềm chất lượng, hiệu suất và đáp ứng nhu cầu kinh doanh.</p>

        <h3 class="main-section-title">Kinh nghiệm làm việc</h3>
        <div class="section-divider"></div>

        <div class="experience-item">
            <div class="item-header">
                <div class="item-title">FPT Software</div>
                <div class="item-period">07/2019 - Hiện tại</div>
            </div>
            <div class="item-subtitle">Java Developer | TP. Hồ Chí Minh</div>
            <div class="item-description">
                Phát triển các ứng dụng web sử dụng Java, Spring Boot, Hibernate và RESTful API. Tham gia vào các dự án phát triển hệ thống ngân hàng và fintech.
                <ul style="margin-top: 8px; padding-left: 20px;">
                    <li>Thiết kế và phát triển các microservices</li>
                    <li>Tối ưu hóa hiệu suất ứng dụng</li>
                    <li>Phối hợp với team QA để đảm bảo chất lượng sản phẩm</li>
                </ul>
            </div>
            <div class="item-achievements">
                <strong>Thành tích:</strong> Nhận giải Nhân viên xuất sắc quý 2 năm 2022. Hoàn thành dự án trước thời hạn 2 tuần.
            </div>
        </div>

        <div class="experience-item">
            <div class="item-header">
                <div class="item-title">TMA Solutions</div>
                <div class="item-period">08/2017 - 06/2019</div>
            </div>
            <div class="item-subtitle">Junior Developer | TP. Hồ Chí Minh</div>
            <div class="item-description">
                Phát triển và bảo trì các ứng dụng web sử dụng Java, JSP, Servlet. Tham gia vào quá trình kiểm thử và triển khai phần mềm.
                <ul style="margin-top: 8px; padding-left: 20px;">
                    <li>Phát triển module quản lý người dùng</li>
                    <li>Viết unit test và integration test</li>
                    <li>Hỗ trợ triển khai sản phẩm lên production</li>
                </ul>
            </div>
        </div>

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
                <ul style="margin-top: 8px; padding-left: 20px;">
                    <li>Đồ án tốt nghiệp: Hệ thống quản lý bệnh viện</li>
                    <li>Tham gia CLB Lập trình viên</li>
                </ul>
            </div>
        </div>

        <div class="education-item">
            <div class="item-header">
                <div class="item-title">Trung tâm Đào tạo CNTT ABC</div>
                <div class="item-period">01/2018 - 06/2018</div>
            </div>
            <div class="item-subtitle">Chứng chỉ Java Professional</div>
            <div class="item-description">
                Hoàn thành khóa học Java chuyên sâu và Spring Framework.
            </div>
        </div>

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

        <div class="certification-item">
            <div class="item-header">
                <div class="item-title">AWS Certified Developer - Associate</div>
                <div class="item-period">09/2021</div>
            </div>
            <div class="item-description">
                Chứng chỉ xác nhận kiến thức về phát triển, triển khai và gỡ lỗi ứng dụng trên AWS.
            </div>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>