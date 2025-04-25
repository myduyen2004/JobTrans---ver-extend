<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
	.footer {
		width: 100%;
		background: linear-gradient(to right, rgba(15, 27, 99, 0.95), rgba(25, 37, 109, 0.88));
		color: white;
		padding: 60px 0 40px;
		position: relative;
		overflow: hidden;
		margin-bottom: 0;
	}

	.footer-container {
		max-width: 1200px;
		margin: 0 auto;
		padding: 0 20px;
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		gap: 40px;
	}

	.footer-logo {
		display: flex;
		flex-direction: column;
		align-items: flex-start;
	}

	.footer-logo img {
		width: 120px;
		height: 120px;
		object-fit: contain;
		margin-bottom: 20px;
	}

	.copyright {
		font-size: 16px;
		opacity: 0.9;
		margin-top: 20px;
	}

	.footer-section {
		display: flex;
		flex-direction: column;
	}

	.footer-title {
		font-family: 'Inter', sans-serif;
		font-weight: 600;
		font-size: 22px;
		margin-bottom: 25px;
		position: relative;
		padding-bottom: 10px;
	}

	.footer-title:after {
		content: '';
		position: absolute;
		bottom: 0;
		left: 0;
		width: 40px;
		height: 3px;
		background: rgba(255, 255, 255, 0.6);
	}

	.footer-links {
		display: flex;
		flex-direction: column;
		gap: 12px;
	}

	.footer-link {
		color: white;
		text-decoration: none;
		font-size: 17px;
		font-weight: 300;
		transition: all 0.3s ease;
		opacity: 0.85;
	}

	.footer-link:hover {
		opacity: 1;
		transform: translateX(5px);
	}

	@media (max-width: 768px) {
		.footer-container {
			grid-template-columns: 1fr;
			text-align: center;
		}

		.footer-logo {
			align-items: center;
			margin-bottom: 30px;
		}

		.footer-title:after {
			left: 50%;
			transform: translateX(-50%);
		}
	}
</style>
<footer class="footer">
	<div class="footer-container">
		<div class="footer-logo">
			<img src="http://localhost:8080/JobTrans/img/logo/logo.png" alt="JobTrans Logo">
			<div class="copyright">Copyright © 2025 JobTrans All Rights Reserved.</div>
		</div>

		<div class="footer-section">
			<h3 class="footer-title">Danh mục</h3>
			<div class="footer-links">
				<a href="#" class="footer-link">Marketing</a>
				<a href="#" class="footer-link">Công nghệ & IT</a>
				<a href="#" class="footer-link">Design</a>
				<a href="#" class="footer-link">Dịch thuật</a>
				<a href="#" class="footer-link">Khác</a>
			</div>
		</div>

		<div class="footer-section">
			<h3 class="footer-title">Điều khoản, chính sách</h3>
			<div class="footer-links">
				<a href="#" class="footer-link">Quy chế tính điểm uy tín</a>
				<a href="#" class="footer-link">Điều khoản, quy định</a>
			</div>

			<h3 class="footer-title" style="margin-top: 30px;">Cộng đồng</h3>
			<div class="footer-links">
				<a href="#" class="footer-link">Facebook</a>
				<a href="#" class="footer-link">LinkedIn</a>
			</div>
		</div>
	</div>
</footer>