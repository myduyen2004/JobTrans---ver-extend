<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Báo Cáo Vi Phạm</title>
    <style>

        body {
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 800px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }

        .header {
            background: linear-gradient(to right, rgb(21, 42, 105), rgb(54, 75, 140));
            color: white;
            padding: 25px 30px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 8px;
            position: relative;
            z-index: 1;
        }

        .header p {
            font-size: 16px;
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }

        .header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
            animation: shimmer 8s infinite linear;
            pointer-events: none;
        }

        @keyframes shimmer {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .form-content {
            padding: 30px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
            overflow: hidden;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
            font-size: 15px;
        }

        .form-group select,
        .form-group textarea,
        .form-group input[type="file"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 15px;
            color: #333;
            background-color: #f9f9f9;
            transition: all 0.3s ease;
        }

        .form-group select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23333' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 16px;
        }

        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: rgb(54, 75, 140);
            box-shadow: 0 0 0 3px rgba(54, 75, 140, 0.1);
            background-color: #fff;
        }

        .form-group textarea {
            min-height: 120px;
            resize: vertical;
        }

        .form-group .file-input-wrapper {
            position: relative;
            display: inline-block;
            width: 100%;
        }

        .file-input-label {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 12px 20px;
            background: linear-gradient(to right, rgb(21, 42, 105), rgb(54, 75, 140));
            color: white;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            text-align: center;
            margin-top: 10px;
        }

        .file-input-label:hover {
            background: linear-gradient(to right, rgb(30, 55, 125), rgb(65, 90, 165));
        }

        .file-input-label svg {
            margin-right: 8px;
        }

        .file-input {
            position: absolute;
            left: -9999px;
        }

        #file-name {
            margin-top: 10px;
            font-size: 14px;
            color: #555;
            font-style: italic;
        }

        .submit-btn {
            background: linear-gradient(to right, rgb(21, 42, 105), rgb(54, 75, 140));
            color: white;
            border: none;
            border-radius: 6px;
            padding: 14px 25px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(21, 42, 105, 0.2);
            position: relative;
            overflow: hidden;
        }

        .submit-btn:hover {
            background: linear-gradient(to right, rgb(30, 55, 125), rgb(65, 90, 165));
            box-shadow: 0 6px 20px rgba(21, 42, 105, 0.3);
        }

        .submit-btn:active {
            transform: translateY(2px);
        }

        .submit-btn::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 5px;
            height: 5px;
            background: rgba(255, 255, 255, 0.5);
            opacity: 0;
            border-radius: 100%;
            transform: scale(1);
            transition: 0.9s;
        }

        .submit-btn:active::after {
            opacity: 1;
            transform: scale(25);
            transition: 0s;
        }

        /* Animation for form elements */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-group {
            animation: fadeIn 0.5s ease forwards;
            opacity: 0;
        }

        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }
        .form-group:nth-child(4) { animation-delay: 0.4s; }

        .submit-container {
            display: flex;
            justify-content: center;
            animation: fadeIn 0.5s ease forwards;
            animation-delay: 0.5s;
            opacity: 0;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                max-width: 95%;
            }

            .header {
                padding: 20px 15px;
            }

            .header h1 {
                font-size: 24px;
            }

            .form-content {
                padding: 20px 15px;
            }
        }
    </style>
    <style>
        .progress-section {
            margin: 30px 0;
            padding: 0 10px;
        }

        .progress-title {
            font-weight: 500;
            font-size: 16px;
            color: #1a2b5f;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
        }

        .progress-percentage {
            color: #6787fe;
            font-weight: 700;
        }

        .progress {
            height: 12px;
            border-radius: 10px;
            background-color: #e9ecef;
            overflow: hidden;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .progress-bar {
            background: linear-gradient(to right, #6787fe, #9dabff);
            border-radius: 10px;
            transition: width 1.5s ease;
            position: relative;
        }

        .progress-milestones {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
            position: relative;
            padding: 0 1%;
        }

        .milestone {
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
            width: 18%;
            text-align: center;
        }

        .milestone-dot {
            width: 12px;
            height: 12px;
            background-color: #c6d0f5;
            border-radius: 50%;
            margin-bottom: 6px;
            position: relative;
            z-index: 2;
            transition: all 0.3s ease;
        }

        .milestone.active .milestone-dot {
            background-color: #6787fe;
            box-shadow: 0 0 0 3px rgba(103, 135, 254, 0.2);
        }

        .milestone-label {
            font-size: 12px;
            color: #728095;
            transition: all 0.3s ease;
        }

        .milestone.active .milestone-label {
            color: #1a2b5f;
            font-weight: 500;
        }

    </style>
</head>
<%@include file="includes/header-01.jsp"%>

<body>
<div class="container">
    <div class="header">
        <h1>Báo Cáo Vi Phạm</h1>
        <h4>Đối tác ${account.accountName} vi phạm trong công việc "${job.jobTitle}"</h4>
        <p>Vui lòng điền đầy đủ thông tin để chúng tôi xử lý nhanh chóng</p>
    </div>
    <div class="progress-section">
        <div class="progress-title">
            <span>Trạng thái báo cáo</span>
                <span class="progress-percentage">25%</span>
        </div>

        <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>

        </div>
        <div class="progress-milestones">
            <div class="milestone active">
                <div class="milestone-dot"></div>
                <div class="milestone-label">Tạo báo cáo</div>
            </div>
            <div class="milestone active">
                <div class="milestone-dot"></div>
                <div class="milestone-label">Chờ xử lí</div>
            </div>
            <div class="milestone active">
                <div class="milestone-dot"></div>
                <div class="milestone-label">Kết quả xử lí</div>
            </div>
        </div>
    </div>

    <div class="form-content">
        <form id="report-form" action="job-manage-process" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="jobId" value="${job.jobId}">
            <input type="hidden" name="accountId" value="${account.accountId}">
            <div class="form-group">
                <label for="violation-type">Tiêu chí vi phạm</label>
                <select id="violation-type" name="violationType" required>
                    <option value="" disabled selected>Chọn loại vi phạm</option>
                    <c:forEach var="criteria" items="${criteriaList}">
                        <option value="${criteria.criteriaId}">${criteria.content}</option>
                    </c:forEach>
                </select>
            </div>


            <div class="form-group">
                <label for="violation-details">Nội dung vi phạm</label>
                <textarea id="violation-details" name="content" placeholder="Mô tả chi tiết về hành vi vi phạm..." required></textarea>
            </div>

            <div class="form-group">
                <label for="evidence">Bằng chứng</label>
                <div class="file-input-wrapper" style="width: 30%">
                    <input type="file" id="evidence" class="file-input" name="evidences" multiple>
                    <label for="evidence" class="file-input-label" style="color: whitesmoke">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                            <polyline points="17 8 12 3 7 8"></polyline>
                            <line x1="12" y1="3" x2="12" y2="15"></line>
                        </svg>
                        Tải lên tệp bằng chứng
                    </label>
                    <div id="file-name"></div>
                </div>
            </div>

            <div class="submit-container">
                <button type="submit" class="submit-btn">Gửi báo cáo</button>
            </div>
        </form>
    </div>
</div>

<script>

</script>
</body>
</html>