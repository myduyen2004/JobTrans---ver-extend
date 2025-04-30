<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV Builder Pro</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <script src="https://upload-widget.cloudinary.com/global/all.js" type="text/javascript"></script>

    <style>
        :root {
            --primary: #4F46E5;
            --primary-light: #EEF2FF;
            --primary-dark: #4338CA;
            --secondary: #10B981;
            --dark: #1F2937;
            --light: #F9FAFB;
            --gray: #6B7280;
            --gray-light: #E5E7EB;
            --border: #D1D5DB;
            --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.1);
            --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 10px 25px rgba(0, 0, 0, 0.1);
            --transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--light);
            color: var(--dark);
            line-height: 1.5;
        }

        /* Layout Structure */
        .app-container {
            display: flex;
        }

        /* Sidebar Styles */
        .sidebarCV {
            margin-top: 5px;
            margin-left: 10px;

            display: flex;
            flex-direction: column;
            transition: var(--transition);
            z-index: 50;
            margin-bottom: 20px;
        }

        .sidebar-collapsed {
            width: 80px;
        }

        .sidebar-header {
            padding: 20px;
            border-bottom: 1px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 700;
            font-size: 20px;
            color: var(--primary);
            white-space: nowrap;
        }

        .logo-icon {
            font-size: 24px;
            color: var(--primary);
        }

        .sidebar-menu {
            flex: 1;
            padding: 16px 0;
            overflow-y: auto;
            position: fixed;
        }

        .menu-section {
            margin-bottom: 24px;
        }

        .menu-title {
            padding: 8px 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: var(--gray);
            display: flex;
            align-items: center;

        }

        .menu-title span {
            font-size: 20px;
            padding-left: 40px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            margin: 30px 8px;
            border-radius: 8px;
            cursor: pointer;
            transition: var(--transition);
            background: linear-gradient(to right, #152070, #2740b3);
            text-decoration: none;
            white-space: nowrap;
            flex-direction: column;
            border: 1px solid wheat;
            width: 90px;
            height: 90px;


        }

        .menu-item:hover {

            background: #2a3b70;
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
            color: #2B3D9F;
            margin-right: 40px;
        }

        .menu-item.active {
            background-color: var(--primary-light);
            color: var(--primary);
            font-weight: 500;
        }

        .menu-icon {
            width: 24px;
            font-size: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 16px;
            transition: var(--transition);
            margin-top: 9px;
            margin-left: 19px;
            margin-bottom: 9px;
            color: whitesmoke;
        }

        .menu-text {

            font-size: 12px;
            font-weight: 500;
            color: white;
            transition: var(--transition);
        }

        .menu-text:hover{
            color: #ffd700; /* Vàng nhạt để tạo điểm nhấn */
            transform: scale(1.05);
        }

        .sidebar-collapsed .menu-text,
        .sidebar-collapsed .menu-title span {
            opacity: 0;
            width: 0;
            height: 0;
            overflow: hidden;
            display: none;
        }

        .sidebar-collapsed .menu-item {
            justify-content: center;
            padding: 12px 0;
            margin: 0 12px;
        }

        .sidebar-collapsed .menu-icon {
            margin-right: 0;
            font-size: 20px;
        }



        .htoggle-btn {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 12px;
            border-radius: 8px;
            background: transparent;
            border: none;
            cursor: pointer;
            color: var(--gray);
            transition: var(--transition);

        }

        .toggle-btn:hover {
            background: var(--primary-light);
            color: var(--primary);
        }

        .toggle-icon {
            font-size: 16px;
            transition: var(--transition);
        }

        .sidebar-collapsed .toggle-icon {
            transform: rotate(180deg);
        }

        /* Main Content Area */
        .main-content {
        }

        .sidebar-collapsed ~ .main-content {
            margin-left: 80px;
        }

        /* Loading Indicator */
        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            color: white;
            font-size: 20px;
        }

        .spinner-border {
            display: inline-block;
            width: 2rem;
            height: 2rem;
            vertical-align: text-bottom;
            border: 0.25em solid currentColor;
            border-right-color: transparent;
            border-radius: 50%;
            animation: spinner-border .75s linear infinite;
        }

        @keyframes spinner-border {
            to { transform: rotate(360deg); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
                z-index: 100;
            }

            .sidebar-open {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
            }

            .mobile-menu-btn {
                display: block;
                top: 16px;
                left: 16px;
                z-index: 90;
                background: white;
                border: 1px solid var(--border);
                border-radius: 8px;
                padding: 8px;
                box-shadow: var(--shadow-sm);
            }
        }

        /* Badge for new features */
        .template {
            padding: 1rem;
            background-color: #f9f9f9;
            border-radius: 8px;
            width: 350px;
            margin: 55px auto;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-left: 140px;
            height: auto;
            border: 1px solid #0b1638;
        }

        .template-heading {

            /*margin-bottom: 2rem;*/
            font-size: 1.5rem;

            position: relative;
            padding-bottom: 15px;

            padding: 10px;
            background:whitesmoke;
            color: #0b1638;
            padding-top: 6px;
            background-color: whitesmoke;


        }

        .template-heading:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 25%;
            transform: translateX(-50%);
            width: 140px;
            height: 3px;
            background: linear-gradient(90deg, #3498db, #2ecc71);
        }

          .template-container {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
            justify-content: center;
            width: 100%;

        }

        .template-card {
            width: 140px;

            margin-top: 20px;
            /*overflow: hidden;*/

            transition: all 0.3s ease;
            cursor: pointer;
        }

        .template-card:hover {
            transform: translateY(-10px);

        }

        .template-card img {
            width: 100%;
            height: 100%;
            display: block;
            border-bottom: 1px solid #eee;
            border-radius: 10px;

        }

        .template-card p {
            padding: 1rem;
            text-align: center;
            font-size: 1.1rem;
            font-weight: 500;
            color: #333;
            margin: 0;
        }

        /* Animation khi hover */
        .template-card img {
            transition: transform 0.5s ease;
        }

        .template-card:hover img {
            transform: scale(1.05);
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .template-container {
                gap: 1.5rem;
            }

            .template-card {
                width: 230px;
            }

            .template-heading {
                font-size: 1.8rem;
            }
        }

        @media (max-width: 480px) {
            .template {
                padding: 1.5rem;
            }

            .template-card {
                width: 100%;
                max-width: 320px;
            }
        }
    </style>
