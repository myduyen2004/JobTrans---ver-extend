<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/26/2025
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản Lý Giao Dịch - Admin Dashboard</title>
  <style>
    body {
      background-color: #f5f7fa;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }

    .header {
      background: linear-gradient(to right, rgb(21, 42, 105), rgb(54, 75, 140));
      color: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .header h1 {
      font-size: 24px;
      animation: fadeIn 1s ease-in-out;
    }

    .user-info {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .user-avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background-color: #fff;
      display: flex;
      align-items: center;
      justify-content: center;
      color: rgb(21, 42, 105);
      font-weight: bold;
    }

    .card {
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      padding: 20px;
      margin-bottom: 20px;
      animation: slideUp 0.5s ease-out;
    }

    .filter-section {
      display: flex;
      gap: 15px;
      flex-wrap: wrap;
      margin-bottom: 15px;
    }

    .filter-item {
      flex: 1;
      min-width: 200px;
    }

    .filter-item label {
      display: block;
      margin-bottom: 5px;
      font-weight: 500;
      color: #555;
    }

    .filter-item input, .filter-item select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      outline: none;
      transition: border 0.3s;
    }

    .filter-item input:focus, .filter-item select:focus {
      border-color: rgb(54, 75, 140);
    }

    .button {
      background: linear-gradient(to right, rgb(21, 42, 105), rgb(54, 75, 140));
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      transition: all 0.3s;
    }

    .button:hover {
      opacity: 0.9;
      transform: translateY(-2px);
    }

    .button-small {
      padding: 5px 10px;
      font-size: 12px;
    }

    .button-add {
      display: flex;
      align-items: center;
      gap: 5px;
    }

    .table-container {
      overflow-x: auto;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #eee;
    }

    th {
      background-color: rgba(21, 42, 105, 0.1);
      color: rgb(21, 42, 105);
      font-weight: 600;
    }

    tr:hover {
      background-color: rgba(54, 75, 140, 0.05);
    }

    .status {
      padding: 5px 10px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: 500;
    }

    .status-success {
      background-color: rgba(39, 174, 96, 0.1);
      color: #27ae60;
    }

    .status-pending {
      background-color: rgba(241, 196, 15, 0.1);
      color: #f1c40f;
    }

    .status-failed {
      background-color: rgba(231, 76, 60, 0.1);
      color: #e74c3c;
    }

    .action-buttons {
      display: flex;
      gap: 5px;
    }

    .pagination {
      display: flex;
      justify-content: flex-end;
      gap: 5px;
      margin-top: 20px;
    }

    .pagination button {
      background-color: white;
      border: 1px solid #ddd;
      padding: 5px 10px;
      border-radius: 5px;
      cursor: pointer;
    }

    .pagination button.active {
      background: linear-gradient(to right, rgb(21, 42, 105), rgb(54, 75, 140));
      color: white;
      border: none;
    }

    .stats-cards {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 20px;
      margin-bottom: 20px;
    }

    .stat-card {
      background: white;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      text-align: center;
      animation: pulse 2s infinite ease-in-out;
    }

    .stat-card h3 {
      font-size: 14px;
      color: #777;
      margin-bottom: 10px;
    }

    .stat-card .value {
      font-size: 24px;
      font-weight: bold;
      color: rgb(21, 42, 105);
    }

    .stat-card.income .value {
      color: #27ae60;
    }

    .stat-card.expense .value {
      color: #e74c3c;
    }

    .modal {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      z-index: 100;
      animation: fadeIn 0.3s;
    }

    .modal-content {
      background-color: white;
      margin: 10% auto;
      padding: 20px;
      width: 80%;
      max-width: 500px;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
      animation: slideDown 0.5s;
    }

    .modal-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }

    .close {
      font-size: 24px;
      cursor: pointer;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: 500;
    }

    .form-group input, .form-group select, .form-group textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }

    .form-actions {
      display: flex;
      justify-content: flex-end;
      gap: 10px;
      margin-top: 20px;
    }

    .loader {
      border: 4px solid #f3f3f3;
      border-radius: 50%;
      border-top: 4px solid rgb(21, 42, 105);
      width: 20px;
      height: 20px;
      animation: spin 1s linear infinite;
      margin: 0 auto;
      display: none;
    }

    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }

    @keyframes slideUp {
      from {
        transform: translateY(20px);
        opacity: 0;
      }
      to {
        transform: translateY(0);
        opacity: 1;
      }
    }

    @keyframes slideDown {
      from {
        transform: translateY(-20px);
        opacity: 0;
      }
      to {
        transform: translateY(0);
        opacity: 1;
      }
    }

    @keyframes pulse {
      0% { transform: scale(1); }
      50% { transform: scale(1.03); }
      100% { transform: scale(1); }
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }

    @media (max-width: 768px) {
      .stats-cards {
        grid-template-columns: 1fr;
      }

      .filter-section {
        flex-direction: column;
      }

      .filter-item {
        min-width: 100%;
      }
    }
  </style>
