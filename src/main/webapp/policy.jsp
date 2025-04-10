<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
    margin-top: 30px;
}

.container_policy {
    display: flex;
    justify-content: center;
    gap: 8%;
    padding: 30px;
}

.box {
    width: 60%;
    background: white;
    border: 2px solid #2E3B82;
    border-radius: 8px;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    margin-left: 6%;
    padding-top: 30px;
    position: relative;
}

.box2 {
    width: 40%;
    background: white;
    border: 2px solid #2E3B82;
    border-radius: 8px;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    margin-right: 6%;
    padding-top: 30px;
    position: relative;
}

.box-header {
    background-color: #2E3B82; /* Màu xanh header */
    color: white;
    font-weight: bold;
    padding: 10px;
    font-size: 16px;
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
    position: relative;
    text-align: left;
    padding-left: 15px;
    border-radius: 30px;
    position: absolute;
    top: -15px;
    
   
}

.box-content {
    padding: 15px;
    
}

.box-content ul {
    list-style-type: disc;
    padding-left: 30px;
    
}

.box-content li {
    margin-bottom: 45px;
    font-weight: bold;
    font-size: 18px;
    color: #ccc;
    
}

    </style>
    <body style="background-image: url('');
                 background-size: cover;">

<div class="container_policy">
    <div class="box">
        <div class="box-header" style="width: 40%; text-align: center; font-size: 19px"  >Hướng dẫn sử dụng</div>
        <div class="box-content" >
            <ul>
                <li><a href="#">Hướng dẫn nạp tiền vào tài khoản</a></li>
                <li><a href="#">Hướng dẫn tạo CV trên hệ thống</a></li>
                <li><a href="#">Hướng dẫn hệ với đối tác</a></li>
                <li><a href="#">Hướng dẫn đánh giá đối tác</a></li>
                <li><a href="#">Hướng dẫn thiết kế profile</a></li>
                <li><a href="#">Hướng dẫn rút tiền về tài khoản</a></li>
                <li><a href="#">Hướng dẫn hủy dự án (Trường hợp bắt buộc)</a></li>
            </ul>
        </div>
    </div>

    <!-- Điều khoản & chính sách -->
    <div class="box2" style="margin-bottom: 20%;">
        <div class="box-header" style="width: 60%; text-align: center; font-size: 19px">Điều khoản & chính sách</div>
        <div class="box-content">
            <ul>
                <li><a href="add-point.jsp">Điều khoản cộng điểm</a></li>
                <li><a href="#">Điều khoản trừ điểm/ block</a></li>
                <li><a href="#">Điều khoản thăng hạng</a></li>
                <li><a href="#">Chính sách hỗ trợ người mới tham gia</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