</head>
<body>
<div class="app-container">
    <!-- Sidebar Navigation -->
    <aside class="sidebarCV" id="sidebar">
        <nav class="sidebar-menu">
            <div class="menu-section">
            </div>

            <div class="menu-section">


                <a id="cvTemplateBtn" href="#" class="menu-item">
                    <i class="fas fa-palette menu-icon"></i>
                    <span class="menu-text">Mẫu CV</span>
                </a>

                <a href="#" class="menu-item">
                    <i class="fas fa-pen-fancy menu-icon"></i>
                    <div>
                        <span class="menu-text">Thêm mục</span>
                    </div>
                </a>
                <a href="#" class="menu-item" id="cvInstructionBtn">
                    <i class="fas fa-layer-group menu-icon"></i>
                    <span class="menu-text">Hướng dẫn</span>
                </a>


                <a href="#" id="downloadPdfBtn" class="menu-item"
                >
                    <i class="fas fa-file-pdf menu-icon"></i>
                    <span class="menu-text">Tải CV pdf</span>
                </a>

                <form id="reviewForm" action="cv" method="post" style="display:none;">
                    <input type="hidden" name="action" value="SaveCVload">
                    <input type="hidden" name="cvId" value="13">
                    <input type="hidden" name="reviewLink" id="reviewLink">
                </form>

            </div>
        </nav>

