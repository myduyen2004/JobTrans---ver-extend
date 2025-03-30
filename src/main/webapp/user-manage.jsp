<%--
    Document   : post_list
    Created on : Mar 13, 2025, 10:45:02 AM
    Author     : ADM
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/ by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:30:18 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--<link rel="profile" href="https://gmpg.org/xfn/11">-->

    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large' />

    <!--new css -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="css/post_list.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>

<body>


<%@include file="includes/header-login-01.jsp"%>

<div class="py-4 banner_title">
    <h1 class="text-white font-weight-bold" style="padding-left: 50px;">Danh sách người dùng</h1>
</div>

<main class="container mx-auto mt-8 mb-5" style="width: 1200px;">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <section class="col-span-2">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="search-result col-xl-10">
                        <%--Người dùng đang hoạt động--%>
                        <c:set var="activeUser" value="false" />

                        <c:forEach items="${list}" var="o">
                            <c:if test="${o.status eq 'đang hoạt động'}">
                                <c:set var="activeUser" value="true" />
                            </c:if>
                        </c:forEach>
                        <%--Người dùng đang hoạt động--%>
                        <c:if test="${activeUser}">
                            <h3>Người dùng đang hoạt động</h3>
                            <c:forEach items="${list}" var="o" varStatus="status">
                                <c:if test="${o.status eq 'đang hoạt động'}">
                                    <div class="prolancer-seller-item style-2">
                                        <div class="row">
                                            <div class="col-3 my-auto">
                                                <a href="acc-manage?action=viewAccountDetails&accId=${o.accountId}">
                                                    <img src="${o.avatar}"
                                                         alt="User_avatar"
                                                         style="width: 100%; height: auto; border-radius: 50%; object-fit: cover;" />
                                                </a>
                                            </div>
                                            <div class="col-6 my-auto">
                                                <div class="seller-content">
                                                    <h4>${o.specialist}</h4>
                                                    <h3 class="mb-2 d-flex align-items-center">
                                                        <a href="#">${o.accountName}</a>
                                                        <i class="fas fa-check-circle verified text-primary ms-2" title="Verified"></i>
                                                    </h3>
                                                    <ul class="list-inline mb-lg-0">
                                                        <li class="list-inline-item mb-2"><i class="fad fa-users-medical"></i>${o.type}</li>
                                                        <li class="list-inline-item"><i class="fas fa-map-marked-alt"></i>${o.address}</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-3 text-center">
                                                <div class="star-rating mx-auto mb-4">
                                                    <span style="width:90%"></span>
                                                </div>
                                                <a style="font-size: 15px; background-color: #6787FE; border-radius: 30px; color: white; padding: 10px;" href="acc-manage?action=viewAccountDetails&accId=${o.accountId}">
                                                    Xem chi tiết
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>

                        <%--Người dùng chờ xem xét--%>
                        <c:set var="hasPendingUsers" value="false" />

                        <c:forEach items="${list}" var="o">
                            <c:if test="${o.status eq 'chờ xem xét'}">
                                <c:set var="hasPendingUsers" value="true" />
                            </c:if>
                        </c:forEach>
                        <c:if test="${hasPendingUsers}">
                            <h3>Người dùng chờ xem xét</h3>
                            <c:forEach items="${list}" var="o" varStatus="status">
                                <c:if test="${o.status eq 'chờ xem xét'}">
                                    <div class="prolancer-seller-item style-2">
                                        <div class="row">
                                            <div class="col-md-3 my-auto">
                                                <a href="acc-manage?action=viewAccountDetails&accId=${o.accountId}">
                                                    <img src="${o.avatar}"
                                                         alt="User_avatar"
                                                         style="width: 100%; height: auto; border-radius: 50%; object-fit: cover;" />
                                                </a>
                                            </div>

                                            <div class="col-md-6 my-auto">
                                                <div class="seller-content">
                                                    <h4>${o.specialist}</h4>
                                                    <h3 class="mb-2 d-flex align-items-center">
                                                        <a href="#">${o.accountName}</a>
                                                        <i class="fas fa-check-circle verified text-primary ms-2" title="Verified"></i>

                                                    </h3>

                                                    <ul class="list-inline mb-lg-0">
                                                        <li class="list-inline-item mb-2"><i class="fad fa-users-medical"></i>${o.type}</li>
                                                        <li class="list-inline-item"><i class="fas fa-map-marked-alt"></i>${o.address}</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-md-3 my-auto text-center">
                                                <div class="star-rating mx-auto mb-4">
                                                    <span style="width:90%"></span>
                                                </div>
                                                <a style="font-size: 15px; background-color: #6787FE; border-radius: 30px; color: white; padding: 10px;" href="acc-manage?action=viewAccountDetails&accId=${o.accountId}">
                                                    Xem chi tiết
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>>

                        <%--Người dùng bị chặn--%>
                        <c:set var="hasBanUsers" value="false" />

                        <c:forEach items="${list}" var="o">
                            <c:if test="${o.status eq 'bị chặn'}">
                                <c:set var="hasBanUsers" value="true"/>
                            </c:if>
                        </c:forEach>
                        <c:if test="${hasBanUsers}">
                            <h3>Người dùng bị chặn</h3>
                            <c:forEach items="${list}" var="o" varStatus="status">
                                <c:if test="${o.status eq 'bị chặn'}">
                                    <div class="prolancer-seller-item style-2">
                                        <div class="row">
                                            <div class="col-md-3 my-auto">
                                                <a href="acc-manage?action=viewAccountDetails&accId=${o.accountId}">
                                                    <img src="${o.avatar}"
                                                         alt="User_avatar"
                                                         style="width: 100%; height: auto; border-radius: 50%; object-fit: cover;" />
                                                </a>
                                            </div>

                                            <div class="col-md-6 my-auto">
                                                <div class="seller-content">
                                                    <h4>${o.specialist}</h4>
                                                    <h3 class="mb-2 d-flex align-items-center">
                                                        <a href="#">${o.accountName}</a>
                                                        <i class="fas fa-check-circle verified text-primary ms-2" title="Verified"></i>

                                                    </h3>

                                                    <ul class="list-inline mb-lg-0">
                                                        <li class="list-inline-item mb-2"><i class="fad fa-users-medical"></i>${o.type}</li>
                                                        <li class="list-inline-item"><i class="fas fa-map-marked-alt"></i>${o.address}</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-md-3 my-auto text-center">
                                                <div class="star-rating mx-auto mb-4">
                                                    <span style="width:90%"></span>
                                                </div>
                                                <a style="font-size: 15px; background-color: #6787FE; border-radius: 30px; color: white; padding: 10px;" href="acc-manage?action=viewAccountDetails&accId=${o.accountId}">
                                                    Xem chi tiết
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>
        <aside>
            <div class="bg-white p-6 rounded-lg shadow-md" style="border: solid 1px #6787FE; border-radius: 15px;">
                <h3>Quản lý người dùng</h3>
                <form action="acc-manage" method="GET" style="margin-left: 20px;">
                    <button type="submit" name="action" value="viewAllUser" style="height: 40px;">Danh sách người dùng</button>
                </form>
            </div>
        </aside>
    </div>
</main>

<%@include file="includes/footer.jsp"%>

<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
</body>
</html>
