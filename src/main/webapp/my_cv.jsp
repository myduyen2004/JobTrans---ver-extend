<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

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
    background: #0a0a2b;
    color: white;
    padding: 10px 20px;
    border-radius: 20px;
    font-size: 16px;
    border: 2px solid #0a0a2b;
    cursor: pointer;
    margin-left: 50%;
}

/* Danh sách CV */
.cv-list {
    display: flex;
    flex-direction: column;
    gap: 20px;
    width: 1400px;
}

/* Thẻ CV */
.cv-card {
    background: #f8f8f8;
    padding: 20px;
    border-radius: 10px;
    border: 1px solid #ddd;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    margin-right:26%;

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

/* Hiệu ứng hover */
.view-btn:hover, .edit-btn:hover, .delete-btn:hover {
    background: #6c63ff;
    color: white;
    margin-left: 40px;
    min-width: 90px; /* Đảm bảo nút đều nhau */
    text-align: center;
}

</style>

<body>

<%@include file="includes/header-01.jsp" %>


<%@include file="./includes/sidebar.jsp" %>
 <div class="content" id="content">


<div class="container_cv">

    <div class="container_listCV">

        <div  class="header">
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
                                <a href="cv?action=view&cvId=${o.cvId}"><button class="view-btn">Xem CV</button></a>
                                <a href="cv?action=load-editing&cvId=${o.cvId}"><button class="edit-btn">Sửa CV</button></a>
                                <a href="cv?action=delete&cvId=${o.cvId}"><button class="edit-btn">Xóa CV</button></a>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>



        </div>
    </div>
</div>
 </div>
<%@include file="includes/footer.jsp" %>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
</html>