</head>
<body>
<%@include file="includes/header-01.jsp"%>
<div class="container">
  <header class="header">
    <h1>HỆ THỐNG QUẢN LÝ GIAO DỊCH</h1>
    <div class="user-info">
      <span>Admin</span>
      <div class="user-avatar">A</div>
    </div>
  </header>

  <div class="stats-cards">
    <div class="stat-card">
      <h3>TỔNG SỐ GIAO DỊCH</h3>
      <div class="value">1,234</div>
    </div>
    <div class="stat-card income">
      <h3>TỔNG THU</h3>
      <div class="value">2,500,000,000 ₫</div>
    </div>
    <div class="stat-card expense">
      <h3>TỔNG CHI</h3>
      <div class="value">1,800,000,000 ₫</div>
    </div>
    <div class="stat-card">
      <h3>SỐ DƯ</h3>
      <div class="value">700,000,000 ₫</div>
    </div>
  </div>

  <div class="card">
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
      <h2>Danh Sách Giao Dịch</h2>
      <button class="button button-add" onclick="openAddModal()">
        <span>+</span> Thêm Giao Dịch
      </button>
    </div>

    <div class="filter-section">
      <div class="filter-item">
        <label for="search">Tìm kiếm</label>
        <input type="text" id="search" placeholder="Nhập mã hoặc mô tả...">
      </div>
      <div class="filter-item">
        <label for="dateFrom">Từ ngày</label>
        <input type="date" id="dateFrom">
      </div>
      <div class="filter-item">
        <label for="dateTo">Đến ngày</label>
        <input type="date" id="dateTo">
      </div>
      <div class="filter-item">
        <label for="status">Trạng thái</label>
        <select id="status">
          <option value="">Tất cả</option>
          <option value="success">Thành công</option>
          <option value="pending">Đang xử lý</option>
          <option value="failed">Thất bại</option>
        </select>
      </div>
      <div class="filter-item">
        <label for="type">Loại giao dịch</label>
        <select id="type">
          <option value="">Tất cả</option>
          <option value="income">Thu</option>
          <option value="expense">Chi</option>
        </select>
      </div>
      <div class="filter-item" style="display: flex; align-items: flex-end;">
        <button class="button" style="width: 100%;">Lọc</button>
      </div>
    </div>

    <div class="table-container">
      <table>
        <thead>
        <tr>
          <th>Mã GD</th>
          <th>Ngày</th>
          <th>Mô tả</th>
          <th>Loại</th>
          <th>Số tiền</th>
          <th>Trạng thái</th>
          <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>GD0001</td>
          <td>26/04/2025</td>
          <td>Thu tiền dự án A</td>
          <td>Thu</td>
          <td>500,000,000 ₫</td>
          <td><span class="status status-success">Thành công</span></td>
          <td>
            <div class="action-buttons">
              <button class="button button-small" onclick="openViewModal('GD0001')">Xem</button>
              <button class="button button-small" onclick="openEditModal('GD0001')">Sửa</button>
            </div>
          </td>
        </tr>
        <tr>
          <td>GD0002</td>
          <td>25/04/2025</td>
          <td>Chi tiền lương nhân viên</td>
          <td>Chi</td>
          <td>300,000,000 ₫</td>
          <td><span class="status status-success">Thành công</span></td>
          <td>
            <div class="action-buttons">
              <button class="button button-small" onclick="openViewModal('GD0002')">Xem</button>
              <button class="button button-small" onclick="openEditModal('GD0002')">Sửa</button>
            </div>
          </td>
        </tr>
        <tr>
          <td>GD0003</td>
          <td>24/04/2025</td>
          <td>Thu tiền dự án B</td>
          <td>Thu</td>
          <td>800,000,000 ₫</td>
          <td><span class="status status-pending">Đang xử lý</span></td>
          <td>
            <div class="action-buttons">
              <button class="button button-small" onclick="openViewModal('GD0003')">Xem</button>
              <button class="button button-small" onclick="openEditModal('GD0003')">Sửa</button>
            </div>
          </td>
        </tr>
        <tr>
          <td>GD0004</td>
          <td>23/04/2025</td>
          <td>Chi tiền văn phòng phẩm</td>
          <td>Chi</td>
          <td>15,000,000 ₫</td>
          <td><span class="status status-success">Thành công</span></td>
          <td>
            <div class="action-buttons">
              <button class="button button-small" onclick="openViewModal('GD0004')">Xem</button>
              <button class="button button-small" onclick="openEditModal('GD0004')">Sửa</button>
            </div>
          </td>
        </tr>
        <tr>
          <td>GD0005</td>
          <td>22/04/2025</td>
          <td>Chi tiền thuê văn phòng</td>
          <td>Chi</td>
          <td>50,000,000 ₫</td>
          <td><span class="status status-failed">Thất bại</span></td>
          <td>
            <div class="action-buttons">
              <button class="button button-small" onclick="openViewModal('GD0005')">Xem</button>
              <button class="button button-small" onclick="openEditModal('GD0005')">Sửa</button>
            </div>
          </td>
        </tr>
        <tr>
          <td>GD0006</td>
          <td>21/04/2025</td>
          <td>Thu tiền hợp đồng C</td>
          <td>Thu</td>
          <td>1,200,000,000 ₫</td>
          <td><span class="status status-success">Thành công</span></td>
          <td>
            <div class="action-buttons">
              <button class="button button-small" onclick="openViewModal('GD0006')">Xem</button>
              <button class="button button-small" onclick="openEditModal('GD0006')">Sửa</button>
            </div>
          </td>
        </tr>
        </tbody>
      </table>
    </div>

    <div class="pagination">
      <button>&lt;</button>
      <button class="active">1</button>
      <button>2</button>
      <button>3</button>
      <button>&gt;</button>
    </div>
  </div>
