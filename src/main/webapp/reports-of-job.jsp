<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <jsp:useBean id="accountDAO" class="jobtrans.dal.AccountDAO" scope="page" />
  <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="page" />
  <jsp:useBean id="criteriaDAO" class="jobtrans.dal.CriteriaDAO" scope="page" />
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh sách báo cáo vi phạm</title>
  <style>
    :root {
      --primary-color: rgb(21, 42, 105);
      --primary-light: rgb(54, 75, 140);
      --accent-color: #6787fe;
      --text-color: #333;
      --text-light: #555;
      --border-color: #e1e5eb;
      --bg-color: #f7f9fc;
      --white: #ffffff;
      --shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
      --transition: all 0.3s ease;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: var(--bg-color);
      color: var(--text-color);
      line-height: 1.6;
      padding: 20px;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }

    .page-header {
      background: linear-gradient(to right, var(--primary-color), var(--primary-light));
      color: var(--white);
      padding: 25px 30px;
      border-radius: 12px;
      margin-bottom: 30px;
      box-shadow: var(--shadow);
      position: relative;
      overflow: hidden;
    }

    .page-header::before {
      content: '';
      position: absolute;
      top: -50%;
      left: -50%;
      width: 200%;
      height: 200%;
      background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
      animation: shimmer 8s infinite linear;
      pointer-events: none;
    }

    @keyframes shimmer {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }

    .page-header h1 {
      font-size: 28px;
      margin-bottom: 10px;
      position: relative;
      z-index: 1;
    }

    .page-header p {
      font-size: 16px;
      opacity: 0.9;
      position: relative;
      z-index: 1;
    }

    .job-info {
      background-color: rgba(255, 255, 255, 0.1);
      padding: 15px;
      border-radius: 8px;
      margin-top: 15px;
      position: relative;
      z-index: 1;
    }

    .job-info strong {
      margin-right: 10px;
    }

    .filter-section {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 25px;
      flex-wrap: wrap;
      gap: 15px;
    }

    .search-box {
      display: flex;
      align-items: center;
      background-color: var(--white);
      border-radius: 8px;
      padding: 10px 15px;
      box-shadow: var(--shadow);
      flex: 1;
      max-width: 400px;
    }

    .search-box input {
      border: none;
      outline: none;
      background: transparent;
      padding: 5px 10px;
      font-size: 15px;
      color: var(--text-color);
      width: 100%;
    }

    .search-box i {
      color: var(--text-light);
    }

    .filters {
      display: flex;
      gap: 15px;
      align-items: center;
      flex-wrap: wrap;
    }

    .filter-dropdown {
      position: relative;
    }

    .filter-dropdown select {
      appearance: none;
      background-color: var(--white);
      border: 1px solid var(--border-color);
      border-radius: 8px;
      padding: 10px 35px 10px 15px;
      font-size: 14px;
      color: var(--text-color);
      cursor: pointer;
      outline: none;
      box-shadow: var(--shadow);
      transition: var(--transition);
      background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23333' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
      background-repeat: no-repeat;
      background-position: right 10px center;
      background-size: 16px;
    }

    .filter-dropdown select:focus {
      border-color: var(--accent-color);
    }

    .reports-grid {
      display: grid;
      /*grid-template-columns: repeat(auto-fill, minmax(340px, 1fr));*/
      gap: 25px;
      /*margin-top: 20px;*/
    }

    .report-card {
      background-color: var(--white);
      border-radius: 12px;
      overflow: hidden;
      box-shadow: var(--shadow);
      transition: var(--transition);
      border: 1px solid var(--border-color);
    }

    .report-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    }

    .report-header {
      padding: 15px 20px;
      border-bottom: 1px solid var(--border-color);
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .report-id {
      font-size: 15px;
      font-weight: 600;
      color: var(--primary-color);
    }

    .report-date {
      font-size: 13px;
      color: var(--text-light);
    }

    .report-content {
      padding: 20px;
    }

    .parties {
      display: flex;
      flex-direction: column;
      gap: 12px;
      margin-bottom: 20px;
    }

    .party {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .party-avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      color: var(--white);
      font-weight: 600;
      font-size: 16px;
    }

    .reporter .party-avatar {
      background-color: var(--primary-light);
    }

    .reported .party-avatar {
      background-color: #e74c3c;
    }

    .party-info {
      flex: 1;
    }

    .party-name {
      font-weight: 600;
      color: var(--text-color);
      margin-bottom: 2px;
    }

    .party-role {
      font-size: 13px;
      color: var(--text-light);
    }

    .report-details {
      margin-top: 15px;
    }

    .detail-item {
      margin-bottom: 12px;
    }

    .detail-label {
      font-size: 13px;
      color: var(--text-light);
      margin-bottom: 3px;
    }

    .detail-value {
      font-size: 15px;
      color: var(--text-color);
    }

    .report-footer {
      padding: 15px 20px;
      border-top: 1px solid var(--border-color);
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .status-badge {
      padding: 6px 12px;
      border-radius: 50px;
      font-size: 12px;
      font-weight: 600;
      text-transform: uppercase;
    }

    .status-pending {
      background-color: #fff8e1;
      color: #ffa000;
    }

    .status-processing {
      background-color: #e3f2fd;
      color: #1976d2;
    }

    .status-resolved {
      background-color: #e8f5e9;
      color: #2e7d32;
    }

    .status-rejected {
      background-color: #feeceb;
      color: #d32f2f;
    }

    .action-buttons {
      display: flex;
      gap: 10px;
    }

    .btn {
      padding: 8px 16px;
      border-radius: 6px;
      font-size: 13px;
      font-weight: 600;
      cursor: pointer;
      transition: var(--transition);
      border: none;
      display: flex;
      align-items: center;
      gap: 5px;
    }

    .btn-primary {
      background-color: var(--primary-color);
      color: var(--white);
    }

    .btn-primary:hover {
      background-color: var(--primary-light);
    }

    .btn-outline {
      background-color: transparent;
      border: 1px solid var(--border-color);
      color: var(--text-color);
    }

    .btn-outline:hover {
      background-color: #f5f7fa;
    }

    .pagination {
      display: flex;
      justify-content: center;
      margin-top: 40px;
      gap: 5px;
    }

    .pagination-item {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 40px;
      height: 40px;
      border-radius: 8px;
      border: 1px solid var(--border-color);
      font-weight: 600;
      cursor: pointer;
      transition: var(--transition);
      background-color: var(--white);
    }

    .pagination-item.active {
      background-color: var(--primary-color);
      color: var(--white);
      border-color: var(--primary-color);
    }

    .pagination-item:hover:not(.active) {
      background-color: #f5f7fa;
    }

    .back-button {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 12px 20px;
      background: linear-gradient(to right, #f8f9fa, #e9ecef);
      color: #3a4a63;
      border: none;
      border-radius: 8px;
      font-weight: 600;
      font-size: 14.5px;
      transition: all 0.3s ease;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
      cursor: pointer;
      position: relative;
      overflow: hidden;
      margin-bottom: 20px;
      width: fit-content;
    }

    .back-button:before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 0;
      height: 100%;
      background: rgba(103, 135, 254, 0.1);
      transition: width 0.4s ease;
      z-index: 1;
    }

    .back-button:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
      color: #152a69;
    }

    .back-button:hover:before {
      width: 100%;
    }

    .back-button:active {
      transform: translateY(1px);
    }

    .back-button i,
    .back-button span {
      position: relative;
      z-index: 2;
    }

    .back-button:hover i {
      transform: translateX(-3px);
      transition: transform 0.3s ease;
    }

    .no-reports {
      background-color: var(--white);
      border-radius: 12px;
      padding: 40px;
      text-align: center;
      box-shadow: var(--shadow);
      margin-top: 30px;
    }

    .no-reports i {
      font-size: 48px;
      color: #cbd5e0;
      margin-bottom: 20px;
    }

    .no-reports h3 {
      font-size: 20px;
      margin-bottom: 10px;
      color: var(--text-color);
    }

    .no-reports p {
      color: var(--text-light);
      margin-bottom: 20px;
    }

    @media (max-width: 768px) {
      .reports-grid {
        grid-template-columns: 1fr;
      }

      .filter-section {
        flex-direction: column;
        align-items: stretch;
      }

      .search-box {
        max-width: 100%;
      }

      .filters {
        justify-content: space-between;
      }

      .job-info {
        flex-direction: column;
      }
    }
    /* Reports Grid Layout */
    .reports-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
      gap: 1.5rem;
      margin: 2rem 0;
      animation: fadeIn 0.5s ease-in;
    }

    /* Report Card Styling & Animation */
    .report-card {
      background: var(--card-bg);
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 6px 12px var(--card-shadow);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      position: relative;
      border-top: 4px solid transparent;
      background-clip: padding-box;
    }

    .report-card::before {
      content: '';
      position: absolute;
      top: -4px;
      left: 0;
      right: 0;
      height: 4px;
      background: linear-gradient(to right, var(--primary-dark), var(--primary-light), var(--accent-light));
      animation: gradientShift 3s infinite alternate;
    }

    .report-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 12px 20px var(--card-shadow);
    }

    /* Header section */
    .report-header {
      padding: 1.25rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: linear-gradient(to right, var(--primary-dark), var(--primary-light));
      color: var(--text-light);
    }

    .report-id {
      font-weight: bold;
      font-size: 1.1rem;
      letter-spacing: 0.5px;
    }

    .report-date {
      font-size: 0.9rem;
      opacity: 0.9;
    }

    /* Content section */
    .report-content {
      padding: 1.25rem;
    }

    /* Party sections */
    .parties {
      display: flex;
      flex-direction: column;
      gap: 1rem;
      margin-bottom: 1.25rem;
    }

    .party {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      padding: 0.75rem;
      border-radius: 8px;
      transition: background-color 0.2s ease;
    }

    .reporter {
      background-color: rgba(21, 42, 105, 0.08);
    }

    .reported {
      background-color: rgba(54, 75, 140, 0.08);
    }

    .party:hover {
      background-color: rgba(82, 113, 196, 0.15);
    }

    .party-avatar {
      width: 2.5rem;
      height: 2.5rem;
      border-radius: 50%;
      background: linear-gradient(135deg, var(--primary-light), var(--primary-dark));
      /*color: var(--text-light);*/
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.2rem;
      box-shadow: 0 2px 6px rgba(21, 42, 105, 0.2);
    }

    .party-info {
      flex: 1;
    }

    .party-name {
      font-weight: 500;
      color: var(--text-dark);
    }

    /* Report details */
    .report-details {
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }

    .detail-item {
      padding: 0.875rem;
      border-radius: 8px;
      background-color: rgba(82, 113, 196, 0.05);
      transition: background-color 0.2s ease;
    }

    .detail-item:hover {
      background-color: rgba(82, 113, 196, 0.1);
    }

    .detail-label {
      margin-bottom: 0.5rem;
      color: var(--primary-dark);
      font-size: 0.9rem;
    }

    .detail-value {
      color: var(--text-dark);
      line-height: 1.5;
    }

    /* Footer section */
    .report-footer {
      padding: 1rem 1.25rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-top: 1px solid rgba(21, 42, 105, 0.1);
    }

    /* Status badge */
    .status-badge {
      padding: 4px 12px;
      border-radius: 16px;
      font-size: 13px;
      font-weight: 600;
      display: inline-block;
      text-align: center;
    }

    /* Màu cho các trạng thái */
    .status-pending {
      background-color: #fff6cc;
      color: #b08500;
    }

    .status-done {
      background-color: #e1f7e7;
      color: #2e7d32;
    }

    .status-rejected {
      background-color: #ffe0e0;
      color: #d32f2f;
    }


    /* Action buttons */
    .action-buttons {
      display: flex;
      gap: 0.5rem;
    }

    .btn {
      padding: 0.5rem 1rem;
      border-radius: 6px;
      font-size: 0.9rem;
      font-weight: 500;
      display: flex;
      align-items: center;
      gap: 0.5rem;
      cursor: pointer;
      transition: all 0.2s ease;
    }

    .btn-outline {
      border: 1px solid var(--primary-light);
      color: var(--primary-light);
      background: transparent;
    }

    .btn-outline:hover {
      background-color: var(--primary-light);
      color: white;
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(54, 75, 140, 0.3);
    }

    /* Animations */
    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(10px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @keyframes shimmer {
      0% {
        left: -100%;
      }
      100% {
        left: 100%;
      }
    }

    @keyframes gradientShift {
      0% {
        background-position: 0% 50%;
      }
      100% {
        background-position: 100% 50%;
      }
    }

    /* Staggered entry animation for cards */
    .report-card {
      opacity: 0;
      animation: cardEntry 0.5s ease forwards;
    }

    @keyframes cardEntry {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Apply staggered delay to cards */
    .report-card:nth-child(1) { animation-delay: 0.1s; }
    .report-card:nth-child(2) { animation-delay: 0.2s; }
    .report-card:nth-child(3) { animation-delay: 0.3s; }
    .report-card:nth-child(4) { animation-delay: 0.4s; }
    .report-card:nth-child(5) { animation-delay: 0.5s; }
    .report-card:nth-child(6) { animation-delay: 0.6s; }
    .report-card:nth-child(n+7) { animation-delay: 0.7s; }

    /* Media queries for responsive design */
    @media (max-width: 768px) {
      .reports-grid {
        grid-template-columns: 1fr;
      }

      .party {
        flex-direction: column;
        text-align: center;
      }

      .party-avatar {
        margin: 0 auto;
      }
    }
  </style>
</head>
<body>
<%@include file="includes/header-01.jsp"%>
<div class="container">
  <button class="back-button" onclick="history.back()">
    <i class="fas fa-arrow-left"></i>
    <span>Quay lại</span>
  </button>

  <div class="page-header">
    <h1>Danh sách báo cáo vi phạm</h1>
    <p>Quản lý các báo cáo vi phạm trong công việc của bạn</p>
    <div class="job-info">
      <strong>Công việc: ${jobDAO.getJobById(jobId).jobTitle}</strong>
    </div>
  </div>

  <div class="filter-section">
    <div class="search-box">
      <i class="fas fa-search"></i>
      <input type="text" placeholder="Tìm kiếm báo cáo...">
    </div>
    <div class="filters">
      <div class="filter-dropdown">
        <select>
          <option value="">Trạng thái</option>
          <option value="pending">Chờ xử lý</option>
          <option value="processing">Đang xử lý</option>
          <option value="resolved">Đã giải quyết</option>
          <option value="rejected">Từ chối</option>
        </select>
      </div>
      <div class="filter-dropdown">
        <select>
          <option value="">Sắp xếp theo</option>
          <option value="newest">Mới nhất</option>
          <option value="oldest">Cũ nhất</option>
        </select>
      </div>
    </div>
  </div>

  <div class="reports-grid">
    <c:forEach var="report" items="${reportList}">
      <div class="report-card">
        <div class="report-header">
          <div class="report-id">#RP${report.reportId}</div>
          <div class="report-date">
            ${report.reportTime}
          </div>
        </div>
        <div class="report-content">
          <div class="parties">
            <div class="party reporter">
              <div class="party-avatar"><i class="fas fa-user"></i></div>
              <div class="party-info">
                <div class="party-name">Người báo cáo: ${accountDAO.getAccountById(report.reportBy).accountName}</div>
              </div>
            </div>
            <div class="party reported">
              <div class="party-avatar"><i class="fas fa-user"></i></div>
              <div class="party-info">
                <div class="party-name">Tài khoản bị báo cáo: ${accountDAO.getAccountById(report.reportedAccount).accountName}</div>
              </div>
            </div>
          </div>
          <div class="report-details">
            <div class="detail-item">
              <div class="detail-label"><strong>Tiêu chí vi phạm</strong></div>
              <div class="detail-value">${criteriaDAO.getCriteriaById(report.criteriaId).content}</div>
            </div>
            <div class="detail-item">
              <div class="detail-label"><strong>Mô tả vắn tắt</strong></div>
              <div class="detail-value">
                <c:out value="${report.contentReport}" />
              </div>
            </div>
          </div>
        </div>
        <div class="report-footer">
          <c:choose>
            <c:when test="${report.status == 'Chờ xử lí'}">
              <div class="status-badge status-pending">${report.status}</div>
            </c:when>
            <c:when test="${report.status == 'Đã xử lí'}">
              <div class="status-badge status-done">${report.status}</div>
            </c:when>
            <c:when test="${report.status == 'Bị từ chối'}">
              <div class="status-badge status-rejected">${report.status}</div>
            </c:when>
            <c:otherwise>
              <div class="status-badge">${report.status}</div>
            </c:otherwise>
          </c:choose>

          <div class="action-buttons">
            <form action="job-manage-process" method="get">
              <input type="hidden" name="action" value="view-report">
              <input type="hidden" name="reportId" value="${report.reportId}" />
              <button class="btn btn-outline">
                <i class="far fa-eye"></i> Chi tiết
              </button>
            </form>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
  <!-- Empty state (hidden by default) -->
  <div class="no-reports" style="display: none;">
    <i class="far fa-clipboard"></i>
    <h3>Không có báo cáo nào</h3>
    <p>Hiện tại chưa có báo cáo vi phạm nào cho công việc này</p>
    <button class="btn btn-primary">
      <i class="fas fa-plus"></i> Tạo báo cáo mới
    </button>
  </div>
</div>
</body>
<%@include file="includes/footer.jsp"%>
</html>