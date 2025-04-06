<%-- 
    Document   : add-point
    Created on : 4 thg 3, 2025, 09:50:45
    Author     : mac
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
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

        .box ul {
            list-style: none;
            padding-left: 0;
            list-style-type: disc;
            margin-left: 30px;
        }

        .box ul li {
            padding: 5px 0;
            margin-bottom: 18px;
        }
    </style>
</head>

<body style="background-image: url('');
                 background-size: cover;">
<%@include file="includes/header-01.jsp" %>

    <div class="box" >
    <div class="box-header">Điều khoản cộng điểm</div>
    <ul>
        <li>Người dùng xác thực tài khoản bằng liên kết của bên thứ 3 như LinkedIn (+50 điểm)</li>
        <li>Hoàn thành 2 công việc đầu tiên (+30 điểm)</li>
        <li>Seeker hoàn thành đúng hạn (+10 điểm/công việc)</li>
        <li>Nhận đánh giá 5 sao từ khách hàng (+15 điểm)</li>
        <li>Xây dựng hồ sơ đầy đủ, chi tiết (+5 điểm)</li>
        <li>Seeker hoàn thành dự án trước deadline (+15 điểm)</li>
        <li>Được khách hàng thuê lại nhiều lần (+10 điểm)</li>
        <li>Employer trả tiền đúng hạn (+10 điểm/công việc)</li>
        <li>Giới thiệu bạn bè (+15 điểm/người) từ người thứ 2 (+5 điểm/người)</li>
        <li>Tạo tài khoản (+10 điểm)</li>
    </ul>
</div>
    <%@include file="includes/footer.jsp" %>
</body>
</html>
