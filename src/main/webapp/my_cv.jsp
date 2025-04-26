<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->

<style>* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* Container chính */
.container_listCV {
    width: 80%;
    margin: 20px auto;
    margin-right: 50px;
}

/* Header */
.header {
    margin-top: 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 40px;
    margin-right: 70px;
}

/* Tab danh sách CV */
.tab-active {
    background: transparent;
    border: 2px solid #6c63ff;
    padding: 10px 20px;
    border-radius: 20px;
    font-size: 16px;
    color: #6c63ff;
    cursor: pointer;

    margin-top: 50px;
    margin-bottom: 20px;
}

/* Nút tạo CV */
.create-btn {
    background: linear-gradient(135deg, #0a0a2b, #3f3d56); /* Gradient tạo chiều sâu */
    color: white;
    padding: 12px 28px;
    border-radius: 25px;
    font-size: 16px;
    font-weight: 500;
    border: none; /* Loại bỏ viền cứng */
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 10px rgba(10, 10, 43, 0.3);
    display: inline-block;
    transform: translateX(-50%);
    margin-left: 50%;
}

.create-btn:hover {
    background: linear-gradient(135deg, #1e1e60, #5a5870); /* Màu hover đậm hơn */
    box-shadow: 0 6px 15px rgba(10, 10, 43, 0.5);
    transform: translateX(-50%) translateY(-2px); /* Nhô nhẹ lên */
}

/* Danh sách CV */
.cv-list {
    display: flex;
    flex-direction: column;
    gap: 20px;

}

/* Thẻ CV */
.cv-card {
    background: #f8f8f8;
    padding: 20px;
    border-radius: 10px;
    border: 1px solid #ddd;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    margin-right: 17%;

}
.cv-card:hover {
    background: #ffffff;
    border-color: #ccc;
    box-shadow: 4px 4px 20px rgba(0, 0, 0, 0.15);
    transform: translateY(-5px);
    transition: all 0.3s ease;
}

/* Nhóm nút */
.button-group {
    display: flex;
    margin-left: 60px;
    gap: 40px; /* Khoảng cách giữa các nút */
    margin-top: 15px;
}


/* Căn chỉnh kích thước và phong cách nút */
.view-btn, .edit-btn, .delete-btn {
    height: 45px;
    background: #e0e0ff; /* Màu nền nhẹ */
    color: #6c63ff; /* Màu chữ */
    border: none;
    padding: 8px 16px; /* Tăng padding */
    border-radius: 20px; /* Bo tròn đẹp hơn */
    cursor: pointer;
    font-size: 14px;
    transition: all 0.3s ease-in-out;
    min-width: 90px; /* Đảm bảo nút đều nhau */
    text-align: center;
}
.view-btn:hover,
.edit-btn:hover,
.delete-btn:hover {
    background: #6c63ff; /* Màu nền đậm khi hover */
    color: #ffffff;       /* Màu chữ trắng khi hover */
    transform: translateY(-2px); /* Hiệu ứng nổi nhẹ */
    box-shadow: 0 4px 10px rgba(108, 99, 255, 0.3); /* Đổ bóng */
}

/*!* Hiệu ứng hover *!*/
/*.view-btn:hover, .edit-btn:hover, .delete-btn:hover {*/
/*    background: #6c63ff;*/
/*    color: white;*/
/*    margin-left: 40px;*/
/*    min-width: 90px; !* Đảm bảo nút đều nhau *!*/
/*    text-align: center;*/
/*}*/

.banner_title {
    background-image: url(./img/anh1/anh1.png);
    background-size: 100%;
    font-size: 40px;
    height: 200px;
    display: flex;
    margin-top: 15px;
    align-items: center;
}

</style>

<body>

<%@include file="includes/header-01.jsp" %>

<div style="margin-top: 20px" class="py-4 banner_title">
    <h1 class="text-white font-weight-bold" style="padding-left: 50px;">Danh sách CV của bạn</h1>
</div>


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
<%@include file="includes/footer.jsp" %>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
</html>