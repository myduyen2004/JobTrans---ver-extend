<%-- 
    Document   : diem_tru
    Created on : 4 thg 3, 2025, 10:22:44
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

       .box {
            width: 60%;
            background: white;
            border: 2px solid #2E3B82;
            border-radius: 10px;
            padding: 20px;
            position: relative;
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 50px auto;
            margin-right: 30%;
        }

        .box-header {
            background-color: #2E3B82;
            color: white;
            font-weight: bold;
            padding: 5px 40px;
            font-size: 19px;
            border-radius: 20px;
            position: absolute;
            top: -18px;
            left: 20px;
            
        }

        .section-title {
            background-color:#2E3B82;
            color: white;
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 20px;
            display: inline-block;
            margin: 10px 0;
            margin-left: 10px;
        }

        .box ul {
            list-style: none;
            padding: 0px 40px;
            list-style-type: disc;
        }

        .box ul li {
            padding: 5px 0;
        }
        .box_in{
            border: solid 2px #2E3B82 ;
            
            margin-top: 20px;
            width: 80%;
            padding: 5px 10px;
            border-radius: 20px;
        }
    </style>
</head>
<body style="background-image: url('img/anh_background_CV/anh5.webp');
                 background-size: cover;">

<div class="box">
    <div class="box-header">Điều khoản trừ điểm</div>
     
    <div class="box_in">
    <p class="section-title">Trường hợp bị báo cáo vi phạm người dùng:</p>
    <ul>
        <li>Dùng từ thô thiển, vi phạm chuẩn mực (-20 điểm/ 1 lần)</li>
        <li>Giả mạo (block)</li>
        <li>Spam liên tục (-30 điểm)</li>
        <li>Bán lại hoặc tiết lộ thông tin khách hàng trái phép (block)</li>
    </ul>
    </div>
    <div class="box_in">
    <p class="section-title">Đối tác khiếu nại lúc đang làm việc:</p>
    <ul>
        <li>Thái độ làm việc (-20 điểm)</li>
        <li>Quá hạn làm việc (-30 điểm)</li>
        <li>Đạo văn (-30 điểm)</li>
        <li>Tiết lộ thông tin (-30 điểm)</li>
        <li>Sản phẩm kém chất lượng (-30 điểm)</li>
    </ul>
    </div>
    <div class="box_in">
    <p class="section-title">Phản hồi trả tiền chậm khi đến hạn (Employer):</p>
    <ul>
        <li>Nhắc lần đầu (cảnh cáo -5 điểm)</li>
        <li>Nhắc lần 2 (-30 điểm) sau 5 ngày : gắn nhãn cảnh báo</li>
    </ul>
    </div>
</div>

</body>
</html>
