<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"/>
  <jsp:useBean id="accDao" class="jobtrans.dal.AccountDAO" scope="session"/>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh sách báo cáo | Tài khoản người dùng</title>
  <link rel="stylesheet" href="css/account-report-list.css">
</head>
<body>
<%@include file="includes/header-01.jsp"%>
<!-- Main Content -->
<div class="container my-4">
  <div class="row">
    <!-- Main Content -->
    <div class="col-lg-12" style="margin-left: 20px; margin-right: 20px">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h3 class="mb-0" style="color: white">Danh sách báo cáo</h3>
          <button class="btn btn-sm btn-light"><i class="fas fa-filter me-2"></i> Lọc</button>
        </div>
        <div class="card-body">
          <div class="search-box">
            <i class="fas fa-search"></i>
            <input type="text" class="form-control" placeholder="Tìm kiếm báo cáo...">
          </div>

          <ul class="nav nav-tabs mb-4" id="reportTabs" role="tablist">
            <li class="nav-item" role="presentation">
              <button class="nav-link active" id="created-tab" data-bs-toggle="tab" data-bs-target="#created" type="button" role="tab" aria-controls="created" aria-selected="true">
                <i class="fas fa-edit me-2"></i> Báo cáo đã tạo
              </button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="received-tab" data-bs-toggle="tab" data-bs-target="#received" type="button" role="tab" aria-controls="received" aria-selected="false">
                <i class="fas fa-inbox me-2"></i> Báo cáo nhận được
              </button>
            </li>
          </ul>

          <div class="tab-content" id="reportTabsContent">
            <!-- Báo cáo đã tạo -->
            <div class="tab-pane fade show active" id="created" role="tabpanel" aria-labelledby="created-tab">
              <h5 class="section-heading">Báo cáo đã tạo (${accDao.getNumOfReportsByReportBy(accountLogged.accountId)})</h5>

              <c:forEach items="${reportList}" var="o">
                <div class="report-item d-flex align-items-center">
                  <div class="report-icon">
                    <i class="fas fa-chart-bar"></i>
                  </div>
                  <div class="flex-grow-1">
                    <div class="d-flex justify-content-between align-items-start">
                      <a href="profile?action=viewReport&reportId=${o.reportId}"><h6 class="mb-1">${accDao.getAccountById(o.reportedAccount).accountName} - ${accDao.getCriteriaById(o.criteriaId).content}</h6></a>
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
                    <p class="text-muted mb-0 small">Cập nhật: <fmt:formatDate value="${o.reportTime}" pattern="dd/MM/yyyy"/></p>
                  </div>
                </div>
              </c:forEach>
            </div>

            <!-- Báo cáo nhận được -->
            <div class="tab-pane fade" id="received" role="tabpanel" aria-labelledby="received-tab">
              <h5 class="section-heading">Báo cáo nhận được (${accDao.getNumberOfReportsByReportedAcc(o.reportedAccount)})</h5>

              <c:forEach items="${reportedList}" var="o">
                <div class="report-item d-flex align-items-center">
                  <div class="report-icon">
                    <i class="fas fa-file-alt"></i>
                  </div>
                  <div class="flex-grow-1">
                    <div class="d-flex justify-content-between align-items-start">
                      <h6 class="mb-1">${accDao.getAccountById(o.reportedAccount).accountName} - ${accDao.getCriteriaById(o.criteriaId).content}</h6>
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
                    <p class="text-muted mb-0 small">Từ: ${accDao.getAccountById(o.reportBy).accountName} - <fmt:formatDate value="${o.reportTime}" pattern="dd/MM/yyyy"/></p>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Floating Action Button -->
<a href="#" class="floating-create-btn">
  <i class="fas fa-plus fa-lg"></i>
</a>
<%@include file="includes/footer.jsp"%>
</body>
</html>