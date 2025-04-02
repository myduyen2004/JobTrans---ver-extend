<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>\
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="profile" href="https://gmpg.org/xfn/11">

  <title>Projects &#8211; ProLancer</title>
  <meta name='robots' content='max-image-preview:large' />

  <style id="prolancer_opt-dynamic-css" title="dynamic-css" class="redux-options-output">
    .profile {
      width: 350px;
      text-align: center;
    }

    .avatar {
      width: 220px;
      height: 220px;
      border-radius: 50%;
      margin: 20px auto;
    }

    .stars {
      color: #FFDB5B;
      font-size: 20px;
    }

    .avatar-btn {
      background: #0B1741;
      color: white;
      border: none;
      border-radius: 20px;
      padding: 10px;
      width: 120px;
      height: fit-content;
      margin-top: 10px;
      cursor: pointer;
    }

    .member-since {
      color: #7F7A7A;
      font-size: 14px;
      margin-top: 10px;
    }

    .info {
      flex: 1;
      padding: 20px;
    }

    h2 {
      font-size: 32px;
      color: #0B1741;
      margin-left: 24%;
      margin-bottom: 40px;
    }

    .info-grid {
      display: grid;
      grid-template-columns: auto auto;
      gap: 10px 20px;
      align-items: center;
      margin-left: 30px;
    }

    .info-grid p {
      font-size: 20px;
      margin: 5px 0;
    }

    .info-grid p:nth-child(odd) {
      font-weight: bold;
    }

    .buttons {
      margin-top: 0;
    }

    .intro-container {
      margin-top: 70px;
      width: 100%;
      height: fit-content;
      position: relative;
      background: #E8E6E6;
      border-radius: 30px;
      padding: 50px 79px;
    }

    .intro-title {
      text-align: center;
      color: #0B1741;
      font-size: 32px;
      font-family: Inter, sans-serif;
      font-weight: 900;
    }

    .intro-text {
      color: black;
      font-size: 24px;
      font-family: Inter, sans-serif;
      font-weight: 300;
      line-height: 35px;
      word-wrap: break-word;
      margin-top: 30px;
    }

    input[type=date] {
        width: 100%;
        border: 1px solid #dfdfdf;
        height: 60px;
        border-radius: 50px;
        padding: 0 15px;
        -webkit-transition: .3s linear;
        -o-transition: .3s linear;
        transition: .3s linear;
    }
  </style>
</head>

<body
        class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">

<!-- Preloading -->
<div id="preloader">
  <div class="spinner">
    <div class="uil-ripple-css">
      <div></div>
      <div></div>
    </div>
  </div>
</div>

<%@include file="includes/header-login-01.jsp" %>

<a class="skip-link screen-reader-text" href="#content">Skip to content</a>

<section>
  <div class="breadcrumbs">
    <div class="container">
      <div class="row">
        <div class="col-md-12 my-auto">
          <h1>
            Projects </h1>
          <ul class="trail-items" itemscope itemtype="http://schema.org/BreadcrumbList">
            <li class="trail-item trail-begin"><a href="../index.html"><span
                    itemprop="name">Home</span></a>
              <meta itemprop="position" content="1" />
            </li>
            <li class="trail-item trail-end"><span itemprop="item"><span
                    itemprop="name">Projects</span></span>
              <meta itemprop="position" content="2" />
            </li>
          </ul>
        </div>
      </div>

    </div>
  </div>
</section>


<section class="section-padding">
  <div class="container">
    <form action="profile?action=update" method="post">
      <div class="justify-content-center col-xl-12" style="display: flex;">
        <div class="profile col-xl-4">
          <img class="avatar"
               src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg"
               alt="Avatar">
          <div class="stars">
            <span>★★★★★</span>
          </div>
          <button type="button" class="avatar-btn">Thay avatar</button>
<%--            <p class="member-since">Thành viên từ <span>${account.registrationDate}</span></p>--%>
        </div>
        <div class="info col-xl-6">
          <h2>Thông tin tài khoản</h2>
          <div class="info-grid">
            <p>Họ và tên</p>
            <input type="text" name="fullName" value="${account.accountName}" required>
            <p>Ngày sinh</p>
            <fmt:formatDate value="${account.dateOfBirth}" pattern="dd/MM/yyyy" var="formattedDob"/>
            <input type="date" name="dob" value="${formattedDob}" required>
<%--            <input type="date" name="dob" value="${account.dateOfBirth}" required>--%>
            <p>Loại tài khoản</p>
            <input type="text" name="accountType" value="${account.type}" readonly>
            <p>Giới tính</p>
            <select name="gender">
              <option value="Nam" ${account.gender == 'Nam' ? 'selected' : ''}>Nam</option>
              <option value="Nữ" ${account.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
            </select>
            <p>Chuyên môn</p>
            <input type="text" name="specialty" value="${account.specialist}" required>

            <p>Email</p>
            <input type="email" name="email" value="${account.email}" required>
            <p>SĐT</p>
            <input type="text" name="phone" value="${account.phone}" required>
          </div>
        </div>
        <div class="buttons col-xl-3" style="text-align: center">
          <input type="hidden" name="accountId" value="${account.accountId}">
          <button type="submit" class="save-btn" style="margin-bottom: 20px">Lưu thông tin</button>
          <button type="button" class="cancel-btn" onclick="window.history.back();">Hủy</button>
        </div>
      </div>
      <div class="intro-container">
        <div class="intro-title">Giới thiệu chung</div>
        <textarea name="introduction" class="intro-text">${account.bio}</textarea>
      </div>
    </form>
  </div>
</section>

<%@include file="includes/footer.jsp" %>
<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
</body>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

</html>