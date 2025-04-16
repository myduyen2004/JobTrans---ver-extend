<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
	/* Main Container */
	.container_cv {
		display: flex;
		min-height: calc(100vh - 200px);
		background-color: #f8f9fa;
	}

	/* CV Container */
	.cv-container {
		flex: 1;
		padding: 30px;
		background-color: white;
		border-radius: 8px;
		box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
		margin: 20px;
		max-height: 80vh;
		overflow-y: auto;
		margin-left: 14%;
		margin-right: 14%;
		margin-top: 50px;
		width: 1100px;
	}

	/* Title */
	.cv-title {
		color: #4a4a4a;
		font-size: 24px;
		font-weight: 600;
		margin-bottom: 30px;
		padding-bottom: 10px;
		border-bottom: 2px solid #6c63ff;
		display: inline-block;
	}

	/* CV Card */
	.cv-card {
		display: flex;
		align-items: center;
		background: white;
		border-radius: 8px;
		padding: 20px;
		margin-bottom: 20px;
		box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
		transition: transform 0.3s ease, box-shadow 0.3s ease;
		border-left: 4px solid #6c63ff;
	}

	.cv-card:hover {
		transform: translateY(-3px);
		box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	}

	/* CV Image */
	.cv-image {
		width: 150px;
		height: 200px;
		object-fit: cover;
		border-radius: 6px;
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	}

	/* CV Info */
	.cv-info {
		flex: 1;
		margin-left: 25px;
	}

	.cv-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 15px;
	}

	.cv-description {
		font-size: 18px;
		font-weight: 500;
		color: #333;
		margin-right: 15px;
	}

	/* Price Tag */
	.cv-price {
		background: #6c63ff;
		color: white;
		font-size: 14px;
		padding: 6px 15px;
		border-radius: 20px;
		font-weight: 600;
		white-space: nowrap;
		margin-left: auto;
	}

	.cv-price.free {
		background: #37d67a;
	}

	/* Buttons */
	.button-group {
		display: flex;
		gap: 20px;
		margin-top: 20px;
	}

	.view-btn, .use-btn {
		width: 180px;
		height: 45px;
		border-radius: 6px;
		font-size: 15px;
		font-weight: 500;
		border: none;
		cursor: pointer;
		transition: all 0.3s;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.view-btn {
		background: #f0f0ff;
		color: #6c63ff;
		border: 1px solid #6c63ff;
	}

	.use-btn {
		background: #6c63ff;
		color: white;
	}

	.view-btn:hover {
		background: #6c63ff;
		color: white;
	}

	.use-btn:hover {
		background: #5a52d6;
	}

	/* Scrollbar styling */
	.cv-container::-webkit-scrollbar {
		width: 8px;
	}

	.cv-container::-webkit-scrollbar-track {
		background: #f1f1f1;
		border-radius: 10px;
	}

	.cv-container::-webkit-scrollbar-thumb {
		background: #c1c1c1;
		border-radius: 10px;
	}

	.cv-container::-webkit-scrollbar-thumb:hover {
		background: #a8a8a8;
	}

	/* Back to top button */
	#backtotop {
		display: none;
		position: fixed;
		bottom: 30px;
		right: 30px;
		background: #6c63ff;
		color: white;
		width: 50px;
		height: 50px;
		border-radius: 50%;
		cursor: pointer;
		box-shadow: 0 4px 15px rgba(108, 99, 255, 0.3);
		transition: all 0.3s;
		display: flex;
		align-items: center;
		justify-content: center;
		z-index: 99;
	}

	#backtotop:hover {
		background: #5a52d6;
		transform: translateY(-3px);
		box-shadow: 0 6px 20px rgba(108, 99, 255, 0.4);
	}

	/* Responsive adjustments */
	@media (max-width: 992px) {
		.container_cv {
			flex-direction: column;

		}

		.cv-container {
			margin-left: 0;
			width: auto;
			margin-right: 50px;
		}

		.cv-card {
			flex-direction: column;
			align-items: flex-start;
			height: auto;
		}

		.cv-image {
			margin-bottom: 15px;
		}

		.button-group {
			flex-direction: column;
			gap: 10px;
			width: 100%;
		}

		.view-btn, .use-btn {
			width: 100%;
		}
	}
</style>

<body class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">

<!-- Preloading -->


<%@include file="includes/header-01.jsp"%>


<div class="container_cv">

<div>
	<%@include file="includes/sidebar.jsp"%>
</div>
	<div class="content" id="content">
	<div class="cv-container">
		<h2 class="cv-title">Chọn mẫu CV</h2>

		<c:choose>
			<c:when test="${not empty cvTypes}">
				<c:forEach items="${cvTypes}" var="o">
					<div class="cv-card">
						<img src="${o.imageCv}" alt="" class="cv-image">
						<div class="cv-info">
							<div style="display: flex">
								<p class="cv-description">${o.typeName}</p>

								<span class="cv-price free">${o.priceCv}</span>
							</div>
							<p>${o.description}</p>
							<div class="button-group">
								<a  href="cv?action=mauCV&typeId=${o.typeId}" class="view-btn">Xem mẫu</a>
								<c:choose>
									<c:when test="${o.typeId == 1}">
										<a href="create-cv1.jsp?typeId=${o.typeId}">
											<button class="use-btn">Sử dụng</button>
										</a>
									</c:when>

									<c:when test="${o.typeId == 2}">
										<a href="create-cv2.jsp?typeId=${o.typeId}">
											<button class="use-btn">Sử dụng</button>
										</a>
									</c:when>

									<c:when test="${o.typeId == 3}">
										<a href="create-cv3.jsp?typeId=${o.typeId}">
											<button class="use-btn">Sử dụng</button>
										</a>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>

	</div>
	</div>
</div>
<%@include file="includes/footer.jsp" %>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

<script>
	document.addEventListener("DOMContentLoaded", function () {
		const backToTop = document.getElementById("backtotop");

		function toggleBackToTop() {
			if (window.scrollY > 300) {
				backToTop.style.display = "block";
			} else {
				backToTop.style.display = "none";
			}
		}

		backToTop.addEventListener("click", function () {
			window.scrollTo({ top: 0, behavior: "smooth" });
		});

		window.addEventListener("scroll", toggleBackToTop);

		// Ẩn nút khi mới vào trang
		toggleBackToTop();
	});
</script>

</html>