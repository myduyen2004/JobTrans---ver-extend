<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="profile" href="https://gmpg.org/xfn/11">
	
	<title>Công việc của tôi &#8211; ProLancer</title>
<meta name='robots' content='max-image-preview:large' />
	<style>img:is([sizes="auto" ], [sizes^="auto," ]) { contain-intrinsic-size: 3000px 1500px }</style>
         <link rel="stylesheet" href="css/styles.css">
	<link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">
</head>
<style>* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* Container chính */
.container_listCV {
    width: 80%;
    margin: 20px auto;
    margin-right: 50px;
}

/* Header */
.header {
    margin-top: 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 40px;
}

/* Tab danh sách CV */
.tab-active {
    background: transparent;
    border: 2px solid #6c63ff;
    padding: 10px 20px;
    border-radius: 20px;
    font-size: 16px;
    color: #6c63ff;
    cursor: pointer;
}

/* Nút tạo CV */
.create-btn {
    background: #0a0a2b;
    color: white;
    padding: 10px 20px;
    border-radius: 20px;
    font-size: 16px;
    border: 2px solid #0a0a2b;
    cursor: pointer;
}

/* Danh sách CV */
.cv-list {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

/* Thẻ CV */
.cv-card {
    background: #f8f8f8;
    padding: 20px;
    border-radius: 10px;
    border: 1px solid #ddd;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    margin-right:20%;
}

/* Nhóm nút */
.button-group {
    display: flex;
    margin-left: 60px;
    gap: 40px; /* Khoảng cách giữa các nút */
    margin-top: 15px;
}

/* Căn chỉnh kích thước và phong cách nút */
.view-btn, .edit-btn, .delete-btn {
    height: 45px;
    background: #e0e0ff; /* Màu nền nhẹ */
    color: #6c63ff; /* Màu chữ */
    border: none;
    padding: 8px 16px; /* Tăng padding */
    border-radius: 20px; /* Bo tròn đẹp hơn */
    cursor: pointer;
    font-size: 14px;
    transition: all 0.3s ease-in-out;
    min-width: 90px; /* Đảm bảo nút đều nhau */
    text-align: center;
}

/* Hiệu ứng hover */
.view-btn:hover, .edit-btn:hover, .delete-btn:hover {
    background: #6c63ff;
    color: white;
}
    
</style>

<body class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">
	 	
			<!-- Preloading -->
		<div id="preloader">
			<div class="spinner">
				<div class="uil-ripple-css"><div></div><div></div></div>
			</div>
		</div>
		
	<a class="skip-link screen-reader-text" href="#content">Skip to content</a>
			<%@include file="includes/header-login-01.jsp" %>
	<!--Mobile Navigation Toggler-->
	<div class="off-canvas-menu-bar">
	    <div class="container">
	        <div class="row">
	            <div class="col-6 my-auto">
	            <a href="./index.html" class="custom-logo-link" rel="home"><img width="500" height="71" src="../wp-content/uploads/2021/09/logo.png" class="custom-logo" alt="ProLancer" decoding="async" srcset="https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo.png 500w, https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo-300x43.png 300w" sizes="(max-width: 500px) 100vw, 500px" /></a>	            </div>
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
	        <a href="./index.html" class="custom-logo-link" rel="home"><img width="500" height="71" src="../wp-content/uploads/2021/09/logo.png" class="custom-logo" alt="ProLancer" decoding="async" srcset="https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo.png 500w, https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo-300x43.png 300w" sizes="(max-width: 500px) 100vw, 500px" /></a>	        </div>
	        
	        <ul class="navigation"><!--Keep This Empty / Menu will come through Javascript--></ul>
	        				<div class="text-center">
					<a href="./frontend-dashboard/index6f28.html?fed=dashboard" class="prolancer-btn mt-4">
						Dashboard					</a>
				</div>
				    </nav>
	</div>
		<section >
			<div  class="breadcrumbs">
				<div  class="container">
					<div class="row">
						<div class="col-md-12 my-auto">
							
							<ul class="trail-items" itemscope itemtype="http://schema.org/BreadcrumbList"><li class="trail-item trail-begin"><a href="../index.html"><span itemprop="name">Home</span></a><meta itemprop="position" content="1" /></li><li class="trail-item trail-end"><span itemprop="item"><span itemprop="name">Projects</span></span><meta itemprop="position" content="2" /></li></ul>						</div>
							<h1 style="align-items: center;">
								DANH SÁCH CV CỦA TÔI						    </h1>
						</div>
					
				</div>
			</div>	
		</section>
                
        <div class="container_cv">
            <%@include file="../includes/sidebar.jsp" %>
                <div class="container_listCV">
                  
        <div class="header">
            <button class="tab-active">Danh sách CV đã được tạo</button>
            <button class="create-btn">Tạo CV</button>
        </div>

        <div class="cv-list">
            <div class="cv-card">
                <p><strong>Ngày tạo:</strong> **/**/****</p>
                <p><strong>Mã CV:</strong> CV**(01,02,...)</p>
                <div class="button-group">
                    <button class="view-btn">Xem CV</button>
                    <button class="edit-btn">Sửa CV</button>
                    <button class="delete-btn">Xóa CV</button>
                </div>
            </div>

            <div class="cv-card">
                <p><strong>Ngày tạo:</strong> **/**/****</p>
                <p><strong>Mã CV:</strong> CV**(01,02,...)</p>
                <div class="button-group">
                    <button class="view-btn">Xem CV</button>
                    <button class="edit-btn">Sửa CV</button>
                    <button class="delete-btn">Xóa CV</button>
                </div>
            </div>
        </div>
    </div>
            </div>
			<%@include file="includes/footer.jsp" %>

	<!--======= Back to Top =======-->
	<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
</html>
