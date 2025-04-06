<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/services/?services-layout=services_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:48 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">

    <title>Đánh giá đối tác &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large'/>
    <link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<style>
   body {
    font-family: 'Poppins', Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
    color: #333;
}

/* Container của phần thông tin liên hệ */
.contact-container {
    display: flex;
    justify-content: center;
    gap: 40px;
    flex-wrap: wrap;
    text-align: center;
    padding: 30px;
    margin-top: 80px;
    margin-bottom: 40px;
}

.contact-item {
    flex: 1;
    max-width: 250px;
    padding: 15px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
}

.contact-item:hover {
    transform: translateY(-5px);
}

.contact-item img {
    width: 50px;
    height: 50px;
    margin-bottom: 10px;
    border-radius: 40px;
}

.contact-item h3 {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 5px;
}

.contact-item p {
    font-size: 14px;
    color: #555;
}

.contact-item a {
    color: #192663;
    font-weight: 600;
    text-decoration: none;
}

.contact-item a:hover {
    text-decoration: underline;
}
.contact-item:hover {
    background-color: #badce3;
    transform: scale(1.1); /* Phóng to nhẹ khi hover */
}

/* Feedback container */
.feedback-container {
    text-align: center;
    padding: 30px;
}

.feedback-button {
    background-color: #192663;
    color: white;
    padding: 12px 18px;
    border: none;
    border-radius: 25px;
    font-weight: bold;
    font-size: 16px;
    cursor: pointer;
    transition: background 0.3s;
}

.feedback-container {
    position: relative; /* Gốc cho button */
    text-align: center;
    padding: 30px;
}

.feedback-container {
    position: relative; /* Gốc cho button */
    text-align: center;
    padding: 30px;
}

.feedback-textarea {
    width: 80%;
    height: 300px;
    padding: 10px;
    border-radius: 8px;
    border: 2px solid #192663;
    font-size: 14px;
    transition: box-shadow 0.3s;
    resize: none;
   
}

.feedback-textarea:focus {
    box-shadow: 0 0 8px rgba(25, 38, 99, 0.5);
    outline: none;
}

/* Nút nằm góc trái trên textarea */
.feedback-button {
    position: absolute;
    top: 10px; /* Khoảng cách từ trên xuống */
    left: 10px; /* Khoảng cách từ trái vào */
    background-color: #192663;
    color: white;
    padding: 8px 15px;
    border: none;
    border-radius: 20px;
    font-weight: bold;
    font-size: 14px;
    cursor: pointer;
    transition: background 0.3s, transform 0.2s;
    margin-left: 165px;
    height: 40px;
}

/* Hiệu ứng hover */
.feedback-button:hover {
    background-color: #0f1b49;
    transform: scale(1.1); /* Phóng to nhẹ khi hover */
}
/* Banner */
.banner {
    text-align: center;
    background-color: #e8ecfc;
    padding: 30px;
    margin: 20px auto;
    border-radius: 12px;
    width: 80%;
}

.banner h2 {
    font-size: 22px;
    font-weight: bold;
    color: #333;
}

.banner p {
    font-size: 14px;
    color: #666;
}

.post-job-button {
    background-color: #4460f1;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 8px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 10px;
}

.post-job-button:hover {
    background-color: #e68900;
}

/* Responsive Design */
@media (max-width: 768px) {
    .contact-container {
        flex-direction: column;
        align-items: center;
    }

    .feedback-textarea {
        width: 95%;
    }

    .banner {
        width: 90%;
    }
}

</style>

<body class="archive post-type-archive post-type-archive-services wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">

<!-- Preloading -->
<div id="preloader">
    <div class="spinner">
        <div class="uil-ripple-css">
            <div></div>
            <div></div>
        </div>
    </div>
</div>

<a class="skip-link screen-reader-text" href="#content">Skip to content</a>

<%@include file="includes/header-01.jsp" %>

