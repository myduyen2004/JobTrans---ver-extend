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

            width: 280px;
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
            width: 100px;
            height: 100px;


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
        }

        .menu-text {

            font-size: 16px;
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
        .badge {
            margin-left: auto;
            background: var(--secondary);
            color: white;
            font-size: 10px;
            font-weight: 600;
            padding: 2px 6px;
            border-radius: 999px;
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


                <a href="#" class="menu-item">
                    <i class="fas fa-palette menu-icon"></i>
                    <span class="menu-text">Mẫu CV</span>
                </a>

                <a href="#" class="menu-item">
                    <i class="fas fa-pen-fancy menu-icon"></i>
                    <div>
                    <span class="menu-text">Thêm mục</span>
                    </div>
                </a>
                <a href="#" class="menu-item">
                    <i class="fas fa-layer-group menu-icon"></i>
                    <span class="menu-text">Hướng dẫn</span>
                </a>


                <a href="#" id="downloadPdfBtn" class="menu-item"
                  >
                    <i class="fas fa-file-pdf menu-icon"></i>
                    <span class="menu-text">Tải CV (PDF)</span>
                </a>

                <form id="reviewForm" action="cv" method="post" style="display:none;">
                    <input type="hidden" name="action" value="SaveCVload">
                    <input type="hidden" name="cvId" value="13">
                    <input type="hidden" name="reviewLink" id="reviewLink">
                </form>

                <button class="htoggle-btn" onclick="toggleSidebar()">
                    <div  class="menu-title">
                        <span>Thu gọn</span>
                    </div>
                </button>
            </div>
        </nav>

        <button class="mobile-menu-btn" id="mobileMenuBtn">
            <i class="fas fa-bars"></i>
        </button>
    </aside>

    <!-- Main Content Area -->
    <main class="main-content" id="mainContent">
        <!-- Nội dung CV sẽ được hiển thị ở đây -->
        <div class="cv_box">
            <!-- CV content will be here -->
        </div>
    </main>
</div>

<script>
    // Cấu hình Cloudinary
    const cloudinaryConfig = {
        cloudName: 'dnicohhja',
        uploadPreset: 'JobTrans',
        apiKey: '467738894942688'
    };

    // Kiểm tra cấu hình Cloudinary
    function validateCloudinaryConfig() {
        if (!cloudinaryConfig.cloudName) {
            console.error('Cloudinary cloudName is missing');
            return false;
        }
        if (!cloudinaryConfig.uploadPreset) {
            console.error('Cloudinary uploadPreset is missing');
            return false;
        }
        return true;
    }

    // Hiển thị loading indicator
    function showLoadingIndicator() {
        const loadingDiv = document.createElement('div');
        loadingDiv.className = 'loading-overlay';
        loadingDiv.innerHTML = `
            <div style="text-align: center;">
                <div class="spinner-border" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
                <p>Đang tạo và tải lên CV, vui lòng chờ...</p>
            </div>
        `;
        document.body.appendChild(loadingDiv);
        return loadingDiv;
    }

    // Tải xuống PDF
    function downloadPDF(blob, filename) {
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
    }

    // Tạo PDF và tải lên Cloudinary
    async function generatePDF() {
        const loading = showLoadingIndicator();

        try {
            // Xử lý hình ảnh không hợp lệ
            const images = document.querySelectorAll('img');
            let hasInvalidImages = false;

            images.forEach(img => {
                if (!img.src || img.src.includes('null') || img.src.includes('uploads/null')) {
                    console.log('Fixing invalid image source:', img.src);
                    img.src = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=';
                    hasInvalidImages = true;
                }
            });

            if (hasInvalidImages) {
                console.warn('Một số hình ảnh không hợp lệ đã được thay thế bằng placeholder');
            }

            const element = document.querySelector('.cv_box');
            if (!element) {
                throw new Error('Không tìm thấy nội dung CV');
            }

            console.log('Đang tạo PDF...');

            // Lấy năm hiện tại để đặt tên file
            const currentYear = new Date().getFullYear();
            const baseFilename = `My-cv-${currentYear}`;

            const opt = {
                margin: 10,
                filename: `${baseFilename}.pdf`,
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: {
                    scale: 2,
                    logging: true,
                    useCORS: true,
                    allowTaint: true
                },
                jsPDF: {
                    unit: 'mm',
                    format: 'a4',
                    orientation: 'portrait'
                }
            };

            // Tạo PDF từ nội dung CV
            const pdfBlob = await html2pdf()
                .set(opt)
                .from(element)
                .output('blob');

            console.log('PDF đã được tạo thành công');

            // Tạo tên file duy nhất với timestamp
            const timestamp = Date.now();
            const uniqueFilename = `${baseFilename}-${timestamp}.pdf`;

            // Tải PDF lên Cloudinary - Sử dụng widget trực tiếp để tránh lỗi CORS
            console.log('Đang tải PDF lên Cloudinary thông qua widget...');
            const pdfUrl = await uploadWithWidget(pdfBlob, uniqueFilename);

            if (pdfUrl) {
                // Lưu link PDF vào hệ thống và tải xuống
                console.log('Tải lên thành công, URL:', pdfUrl);
                await saveCVReviewLink(pdfUrl);
            }

            // Tải xuống PDF cho người dùng
            downloadPDF(pdfBlob, `${baseFilename}.pdf`);

        } catch (error) {
            console.error("Lỗi:", error);
            alert("Lỗi: " + error.message);
        } finally {
            if (loading) {
                document.body.removeChild(loading);
            }
        }
    }

    // Tải lên Cloudinary
    async function uploadToCloudinary(blob, filename) {
        console.log('Bắt đầu tải lên Cloudinary...');

        if (!validateCloudinaryConfig()) {
            throw new Error('Cấu hình Cloudinary không hợp lệ');
        }

        // Tạo URL cho API Cloudinary
        const url = `https://api.cloudinary.com/v1_1/${cloudinaryConfig.cloudName}/upload`;
        console.log('URL tải lên:', url);

        try {
            // Tạo FormData để gửi file
            const formData = new FormData();
            formData.append('file', blob);
            formData.append('upload_preset', cloudinaryConfig.uploadPreset);

            // Gửi request tải lên trực tiếp qua API
            const response = await fetch(url, {
                method: 'POST',
                body: formData
            });

            // Kiểm tra phản hồi
            if (!response.ok) {
                const errorText = await response.text();
                console.error('Lỗi phản hồi tải lên:', response.status, errorText);
                throw new Error(`Tải lên thất bại với mã lỗi: ${response.status}`);
            }

            // Xử lý phản hồi thành công
            const data = await response.json();
            console.log('Tải lên thành công:', data);
            return data.secure_url;

        } catch (error) {
            console.error('Lỗi tải lên Cloudinary:', error);

            // Nếu có lỗi CORS hoặc lỗi khác, thử phương pháp widget
            console.log('Phát hiện lỗi, thử dùng widget...');
            return await uploadWithWidget(blob, filename);
        }
    }

    // Tải lên bằng widget Cloudinary (phương pháp dự phòng)
    // function uploadWithWidget(blob, filename) {
    //     return new Promise((resolve, reject) => {
    //         try {
    //             if (!validateCloudinaryConfig()) {
    //                 throw new Error('Cấu hình Cloudinary không hợp lệ');
    //             }
    //
    //             console.log('Khởi tạo widget Cloudinary với cloudName:', cloudinaryConfig.cloudName);
    //
    //             // Khởi tạo widget Cloudinary
    //             const widget = cloudinary.createUploadWidget({
    //                 cloudName: cloudinaryConfig.cloudName,
    //                 uploadPreset: cloudinaryConfig.uploadPreset,
    //                 sources: ['local'],
    //                 multiple: false,
    //                 clientAllowedFormats: ['pdf'],
    //                 showAdvancedOptions: false,
    //                 cropping: false,
    //                 maxFileSize: 10000000 // 10MB
    //             }, (error, result) => {
    //                 if (error) {
    //                     console.error('Lỗi widget:', error);
    //                     reject(error);
    //                     return;
    //                 }
    //
    //                 if (result.event === 'success') {
    //                     console.log('Widget tải lên thành công:', result.info.secure_url);
    //                     resolve(result.info.secure_url);
    //                 } else if (result.event === 'close' && !result.info) {
    //                     // Người dùng đóng widget mà không tải lên
    //                     console.warn('Widget đã đóng mà không hoàn thành tải lên');
    //                     resolve(null); // Trả về null thay vì reject để tiếp tục quá trình download
    //                 }
    //             });
    //
    //             // Mở widget và hướng dẫn người dùng
    //             widget.open();
    //             console.log('Widget Cloudinary đã mở, đang chờ người dùng chọn file...');
    //
    //         } catch (error) {
    //             console.error('Lỗi khởi tạo widget:', error);
    //             reject(error);
    //         }
    //     });
    // }

    // Lưu link CV đã tải lên vào hệ thống
    async function saveCVReviewLink(pdfUrl) {
        if (!pdfUrl) {
            console.warn('Không có URL để lưu');
            return false;
        }

        try {
            // Cập nhật giá trị trong form
            document.getElementById('reviewLink').value = pdfUrl;
            const form = document.getElementById('reviewForm');
            const formData = new FormData(form);

            // Gửi dữ liệu để lưu link
            const response = await fetch('cv?action=SaveCVload', {
                method: 'POST',
                body: formData
            });

            // Kiểm tra phản hồi
            if (!response.ok) {
                const errorText = await response.text();
                console.error('Lỗi máy chủ khi lưu link:', errorText);
                throw new Error('Lỗi khi lưu link CV: ' + errorText);
            }

            console.log('Link CV đã được lưu thành công');
            return true;
        } catch (error) {
            console.error('Lỗi khi lưu link CV:', error);
            // Không dừng quá trình nếu việc lưu link thất bại
            console.warn('Link CV có thể chưa được lưu nhưng vẫn tiếp tục tải xuống');
            return false;
        }
    }

    // Toggle sidebar
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        sidebar.classList.toggle('sidebar-collapsed');

        const icon = document.querySelector('#toggle-icon i');
        if (icon) {
            icon.classList.toggle('fa-chevron-left');
            icon.classList.toggle('fa-chevron-right');
        }

        const toggleText = document.getElementById('toggle-icon');
        if (toggleText) {
            toggleText.innerHTML = icon.classList.contains('fa-chevron-left')
                ? '<i class="fa fa-chevron-left"></i> Thu gọn'
                : '<i class="fa fa-chevron-right"></i> Mở rộng';
        }
    }

    // Xử lý responsive menu và khởi tạo
    document.addEventListener('DOMContentLoaded', function () {
        const mobileMenuBtn = document.getElementById('mobileMenuBtn');
        const sidebar = document.getElementById('sidebar');
        const downloadBtn = document.getElementById('downloadPdfBtn');

        // Kiểm tra kích thước màn hình để điều chỉnh sidebar
        function checkScreenSize() {
            if (window.innerWidth <= 768) {
                if (mobileMenuBtn) mobileMenuBtn.style.display = 'block';
                if (sidebar) sidebar.classList.add('sidebar-collapsed');
            } else {
                if (mobileMenuBtn) mobileMenuBtn.style.display = 'none';
                if (sidebar) sidebar.classList.remove('sidebar-collapsed');
            }
        }

        // Gọi lần đầu và đăng ký sự kiện resize
        checkScreenSize();
        window.addEventListener('resize', checkScreenSize);

        // Xử lý sự kiện menu mobile
        if (mobileMenuBtn) {
            mobileMenuBtn.addEventListener('click', function () {
                if (sidebar) sidebar.classList.toggle('sidebar-open');
            });
        }

        // Đăng ký sự kiện click cho nút tải PDF
        if (downloadBtn) {
            downloadBtn.addEventListener('click', function(e) {
                e.preventDefault();
                generatePDF().catch(error => {
                    console.error('Lỗi trong quá trình tạo PDF:', error);
                    alert('Lỗi: ' + error.message);
                });
            });
        } else {
            console.error('Không tìm thấy nút tải PDF');
        }
    });
</script>
</body>
</html>