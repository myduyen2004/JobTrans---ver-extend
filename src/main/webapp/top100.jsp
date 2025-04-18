<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="profile" href="https://gmpg.org/xfn/11">
  <title>Top 100 Freelance - JobTrans</title>
  <meta name='robots' content='max-image-preview:large'/>
  <link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Font Awesome for icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

  <style>
    :root {
      --primary-color: #3f51b5;
      --primary-light: #757de8;
      --primary-dark: #002984;
      --accent-color: #ff9800;
      --success-color: #4caf50;
      --gold: #ffd700;
      --silver: #c0c0c0;
      --bronze: #cd7f32;
    }

    body {
      font-family: 'Roboto', sans-serif;
      background-color: #f5f7fa;
    }

    .body_top100 {
      padding: 40px 20px;
      background: linear-gradient(135deg, #f5f7fa 0%, #e4e7f0 100%);
    }

    .container_top100 {
      background: white;
      border-radius: 16px;
      padding: 30px;
      width: 85%;
      max-width: 1000px;
      margin: 0 auto;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      position: relative;
    }

    .title-section {
      text-align: center;
      margin-bottom: 30px;
      position: relative;
    }

    .title {
      font-family: 'Poppins', sans-serif;
      font-size: 28px;
      font-weight: 700;
      color: var(--primary-color);
      position: relative;
      display: inline-block;
      padding-bottom: 10px;
    }

    .title::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 80px;
      height: 4px;
      background: var(--primary-light);
      border-radius: 2px;
    }

    .search-container {
      margin: 25px 0;
      position: relative;
    }

    .search-box {
      position: relative;
      max-width: 400px;
      margin: 0 auto;
    }

    .search-box input {
      width: 100%;
      padding: 12px 20px;
      padding-right: 50px;
      border: 2px solid #e0e0e0;
      border-radius: 50px;
      font-size: 16px;
      transition: all 0.3s ease;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    }

    .search-box input:focus {
      border-color: var(--primary-color);
      box-shadow: 0 4px 15px rgba(63, 81, 181, 0.15);
      outline: none;
    }

    .search-box button {
      position: absolute;
      right: 5px;
      top: 50%;
      transform: translateY(-50%);
      background: var(--primary-color);
      color: white;
      border: none;
      width: 42px;
      height: 42px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .search-box button:hover {
      background: var(--primary-dark);
    }

    .freelancers-container {
      max-height: 600px;
      overflow-y: auto;
      padding-right: 5px;
    }

    .freelancers-container::-webkit-scrollbar {
      width: 8px;
    }

    .freelancers-container::-webkit-scrollbar-track {
      background: #f1f1f1;
      border-radius: 10px;
    }

    .freelancers-container::-webkit-scrollbar-thumb {
      background: #c5cae9;
      border-radius: 10px;
    }

    .freelancers-container::-webkit-scrollbar-thumb:hover {
      background: var(--primary-color);
    }

    .freelancer {
      display: flex;
      align-items: center;
      justify-content: space-between;
      background: white;
      border-radius: 12px;
      padding: 15px 20px;
      margin-bottom: 15px;
      box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
      transition: all 0.3s ease;
      border: 1px solid #eaeaea;
      text-decoration: none;
      color: inherit;
    }

    .freelancer:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      border-color: var(--primary-light);
    }

    .rank {
      font-weight: 700;
      font-size: 20px;
      color: #757575;
      width: 40px;
      height: 40px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 50%;
      background: #f5f5f5;
      z-index: 1;
    }

    .top-rank {
      color: white;
      position: relative;
    }

    .top-rank::before {
      font-family: "Font Awesome 5 Free";
      font-weight: 900;
      position: absolute;
      top: -20px;
      left: 50%;
      transform: translateX(-50%);
      font-size: 16px;
    }

    .rank-1 {
      background: var(--gold);
      box-shadow: 0 0 15px rgba(255, 215, 0, 0.5);
    }

    .rank-1::before {
      content: "\f521"; /* crown */
      color: var(--gold);
    }

    .rank-2 {
      background: var(--silver);
      box-shadow: 0 0 10px rgba(192, 192, 192, 0.5);
    }

    .rank-2::before {
      content: "\f559"; /* medal */
      color: var(--silver);
    }

    .rank-3 {
      background: var(--bronze);
      box-shadow: 0 0 10px rgba(205, 127, 50, 0.5);
    }

    .rank-3::before {
      content: "\f559"; /* medal */
      color: var(--bronze);
    }

    .profile {
      display: flex;
      align-items: center;
      flex: 1;
      margin: 0 20px;
      position: relative;
    }

    .profile-img {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      object-fit: cover;
      border: 3px solid white;
      box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
      margin-right: 20px;
    }

    .profile-info {
      flex: 1;
    }

    .name {
      font-weight: 600;
      font-size: 18px;
      color: #333;
      margin-bottom: 5px;
      display: flex;
      align-items: center;
    }

    .name::after {
      content: "\f0c1";
      font-family: "Font Awesome 5 Free";
      font-weight: 900;
      margin-left: 10px;
      font-size: 14px;
      color: var(--primary-color);
      opacity: 0;
      transition: all 0.3s ease;
    }

    .freelancer:hover .name::after {
      opacity: 1;
      transform: translateX(5px);
    }

    .stars {
      color: #ffc107;
      font-size: 16px;
    }

    .score {
      font-size: 20px;
      font-weight: 700;
      color: var(--primary-color);
      background: #e8eaf6;
      border-radius: 50px;
      padding: 8px 20px;
      min-width: 80px;
      text-align: center;
      box-shadow: 0 3px 6px rgba(0, 0, 0, 0.05);
      z-index: 1;
    }

    /* Top 3 styles */
    .freelancer-top {
      background: linear-gradient(135deg, #fff 0%, #f9f9f9 100%);
      border-width: 2px;
    }

    .freelancer-1 {
      border-color: var(--gold);
      background: linear-gradient(135deg, #fff8e1 0%, #fff 100%);
    }

    .freelancer-2 {
      border-color: var(--silver);
      background: linear-gradient(135deg, #f5f5f5 0%, #fff 100%);
    }

    .freelancer-3 {
      border-color: var(--bronze);
      background: linear-gradient(135deg, #fff3e0 0%, #fff 100%);
    }

    /* Highlighted status for verified accounts */
    .verified-badge {
      color: var(--primary-color);
      margin-left: 8px;
      font-size: 16px;
    }

    /* Back to top button */
    #back-to-top-btn {
      position: fixed;
      bottom: 30px;
      right: 30px;
      width: 50px;
      height: 50px;
      border-radius: 50%;
      background: var(--primary-color);
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      opacity: 0;
      visibility: hidden;
      transition: all 0.3s ease;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      z-index: 1000;
    }

    #back-to-top-btn.visible {
      opacity: 1;
      visibility: visible;
    }

    #back-to-top-btn:hover {
      background: var(--primary-dark);
      transform: translateY(-5px);
    }

    /* Hover effect overlay */
    .freelancer::after {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: rgba(63, 81, 181, 0.05);
      border-radius: 12px;
      opacity: 0;
      transition: opacity 0.3s ease;
      pointer-events: none;
    }

    .freelancer:hover::after {
      opacity: 1;
    }

    /* Responsive styles */
    @media (max-width: 768px) {
      .container_top100 {
        width: 95%;
        padding: 20px;
      }

      .profile {
        margin: 0 10px;
      }

      .profile-img {
        width: 50px;
        height: 50px;
        margin-right: 15px;
      }

      .name {
        font-size: 16px;
      }

      .score {
        font-size: 16px;
        padding: 6px 15px;
        min-width: 60px;
      }
    }
  </style>
</head>

<body>
<%@include file="includes/header-01.jsp" %>

<div class="body_top100">
  <div class="container_top100">
    <div class="title-section">
      <h2 class="title">Top 100 Freelance</h2>
    </div>

    <div class="search-container">
      <form action="${pageContext.request.contextPath}/top100" method="get" class="search-box">
        <input type="text" name="searchName" placeholder="Tìm kiếm theo tên..." value="${param.searchName}" class="form-control">
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>

    <div class="freelancers-container">
      <c:forEach items="${top100}" var="o" varStatus="status">
        <a href="${pageContext.request.contextPath}/profile?id=${o.accountId}" class="freelancer ${status.index < 3 ? 'freelancer-top freelancer-'.concat(status.index + 1) : ''}">
          <div class="rank ${status.index < 3 ? 'top-rank rank-'.concat(status.index + 1) : ''}">${status.index + 1}</div>

          <div class="profile">
            <img src="${o.avatar}" alt="${o.accountName}" class="profile-img">
            <div class="profile-info">
              <div class="name">
                  ${o.accountName}
                <c:if test="${o.verifiedAccount}">
                  <i class="fas fa-check-circle verified-badge" title="Tài khoản đã xác thực"></i>
                </c:if>
              </div>
              <div class="stars">
                <c:set var="starRating" value="${o.starRate}" />
                <c:choose>
                  <c:when test="${starRating >= 4.8}">
                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                  </c:when>
                  <c:when test="${starRating >= 4.3}">
                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
                  </c:when>
                  <c:when test="${starRating >= 3.8}">
                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>
                  </c:when>
                  <c:when test="${starRating >= 3.3}">
                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                  </c:when>
                  <c:when test="${starRating >= 2.8}">
                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
                  </c:when>
                  <c:when test="${starRating >= 2.3}">
                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i>
                  </c:when>
                  <c:when test="${starRating >= 1.8}">
                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
                  </c:when>
                  <c:when test="${starRating >= 1.3}">
                    <i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
                  </c:when>
                  <c:when test="${starRating >= 0.8}">
                    <i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
                  </c:when>
                  <c:when test="${starRating >= 0.3}">
                    <i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
                  </c:when>
                  <c:otherwise>
                    <i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
                  </c:otherwise>
                </c:choose>
                <span class="ms-1 small text-muted">(${o.starRate})</span>
              </div>
            </div>
          </div>

          <div class="score">
            <i class="fas fa-trophy me-1 ${status.index < 3 ? 'text-warning' : ''}"></i> ${o.point}
          </div>
        </a>
      </c:forEach>
    </div>
  </div>
</div>

<!-- Back to top button -->
<div id="back-to-top-btn">
  <i class="fas fa-arrow-up"></i>
</div>

<%@include file="includes/footer.jsp" %>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
  // Back to top button functionality
  const backToTopButton = document.getElementById('back-to-top-btn');
  const scrollContainer = document.querySelector('.freelancers-container');

  scrollContainer.addEventListener('scroll', () => {
    if (scrollContainer.scrollTop > 300) {
      backToTopButton.classList.add('visible');
    } else {
      backToTopButton.classList.remove('visible');
    }
  });

  backToTopButton.addEventListener('click', () => {
    scrollContainer.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  });
</script>
</body>
</html>