<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Giao Dịch - Admin Dashboard</title>
    <link href="./css/admin-transaction-list-manage.css" rel="stylesheet"/>
</head>
<%@include file="includes/header-01.jsp" %>
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
            <div class="value">${transactions.size()}</div>
        </div>
        <div class="stat-card income">
            <h3>TỔNG THU</h3>
            <div class="value"><fmt:formatNumber value="${totalIncome}" pattern="#,###" /> VND</div>
        </div>
        <div class="stat-card expense">
            <h3>TỔNG CHI</h3>
            <div class="value"><fmt:formatNumber value="${totalExpense}" pattern="#,###" /> VND</div>
        </div>
        <div class="stat-card">
            <h3>SỐ DƯ</h3>
            <div class="value"><fmt:formatNumber value="${balance}" pattern="#,###" /> VND</div>
        </div>
    </div>

    <div class="card">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
            <h2>Danh Sách Giao Dịch</h2>
            <button class="button button-add" onclick="openAddModal()">
                <span>+</span> Thêm Giao Dịch
            </button>
        </div>
        <!-- Fix the form to submit with the correct parameters -->
        <form class="search-form" method="get" action="/JobTrans/trans-manage" id="transactionSearchForm">
            <!-- Add the action parameter as a hidden input field -->
            <input type="hidden" name="action" value="search">
            <div class="form-group">
                <label for="search">Tìm kiếm</label>
                <input type="text" id="search" name="search" placeholder="Nhập mã hoặc mô tả..." class="form-control">
            </div>
            <div class="form-group" style="display: flex; align-items: flex-end;">
                <button type="submit" class="btn btn-primary" style="width: 100%; background: linear-gradient(to right, rgb(21, 42, 105), rgb(54, 75, 140));
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;">
                    <i class="fas fa-search"></i> Tìm kiếm
                </button>
            </div>
        </form>

        <div class="filter-section">

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
            <%-- Phần bảng hiển thị giao dịch --%>
            <table>
                <thead>
                <tr>
                    <th>Số giao dịch</th>
                    <th>Ngày</th>
                    <th>Mô tả</th>
                    <th>Loại</th>
                    <th>Số tiền</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="transaction" items="${transactions}">


                    <tr>
                        <td>${transaction.transactionId}</td>
                        <td><fmt:formatDate value="${transaction.createdDate}" pattern="HH:mm:ss dd/MM/yyyy"/></td>
                        <td>${transaction.description}</td>
                        <td>
                            <c:choose>
                                <c:when test="${transaction.transactionType == 'Trừ tiền'}">
                                    <span>Chi</span>
                                </c:when>
                                <c:when test="${transaction.transactionType == 'Rút tiền'}">
                                    <span>Chi</span>
                                </c:when>
                                <c:when test="${transaction.transactionType == 'Thêm tiền'}">
                                    <span>Thu</span>
                                </c:when>
                                <c:otherwise>
                                    <span>${transaction.transactionType}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><fmt:formatNumber value="${transaction.amount}" pattern="#,###" /> VND</td>
                        <td>
                            <c:choose>
                                <c:when test="${transaction.status == true}">
                                    <span class="status status-success">Thành công</span>
                                </c:when>
                                <c:when test="${transaction.status == false}">
                                    <span class="status status-failed">Thất bại</span>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${transaction.transactionType == 'Trừ tiền'}">
                                            <span class="status status-success">Thành công</span>
                                        </c:when>
                                        <c:when test="${transaction.transactionType == 'Rút tiền'}">
                                            <span class="status status-pending">Đang xử lý</span>
                                        </c:when>
                                        <c:when test="${transaction.transactionType == 'Thêm tiền'}">
                                            <span class="status status-failed">Thất bại</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span>${transaction.transactionType}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <div class="action-buttons">
                                <button class="button button-small"
                                        onclick="openViewModal('${transaction.transactionId}',
                                                '${transaction.createdDate}',
                                                '${transaction.status}',
                                                '${transaction.description}',
                                                '${transaction.transactionType}',
                                                '${transaction.amount}',
                                                '${transaction.category.categoryName}'
                                                )">Xem</button>
                                <button class="button button-small" onclick="openEditModal('${transaction.transactionId}')">Sửa</button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty transactions}">
                    <tr><td colspan="7">Không có giao dịch nào.</td></tr>
                </c:if>
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
            <div class="form-actions">
                <div class="loader" id="submitLoader"></div>
                <button type="button" class="button" style="background-color: #ccc;" onclick="closeModal('addModal')">
                    Hủy
                </button>
                <button type="submit" class="button">Lưu</button>
            </div>
        </form>
    </div>