<%--        <button class="mobile-menu-btn" id="mobileMenuBtn">--%>
<%--            <i class="fas fa-bars"></i>--%>
<%--        </button>--%>
    </aside>
    <div id="cvTemplates" style="display: none;">
        <!-- Các mẫu CV sẽ được chèn ở đây bằng JS -->
    </div>
    <div id="cvInstructions" style="display: none;">
        <!-- Nội dung hướng dẫn sẽ được hiển thị tại đây -->
    </div>
    <!-- Main Content Area -->
    <main class="main-content" id="mainContent">
        <!-- Nội dung CV sẽ được hiển thị ở đây -->
        <div class="cv_box">
            <!-- CV conte will be here -->
        </div>
    </main>
</div>

</body>
<script>
    document.getElementById("cvTemplateBtn").addEventListener("click", function (e) {
        e.preventDefault();

        const container = document.getElementById("cvTemplates");
        const instructionContainer = document.getElementById("cvInstructions");


        if (container.style.display === "block") {
            // Nếu đang hiển thị, ẩn đi
            container.style.display = "none";
        } else {
            instructionContainer.style.display = "none";
            // Nếu đang ẩn, hiển thị nội dung
            container.innerHTML = `
            <div class="template">
            <h2 class="template-heading">Chọn mẫu CV</h2>
               <span style="padding-left: 15px; color:gray" >Lựa chọn mẩu cv phù hợp với công việc, sở thích của bạn.</span>
            <div class="template-container">
                <div class="template-card">
                    <img   src="img/cv-template1.png" >
                    <a href="create-cv1.jsp?typeId=1">Mẩu 1</a>
                </div>
                <div class="template-card">
                    <img src="img/cv-template2.png" >
                    <a href="create-cv2.jsp?typeId=2">Mẩu 2</a>
                </div>
                 <div class="template-card">
                    <img src="img/cv-template2.png" >
                    <p>Mẫu CV 2</p>
                </div>
            </div>
</div>
        `;
            container.style.display = "block";
        }
    });
    document.getElementById("cvInstructionBtn").addEventListener("click", function (e) {
        e.preventDefault();

        const instructionContainer = document.getElementById("cvInstructions");
        const templateContainer = document.getElementById("cvTemplates");

        // Nếu đang hiện thì ẩn
        if (instructionContainer.style.display === "block") {
            instructionContainer.style.display = "none";
        } else {
            // Ẩn template nếu đang mở
            templateContainer.style.display = "none";

            // Gán nội dung hướng dẫn
            instructionContainer.innerHTML = `
        <div class="template">
            <h2 class="template-heading">Hướng dẫn tạo CV</h2>
              <span style="padding-left: 15px; color:gray" > Để xem gợi ý cho mục khác, vui lòng click vào mục tương ứng trong CV </span>
            <ul style="padding: 10px 20px; font-size: 15px; line-height: 1.8;">
                <li>Bước 1: Chọn mẫu CV phù hợp.</li>
                <li>Bước 2: Nhập thông tin cá nhân, học vấn, kinh nghiệm, kỹ năng,...</li>
                <li>Bước 3: Xem trước và tải về dưới dạng PDF.</li>
                <li>Bước 4: Gửi CV tới nhà tuyển dụng.</li>
            </ul>
        </div>
        `;
            instructionContainer.style.display = "block";
        }
    });
    // document.getElementById("careerGoalTitle").addEventListener("click", function () {
    //     const container = document.getElementById("cvTemplates");
    //     container.innerHTML = `
    //     <div class="template">
    //         <h2 class="template-heading">Hướng dẫn viết Mục tiêu nghề nghiệp</h2>
    //         <div style="padding: 20px; color: #333; line-height: 1.6">
    //             <p><strong>Mục tiêu ngắn hạn:</strong> Nêu rõ bạn muốn học hỏi và phát triển kỹ năng gì trong 6 tháng đến 1 năm đầu làm việc.</p>
    //             <p><strong>Mục tiêu dài hạn:</strong> Mô tả định hướng sự nghiệp bạn muốn đạt được trong 3-5 năm tới.</p>
    //             <p><strong>Lưu ý:</strong> Hãy viết mục tiêu rõ ràng, thực tế và phù hợp với vị trí ứng tuyển.</p>
    //         </div>
    //     </div>
    //     `;
    //     container.style.display = "block";
    // });
</script>
</html>