</div>

<!-- Modal Thêm Giao Dịch -->
<div id="addModal" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <h2>Thêm Giao Dịch Mới</h2>
      <span class="close" onclick="closeModal('addModal')">&times;</span>
    </div>
    <form id="addForm">
      <div class="form-group">
        <label for="transactionType">Loại giao dịch</label>
        <select id="transactionType" required>
          <option value="income">Thu</option>
          <option value="expense">Chi</option>
        </select>
      </div>
      <div class="form-group">
        <label for="amount">Số tiền (VNĐ)</label>
        <input type="number" id="amount" required placeholder="Ví dụ: 5000000">
      </div>
      <div class="form-group">
        <label for="description">Mô tả</label>
        <textarea id="description" rows="3" required placeholder="Mô tả chi tiết giao dịch"></textarea>
      </div>
      <div class="form-group">
        <label for="date">Ngày giao dịch</label>
        <input type="date" id="date" required>
      </div>
      <div class="form-group">
        <label for="category">Danh mục</label>
        <select id="category" required>
          <option value="salary">Lương</option>
          <option value="project">Dự án</option>
          <option value="office">Văn phòng</option>
          <option value="tax">Thuế</option>
          <option value="other">Khác</option>
        </select>
      </div>
      <div class="form-group">
        <label for="paymentMethod">Phương thức thanh toán</label>
        <select id="paymentMethod" required>
          <option value="bank">Chuyển khoản</option>
          <option value="cash">Tiền mặt</option>
          <option value="card">Thẻ tín dụng</option>
        </select>
      </div>
      <div class="form-actions">
        <div class="loader" id="submitLoader"></div>
        <button type="button" class="button" style="background-color: #ccc;" onclick="closeModal('addModal')">Hủy</button>
        <button type="submit" class="button">Lưu</button>
      </div>
    </form>
  </div>
</div>

<!-- Modal Xem Chi Tiết -->
<div id="viewModal" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <h2>Chi Tiết Giao Dịch</h2>
      <span class="close" onclick="closeModal('viewModal')">&times;</span>
    </div>
    <div id="transactionDetails">
      <p><strong>Mã giao dịch:</strong> <span id="viewId">GD0001</span></p>
      <p><strong>Ngày:</strong> <span id="viewDate">26/04/2025</span></p>
      <p><strong>Mô tả:</strong> <span id="viewDescription">Thu tiền dự án A</span></p>
      <p><strong>Loại:</strong> <span id="viewType">Thu</span></p>
      <p><strong>Số tiền:</strong> <span id="viewAmount">500,000,000 ₫</span></p>
      <p><strong>Danh mục:</strong> <span id="viewCategory">Dự án</span></p>
      <p><strong>Phương thức thanh toán:</strong> <span id="viewPaymentMethod">Chuyển khoản</span></p>
      <p><strong>Trạng thái:</strong> <span class="status status-success">Thành công</span></p>
      <p><strong>Người tạo:</strong> <span id="viewCreatedBy">Admin</span></p>
      <p><strong>Ngày tạo:</strong> <span id="viewCreatedDate">26/04/2025 08:30</span></p>
      <p><strong>Ghi chú bổ sung:</strong> <span id="viewNotes">Hợp đồng dự án A đã hoàn thành 100%. Khách hàng đã thanh toán đủ.</span></p>
    </div>
    <div class="form-actions">
      <button type="button" class="button" onclick="closeModal('viewModal')">Đóng</button>
    </div>
  </div>