</div>

<%-- Modal Xem Chi Tiết --%>
<div id="viewModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Chi Tiết Giao Dịch</h2>
            <span class="close" onclick="closeModal('viewModal')">&times;</span>
        </div>
        <div id="transactionDetails">
            <p><strong>Mã giao dịch:</strong> <span id="viewId"></span></p>
            <p><strong>Ngày tạo:</strong> <span id="viewDate"></span></p>
            <p><strong>Mô tả:</strong> <span id="viewDescription"></span></p>
            <p><strong>Loại:</strong> <span id="viewType"></span></p>
            <p><strong>Số tiền:</strong> <span id="viewAmount"></span></p>
            <p><strong>Phương thức thanh toán:</strong> <span id="viewPaymentMethod"></span></p>
            <p><strong>Trạng thái:</strong> <span id="viewStatus" class="status"></span></p>
        </div>
        <div class="form-actions">
            <button type="button" class="button" onclick="closeModal('viewModal')">Đóng</button>
        </div>
    </div>
</div>
<div id="editModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Sửa Giao Dịch</h2>
            <span class="close" onclick="closeModal('editModal')">&times;</span>
        </div>
        <form id="editForm" action="/trans-manage?action=edit" method="post">
            <div class="form-group" style="display:none;">
                <label for="editId">Mã giao dịch</label>
                <input type="hidden" id="editId" name="id"  class="form-control">
            </div>
            <div class="form-group">
                <label for="editType">Loại giao dịch</label>
                <select id="editType" name="transactionType" required class="form-control">
                    <option value="Thêm tiền">Thu</option>
                    <option value="Trừ tiền">Chi</option>
                </select>
            </div>
            <div class="form-group">
                <label for="editAmount">Số tiền (VNĐ)</label>
                <input type="number" id="editAmount" name="amount" required class="form-control" step="0.01">
            </div>
            <div class="form-group">
                <label for="editDescription">Mô tả</label>
                <textarea id="editDescription" name="description" rows="3" required class="form-control"></textarea>
            </div>
            <div class="form-group">
                <label for="editDate">Ngày giao dịch</label>
                <input type="date" id="editDate" name="createdDate" required class="form-control">
            </div>
            <div class="form-group">
                <label for="editStatus">Trạng thái</label>
                <select id="editStatus" name="status" required class="form-control">
                    <option value="true">Thành công</option>
                    <option value="false">Thất bại</option>
                </select>
            </div>
            <div class="form-actions">
                <button type="button" class="btn btn-secondary" onclick="closeModal('editModal')">
                    Hủy
                </button>
                <button type="submit" class="btn btn-primary">Cập nhật</button>
            </div>
        </form>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
