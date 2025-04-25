<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
    /* Thiết lập cơ bản */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', Arial, sans-serif;
    }

    /* Container chính */
    .container_listCV {
        width: 85%;
        margin: 20px auto;
        animation: fadeIn 0.8s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Header */
    .header {
        margin-top: 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 40px;
        position: relative;
    }

    /* Tab danh sách CV */
    .tab-active {
        background: rgba(255, 255, 255, 0.8);
        border: 2px solid rgb(21, 42, 105);
        padding: 12px 24px;
        border-radius: 30px;
        font-size: 16px;
        color: rgb(21, 42, 105);
        cursor: pointer;
        font-weight: 600;
        margin-top: 20px;
        margin-bottom: 20px;
        box-shadow: 0 4px 8px rgba(21, 42, 105, 0.2);
        display: flex;
        align-items: center;
        transition: all 0.3s ease;
    }

    .tab-active:before {
        content: "\f022"; /* Font Awesome list icon */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        margin-right: 10px;
        font-size: 18px;
    }

    .tab-active:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(21, 42, 105, 0.3);
    }

    /* Nút tạo CV */
    .create-btn {
        background: linear-gradient(to right, rgb(21, 42, 105), rgb(54, 75, 140));
        color: white;
        padding: 14px 30px;
        border-radius: 50px;
        font-size: 16px;
        font-weight: 600;
        border: none;
        cursor: pointer;
        transition: all 0.4s ease;
        box-shadow: 0 4px 15px rgba(21, 42, 105, 0.4);
        display: inline-block;
        position: relative;
        overflow: hidden;
        z-index: 1;
    }

    .create-btn:before {
        content: "";
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(to right, rgb(54, 75, 140), rgb(86, 114, 194));
        transition: all 0.4s ease-in-out;
        z-index: -1;
    }

    .create-btn:hover:before {
        left: 0;
    }

    .create-btn:hover {
        box-shadow: 0 6px 20px rgba(21, 42, 105, 0.6);
        transform: translateY(-3px);
    }

    .create-btn:after {
        content: "\f067"; /* Font Awesome plus icon */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        margin-left: 10px;
    }

    /* Danh sách CV */
    .cv-list {
        display: flex;
        flex-direction: column;
        gap: 25px;
        margin-bottom: 40px;
    }

    /* Thẻ CV */
    .cv-card {
        background: linear-gradient(135deg, #f8f9ff 0%, #eef1f8 100%);
        padding: 25px;
        border-radius: 15px;
        border: 1px solid #e0e6f5;
        box-shadow: 0 10px 20px rgba(21, 42, 105, 0.08);
        margin-right: 0;
        position: relative;
        overflow: hidden;
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    }

    .cv-card:before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 5px;
        background: linear-gradient(to right, rgb(21, 42, 105), rgb(54, 75, 140));
    }

    .cv-card:hover {
        background: #ffffff;
        border-color: #d0d9f0;
        box-shadow: 0 15px 30px rgba(21, 42, 105, 0.15);
        transform: translateY(-8px);
    }

    .cv-card p {
        margin-bottom: 12px;
        color: #555;
        font-size: 15px;
        position: relative;
        padding-left: 28px;
    }

    .cv-card p strong {
        color: rgb(21, 42, 105);
        font-weight: 600;
    }

    /* Add icons for the CV info */
    .cv-card p:nth-child(1):before {
        content: "\f073"; /* Font Awesome calendar icon */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        position: absolute;
        left: 0;
        color: rgb(54, 75, 140);
    }

    .cv-card p:nth-child(2):before {
        content: "\f2bb"; /* Font Awesome ID card icon */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        position: absolute;
        left: 0;
        color: rgb(54, 75, 140);
    }

    /* Nhóm nút */
    .button-group {
        display: flex;
        gap: 15px;
        margin-top: 20px;
        justify-content: flex-end;
    }

    /* Căn chỉnh kích thước và phong cách nút */
    .view-btn, .edit-btn, .delete-btn {
        height: 45px;
        padding: 0 20px;
        border-radius: 50px;
        cursor: pointer;
        font-size: 14px;
        font-weight: 600;
        transition: all 0.3s ease;
        min-width: 110px;
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
        border: none;
    }

    .view-btn {
        background: rgba(21, 42, 105, 0.1);
        color: rgb(21, 42, 105);
    }

    .view-btn:before {
        content: "\f06e"; /* Font Awesome eye icon */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        margin-right: 8px;
    }

    .edit-btn {
        background: rgba(54, 75, 140, 0.1);
        color: rgb(54, 75, 140);
    }

    .edit-btn:before {
        content: "\f044"; /* Font Awesome edit icon */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        margin-right: 8px;
    }

    .delete-btn {
        background: rgba(220, 53, 69, 0.1);
        color: #dc3545;
    }

    .delete-btn:before {
        content: "\f2ed"; /* Font Awesome trash icon */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        margin-right: 8px;
    }

    .view-btn:hover, .edit-btn:hover, .delete-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
    }

    .view-btn:hover {
        background: rgb(21, 42, 105);
        color: white;
    }

    .edit-btn:hover {
        background: rgb(54, 75, 140);
        color: white;
    }

    .delete-btn:hover {
        background: #dc3545;
        color: white;
    }

    /* Banner title enhancement */
    .banner_title {
        background-image: url(./img/anh1/anh1.png);
        background-size: cover;
        background-position: center;
        height: 250px;
        display: flex;
        align-items: center;
        position: relative;
        overflow: hidden;
        margin-top: 15px;
        margin-bottom: 30px;
        border-radius: 8px;
        box-shadow: 0 10px 30px rgba(21, 42, 105, 0.2);
    }

    .banner_title:after {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(to right, rgba(21, 42, 105, 0.8), rgba(54, 75, 140, 0.6));
        z-index: 1;
    }

    .banner_title h1 {
        position: relative;
        z-index: 2;
        font-size: 40px;
        font-weight: 700;
        padding-left: 50px;
        animation: slideInLeft 1s ease;
        color: white;
        text-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
    }

    @keyframes slideInLeft {
        from {
            transform: translateX(-50px);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }

    /* Empty state animation */
    .cv-list:empty:before {
        content: "Bạn chưa tạo CV nào";
        display: block;
        text-align: center;
        padding: 40px;
        color: #999;
        font-style: italic;
        animation: pulse 2s infinite;
        background: #f8f9ff;
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(21, 42, 105, 0.05);
    }

    @keyframes pulse {
        0% { opacity: 0.6; }
        50% { opacity: 1; }
        100% { opacity: 0.6; }
    }

    /* Container wrapper */
    .container_cv {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 15px;
    }

    /* Back to top button enhancement */
    #backtotop {
        background: linear-gradient(to right, rgb(21, 42, 105), rgb(54, 75, 140));
        color: white;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        position: fixed;
        bottom: 30px;
        right: 30px;
        cursor: pointer;
        opacity: 0;
        visibility: hidden;
        transition: all 0.4s ease;
        box-shadow: 0 4px 15px rgba(21, 42, 105, 0.5);
        z-index: 999;
    }

    #backtotop.visible {
        opacity: 1;
        visibility: visible;
    }

    #backtotop:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(21, 42, 105, 0.7);
    }

    /* Fix lỗi cho nút xóa - nút này dùng class edit-btn nhưng cần hiệu ứng của delete-btn */
    a[href*="action=delete"] .edit-btn {
        background: rgba(220, 53, 69, 0.1);
        color: #dc3545;
    }

    a[href*="action=delete"] .edit-btn:before {
        content: "\f2ed"; /* Font Awesome trash icon */
    }

    a[href*="action=delete"] .edit-btn:hover {
        background: #dc3545;
        color: white;
    }

    /* Responsive adjustments */
    @media (max-width: 992px) {
        .container_listCV {
            width: 95%;
        }

        .header {
            flex-direction: column;
            gap: 20px;
            align-items: center;
        }

        .tab-active {
            margin-top: 10px;
        }

        .button-group {
            flex-wrap: wrap;
            justify-content: center;
        }
    }

    @media (max-width: 576px) {
        .button-group {
            flex-direction: column;
            width: 100%;
        }

        .view-btn, .edit-btn, .delete-btn {
            width: 100%;
        }

        .banner_title h1 {
            font-size: 30px;
            padding-left: 30px;
        }
    }

</style>
</head>
<%@include file="includes/header-01.jsp" %>

<body>

<div class="container_cv">

    <div class="container_listCV">

        <div class="header">
            <button class="tab-active">Danh sách CV đã được tạo</button>
            <button class="create-btn">Tạo CV</button>
        </div>

        <div class="cv-list">
            <c:choose>
                <c:when test="${not empty listcv}">
                    <c:forEach items="${listcv}" var="o">

                        <div class="cv-card">
                            <p><strong>Ngày tạo:</strong> ${o.createdAt}</p>
                            <p><strong>Mã CV:</strong> CV0${o.cvId}</p>


                            <div class="button-group">
                                <a href="cv?action=view&cvId=${o.cvId}">
                                    <button class="view-btn">Xem CV</button>
                                </a>
                                <a href="cv?action=load-editing&cvId=${o.cvId}">
                                    <button class="edit-btn">Sửa CV</button>
                                </a>
                                <a href="cv?action=delete&cvId=${o.cvId}">
                                    <button class="edit-btn">Xóa CV</button>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>


        </div>
    </div>
</div>
</body>
<%@include file="includes/footer.jsp" %>

</html>