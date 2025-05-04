<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
    <title>Quản lí CV</title>
<style>
    /* CSS cho trang Quản lý CV */
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap');

    /* Reset và base styles */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f5f7fa;
        color: #333;
    }

    /* Container styles */
    .container_cv {
        max-width: 1200px;
        margin: 40px auto;
        padding: 0 20px;
    }

    .container_listCV {
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(21, 42, 105, 0.1);
        overflow: hidden;
        animation: slideDown 0.5s ease-out;
    }

    @keyframes slideDown {
        from {
            opacity: 0;
            transform: translateY(-30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* Header styles */
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 25px 30px;
        background: linear-gradient(to right, rgb(21, 42, 105), rgb(54, 75, 140));
        color: #fff;
        border-radius: 12px 12px 0 0;
    }

    .tab-active {
        background: transparent;
        border: none;
        color: #fff;
        font-size: 1.2rem;
        font-weight: 600;
        cursor: pointer;
        padding: 8px 0;
        position: relative;
        display: flex;
        align-items: center;
    }

    .tab-active::before {
        content: "\f0ae"; /* Font Awesome icon for list */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        margin-right: 10px;
        font-size: 1.3rem;
    }

    .tab-active::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 3px;
        background-color: #fff;
        transform: scaleX(1);
        transition: transform 0.3s ease;
    }

    .create-btn {
        background-color: #fff;
        color: rgb(21, 42, 105);
        border: none;
        border-radius: 50px;
        padding: 12px 25px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    .create-btn::before {
        content: "\f067"; /* Font Awesome icon for plus */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        margin-right: 8px;
    }

    .create-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.25);
    }

    /* CV List styles */
    .cv-list {
        padding: 30px;
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
        gap: 25px;
    }

    .cv-card {
        background-color: #fff;
        border-radius: 10px;
        padding: 25px;
        box-shadow: 0 5px 15px rgba(21, 42, 105, 0.08);
        transition: all 0.3s ease;
        border-top: 5px solid rgb(21, 42, 105);
        position: relative;
        animation: fadeIn 0.5s ease-out;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: scale(0.9);
        }
        to {
            opacity: 1;
            transform: scale(1);
        }
    }

    .cv-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 15px 30px rgba(21, 42, 105, 0.15);
    }

    .cv-card::before {
        content: "\f15c"; /* Font Awesome icon for file */
        font-family: "Font Awesome 5 Free";
        font-weight: 400;
        position: absolute;
        top: 22px;
        right: 25px;
        font-size: 2rem;
        color: rgba(21, 42, 105, 0.1);
        transition: all 0.3s ease;
    }

    .cv-card:hover::before {
        color: rgba(21, 42, 105, 0.2);
        transform: scale(1.1);
    }

    .cv-card p {
        margin-bottom: 12px;
        font-size: 0.95rem;
        display: flex;
        align-items: center;
    }

    .cv-card p:first-child::before {
        content: "\f073"; /* Font Awesome icon for calendar */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        margin-right: 10px;
        color: rgb(54, 75, 140);
    }

    .cv-card p:nth-child(2)::before {
        content: "\f02a"; /* Font Awesome icon for tag */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        margin-right: 10px;
        color: rgb(54, 75, 140);
    }

    .button-group {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-top: 20px;
    }

    .button-group a {
        text-decoration: none;
        flex-grow: 1;
        min-width: 100px;
    }

    .view-btn, .edit-btn {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 5px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s ease;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .view-btn {
        background: linear-gradient(to right, rgb(21, 42, 105), rgb(54, 75, 140));
        color: white;
    }

    .view-btn::before {
        content: "\f06e"; /* Font Awesome icon for eye */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        margin-right: 6px;
    }

    .edit-btn {
        background-color: transparent;
        color: rgb(21, 42, 105);
        border: 1px solid rgb(21, 42, 105);
    }

    .edit-btn:nth-of-type(1)::before {
        content: "\f044"; /* Font Awesome icon for edit */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        margin-right: 6px;
    }

    .edit-btn:nth-of-type(2)::before {
        content: "\f2ed"; /* Font Awesome icon for trash */
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        margin-right: 6px;
        color: #d9534f;
    }

    .view-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 5px 10px rgba(21, 42, 105, 0.3);
    }

    .edit-btn:hover {
        background-color: rgba(21, 42, 105, 0.1);
    }

    /* Empty state */
    .empty-cv {
        text-align: center;
        padding: 40px;
        grid-column: 1 / -1;
        animation: pulse 2s infinite;
    }

    @keyframes pulse {
        0% {
            opacity: 0.7;
        }
        50% {
            opacity: 1;
        }
        100% {
            opacity: 0.7;
        }
    }

    .empty-cv i {
        font-size: 4rem;
        color: rgb(21, 42, 105);
        margin-bottom: 20px;
        opacity: 0.5;
    }

    .empty-cv p {
        font-size: 1.2rem;
        color: #555;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .header {
            flex-direction: column;
            gap: 15px;
            padding: 20px;
        }

        .cv-list {
            grid-template-columns: 1fr;
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
        </div>

        <div class="cv-list">
            <c:choose>
                <c:when test="${not empty listcv}">
                    <c:forEach items="${listcv}" var="o">
                        <div class="cv-card">
                            <p><strong>Ngày tạo:</strong> ${o.createdAt}</p>
                            <p><strong>Mã CV:</strong> CV0${o.cvId}</p>

                            <div class="button-group">
<%--                                <a href="cv?action=view&cvId=${o.cvId}">--%>
<%--                                    <button class="view-btn">Xem CV</button>--%>
<%--                                </a>--%>
    <c:choose>

        <c:when test="${o.summary != null || not empty o.summary}">  <!-- Nếu cvUpload KHÔNG null -->
            <a href="cv?action=view&cvId=${o.cvId}">
                <button class="view-btn">Xem CV</button>
            </a>
        </c:when>
        <c:otherwise>  <!-- Ngược lại (cvUpload null) -->
            <a href="cv?action=pdf&cvId=${o.cvId}" target="_blank">
                <button class="view-btn">Xem CV</button>
            </a>
        </c:otherwise>
    </c:choose>
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
                <c:otherwise>
                    <div class="empty-cv">
                        <i class="far fa-file-alt"></i>
                        <p>Bạn chưa có CV nào. Hãy tạo CV ngay!</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
</body>
<%@include file="includes/footer.jsp" %>

</html>