<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <jsp:useBean id="accDao" class="jobtrans.dal.AccountDAO" scope="session"/>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lí báo cáo</title>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/report-list.css">

  <style>
    .page-btn.active {
      color: white;
      font-weight: 600;
      background: var(--primary-gradient);
      border-color: var(--primary-color);
    }
  </style>
</head>
<%@include file="includes/header-01.jsp"%>
<%@include file="includes/sidebar.jsp"%>
<body>
<!-- Main Content -->
<div class="content-wrapper" style="margin-left: 6.666667%; margin-right:6.666667% ">
  <main class="container-fluid py-4 fade-in main-container">
    <!-- Stats Overview -->
    <div class="row mb-4 fade-in" style="animation-delay: 0.3s;">
      <div class="col-md-3 mb-3">
        <div class="stats-card">
          <div class="stats-icon">
            <i class="fas fa-file-alt"></i>
          </div>
          <div class="stats-number">${accDao.getNumberOfReports()}</div>
          <div class="stats-label">Tất cả báo cáo</div>
        </div>
      </div>
      <div class="col-md-3 mb-3">
        <div class="stats-card">
          <div class="stats-icon">
            <i class="fas fa-check-circle"></i>
          </div>
          <div class="stats-number">${accDao.getNumberOfResolvedReports()}</div>
          <div class="stats-label">Đã xử lí</div>
        </div>
      </div>
      <div class="col-md-3 mb-3">
        <div class="stats-card">
          <div class="stats-icon">
            <i class="fas fa-exclamation-circle"></i>
          </div>
          <div class="stats-number">${accDao.getNumberOfRejectedReports()}</div>
          <div class="stats-label">Đã từ chối</div>
        </div>
      </div>
      <div class="col-md-3 mb-3">
        <div class="stats-card">
          <div class="stats-icon">
            <i class="fas fa-spinner"></i>
          </div>
          <div class="stats-number">${accDao.getNumberOfPendingReports()}</div>
          <div class="stats-label">Đang chờ</div>
        </div>
      </div>
    </div>

    <!-- Filter & Actions -->
    <div class="filter-actions d-flex justify-content-between align-items-center mb-4 fade-in" style="animation-delay: 0.4s;">
      <h3 class="h5 mb-0">Recent Reports</h3>
      <div class="d-flex">
        <div class="filter-dropdown dropdown me-2">
          <button class="btn dropdown-toggle" type="button" id="filterDropdown" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fas fa-filter me-2"></i> Filter
          </button>
          <ul class="dropdown-menu" aria-labelledby="filterDropdown">
            <li><a class="dropdown-item" href="#">All Reports</a></li>
            <li><a class="dropdown-item" href="#">Completed</a></li>
            <li><a class="dropdown-item" href="#">In Progress</a></li>
            <li><a class="dropdown-item" href="#">Pending</a></li>
          </ul>
        </div>
        <div class="filter-dropdown dropdown">
          <button class="btn dropdown-toggle" type="button" id="sortDropdown" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fas fa-sort me-2"></i> Sort
          </button>
          <ul class="dropdown-menu" aria-labelledby="sortDropdown">
            <li><a class="dropdown-item" href="#">Latest First</a></li>
            <li><a class="dropdown-item" href="#">Oldest First</a></li>
            <li><a class="dropdown-item" href="#">Progress (High to Low)</a></li>
            <li><a class="dropdown-item" href="#">Progress (Low to High)</a></li>
          </ul>
        </div>
      </div>
    </div>

    <!-- Reports List -->
    <div class="reports-container fade-in" id="reportsContainer" style="animation-delay: 0.5s;">
      <c:forEach var="o" items="${reports}">
        <div class="report-card">
          <div class="card-body d-flex">
            <div class="report-icon">
              <i class="fas fa-chart-line"></i>
            </div>
            <div class="flex-grow-1">
              <div class="d-flex justify-content-between align-items-start mb-2">
                <h5 class="report-title">${accDao.getCriteriaById(o.criteriaId).content}</h5>
                <c:choose>
                  <c:when test="${o.status == 'Chờ xử lí'}">
                    <span class="report-status status-pending">Đang xử lí</span>
                  </c:when>
                  <c:when test="${o.status == 'Bị từ chối'}">
                    <span class="report-status status-in-progress">Đã từ chối</span>
                  </c:when>
                  <c:when test="${o.status == 'Đã xử lí'}">
                    <span class="report-status status-completed">Đã xử lí</span>
                  </c:when>
                </c:choose>
              </div>
              <div class="d-flex justify-content-between align-items-center">
                <span class="report-date"><i class="far fa-calendar-alt me-1"></i> <fmt:formatDate value="${o.reportTime}" pattern="dd/MM/yyyy"/></span>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>

      <div id="pagination" class="mt-4 d-flex justify-content-center"></div>
    </div>

    <!-- Pagination -->
