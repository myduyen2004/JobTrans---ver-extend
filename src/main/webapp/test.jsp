<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xem báo cáo người dùng</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .view-report-container {
            max-width: 800px;
            margin: 60px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .report-item {
            margin-bottom: 20px;
        }

        .report-item label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
            color: #555;
        }

        .report-item .value {
            padding: 10px;
            background-color: #f7f7f7;
            border-radius: 6px;
            border: 1px solid #ddd;
        }

        .btn-container {
            margin-top: 30px;
            text-align: center;
        }

        .btn-container button {
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            margin: 0 10px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .btn-report {
            background-color: #e74c3c;
            color: white;
        }

        .btn-report:hover {
            background-color: #c0392b;
        }

        .btn-confirm {
            background-color: #2ecc71;
            color: white;
        }

        .btn-confirm:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
<div class="view-report-container">
    <h2>Chi tiết báo cáo</h2>

    <div class="report-item">
        <label>Nội dung chi tiết báo cáo:</label>
        <div class="value">${jr.contentReport}</div>
    </div>

    <div class="report-item">
        <label>Người báo cáo:</label>
        <div class="value">${jr.reporterName}</div>
    </div>

    <div class="report-item">
        <label>Tên dự án:</label>
        <div class="value">${jr.projectName}</div>
    </div>

    <div class="report-item">
        <label>Vi phạm nội dung:</label>
        <div class="value">${jr.violationContent}</div>
    </div>

    <div class="btn-container">
        <form action="job" method="post" style="display: inline;">
            <input type="hidden" name="command" value="accuseUser">
            <input type="hidden" name="reportId" value="${jr.reportId}">
            <button type="submit" class="btn-report">Tố cáo người dùng</button>
        </form>

        <form action="job" method="post" style="display: inline;">
            <input type="hidden" name="command" value="confirmReport">
            <input type="hidden" name="reportId" value="${jr.reportId}">
            <button type="submit" class="btn-confirm">Xác nhận báo cáo</button>
        </form>
    </div>
</div>
</body>
</html>
