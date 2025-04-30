<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_fullwidth by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>
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

    .cong .cv-container {
        margin-bottom: 20px;
        margin-top: 90px;
        margin-left: 110px;
        width: 1000px;
        display: flex;
        box-shadow: var(--shadow);
        background: white;

        overflow: hidden;
        position: relative;
        margin-top: 20px;
        margin-left: 17%;
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

        width: 100px;
        height: 100px;
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
        border: 0.5px solid black;
    }

    .header-section {
        text-align: center;
        margin-bottom: 50px;
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


    textarea.main-form-control {
        min-height: 120px;
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
    .banner_title {
        background-image: url(./img/anh1/anh1.png);
        background-size: 100%;
        font-size: 40px;
        height: 200px;
        display: flex;

        align-items: center;
    }
</style>
<body class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">


<%@include file="./includes/header-01.jsp" %>
<div class="py-4 banner_title">
    <h1 class="text-white font-weight-bold" style="padding-left: 50px;">Danh sách công việc</h1>
</div>


<div  style="display: flex">

    <%@include file="./includes/sidebar_createCV.jsp" %>

    <div class="cong">
        <div class="cv-container">


            <!-- Left Sidebar -->
            <div class="cv-sidebar">
                <div style="width: 240px;height: 240px" class="avatar-container">
                    <img id="avatar-preview" src="https://randomuser.me/api/portraits/men/32.jpg" alt="John Doe">
                </div>

                <h2 class="section-title">Thông tin cá nhân</h2>
                <div class="form-group">
                    <div class="contact-info"><i class="fas fa-phone"></i> (123) 456-7890</div>
                </div>
                <div class="form-group">
                    <div class="contact-info"><i class="fas fa-envelope"></i> john.doe@example.com</div>
                </div>
                <div class="form-group">
                    <div class="contact-info"><i class="fas fa-map-marker-alt"></i> 123 Main St, New York, NY</div>
                </div>
                <div class="form-group">
                    <div class="contact-info"><i class="fas fa-birthday-cake"></i> June 15, 1990</div>
                </div>

                <h2 class="section-title">Kỹ năng</h2>
                <div class="skills-section">
                    <div class="skill-item">
                        <div class="skill-name">Java Development</div>
                        <div class="skill-proficiency">
                            <div class="proficiency-bar" style="width: 90%;"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-name">Spring Framework</div>
                        <div class="skill-proficiency">
                            <div class="proficiency-bar" style="width: 85%;"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-name">Database Design</div>
                        <div class="skill-proficiency">
                            <div class="proficiency-bar" style="width: 80%;"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-name">Project Management</div>
                        <div class="skill-proficiency">
                            <div class="proficiency-bar" style="width: 75%;"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-name">Team Leadership</div>
                        <div class="skill-proficiency">
                            <div class="proficiency-bar" style="width: 85%;"></div>
                        </div>
                    </div>
                </div>

                <h2 class="section-title">Languages</h2>
                <div class="skills-section">
                    <div class="skill-item">
                        <div class="skill-name">English</div>
                        <div class="skill-proficiency">
                            <div class="proficiency-bar" style="width: 100%;"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-name">Spanish</div>
                        <div class="skill-proficiency">
                            <div class="proficiency-bar" style="width: 60%;"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Content -->
            <div class="cv-content">
                <div class="header-section">
                    <h1 class="name">John Doe</h1>
                    <h2 class="position">Senior Software Engineer</h2>
                    <div class="summary-short">8+ years of experience in Java development and system architecture</div>
                </div>

                <div class="content-section">
                    <div class="content-title">Mục tiêu nghề nghiệp</div>
                    <div class="content-text">
                        <p>Results-driven Senior Software Engineer with over 8 years of experience in designing and
                            implementing
                            enterprise-level applications. Specialized in Java backend development with extensive
                            knowledge of
                            Spring Framework, microservices architecture, and cloud technologies.</p>
                        <p>Proven track record of leading development teams and delivering high-quality software
                            solutions that
                            meet business requirements. Passionate about clean code, software design patterns, and
                            mentoring
                            junior developers.</p>
                    </div>
                </div>

                <div class="content-section">
                    <div class="content-title">Kinh nghiệm làm việc</div>

                    <div class="experience-item">
                        <div class="experience-header">
                            <h3 class="company">Tech Solutions Inc.</h3>
                            <div class="position-date">
                                <span class="position">Senior Software Engineer</span>
                                <span class="date">Jan 2020 - Present</span>
                            </div>
                        </div>
                        <ul class="experience-details">
                            <li>Led a team of 5 developers in designing and implementing a microservices-based
                                e-commerce
                                platform
                            </li>
                            <li>Reduced system response time by 40% through performance optimization and database
                                tuning
                            </li>
                            <li>Implemented CI/CD pipelines reducing deployment time from 2 hours to 15 minutes</li>
                            <li>Mentored junior developers and conducted code reviews to maintain code quality
                                standards
                            </li>
                        </ul>
                    </div>

                    <div class="experience-item">
                        <div class="experience-header">
                            <h3 class="company">Global Systems Corp.</h3>
                            <div class="position-date">
                                <span class="position">Software Engineer</span>
                                <span class="date">Mar 2016 - Dec 2019</span>
                            </div>
                        </div>
                        <ul class="experience-details">
                            <li>Developed RESTful APIs for financial services applications using Spring Boot</li>
                            <li>Collaborated with cross-functional teams to design database schemas and optimize
                                queries
                            </li>
                            <li>Implemented automated testing framework reducing bug reports by 30%</li>
                            <li>Participated in Agile development processes including sprint planning and
                                retrospectives
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="content-section">
                    <div class="content-title">Học vấn </div>

                    <div class="education-item">
                        <div class="education-header">
                            <h3 class="institution">Massachusetts Institute of Technology</h3>
                            <div class="degree-date">
                                <span class="degree">Master of Computer Science</span>
                                <span class="date">2014 - 2016</span>
                            </div>
                        </div>
                        <div class="education-details">
                            <p>Specialization in Software Engineering and Distributed Systems</p>
                            <p>GPA: 3.8/4.0</p>
                        </div>
                    </div>

                    <div class="education-item">
                        <div class="education-header">
                            <h3 class="institution">Stanford University</h3>
                            <div class="degree-date">
                                <span class="degree">Bachelor of Science in Computer Science</span>
                                <span class="date">2010 - 2014</span>
                            </div>
                        </div>
                        <div class="education-details">
                            <p>Minor in Mathematics</p>
                            <p>Dean's List for 6 semesters</p>
                        </div>
                    </div>
                </div>

                <div class="content-section">
                    <div class="content-title">Chứng chỉ & giải thưởng</div>

                    <div class="certification-item">
                        <div class="certification-header">
                            <h3 class="certification-name">Oracle Certified Professional: Java SE 11 Developer</h3>
                            <span class="date">2021</span>
                        </div>
                    </div>

                    <div class="certification-item">
                        <div class="certification-header">
                            <h3 class="certification-name">AWS Certified Solutions Architect - Associate</h3>
                            <span class="date">2020</span>
                        </div>
                    </div>

                    <div class="certification-item">
                        <div class="certification-header">
                            <h3 class="certification-name">Spring Professional Certification</h3>
                            <span class="date">2019</span>
                        </div>
                    </div>
                </div>

            </div>


        </div>
    </div>


    </div>


</body>
<%@include file="includes/footer.jsp" %>
</html>