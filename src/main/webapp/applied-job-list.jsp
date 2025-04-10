<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
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
    <link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">
    <style>
        .job-card-2 {
            border: 1px solid #B2B2B2;
            border-radius: 12px;
            padding: 16px;
            display: block;
            width: 100%;
            height: fit-content;
            background: #f8faff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .job-card-2:hover {
            border: 2px solid #6787FE;
        }

        .job-header-2 {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        /* .job-avatar-2 {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            object-fit: cover;
        } */
        .avatar-wrapper {
            position: relative;
            display: inline-block;
        }

        .avatar-2 {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
        }

        .job-title-2 {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .job-category-2 {
            font-size: 14px;
            color: #777;
        }

        .job-info-2 {
            font-size: 14px;
            color: black;
            margin-left: 72px;
        }

        .cv-name-2 {
            font-weight: bold;
            color: #6787FE;
        }

        .salary-range-2 {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 8px;
            margin-left: 70px;
        }

        .salary-2 {
            background: #eaf0ff;
            padding: 6px 12px;
            border-radius: 16px;
            font-size: 14px;
            font-weight: bold;
            color: #6787FE;
        }

        .view-cv-2 {
            background: #6787FE;
            color: white;
            font-size: 14px;
            padding: 6px 12px;
            border-radius: 20px;
            text-decoration: none;
            margin-left: auto;
            white-space: nowrap;

        }

        .view-cv-2:hover {
            background: #F0F3FF;
            color: #6787FE;
            border: 1px solid #777;
            font-size: 14px;
            padding: 6px 12px;
            border-radius: 20px;
            text-decoration: none;
            margin-left: auto;
            white-space: nowrap;
        }

    </style>
</head>

<body class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">
<!-- Preloading -->
<div id="preloader">
    <div class="spinner">
        <div class="uil-ripple-css">
            <div></div>
            <div></div>
        </div>
    </div>
</div>

<%@include file="includes/header-01.jsp" %>
<%@include file="includes/sidebar.jsp" %>


<div class="row main-content" id="mainContent">
    <section>
        <div class="breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 my-auto">
                        <h1>Quản lí công việc</h1>
                        <ul class="trail-items" itemscope itemtype="http://schema.org/BreadcrumbList">
                            <li class="trail-item trail-begin"><a href="../index.html"><span
                                    itemprop="name">Tài khoản</span></a>
                                <meta itemprop="position" content="1"/>
                            </li>
                            <li class="trail-item trail-end"><span itemprop="item"><span
                                    itemprop="name">Quản lí công việc</span></span>
                                <meta itemprop="position" content="2"/>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="section-padding">
        <div class="container">
            <div class="row justify-content-center flex-row-reverse">
                <div class="col-xl-9" style="text-align: center;">
                    <h2>Danh sách công việc đã ứng tuyển</h2>
                </div>
                <c:forEach items="${job}" var="o">
                    <c:set var="jobDetail" value="${jobDAO.getJobById(o.jobId)}" />
                    <c:set var="accountDetail" value="${accountDAO.getAccountById(o.jobSeekerId)}" />
                    <c:set var="accountCompany" value="${accountDAO.getAccountById(jobDetail.postAccountId)}" />

                <div class="job-card-2">
                    <div class="job-header-2">
                        <div class="avatar-wrapper">
                            <img src="" alt="User Avatar" class="avatar-2">
                            <div class="verified-icon"></div>
                        </div>
                        <div>
                            <div style="display: flex">
                                <div class="job-title-2">${jobDetail.jobTitle}</div>

                                <div style="margin-left: 100px" class="job-category-2">${fn:substring(jobDetail.description, 0, 30)}...</div>
<%--                                <a  href="" class="view-cv-2">Xem </a>--%>
                            </div>
                            <div class="job-category-2">${accountCompany.accountName}</div>
                        </div>

                    </div>
                    <div class="job-info-2">
                        Thời hạn ứng tuyển:
                        <fmt:formatDate value="${jobDetail.postDate}" pattern="dd/MM/yyyy" /> -
                        <fmt:formatDate value="${jobDetail.dueDate}" pattern="dd/MM/yyyy" />
                    </div>
                    <div class="job-info-2">
                        CV đã ứng tuyển:
                        <a href="href="cv?action=view&cvId=${o.cvId}"><span class="cv-name-2">Xem CV</span></a>
                    </div>
                    <div class="salary-range-2">
            <span class="salary-2">
                <fmt:formatNumber value="${jobDetail.budgetMin}" type="currency" currencyCode="VND" />
            </span>
                        <span style="color: #6787FE;">-</span>
                        <span class="salary-2">
                <fmt:formatNumber value="${jobDetail.budgetMax}" type="currency" currencyCode="VND" />


                        </span>


                    </div>
                </div>
                </c:forEach>
    </section>

    <%@include file="includes/footer.jsp" %>
</div>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

</body>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

</html>