<script>
    // Các hàm để mở/đóng các modal
    function openAddModal() {
        document.getElementById('addModal').style.display = 'block';
        document.getElementById('date').valueAsDate = new Date();
    }
    function openViewModal(id, createdDate, status, description, transactionType, amount) {
        // Hiển thị modal
        document.getElementById('viewModal').style.display = 'block';

        // Cập nhật ID giao dịch
        document.getElementById('viewId').textContent = id;

        // Định dạng ngày tạo
        const formattedDate = new Intl.DateTimeFormat('vi-VN', {
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit',
            day: '2-digit',
            month: 'numeric',
            year: 'numeric'
        }).format(new Date(createdDate));
        document.getElementById('viewDate').textContent = formattedDate;

        // Cập nhật mô tả
        document.getElementById('viewDescription').textContent = description;

        // Xử lý loại giao dịch
        let displayType;
        if (transactionType === 'Trừ tiền' || transactionType === 'Rút tiền') {
            displayType = 'Chi';
        } else if (transactionType === 'Thêm tiền') {
            displayType = 'Thu';
        } else {
            displayType = transactionType;
        }
        document.getElementById('viewType').textContent = displayType;

        // Định dạng số tiền
        const formattedAmount = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(amount);
        document.getElementById('viewAmount').textContent = formattedAmount;

        // Mặc định một số thông tin khác
        document.getElementById('viewPaymentMethod').textContent = 'Chuyển khoản';

        // Xử lý trạng thái giao dịch dựa vào tham số status
        const statusSpan = document.getElementById('viewStatus');

        // Kiểm tra trạng thái và hiển thị tương ứng
        if (status === 'true') {
            statusSpan.textContent = 'Thành công';
            statusSpan.className = 'status status-success';
        } else if (status === 'false') {
            statusSpan.textContent = 'Thất bại';
            statusSpan.className = 'status status-failed';
        } else {
            // Xử lý trạng thái dựa vào loại giao dịch nếu không có status rõ ràng
            if (transactionType === 'Trừ tiền') {
                statusSpan.textContent = 'Thành công';
                statusSpan.className = 'status status-success';
            } else if (transactionType === 'Rút tiền') {
                statusSpan.textContent = 'Đang xử lý';
                statusSpan.className = 'status status-pending';
            } else if (transactionType === 'Thêm tiền') {
                statusSpan.textContent = 'Thất bại';
                statusSpan.className = 'status status-failed';
            } else {
                statusSpan.textContent = 'Không xác định';
                statusSpan.className = 'status';
            }
        }
    }



    function openEditModal(id) {
        const modal = document.getElementById('editModal');
        const form = document.getElementById('editForm');

        // Lấy thông tin giao dịch từ bảng (hoặc từ server nếu cần)
        let row = null;
        const idCells = document.querySelectorAll("td:first-child");
        for (let i = 0; i < idCells.length; i++) {
            if (idCells[i].textContent.trim() === id.toString()) {
                row = idCells[i].parentNode;
                break;
            }
        }
        if (!row) {
            console.error("Row with id " + id + " not found");
            return;
        }

        const transactionType = row.cells[3].textContent;
        const amount = row.cells[4].textContent;
        const description = row.cells[2].textContent;
        const dateString = row.cells[1].textContent.split(" ")[0];
        const status = row.cells[5].textContent;


        form.editId.value = id;
        form.editType.value = transactionType;
        form.editAmount.value = amount;
        form.editDescription.value = description;
        form.editDate.value = dateString;
        form.editStatus.value = status === "Thành công" ? "true" : "false";

        modal.style.display = 'block';
    }

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = "none";
    }

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }

    // Đóng modal khi click ra ngoài
    window.onclick = function (event) {
        if (event.target.className === 'modal') {
            event.target.style.display = 'none';
        }
    }

    // Xử lý sự kiện submit form
    document.getElementById('addForm').addEventListener('submit', function (e) {
        e.preventDefault();
        document.getElementById('submitLoader').style.display = 'block';

        // Giả lập việc gửi dữ liệu
        setTimeout(function () {
            document.getElementById('submitLoader').style.display = 'none';
            closeModal('addModal');
            alert('Thêm giao dịch thành công!');
            // Trong thực tế, bạn sẽ làm mới danh sách giao dịch
        }, 1000);
    });


    document.getElementById('editForm').addEventListener('submit', function (e) {
        e.preventDefault();

        // Lấy dữ liệu từ form
        const editId = document.getElementById('editId').value;
        const editType = document.getElementById('editType').value;
        const editAmount = document.getElementById('editAmount').value;
        const editDescription = document.getElementById('editDescription').value;
        const editDate = document.getElementById('editDate').value;
        const editStatus = document.getElementById('editStatus').value;

        // In các giá trị để kiểm tra
        console.log("Giá trị của các thuộc tính:");
        console.log("id:", editId);
        console.log("transactionType:", editType);
        console.log("amount:", editAmount);
        console.log("description:", editDescription);
        console.log("createdDate:", editDate);
        console.log("status:", editStatus);

        // Tạo đối tượng giao dịch (để gửi lên server)
        const updatedTransaction = {
            id: editId,
            transactionType: editType,
            amount: editAmount,
            description: editDescription,
            createdDate: editDate,
            status: editStatus
        };

        // Gửi dữ liệu lên server (sử dụng fetch hoặc XMLHttpRequest)
        fetch('trans-manage?action=edit', {  // Địa chỉ URL của Servlet để sửa giao dịch
            method: 'POST',
            headers: {
                'Content-Type': 'application/json' // Chỉ định kiểu dữ liệu là JSON
            },
            body: JSON.stringify(updatedTransaction)
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Cập nhật giao dịch không thành công!'); // Xử lý lỗi HTTP
                }
                return response.json();
            })
            .then(data => {
                // Xử lý phản hồi từ server (nếu cần)
                console.log('Giao dịch đã được cập nhật:', data);
                alert('Cập nhật giao dịch thành công!');
                closeModal('editModal');
                window.location.href = 'trans-manage?action=trans-management';
            })
            .catch(error => {
                // Xử lý lỗi
                console.error('Lỗi:', error);
                alert('Đã xảy ra lỗi khi cập nhật giao dịch: ' + error.message);
            });
    });
</script>


</body>
</html>
