<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-US">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="profile" href="https://gmpg.org/xfn/11">

	<title>Mẫu CV chuyên nghiệp &#8211; ProLancer</title>
	<meta name='robots' content='max-image-preview:large' />
	<link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<style>
	:root {
		--primary-color: #1a3a8f;
		--secondary-color: #2a56c7;
		--accent-color: #4a7dff;
		--text-dark: #2d3748;
		--text-medium: #4a5568;
		--text-light: #718096;
		--light-bg: #f8fafc;
		--white: #ffffff;
		--border-radius: 8px;
		--box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
		--transition: all 0.3s ease;
	}

	body {
		font-family: 'Inter', sans-serif;
		background-color: var(--light-bg);
		color: var(--text-medium);
		line-height: 1.6;
		margin: 0;
		padding: 0;
	}

	/* Main Container */
	.container_cv {

		margin: 0 auto;
		padding: 20px;
	}

	/* Page Header */
	.page-header {
		text-align: center;
		margin-bottom: 30px;
		padding: 40px 20px;
		background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
		color: white;
		border-radius: var(--border-radius);
	}

	.page-header h1 {
		font-size: 2rem;
		font-weight: 700;
		margin-bottom: 10px;
	}

	.page-header p {
		font-size: 1rem;
		max-width: 700px;
		margin: 0 auto;
		opacity: 0.9;
	}

	/* Horizontal CV Container */
	.cv-horizontal-container {
		width: 1300px;
		margin-left: 80px;
		overflow-x: auto;
		padding: 20px 0;
		margin-bottom: 40px;
	}

	.cv-horizontal-scroll {
		display: inline-flex;
		gap: 20px;
		padding-bottom: 20px;
	}

	/* Compact CV Card */
	.cv-card-compact {
		width: 350px;
		background: var(--white);
		border-radius: var(--border-radius);
		overflow: hidden;
		box-shadow: var(--box-shadow);
		transition: var(--transition);
		flex-shrink: 0;
	}

	.cv-card-compact:hover {
		transform: translateY(-5px);
		box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12);
	}

	/* CV Image */
	.cv-image-container-compact {
		position: relative;
		padding-top: 120%; /* 4:3 aspect ratio */
		overflow: hidden;
	}

	.cv-image-compact {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		object-fit: cover;
		transition: var(--transition);
	}

	.cv-card-compact:hover .cv-image-compact {
		transform: scale(1.03);
	}

	/* CV Info */
	.cv-info-compact {
		padding: 15px;
	}

	.cv-header-compact {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 10px;
	}

	.cv-title-compact {
		font-size: 1.1rem;
		font-weight: 600;
		color: var(--text-dark);
		margin: 0;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	/* Price Tag */
	.cv-price-compact {
		background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
		color: white;
		font-size: 0.75rem;
		padding: 3px 8px;
		border-radius: 20px;
		font-weight: 600;
		margin-left: 8px;
	}

	.cv-description-compact {
		color: var(--text-medium);
		font-size: 0.85rem;
		margin-bottom: 15px;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
		overflow: hidden;
	}

	/* Buttons */
	.button-group-compact {
		display: flex;
		gap: 10px;
	}

	.view-btn-compact, .use-btn-compact {
		flex: 1;
		padding: 8px;
		border-radius: var(--border-radius);
		font-size: 0.8rem;
		font-weight: 500;
		border: none;
		cursor: pointer;
		transition: var(--transition);
		display: flex;
		align-items: center;
		justify-content: center;
		text-decoration: none;
	}

	.view-btn-compact {
		background: transparent;
		color: var(--primary-color);
		border: 1px solid var(--primary-color);
	}

	.use-btn-compact {
		background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
		color: white;
	}

	.view-btn-compact:hover {
		background: var(--primary-color);
		color: white;
	}

	.use-btn-compact:hover {
		background: linear-gradient(to right, var(--secondary-color), var(--accent-color));
	}

	/* Scrollbar styling */
	.cv-horizontal-container::-webkit-scrollbar {
		height: 8px;
	}

	.cv-horizontal-container::-webkit-scrollbar-track {
		background: #f1f1f1;
		border-radius: 10px;
	}

	.cv-horizontal-container::-webkit-scrollbar-thumb {
		background: rgba(42, 86, 199, 0.6);
		border-radius: 10px;
	}

	.cv-horizontal-container::-webkit-scrollbar-thumb:hover {
		background: rgba(42, 86, 199, 0.8);
	}

	/* Navigation arrows */
	.scroll-arrows {
		display: flex;
		justify-content: center;
		gap: 15px;
		margin-top: 15px;
	}

	.scroll-arrow {
		background: var(--white);
		width: 40px;
		height: 40px;
		border-radius: 50%;
		display: flex;
		align-items: center;
		justify-content: center;
		box-shadow: var(--box-shadow);
		cursor: pointer;
		transition: var(--transition);
	}

	.scroll-arrow:hover {
		background: var(--primary-color);
		color: var(--white);
	}

	/* Responsive adjustments */
	@media (max-width: 768px) {
		.page-header {
			padding: 30px 15px;
		}

		.page-header h1 {
			font-size: 1.5rem;
		}

		.cv-card-compact {
			width: 240px;
		}
	}

	@media (max-width: 576px) {
		.page-header {
			padding: 25px 10px;
		}

		.page-header h1 {
			font-size: 1.3rem;
		}

		.cv-card-compact {
			width: 220px;
		}

		.button-group-compact {
			flex-direction: column;
		}
	}
	.banner_title {
		background-image: url(./img/anh1/anh1.png);
		background-size: 100%;
		font-size: 40px;
		height: 200px;
		display: flex;
		margin-top: 15px;
		align-items: center;
	}
	.upload-cv-form {
		background: #f9f9f9;
		padding: 20px;
		border-radius: 12px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		max-width: 400px;

		display: flex;
		flex-direction: column;
		gap: 16px;
		font-family: 'Segoe UI', sans-serif;
	}

	.upload-cv-form input[type="file"] {
		padding: 10px;
		border: 2px dashed #ccc;
		border-radius: 8px;
		background: #fff;
		cursor: pointer;
		transition: border-color 0.3s;
	}

	.upload-cv-form input[type="file"]:hover {
		border-color: #4a90e2;
	}

	.upload-cv-form .custom-file-label {
		font-weight: bold;
		color: #333;
		margin-top: 400px;
	}

	.upload-cv-form .create-btn {
		background: #4a90e2;
		color: white;
		padding: 12px;
		border: none;
		border-radius: 8px;
		font-size: 16px;
		font-weight: bold;
		cursor: pointer;
		transition: background 0.3s;
	}

	.upload-cv-form .create-btn:hover {
		background: #357ab8;
	}


</style>

<body class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">

<%@include file="includes/header-01.jsp"%>

<div class="container_cv">
	<div class="content" id="content">
		<!-- Page Header -->
		<div class="page-header">
			<h1>Mẫu CV Chuyên Nghiệp</h1>
			<p>Chọn từ bộ sưu tập mẫu CV được thiết kế chuyên nghiệp</p>
		</div>

		<!-- Horizontal CV Container -->
		<div class="cv-horizontal-container">
			<div class="cv-horizontal-scroll">
				<c:choose>
					<c:when test="${not empty cvTypes}">
						<c:forEach items="${cvTypes}" var="o">
							<div class="cv-card-compact">
								<div class="cv-image-container-compact">
									<img src="${o.imageCv}" alt="${o.typeName}" class="cv-image-compact">
								</div>
								<div class="cv-info-compact">
									<div class="cv-header-compact">
										<h3 class="cv-title-compact">${o.typeName}</h3>
										<span class="cv-price-compact">Free</span>
									</div>
									<p class="cv-description-compact">${o.description}</p>
									<div class="button-group-compact">
										<a href="cv?action=mauCV&typeId=${o.typeId}" class="view-btn-compact">Xem</a>
										<c:choose>
											<c:when test="${o.typeId == 1}">
												<a href="create-cv1.jsp?typeId=${o.typeId}" class="use-btn-compact">Dùng</a>
											</c:when>
											<c:when test="${o.typeId == 2}">
												<a href="create-cv2.jsp?typeId=${o.typeId}" class="use-btn-compact">Dùng</a>
											</c:when>
											<c:when test="${o.typeId == 3}">
												<a href="create-cv3.jsp?typeId=${o.typeId}" class="use-btn-compact">Dùng</a>
											</c:when>
											<c:when test="${o.typeId == 4}">
												<a href="create-cv4.jsp?typeId=${o.typeId}" class="use-btn-compact">Dùng</a>
											</c:when>
										</c:choose>
									</div>

								</div>


							</div>
						</c:forEach>
						<form class="upload-cv-form" action="cv?action=createPDF" method="post" enctype="multipart/form-data">

							<label for="cvFile" class="custom-file-label">Chọn file CV (PDF)</label>
							<input type="file" name="cvFile" id="cvFile" required />
							<button class="create-btn" type="submit">📤 Tải lên CV</button>
						</form>
					</c:when>
				</c:choose>
			</div>
		</div>


		<!-- Navigation Arrows (optional) -->
		<div class="scroll-arrows">
			<div class="scroll-arrow" onclick="scrollHorizontally(-300)">
				<i class="fas fa-chevron-left"></i>
			</div>
			<div class="scroll-arrow" onclick="scrollHorizontally(300)">
				<i class="fas fa-chevron-right"></i>
			</div>
		</div>
	</div>
</div>

<%@include file="includes/footer.jsp" %>

<script>
	// Horizontal scrolling function
	function scrollHorizontally(amount) {
		const container = document.querySelector('.cv-horizontal-scroll');
		container.scrollBy({
			left: amount,
			behavior: 'smooth'
		});
	}

	// Back to top button functionality
	document.addEventListener("DOMContentLoaded", function () {
		const backToTop = document.getElementById("backtotop");

		function toggleBackToTop() {
			if (window.scrollY > 300) {
				backToTop.classList.add('active');
			} else {
				backToTop.classList.remove('active');
			}
		}

		backToTop.addEventListener("click", function () {
			window.scrollTo({ top: 0, behavior: "smooth" });
		});

		window.addEventListener("scroll", toggleBackToTop);
		toggleBackToTop();
	});
</script>

</html>