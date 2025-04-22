<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            --primary-dark: rgb(21, 32, 112);
            --primary-light: rgb(39, 64, 179);
            --accent: #4caf50;
            --light: #f8f9fa;
            --dark: #343a40;
            --gray: #6c757d;
            --border-radius: 8px;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: #f5f7fb;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .job-header {
            margin: 40px 0;
            padding: 25px;
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
            animation: fadeIn 0.5s ease-in-out;

        }

        .job-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background: var(--primary-gradient);
        }

        .job-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .job-title h1 {
            font-size: 24px;
            color: var(--primary-dark);
            margin-bottom: 10px;
        }

        .job-status {
            background: var(--accent);
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
        }

        .job-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 40px;
        }

        .applicant-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin: 20px 0;
            color: var(--gray);
            font-size: 14px;
        }

        .detail-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .detail-item i {
            color: var(--primary-light);
            margin-right: 10px;
            font-size: 18px;
            width: 24px;
            text-align: center;
        }

        .job-description {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .brand {
            font-size: 24px;
            font-weight: bold;
            letter-spacing: 1px;
            display: flex;
            align-items: center;
        }

        .brand i {
            margin-right: 10px;
            font-size: 28px;
        }

        .search-bar {
            display: flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 30px;
            padding: 8px 15px;
            width: 300px;
            transition: all 0.3s ease;
        }

        .search-bar:focus-within {
            background: rgba(255, 255, 255, 0.3);
            width: 350px;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
        }

        .search-bar input {
            background: transparent;
            border: none;
            color: white;
            outline: none;
            width: 100%;
            padding: 5px 10px;
        }

        .search-bar input::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .search-bar i {
            color: white;
        }

        .greeting-filters {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            align-items: center;
        }

        .filter-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .filter-title {
            font-weight: 600;
            color: #555;
        }

        .filter-options {
            display: flex;
            gap: 10px;
        }

        .filter-option {
            background: #f0f2f5;
            border-radius: 20px;
            padding: 8px 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 14px;
        }

        .filter-option:hover, .filter-option.active {
            background: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            color: white;
            transform: translateY(-2px);
        }

        .greeting-list {
            display: block;
            /*grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));*/
            gap: 25px;
        }

        .greeting-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            transition: all 0.3s ease;
            animation: fadeIn 0.5s ease-out;
            position: relative;
            margin: 30px 0;
        }

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

        .greeting-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(21, 32, 112, 0.15);
        }

        .greeting-status {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            z-index: 1;
        }

        .status-pending {
            background-color: #FFF8E5;
            color: #FFA113;
        }

        .status-interview {
            background-color: #E5F5FF;
            color: #0095FF;
        }

        .status-rejected {
            background-color: #FFE5E5;
            color: #FF4D4F;
        }

        .status-accepted {
            background-color: #E5FFF2;
            color: #00C853;
        }

        .greeting-header {
            padding: 20px;
            background: linear-gradient(to right, rgba(21, 32, 112, 0.9), rgba(39, 64, 179, 0.9));
            color: white;
            position: relative;
        }

        .job-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .job-company {
            font-size: 14px;
            opacity: 0.9;
        }

        .greeting-body {
            padding: 20px;
        }

        .greeting-info {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .info-item {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .info-item i {
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgba(21, 32, 112, 0.1);
            color: rgb(39, 64, 179);
            border-radius: 50%;
        }

        .greeting-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            border-top: 1px solid #eee;
            background: #f9fafc;
        }

        .seeker-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .seeker-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }

        .view-details {
            padding: 8px 15px;
            background: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .view-details:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(21, 32, 112, 0.3);
        }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 40px;
            gap: 5px;
        }

        .page-item {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .page-item:hover, .page-item.active {
            background: linear-gradient(to right, rgb(21, 32, 112), rgb(39, 64, 179));
            color: white;
        }

        .page-nav {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            background: #f0f2f5;
            transition: all 0.3s ease;
        }

        .page-nav:hover {
            background: #e4e6eb;
        }

        /* Animation for cards */
        .greeting-card:nth-child(odd) {
            animation-delay: 0.2s;
        }

        .greeting-card:nth-child(even) {
            animation-delay: 0.4s;
        }

        .pulse {
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(39, 64, 179, 0.4);
            }
            70% {
                box-shadow: 0 0 0 10px rgba(39, 64, 179, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(39, 64, 179, 0);
            }
        }

        .unread-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            width: 12px;
            height: 12px;
            background: #FF4D4F;
            border-radius: 50%;
            border: 2px solid white;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: var(--border-radius);
            background: var(--primary-gradient);
            color: white;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
    </style>
</head>
<body>

<div class="container">

    <section class="job-header">
        <div class="job-title">
            <div>
                <h1>Thiết kế website thương mại điện tử</h1>
                <div class="applicant-meta">
                    <span><i class="fas fa-building"></i> Công ty ABC</span>
                    <span><i class="fas fa-map-marker-alt"></i> Hà Nội</span>
                    <span><i class="fas fa-calendar-alt"></i> Đăng ngày: 15/04/2025</span>
                </div>
            </div>
            <span class="job-status">Đang tuyển</span>
        </div>

        <div class="job-details">
            <div class="detail-item">
                <i class="fas fa-money-bill-wave"></i>
                <div>
                    <strong>Ngân sách:</strong>
                    <p>15.000.000đ - 25.000.000đ</p>
                </div>
            </div>
            <div class="detail-item">
                <i class="fas fa-calendar-check"></i>
                <div>
                    <strong>Hạn ứng tuyển:</strong>
                    <p>30/04/2025</p>
                </div>
            </div>
            <div class="detail-item">
                <i class="fas fa-clock"></i>
                <div>
                    <strong>Thời gian hoàn thành:</strong>
                    <p>45 ngày</p>
                </div>
            </div>
            <div class="detail-item">
                <i class="fas fa-users"></i>
                <div>
                    <strong>Số lượng thành viên:</strong>
                    <p>3 người</p>
                </div>
            </div>
        </div>

        <div class="job-description">
            <h3 style="margin-bottom: 10px;">Mô tả công việc</h3>
            <p>Thiết kế và phát triển website thương mại điện tử với đầy đủ tính năng như giỏ hàng, thanh toán trực tuyến, quản lý sản phẩm và đơn hàng. Yêu cầu sử dụng ReactJS cho frontend và NodeJS cho backend.</p>
        </div>
    </section>

    <div style="text-align: end; margin-bottom: 27px">
        <button class="btn">
            <i class="fas fa-filter"></i> Lọc
        </button>
    </div>

    <div class="greeting-filters">
        <div class="filter-group">
            <div class="filter-title">Trạng thái:</div>
            <div class="filter-options">
                <div class="filter-option active">Tất cả</div>
                <div class="filter-option">Chờ xét duyệt</div>
                <div class="filter-option">Chờ phỏng vấn</div>
                <div class="filter-option">Bị từ chối</div>
                <div class="filter-option">Được nhận</div>
            </div>
        </div>

        <div class="filter-group">
            <div class="filter-title">Sắp xếp:</div>
            <div class="filter-options">
                <div class="filter-option active">Mới nhất</div>
                <div class="filter-option">Giá cao nhất</div>
                <div class="filter-option">Thời gian ngắn nhất</div>
            </div>
        </div>


    </div>


    <div class="greeting-list">
        <!-- Card 1 -->
        <div class="greeting-card pulse">
            <div class="greeting-status status-pending">Chờ xét duyệt</div>
            <div class="greeting-header">
                <div class="job-title">Lập trình viên Front-end</div>
                <div class="job-company">Tech Solutions Inc.</div>
            </div>
            <div class="greeting-body">
                <div class="greeting-info">
                    <div class="info-item">
                        <i class="fas fa-money-bill-wave"></i>
                        <span>Giá đề xuất: 15,000,000 VND</span>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-calendar-alt"></i>
                        <span>Thời gian hoàn thành: 30 ngày</span>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-file-alt"></i>
                        <span>CV: Front-end Developer CV.pdf</span>
                    </div>
                </div>
            </div>
            <div class="greeting-footer">
                <div class="seeker-info">
                    <div class="seeker-avatar">NT</div>
                    <div>
                        <div>Nguyễn Thanh</div>
                    </div>
                </div>
                <button class="view-details">
                    Chi tiết <i class="fas fa-arrow-right"></i>
                </button>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="greeting-card pulse">
            <div class="greeting-status status-interview">Chờ phỏng vấn</div>
            <div class="greeting-header">
                <div class="job-title">UI/UX Designer</div>
                <div class="job-company">Creative Design Studio</div>
            </div>
            <div class="greeting-body">
                <div class="greeting-info">
                    <div class="info-item">
                        <i class="fas fa-money-bill-wave"></i>
                        <span>Giá đề xuất: 20,000,000 VND</span>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-calendar-alt"></i>
                        <span>Thời gian hoàn thành: 45 ngày</span>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-file-alt"></i>
                        <span>CV: UI Designer Portfolio.pdf</span>
                    </div>
                </div>
            </div>
            <div class="greeting-footer">
                <div class="seeker-info">
                    <div class="seeker-avatar">LH</div>
                    <div>
                        <div>Lê Hương</div>
                    </div>
                </div>
                <button class="view-details">
                    Chi tiết <i class="fas fa-arrow-right"></i>
                </button>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="greeting-card pulse">
            <div class="greeting-status status-rejected">Bị từ chối</div>
            <div class="greeting-header">
                <div class="job-title">Data Analyst</div>
                <div class="job-company">Data Insights Group</div>
            </div>
            <div class="greeting-body">
                <div class="greeting-info">
                    <div class="info-item">
                        <i class="fas fa-money-bill-wave"></i>
                        <span>Giá đề xuất: 18,000,000 VND</span>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-calendar-alt"></i>
                        <span>Thời gian hoàn thành: 20 ngày</span>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-file-alt"></i>
                        <span>CV: Data Analysis Expert.pdf</span>
                    </div>
                </div>
            </div>
            <div class="greeting-footer">
                <div class="seeker-info">
                    <div class="seeker-avatar">TM</div>
                    <div>
                        <div>Trần Minh</div>
                    </div>
                </div>
                <button class="view-details">
                    Chi tiết <i class="fas fa-arrow-right"></i>
                </button>
            </div>
        </div>
    </div>

    <div class="pagination">
        <div class="page-nav"><i class="fas fa-chevron-left"></i></div>
        <div class="page-item active">1</div>
        <div class="page-item">2</div>
        <div class="page-item">3</div>
        <div class="page-item">4</div>
        <div class="page-item">5</div>
        <div class="page-nav"><i class="fas fa-chevron-right"></i></div>
    </div>
</div>

<script>
    // Animation for filter options
    const filterOptions = document.querySelectorAll('.filter-option');

    filterOptions.forEach(option => {
        option.addEventListener('click', function() {
            // Remove active class from siblings
            const siblings = this.parentElement.querySelectorAll('.filter-option');
            siblings.forEach(sibling => {
                sibling.classList.remove('active');
            });

            // Add active class to clicked option
            this.classList.add('active');
        });
    });

    // Animation for pagination
    const pageItems = document.querySelectorAll('.page-item');

    pageItems.forEach(item => {
        item.addEventListener('click', function() {
            // Remove active class from all items
            pageItems.forEach(page => {
                page.classList.remove('active');
            });

            // Add active class to clicked item
            this.classList.add('active');
        });
    });

    // Animation for view details button
    const viewButtons = document.querySelectorAll('.view-details');

    viewButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Redirect to detail page (for demo purposes)
            window.location.href = '#greeting-detail';
        });
    });
</script>
</body>
</html>
