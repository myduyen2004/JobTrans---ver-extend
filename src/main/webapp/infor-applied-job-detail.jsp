<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->

<head>
    <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="session"></jsp:useBean>
    <jsp:useBean id="accountDAO" class="jobtrans.dal.AccountDAO" scope="session"></jsp:useBean>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">

    <title>Projects &#8211; ProLancer</title>
    <meta name='robots' content='max-image-preview:large'/>
    <link rel="icon" type="image/png" href="">



</head>
<style>
    /* Main layout and colors */

    .hello body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: #333;
        line-height: 1.6;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }

    .hello .banner_title {
        background-color: #6787FE;
        padding: 30px 0;
        margin-bottom: 30px;
    }

    /* Container layout */
    .hello .container_main_employee {
        display: flex;
        max-width: 1200px;
        margin:  auto;
        padding: 50px 20px;
        gap: 30px;
    }

    .hello .content {
        flex: 2;
        background: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    .hello .content2 {

        background: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }


    .hello .sidebar {
        flex: 1;
        background: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        height: fit-content;
    }

    /* Typography */
    .hello .header-title {
        font-size: 24px;
        font-weight: 600;
        color: #2B3D9F;
        margin-bottom: 15px;
        padding-bottom: 10px;
        border-bottom: 2px solid #f0f0f0;
    }

    .hello .content-list {
        padding-left: 20px;
    }

    .hello .content-list li {
        margin-bottom: 10px;
        position: relative;
        list-style-type: none;
    }

    .hello .content-list li:before {
        content: "•";
        color: #6787FE;
        font-weight: bold;
        display: inline-block;
        width: 1em;
        margin-left: -1em;
    }

    /* File attachment */
    .file-attachment {
        background: #F8F9FF;
        padding: 20px;
        border-radius: 8px;
        border: 1px solid #E0E5FF;
        align-items: center;
    }

    /* Sidebar elements */
    .hello .sidebar p {
        margin-bottom: 15px;
        padding-bottom: 15px;
        border-bottom: 1px solid #f0f0f0;
    }
    .hello .sidebar strong {
        margin-left: 10px;
    }

    .hello .sidebar strong {
        color: #555;
        font-weight: 600;
    }

    /* Buttons */
    a[style*="background-color: #6787FE50"] {
        transition: all 0.3s ease;
    }

    a[style*="background-color: #6787FE50"]:hover {
        background-color: #6787FE !important;
        color: white !important;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .hello .container_main_employee {
            flex-direction: column;
        }

        hello.sidebar, .content {
            width: 100%;
        }
    }
    .content2 p{
        margin-bottom: 30px;
        margin-left: 10px;
    }
    .content2 i{
        margin-right: 10px;
        color: #0a174e;
    }
    .content2 strong{
        font-size: 18px;
        color: #2B3D9F;
    }

</style>

<body>

<%@include file="includes/header-01.jsp" %>

<div class="hello">
    <%--Main--%>
    <div class="container_main_employee">
        <div class="content">
            <h2 class="header-title">Mô tả chi tiết công việc</h2>
            <ul class="content-list mt-3">
                <li>${job.jobTitle}</li>

            </ul>
            <h2 class="header-title">Yêu cầu ứng viên</h2>
            <ul class="content-list mt-3">
                <li>${job.requirements}</li>

            </ul>
            <h2 class="header-title">Quyền lợi</h2>
            <ul class="content-list mt-3">
                <li>${job.benefit}</li>
            </ul>
            <h2 class="header-title">Số tiền công việc</h2>
            <ul class="content-list mt-3">
                <li>Số tiền: <fmt:formatNumber value="${job.budgetMin}"
                                               type="currency"
                                               currencyCode="VND"/>  -> <fmt:formatNumber value="${job.budgetMax}"
                                                                                          type="currency"
                                                                                          currencyCode="VND"/></li>
            </ul>
            <h2 class="header-title">Tệp đính kèm</h2>
            <div class="file-attachment mt-3 d-flex row">
                <div class="col-2">
                    <i class="fas fa-file" style="font-size: 60px;"></i>
                </div>
                <div class="col-10 space-y-4">
                    <p>Tệp đính kèm</p>
                    <a style="color: #0a174e" href="${job.attachment}">xem tệp</a>
                </div>
            </div>
        </div>
        <div class="content2">
            <h2 class="header-title text-center" style="font-weight: bolder">Chào giá của bạn</h2>
            <p class="text-center" style="font-size: 35px;
border-radius: 30px;
border: #0a0a2b 1px solid;
/* padding: 10px; */
margin-left: 120px;
margin-right: 120px;
padding-bottom: 10px;"><strong>${jobGreeting.price}</strong></p>
            <p><i class="fas fa-check-circle"></i><strong>Trạng thái:</strong> ${jobGreeting.status}</p>
            </p>
            <p><i class="fas fa-building"></i><strong>Nhà tuyển dụng:</strong>${accountDAO.getAccountById(job.postAccountId).accountName}</p>
            <p><i class="fas fa-tags"></i><strong>Phân loại:</strong> ${jobDAO.getCategoryById(job.categoryId).categoryName}</p>
            <p><i class="fas fa-tasks"></i><strong>Kiểm tra: </strong> ${job.haveTested ? 'Có' : 'Không'}</p>
            <p><i class="fas fa-user-tie"></i><strong>Phỏng vấn:</strong>  ${job.haveInterviewed ? 'Có' : 'Không'}</p>
            <p><i class="far fa-calendar-alt"></i><strong>Ngày đăng:</strong> ${job.dueDatePost}</p>
            <p><i class="fas fa-calendar-times"></i><strong>Ngày hết hạn:</strong>${job.dueDateJob}</p>

        </div>
    </div>
    </div>
</div>
<%@include file="includes/footer.jsp"%>

</body>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

</html>