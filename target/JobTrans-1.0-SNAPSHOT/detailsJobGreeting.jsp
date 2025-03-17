
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">
    <style>
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 60px;
        }

        .header-greeting {
            display: flex;
            margin-bottom: 50px;
        }

        .profile {
            background: #F0F3FF;
            padding: 20px;
            border-radius: 10px;
            width: 300px;
            height: 400px;
            text-align: center;
            align-items: center;
        }

        .avatar {
            align-items: center;
            width: 100%;
        }

        .avatar img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
        }

        .word-wrap {
            word-wrap: break-word;
            overflow-wrap: break-word;
            white-space: normal;
        }

        .rating {
            color: gold;
            font-size: 20px;
        }

        .cv-button {
            background: #6787FE;
            color: white;
            border: none;
            padding: 2px 12px;
            cursor: pointer;
            border-radius: 27px;
            margin-top: 10px;
        }

        .cv-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 0px 10px rgba(42, 65, 232, 0.4);
        }

        .info {
            width: 70%;
            padding-left: 20px;
            margin-left: 50px;
        }

        .info h2 {
            border-bottom: 2px solid #ccc;
            padding-bottom: 5px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: auto auto auto auto;
            gap: 10px;
            align-items: center;
        }

        .info-grid p {
            margin: 5px 0;
        }

        .info-grid p:nth-child(odd) {
            font-weight: bold;
        }

        .about-container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
        }

        .about-title {
            font-size: 22px;
            font-weight: bold;
            color: #0a174e;
            display: flex;
            align-items: center;
        }

        .divider {
            flex-grow: 1;
            height: 2px;
            background: #ccc;
            margin-left: 20px;
        }

        .about-content {
            text-align: justify;
            font-size: 16px;
            line-height: 1.6;
            color: #333;
            margin-top: 10px;
        }

        .background-container {
            width: 100%;
            height: auto;
            background: #F0F3FF;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .slideshow-container {
            position: relative;
            max-width: 800px;
            width: 90%;
            margin: auto;
            overflow: hidden;
        }

        .slide {
            display: none;
        }

        .slide img {
            width: 100%;
            height: auto;
            max-height: 500px;
            object-fit: contain;
        }

        .dots-container {
            text-align: center;
            margin-top: 10px;
        }

        .dot {
            height: 12px;
            width: 12px;
            margin: 0 5px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.3s ease;
            border: 1px solid #000000;
        }

        .dot.active {
            background-color: #717171;
        }

        .prev,
        .next {
            font-size: 24px;
            font-weight: bold;
            color: white;
            padding: 15px;
            cursor: pointer;
            border-radius: 50%;
            background: #0F1B63;
            /*transition: #0F1B63 0.3s ease;*/
            width: 50px;
    height: 50px;
    align-items: center;
    justify-content: center;
    display: flex;
        }

        .prev {
            margin-left: 20px;
        }

        .next {
            margin-right: 20px;
        }
        .prev:hover,
        .next:hover {
            background: #D9DAE3;
            color: #0F1B63;
            box-shadow: 0 0px 10px rgba(25, 36, 120, 0.4);
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

    <%@include file="includes/header-login-01.jsp" %>


    <a class="skip-link screen-reader-text" href="#content">Skip to content</a>

    <!--Mobile Navigation Toggler-->
    <div class="off-canvas-menu-bar">
        <div class="container">
            <div class="row">
                <div class="col-6 my-auto">
                    <a href="../index.html" class="custom-logo-link" rel="home"><img width="500" height="71"
                            src="../wp-content/uploads/2021/09/logo.png" class="custom-logo" alt="ProLancer"
                            decoding="async"
                            srcset="https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo.png 500w, https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo-300x43.png 300w"
                            sizes="(max-width: 500px) 100vw, 500px" /></a>
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
                        src="../wp-content/uploads/2021/09/logo.png" class="custom-logo" alt="ProLancer"
                        decoding="async"
                        srcset="https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo.png 500w, https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo-300x43.png 300w"
                        sizes="(max-width: 500px) 100vw, 500px" /></a>
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

    <section>
    <div class="container section-padding">
        <h1>Design trang web</h1>

        <div class="header-greeting col-xl-12">
            <div class="profile col-xl-4">
                <div class="avatar">
                    <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg"
                         alt="Nguyễn Văn User">
                    <h3 class="word-wrap">Nguyễn Văn User User User User</h3>
                    <p style="margin-bottom: 10px;">Điểm: 1735</p>
                    <div class="rating">★★★★★</div>
                    <button class="cv-button">Xem CV</button>
                </div>

            </div>

            <div class="info col-xl-8">
                <h2 style="text-align: center;">Thông tin cơ bản</h2>
                <div class="info-grid">
                    <p><strong>Họ và tên</strong></p>
                    <p>Nguyễn Văn User</p>
                    <p><strong>Ngày sinh</strong></p>
                    <p>22-02-2002</p>

                    <p><strong>Giới tính</strong></p>
                    <p>Nam</p>
                    <p><strong>Chuyên môn</strong></p>
                    <p>IT, CNTT</p>

                    <p><strong>Email</strong></p>
                    <p>user@gmail.com</p>
                    <p><strong>SĐT</strong></p>
                    <p>0999999999</p>

                    <p><strong>Giá đề xuất cho công việc</strong></p>
                    <p>15.000.000 Coins</p>
                    <p><strong>Thời gian hoàn thành dự án</strong></p>
                    <p>2 tháng</p>
                </div>
            </div>

        </div>
        <div class="about-container">
            <h2 class="about-title">Giới thiệu bản thân <span class="divider"></span></h2>
            <p class="about-content">
                Xin chào! Tôi là Nguyễn Văn A, một freelancer IT chuyên về phát triển web và backend. Với 5 năm kinh
                nghiệm,
                tôi giúp khách hàng xây dựng hệ thống hiệu quả, tối ưu hiệu suất và bảo mật. Nếu bạn cần một
                freelancer chuyên nghiệp, hãy liên hệ với tôi!
            </p>
            <p class="about-content">
                Tôi luôn tận tâm mang đến giải pháp công nghệ chất lượng, phù hợp với nhu cầu của từng dự án. Với
                kinh nghiệm sâu rộng về Java, Spring Boot,
                Node.js và các hệ quản trị cơ sở dữ liệu như MySQL, PostgreSQL, tôi có thể xây dựng các hệ thống từ
                nhỏ đến lớn, đảm bảo tính linh hoạt,
                dễ mở rộng và bảo mật cao. Ngoài ra, tôi còn có kinh nghiệm làm việc với AWS, Docker và CI/CD, giúp
                tối ưu hóa quy trình triển khai và vận hành hệ thống.
                Hãy liên hệ với tôi nếu bạn cần một giải pháp web mạnh mẽ, chuyên nghiệp và đáng tin cậy!
            </p>
        </div>


        <div class="about-container">
            <h2 class="about-title">Chứng chỉ<span class="divider"></span></h2>
        </div>

        <div class="background-container">
            <a class="prev" onclick="changeSlide(-1)">&#10094;</a>

            <div class="slideshow-container">
                <div class="slide">
                    <img src="../wp-content/uploads/test/1.webp" alt="Certificate">
                </div>
                <div class="slide">
                    <img src="../wp-content/uploads/test/2.webp" alt="Certificate">
                </div>
                <div class="slide">
                    <img src="../wp-content/uploads/test/1.webp" alt="Certificate">
                </div>

                <div class="dots-container">
                </div>
            </div>
            <a class="next" onclick="changeSlide(1)">&#10095;</a>

        </div>
    </section>
    <%@include file="includes/footer.jsp" %>

    
    <!--======= Back to Top =======-->
    <div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>


    <script>
        let slideIndex = 1;
        showSlides(slideIndex);

        function changeSlide(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            let slides = document.querySelectorAll(".slide");
            let dots = document.querySelectorAll(".dot");

            if (n > slides.length) slideIndex = 1;
            if (n < 1) slideIndex = slides.length;

            slides.forEach(slide => slide.style.display = "none");
            dots.forEach(dot => dot.classList.remove("active"));

            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].classList.add("active");
        }

    </script>
<script>
    let dotIndex = 0;
const slides = document.querySelectorAll(".slide");
const dotsContainer = document.querySelector(".dots-container");

// Tạo dots theo số lượng ảnh
slides.forEach((_, index) => {
    const dot = document.createElement("span");
    dot.classList.add("dot");
    dot.addEventListener("click", () => showSlide(index));
    dotsContainer.appendChild(dot);
});

const dots = document.querySelectorAll(".dot");

// Hiển thị slide theo index
function showSlide(index) {
    if (index >= slides.length) dotIndex = 0;
    else if (index < 0) slidotIndexdeIndex = slides.length - 1;
    else dotIndex = index;

    slides.forEach((slide, i) => {
        slide.style.display = i === dotIndex ? "block" : "none";
        dots[i].classList.toggle("active", i === dotIndex);
    });
}

function changeSlide(step) {
    showSlide(dotIndex + step);
}

showSlide(dotIndex);

</script>

</body>
</html>
