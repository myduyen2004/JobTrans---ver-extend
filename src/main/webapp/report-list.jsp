<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/20/2025
  Time: 8:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lí báo cáo</title>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/report-list.css">
</head>
<%@include file="includes/header-01.jsp"%>
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
          <div class="stats-number">48</div>
          <div class="stats-label">Tất cả báo cáo</div>
        </div>
      </div>
      <div class="col-md-3 mb-3">
        <div class="stats-card">
          <div class="stats-icon">
            <i class="fas fa-check-circle"></i>
          </div>
          <div class="stats-number">32</div>
          <div class="stats-label">Đã xử lí</div>
        </div>
      </div>
      <div class="col-md-3 mb-3">
        <div class="stats-card">
          <div class="stats-icon">
            <i class="fas fa-spinner"></i>
          </div>
          <div class="stats-number">12</div>
          <div class="stats-label">Đã từ chối</div>
        </div>
      </div>
      <div class="col-md-3 mb-3">
        <div class="stats-card">
          <div class="stats-icon">
            <i class="fas fa-exclamation-circle"></i>
          </div>
          <div class="stats-number">4</div>
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

    <div class="reports-container fade-in" style="animation-delay: 0.5s;">
      <!-- Report Card 1 -->
      <div class="report-card">
        <div class="card-body d-flex">
          <div class="report-icon">
            <i class="fas fa-chart-line"></i>
          </div>
          <div class="flex-grow-1">
            <div class="d-flex justify-content-between align-items-start mb-2">
              <h5 class="report-title">Q1 Financial Analysis</h5>
              <span class="report-status status-completed">Đã xử lí</span>
            </div>
            <p class="mb-2">Comprehensive analysis of Q1 2025 financial performance including KPIs and growth metrics.</p>
            <div class="d-flex justify-content-between align-items-center">
              <span class="report-date"><i class="far fa-calendar-alt me-1"></i> April 15, 2025</span>
              <span>100%</span>
            </div>
            <div class="report-progress">
              <div class="progress-bar" style="width: 100%"></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Report Card 2 -->
      <div class="report-card">
        <div class="card-body d-flex">
          <div class="report-icon">
            <i class="fas fa-users"></i>
          </div>
          <div class="flex-grow-1">
            <div class="d-flex justify-content-between align-items-start mb-2">
              <h5 class="report-title">User Engagement Study</h5>
              <span class="report-status status-in-progress">Bị từ chối</span>
            </div>
            <p class="mb-2">Analysis of user behavior patterns and engagement metrics across platform features.</p>
            <div class="d-flex justify-content-between align-items-center">
              <span class="report-date"><i class="far fa-calendar-alt me-1"></i> April 12, 2025</span>
              <span>68%</span>
            </div>
            <div class="report-progress">
              <div class="progress-bar" style="width: 68%"></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Report Card 3 -->
      <div class="report-card">
        <div class="card-body d-flex">
          <div class="report-icon">
            <i class="fas fa-globe"></i>
          </div>
          <div class="flex-grow-1">
            <div class="d-flex justify-content-between align-items-start mb-2">
              <h5 class="report-title">Market Expansion Opportunities</h5>
              <span class="report-status status-completed">Đã xử lí</span>
            </div>
            <p class="mb-2">Research on potential market expansion opportunities in Southeast Asia region.</p>
            <div class="d-flex justify-content-between align-items-center">
              <span class="report-date"><i class="far fa-calendar-alt me-1"></i> April 8, 2025</span>
              <span>100%</span>
            </div>
            <div class="report-progress">
              <div class="progress-bar" style="width: 100%"></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Report Card 4 -->
      <div class="report-card">
        <div class="card-body d-flex">
          <div class="report-icon">
            <i class="fas fa-bullseye"></i>
          </div>
          <div class="flex-grow-1">
            <div class="d-flex justify-content-between align-items-start mb-2">
              <h5 class="report-title">Competitive Analysis</h5>
              <span class="report-status status-in-progress">Bị từ chối</span>
            </div>
            <p class="mb-2">Detailed analysis of key competitors, their strategies, strengths and weaknesses.</p>
            <div class="d-flex justify-content-between align-items-center">
              <span class="report-date"><i class="far fa-calendar-alt me-1"></i> April 5, 2025</span>
              <span>45%</span>
            </div>
            <div class="report-progress">
              <div class="progress-bar" style="width: 45%"></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Report Card 5 -->
      <div class="report-card">
        <div class="card-body d-flex">
          <div class="report-icon">
            <i class="fas fa-file-invoice-dollar"></i>
          </div>
          <div class="flex-grow-1">
            <div class="d-flex justify-content-between align-items-start mb-2">
              <h5 class="report-title">Budget Forecast 2025</h5>
              <span class="report-status status-pending">Đang chờ</span>
            </div>
            <p class="mb-2">Annual budget forecast and financial planning document for fiscal year 2025.</p>
            <div class="d-flex justify-content-between align-items-center">
              <span class="report-date"><i class="far fa-calendar-alt me-1"></i> March 30, 2025</span>
              <span>20%</span>
            </div>
            <div class="report-progress">
              <div class="progress-bar" style="width: 20%"></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Report Card 6 -->
      <div class="report-card">
        <div class="card-body d-flex">
          <div class="report-icon">
            <i class="fas fa-tasks"></i>
          </div>
          <div class="flex-grow-1">
            <div class="d-flex justify-content-between align-items-start mb-2">
              <h5 class="report-title">Project Status Summary</h5>
              <span class="report-status status-completed">Đã xử lí</span>
            </div>
            <p class="mb-2">Overview of all active projects with timeline, resource allocation and completion percentage.</p>
            <div class="d-flex justify-content-between align-items-center">
              <span class="report-date"><i class="far fa-calendar-alt me-1"></i> March 25, 2025</span>
              <span>100%</span>
            </div>
            <div class="report-progress">
              <div class="progress-bar" style="width: 100%"></div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Pagination -->
    <nav aria-label="Page navigation" class="mt-4 fade-in" style="animation-delay: 0.6s;">
      <ul class="pagination">
        <li class="page-item disabled">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        <li class="page-item active"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
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
  });
</script>
</body>
</html>