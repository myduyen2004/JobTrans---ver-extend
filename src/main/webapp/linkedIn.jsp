<%-- Document : favoriteListJob Created on : Mar 2, 2025, 4:13:55 PM Author : qn407 --%>

    <%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="en-US">

        <!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
        <!-- Added by HTTrack -->
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="profile" href="https://gmpg.org/xfn/11">

            <title>Projects &#8211; ProLancer</title>
            <meta name='robots' content='max-image-preview:large' />
            
            <style id="prolancer_opt-dynamic-css" title="dynamic-css" class="redux-options-output">
                .header {
                    width: 241px;
                    height: 73px;
                    margin: 0 auto;
                    position: relative;
                    display: flex;
                    align-items: center;
                }

                .logo {
                    width: 36px;
                    height: 36px;
                    position: absolute;
                    right: 0;
                    top: 24px;
                }

                .brand {
                    font-size: 60px;
                    font-family: Inter, sans-serif;
                    font-weight: 900;
                    color: #0A66C2;
                }

                .mdi--linkedin {
                    display: inline-block;
                    width: 40px;
                    height: 40px;
                    --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23000' d='M19 3a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2zm-.5 15.5v-5.3a3.26 3.26 0 0 0-3.26-3.26c-.85 0-1.84.52-2.32 1.3v-1.11h-2.79v8.37h2.79v-4.93c0-.77.62-1.4 1.39-1.4a1.4 1.4 0 0 1 1.4 1.4v4.93zM6.88 8.56a1.68 1.68 0 0 0 1.68-1.68c0-.93-.75-1.69-1.68-1.69a1.69 1.69 0 0 0-1.69 1.69c0 .93.76 1.68 1.69 1.68m1.39 9.94v-8.37H5.5v8.37z'/%3E%3C/svg%3E");
                    background-color: #0A66C2;
                    -webkit-mask-image: var(--svg);
                    mask-image: var(--svg);
                    -webkit-mask-repeat: no-repeat;
                    mask-repeat: no-repeat;
                    -webkit-mask-size: 100% 100%;
                    mask-size: 100% 100%;
                    margin-top: -23;
                    margin-left: -3;
                }

                .matching-section {
                    display: flex;
                    align-items: center;
                    gap: 20px;
                    position: relative;
                    margin: 0 50px;
                    justify-content: center;
                }

                .matching-title {
                    font-size: 32px;
                    font-weight: bold;
                    font-family: Inter, sans-serif;
                    color: #333;
                }

                .dashboard {
                    position: relative;
                    width: 150px;
                    height: 150px;
                }

                .progress-ring {
                    transform: rotate(-90deg);
                }

                .progress-ring circle {
                    fill: none;
                    stroke-width: 10;
                    stroke-linecap: round;
                }

                .background {
                    stroke: #e0e0e0;
                }

                .progress {
                    stroke: #4CAF50;
                    stroke-dasharray: 314;
                    stroke-dashoffset: 314;
                    transition: stroke-dashoffset 1s ease-in-out;
                }

                .percentage {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    font-size: 24px;
                    font-weight: bold;
                    color: #333;
                }

                .section {
                    width: 1196px;
                    height: fit-content;
                    background: white;
                    border-radius: 20px;
                    border: 1px solid #A1A1A1;
                    display: block;
                    margin-bottom: 20px;
                    padding: 20px;
                    box-sizing: border-box;
                    position: relative;
                }

                .profile {
                    width: 1000px;
                    height: 460px;
                    position: relative;
                    margin: 20px auto;
                }

                .profile-banner {
                    width: 100%;
                    height: 198px;
                    border-top-left-radius: 20px;
                    border-top-right-radius: 20px;
                }

                .profile-picture {
                    width: 120px;
                    height: 120px;
                    position: absolute;
                    left: 55px;
                    top: 126px;
                    border-radius: 50%;
                    outline: 4px white solid;
                }

                .profile-name,
                .profile-role,
                .profile-location,
                .followers,
                .company {
                    position: absolute;
                    left: 38px;
                    font-family: Inter, sans-serif;
                    font-weight: 400;
                }

                .profile-name {
                    top: 270px;
                    font-size: 28px;
                    color: black;
                    font-weight: bold;
                }

                .profile-role {
                    top: 320px;
                    font-size: 20px;
                    color: black;
                }

                .profile-location {
                    top: 363px;
                    font-size: 20px;
                    color: #A1A1A1;
                }

                .followers {
                    top: 408px;
                    font-size: 18px;
                    color: black;
                }

                .experience,
                .education,
                .skills {
                    position: absolute;
                    font-size: 22px;
                    font-family: Inter, sans-serif;
                    font-weight: 700;
                    color: black;
                    margin-bottom: 10px;
                }

                .experience-section,
                .education-section,
                .skills-section {
                    width: 1000px;
                    position: static;
                    margin: 40px auto;
                    display: block;
                    gap: 10px;
                    height: fit-content;
                }

                .experience-section {
                    top: 796px;
                }

                .education-section {
                    top: 1266px;
                }

                .skills-section {
                    top: 1595px;
                }

                .company-logo {
                    width: 75px;
                    height: 75px;
                    object-fit: contain;
                     border-radius: 5px;
                }

                .company-info {
                    display: flex;
                    align-items: center;
                    gap: 15px;
                    padding: 10px;
                }

                .company-title {
                    font-size: 20px;
                    color: black;
                }

                .company-name,
                .company-duration {
                    font-size: 20px;
                    color: black;
                }

                .skill-list {
                    font-size: 20px;
                    font-family: Inter, sans-serif;
                    font-weight: 400;
                    color: black;
                }

                .skill-list,
                .company-info {
                    margin-top: 15px;
                }
            </style>
        </head>

        <body
            class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">

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

                <a class="skip-link screen-reader-text" href="#content">Skip to content</a>

                <section>
                    <div class="breadcrumbs">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 my-auto">
                                    <h1>
                                        Projects </h1>
                                    <ul class="trail-items" itemscope itemtype="http://schema.org/BreadcrumbList">
                                        <li class="trail-item trail-begin"><a href="../index.html"><span
                                                    itemprop="name">Home</span></a>
                                            <meta itemprop="position" content="1" />
                                        </li>
                                        <li class="trail-item trail-end"><span itemprop="item"><span
                                                    itemprop="name">Projects</span></span>
                                            <meta itemprop="position" content="2" />
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>


                <section class="section-padding">
                    <div class="container">
                        <div class="justify-content-center" style="position: relative;">
                            <div class="header">
                                <div class="brand">Linked</div>
                                <div class="logo">
                                    <div class="mdi--linkedin"></div>
                                </div>
                            </div>

                            <div class="matching-section">
                                <div class="matching-title">Tỉ lệ tương hợp hồ sơ</div>
                                <div class="dashboard">
                                    <svg class="progress-ring" width="150" height="150">
                                        <circle class="background" cx="75" cy="75" r="50" stroke-width="10"></circle>
                                        <circle class="progress" cx="75" cy="75" r="50" stroke-width="10"></circle>
                                    </svg>
                                    <div class="percentage">0%</div>
                                </div>
                            </div>


                            <div class="profile section" style="padding: 0;">
                                <img class="profile-banner" src="https://placehold.co/1196x237" />
                                <img class="profile-picture" src="https://placehold.co/157x157" />
                                <div class="profile-name">Nguyễn Văn User</div>
                                <div class="profile-role">Sinh viên tại FPT University</div>
                                <div class="profile-location">Da Nang City, Viet Nam</div>
                                <div class="followers">177 followers</div>
                            </div>

                            <div class="experience-section section">
                                <div class="experience">Experience</div>

                                <div class="company-info" style="margin-top: 50px;">
                                    <img class="company-logo" src="https://placehold.co/75x81" />
                                    <div class="block">
                                        <div class="company-title">Senior - IT</div>
                                        <div class="company-name">Microsoft</div>
                                        <div class="company-duration">2019 - 2023</div>
                                    </div>
                                </div>
                                <div class="company-info">
                                    <img class="company-logo" src="https://placehold.co/75x81" />
                                    <div class="block">
                                        <div class="company-title">Manager</div>
                                        <div class="company-name">Microsoft</div>
                                        <div class="company-duration">2019 - 2023</div>
                                    </div>
                                </div>
                            </div>

                            <div class="education-section section">
                                <div class="education">Education</div>
                                <div class="company-info" style="margin-top: 40px;">
                                    <img class="company-logo" src="https://placehold.co/104x53" />
                                    <div class="block">
                                        <div class="company-title">FPT University</div>
                                        <div class="company-duration">2019 - 2023</div>
                                    </div>
                                </div>
                            </div>

                            <div class="skills-section section">
                                <div class="skills">Skills</div>
                                <div class="skill-list" style="margin-top: 60px;">Korean Translate</div>
                                <div class="skill-list">Soft skills</div>
                            </div>
                        </div>
                    </div>
                </section>

                <%@include file="includes/footer.jsp" %>
                    <!--======= Back to Top =======-->
                    <div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

                    <script>
                        function setProgress(percentage) {
                            const circle = document.querySelector('.progress');
                            const percentageText = document.querySelector('.percentage');
                            const circumference = 2 * Math.PI * 50;
                            const offset = circumference - (percentage / 100) * circumference;
                            circle.style.strokeDashoffset = offset;
                            percentageText.textContent = percentage + '%';
                        }

                        setProgress(75); // Đặt phần trăm hiển thị (ví dụ: 75%)
                    </script>
        </body>

        <!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

        </html>