<!--Mobile Navigation Toggler-->
<div class="off-canvas-menu-bar">
    <div class="container">
        <div class="row">
            <div class="col-6 my-auto">
                <a href="../index.html" class="custom-logo-link" rel="home"><img width="500" height="71"
                                                                                 src="../wp-content/uploads/2021/09/logo.png"
                                                                                 class="custom-logo" alt="ProLancer"
                                                                                 decoding="async"
                                                                                 srcset="https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo.png 500w, https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo-300x43.png 300w"
                                                                                 sizes="(max-width: 500px) 100vw, 500px"/></a>
            </div>
            <div class="col-6">
                <div class="mobile-nav-toggler float-end"><span class="fal fa-bars"></span></div>
            </div>
        </div>
    </div>
</div>

<!-- Mobile Menu  -->
<div class="off-canvas-menu">
    <div class="menu-backdrop"></div>
    <i class="close-btn fa fa-close"></i>
    <nav class="mobile-nav">
        <div class="text-center pt-3 pb-3">
            <a href="../index.html" class="custom-logo-link" rel="home"><img width="500" height="71"
                                                                             src="../wp-content/uploads/2021/09/logo.png"
                                                                             class="custom-logo" alt="ProLancer"
                                                                             decoding="async"
                                                                             srcset="https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo.png 500w, https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo-300x43.png 300w"
                                                                             sizes="(max-width: 500px) 100vw, 500px"/></a>
        </div>

        <ul class="navigation"><!--Keep This Empty / Menu will come through Javascript--></ul>
        <div class="text-center">
            <a href="../frontend-dashboard/index6f28.html?fed=dashboard" class="prolancer-btn mt-4">
                Dashboard </a>
        </div>
    </nav>
</div>


<section>
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-md-12 my-auto">

                    <ul class="trail-items" itemscope itemtype="http://schema.org/BreadcrumbList">
                        <li class="trail-item trail-begin"><a href="../index.html"><span itemprop="name">Home</span></a>
                            <meta itemprop="position" content="1"/>
                        </li>
                        <li class="trail-item trail-end"><span itemprop="item"><span
                                itemprop="name">Services</span></span>
                            <meta itemprop="position" content="2"/>
                        </li>
                    </ul>
                </div>
                <h1>
                    Đánh giá </h1>
            </div>

        </div>
    </div>
</section>


    <div class="contact-container">
        <div class="contact-item">
            <img src="wp-includes/images/anh_icon/sdt.png" alt="Address">
            <h3>Address</h3>
            <p>38 Lê Đại Hành, Ngũ Hành Sơn, Đà Nẵng</p>
        </div>

        <div class="contact-item">
            <img src="wp-includes/images/anh_icon/email.png" alt="Email">
            <h3>Email</h3>
            <p>congnvde180639@gmail.com</p>
        </div>

        <div class="contact-item">
            <img src="wp-includes/images/anh_icon/contact.png" alt="Contact">
            <h3>Contact</h3>
            <p>38 Lê Đại Hành, Ngũ Hành Sơn, Đà Nẵng</p>
        </div>

        <div class="contact-item">
            <img src="wp-includes/images/anh_icon/facebook.png" alt="Facebook">
            <h3>Facebook</h3>
            <p><a href="https://www.facebook.com/profile.php?id=100054503381115" target="_blank">Facebook Profile</a></p>
        </div>
    </div>

    <div class="feedback-container">
        <button class="feedback-button">Đóng góp ý kiến về trang web</button>
        <textarea class="feedback-textarea" placeholder="Nhập ý kiến của bạn tại đây..."></textarea>
    </div>

    <div class="banner">
        <h2>Find the talent needed to get your business growing.</h2>
        <p>Advertise your jobs to millions of monthly users and search 15.8 million CVs</p>
        <button class="post-job-button">Start posting job</button>
    </div>

<%@include file="includes/footer.jsp" %>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
</html>