</div>

<!-- Modal Sửa Giao Dịch -->
<div id="editModal" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <h2>Sửa Giao Dịch</h2>
      <span class="close" onclick="closeModal('editModal')">&times;</span>
    </div>
    <form id="editForm">
      <div class="form-group">
        <label for="editId">Mã giao dịch</label>
        <input type="text" id="editId" readonly>
      </div>
      <div class="form-group">
        <label for="editType">Loại giao dịch</label>
        <select id="editType" required>
          <option value="income">Thu</option>
          <option value="expense">Chi</option>
        </select>
      </div>
      <div class="form-group">
        <label for="editAmount">Số tiền (VNĐ)</label>
        <input type="number" id="editAmount" required>
      </div>
      <div class="form-group">
        <label for="editDescription">Mô tả</label>
        <textarea id="editDescription" rows="3" required></textarea>
      </div>
      <div class="form-group">
        <label for="editDate">Ngày giao dịch</label>
        <input type="date" id="editDate" required>
      </div>
      <div class="form-group">
        <label for="editCategory">Danh mục</label>
        <select id="editCategory" required>
          <option value="salary">Lương</option>
          <option value="project">Dự án</option>
          <option value="office">Văn phòng</option>
          <option value="tax">Thuế</option>
          <option value="other">Khác</option>
        </select>
      </div>
      <div class="form-group">
        <label for="editStatus">Trạng thái</label>
        <select id="editStatus" required>
          <option value="success">Thành công</option>
          <option value="pending">Đang xử lý</option>
          <option value="failed">Thất bại</option>
        </select>
      </div>
      <div class="form-actions">
        <button type="button" class="button" style="background-color: #ccc;" onclick="closeModal('editModal')">Hủy</button>
        <button type="submit" class="button">Cập nhật</button>
      </div>
    </form>
  </div>
</div>
<%@include file="includes/footer.jsp"%>
<script>
  // Các hàm để mở/đóng các modal
  function openAddModal() {
    document.getElementById('addModal').style.display = 'block';
    document.getElementById('date').valueAsDate = new Date();
  }

  function openViewModal(id) {
    document.getElementById('viewModal').style.display = 'block';
    // Trong thực tế, bạn sẽ tải dữ liệu giao dịch từ máy chủ dựa trên ID
    document.getElementById('viewId').textContent = id;
  }

  function openEditModal(id) {
    document.getElementById('editModal').style.display = 'block';
    document.getElementById('editId').value = id;

    // Trong thực tế, bạn sẽ tải dữ liệu giao dịch từ máy chủ dựa trên ID
    if (id === 'GD0001') {
      document.getElementById('editType').value = 'income';
      document.getElementById('editAmount').value = '500000000';
      document.getElementById('editDescription').value = 'Thu tiền dự án A';
      document.getElementById('editDate').value = '2025-04-26';
      document.getElementById('editCategory').value = 'project';
      document.getElementById('editStatus').value = 'success';
    }
  }

  function closeModal(modalId) {
    document.getElementById(modalId).style.display = 'none';
  }

  // Đóng modal khi click ra ngoài
  window.onclick = function(event) {
    if (event.target.className === 'modal') {
      event.target.style.display = 'none';
    }
  }

  // Xử lý sự kiện submit form
  document.getElementById('addForm').addEventListener('submit', function(e) {
    e.preventDefault();
    document.getElementById('submitLoader').style.display = 'block';

    // Giả lập việc gửi dữ liệu
    setTimeout(function() {
      document.getElementById('submitLoader').style.display = 'none';
      closeModal('addModal');
      alert('Thêm giao dịch thành công!');
      // Trong thực tế, bạn sẽ làm mới danh sách giao dịch
    }, 1000);
  });

  document.getElementById('editForm').addEventListener('submit', function(e) {
    e.preventDefault();

    // Giả lập việc cập nhật dữ liệu
    setTimeout(function() {
      closeModal('editModal');
      alert('Cập nhật giao dịch thành công!');
      // Trong thực tế, bạn sẽ làm mới danh sách giao dịch
    }, 500);
  });
</script>
</body>
</html>