<%--    <nav aria-label="Page navigation" class="mt-4 fade-in" style="animation-delay: 0.6s;">--%>
<%--      <ul class="pagination">--%>
<%--        <li class="page-item disabled">--%>
<%--          <a class="page-link" href="#" aria-label="Previous">--%>
<%--            <span aria-hidden="true">&laquo;</span>--%>
<%--          </a>--%>
<%--        </li>--%>
<%--        <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
<%--        <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--        <li class="page-item">--%>
<%--          <a class="page-link" href="#" aria-label="Next">--%>
<%--            <span aria-hidden="true">&raquo;</span>--%>
<%--          </a>--%>
<%--        </li>--%>
<%--      </ul>--%>
<%--    </nav>--%>
  </main>
</div>
<%@include file="includes/footer.jsp"%>
<script>
  // Add fade-in effect on load
  document.addEventListener('DOMContentLoaded', function() {
    const fadeElements = document.querySelectorAll('.fade-in');
    fadeElements.forEach(function(element, index) {
      setTimeout(function() {
        element.style.opacity = '0';
        element.style.animation = 'fadeIn 0.8s ease forwards';
      }, index * 100);
    });

    // Add animation on hover to all report cards
    const reportCards = document.querySelectorAll('.report-card');
    reportCards.forEach(function(card) {
      card.addEventListener('mouseenter', function() {
        this.querySelector('.report-icon').style.transform = 'rotateY(180deg)';
      });

      card.addEventListener('mouseleave', function() {
        this.querySelector('.report-icon').style.transform = 'rotateY(0deg)';
      });
    });

    const reportsPerPage = 5;
    const reports = document.querySelectorAll('.report-card');
    const pagination = document.getElementById('pagination');
    let currentPage = 1;

    function showPage(page) {
      const totalPages = Math.ceil(reports.length / reportsPerPage);
      const start = (page - 1) * reportsPerPage;
      const end = start + reportsPerPage;

      reports.forEach((report, index) => {
        report.style.display = (index >= start && index < end) ? 'block' : 'none';
      });

      // Cập nhật active cho nút số trang
      const pageButtons = pagination.querySelectorAll('.page-btn.number');
      pageButtons.forEach((btn, idx) => {
        btn.classList.toggle('active', idx + 1 === page);
      });

      // Disable/Enable nút Prev/Next
      document.getElementById('prevPage').disabled = (page === 1);
      document.getElementById('nextPage').disabled = (page === totalPages);
    }

    function setupPagination() {
      const totalPages = Math.ceil(reports.length / reportsPerPage);
      pagination.innerHTML = '';

      // Nút Prev
      const prevBtn = document.createElement('button');
      prevBtn.id = 'prevPage';
      prevBtn.className = 'page-btn btn btn-sm btn-outline-secondary mx-1';
      prevBtn.innerText = '← Trang trước';
      prevBtn.addEventListener('click', () => {
        if (currentPage > 1) {
          currentPage--;
          showPage(currentPage);
        }
      });
      pagination.appendChild(prevBtn);

      // Nút số trang
      for (let i = 1; i <= totalPages; i++) {
        const btn = document.createElement('button');
        btn.className = 'page-btn number btn btn-sm btn-outline-primary mx-1';
        btn.innerText = i;
        btn.addEventListener('click', () => {
          currentPage = i;
          showPage(currentPage);
        });
        pagination.appendChild(btn);
      }

      // Nút Next
      const nextBtn = document.createElement('button');
      nextBtn.id = 'nextPage';
      nextBtn.className = 'page-btn btn btn-sm btn-outline-secondary mx-1';
      nextBtn.innerText = 'Trang sau →';
      nextBtn.addEventListener('click', () => {
        if (currentPage < totalPages) {
          currentPage++;
          showPage(currentPage);
        }
      });
      pagination.appendChild(nextBtn);
    }

    if (reports.length > 0) {
      setupPagination();
      showPage(currentPage);
    }
  });
</script>

</body>
</html>