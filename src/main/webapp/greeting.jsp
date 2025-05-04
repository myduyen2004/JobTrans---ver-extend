<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="budget-min" content="${job.budgetMin}" />
  <meta name="budget-max" content="${job.budgetMax}" />

  <title>Tạo Job Greeting</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <link href="css/greeting.css" rel="stylesheet">
  <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="page" />
  <jsp:useBean id="accountDAO" class="jobtrans.dal.AccountDAO" scope="page" />
</head>
<body>
<%@include file="includes/header-01.jsp"%>
<div class="container" style="padding: 0;">
  <div class="job-info">
    <h1>Thông tin công việc: ${job.jobTitle}</h1>
    <div class="job-info-details">
      <div class="job-detail">
        <i class="fas fa-user"></i>
        <span>${accountDAO.getAccountById(job.postAccountId).accountName}</span>
      </div>
      <div class="job-detail">
        <i class="fas fa-money-bill-wave"></i>
        <span>${formattedBudgetMin} - ${formattedBudgetMax}</span>
      </div>
      <div class="job-detail">
        <i class="fas fa-map-marker-alt"></i>
        <span>${accountDAO.getAccountById(job.postAccountId).address}</span>
      </div>
<%--      <div class="job-detail">--%>
<%--        <i class="fas fa-status"></i>--%>
<%--        <span>${job.statusPost}</span>--%>
<%--      </div>--%>
    </div>
    <div class="job-description">
      <p>${job.jobDescription}</p>
    </div>
  </div>

  <div class="form-container">
    <h2 class="form-title">Tạo Job Greeting</h2>
    <form action="job-greeting" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="jobId" value="${job.jobId}">

      <div class="form-group">
        <label class="form-label">Chọn CV của bạn</label>
        <c:if test="${empty cvList}">

        <div class="cv-selection-container">
          <div id="no-cv-message" style=" text-align: center; padding: 30px 20px;">
            <i class="fas fa-exclamation-circle" style="font-size: 50px; color: #ff9800; margin-bottom: 15px;"></i>
            <h3 style="margin-bottom: 10px; color: #555;">Bạn chưa có CV nào</h3>
            <p style="color: #777; margin-bottom: 20px;">Hãy tạo CV mới để có thể ứng tuyển vào vị trí này</p>
            <a href="cv?action=type" id="create-cv-btn" class="submit-btn" style="text-decoration: none ;background: linear-gradient(to right, #ff9800, #ff5722);">
              <i class="fas fa-plus"></i> Tạo CV mới
            </a>
          </div>
        </div>
        </c:if>
        <c:if test="${not empty cvList}">
          <div class="cv-selection-container">
            <c:forEach var="cv" items="${cvList}">
              <div class="cv-item" onclick="selectCV(1)">
                <div class="cv-icon">
                  <i class="fas fa-file-alt"></i>
                </div>
                <div class="cv-details">
                  <h4>${cv.cvName}</h4>
                  <p>Ngày cập nhật: <fmt:formatDate value="${cv.createdAt}" pattern="dd/MM/yyyy"/></p>
                </div>
                <input type="radio" name="cv_id" value="${cv.cvId}" class="cv-radio">
              </div>
            </c:forEach>
          </div>
          <div class="error-message" id="cv-error"></div>
        </c:if>
      </div>

      <div class="form-group">
        <label class="form-label" for="price" style="margin-top: 20px">Mức lương mong muốn</label>
        <div class="price-container">
          <span class="currency-symbol">VND</span>
          <input type="number" id="price" name="price" class="form-input price-input" placeholder="15000000" required>
        </div>
        <div class="error-message" id="price-error"></div>
      </div>

      <div class="form-group">
        <label class="form-label" for="expected_day">Thời gian có thể hoàn thành (số ngày)</label>
        <input type="number" id="expected_day" name="expected_day" class="form-input" placeholder="5" min="1" required>
        <div class="error-message" id="expected-day-error"></div>
      </div>

      <div class="form-group">
        <label class="form-label" for="introduction">Giới thiệu</label>
        <textarea id="introduction" name="introduction" class="form-textarea" placeholder="Giới thiệu về bản thân và lý do bạn phù hợp với vị trí này..." required></textarea>
        <div class="error-message" id="introduction-error"></div>
      </div>

      <div class="form-group">
        <label class="form-label">Tệp đính kèm (nếu có)</label>
        <div class="attachment-area">
          <i class="fas fa-cloud-upload-alt"></i>
          <h4>Kéo thả hoặc nhấp để tải tệp lên</h4>
          <p>Hỗ trợ: PDF, DOCX, JPG (tối đa 5MB)</p>
          <input type="file" id="attachment" name="attachment" accept=".pdf,.docx,.jpg,.jpeg">
        </div>
        <div class="file-preview" id="filePreview">
          <i class="fas fa-file"></i>
          <span class="file-name" id="fileName"></span>
          <span class="remove-file" onclick="removeFile()"><i class="fas fa-times"></i></span>
        </div>
      </div>

      <div class="error-message" id="form-error"></div>

      <button type="submit" class="submit-btn">
      <i class="fas fa-paper-plane"></i> Gửi chào giá cho công việc
      </button>
    </form>
  </div>
</div>

<%@include file="includes/footer.jsp"%>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Get form elements
    const priceInput = document.getElementById('price');
    const expectedDayInput = document.getElementById('expected_day');
    const introductionInput = document.getElementById('introduction');
    const attachmentInput = document.getElementById('attachment');
    const filePreview = document.getElementById('filePreview');
    const fileName = document.getElementById('fileName');
    const formElement = document.querySelector('form');

    // Get error elements
    const priceError = document.getElementById('price-error');
    const expectedDayError = document.getElementById('expected-day-error');
    const introductionError = document.getElementById('introduction-error');
    const cvError = document.getElementById('cv-error');
    const formError = document.getElementById('form-error');

    // Ensure error elements are visible when they contain text
    const errorElements = document.querySelectorAll('.error-message');
    errorElements.forEach(element => {
      // Add styles directly to ensure visibility
      element.style.color = '#ff3333';
      element.style.fontSize = '14px';
      element.style.marginTop = '5px';
      element.style.transition = 'all 0.3s ease';
      element.style.display = 'none'; // Hide initially
    });

    // Show error function
    function showError(errorElement, message) {
      if (errorElement) {
        errorElement.textContent = message;
        errorElement.style.display = 'block';
      }
      return false;
    }

    // Clear error function
    function clearError(errorElement) {
      if (errorElement) {
        errorElement.textContent = '';
        errorElement.style.display = 'none';
      }
    }

    // Check if user has any CVs
    function hasCVs() {
      // Check if cvList is not empty by checking if there are any CV items
      const cvItems = document.querySelectorAll('.cv-item');
      return cvItems.length > 0;
    }

    // Price validation
    priceInput.addEventListener('input', function() {
      clearError(priceError);

      if (this.value === '') {
        return showError(priceError, 'Vui lòng nhập mức lương mong muốn');
      }

      // Kiểm tra giá trị nhập vào có phải là số hợp lệ không
      const price = parseFloat(this.value.replace(/,/g, '')); // Loại bỏ dấu phân cách (nếu có)
      if (isNaN(price) || price <= 0) {
        return showError(priceError, 'Mức lương phải là số dương');
      }

      try {
        // Lấy giá trị từ các phần tử meta nếu có
        let budgetMin = 0;
        let budgetMax = Infinity;

        // Thử lấy giá trị từ meta data nếu có
        const minElement = document.querySelector('meta[name="budget-min"]');
        const maxElement = document.querySelector('meta[name="budget-max"]');

        if (minElement) {
          budgetMin = parseFloat(minElement.getAttribute('content'));
        }

        if (maxElement) {
          budgetMax = parseFloat(maxElement.getAttribute('content'));
        }

        // Nếu không có meta data, thử lấy từ biến toàn cục
        if (isNaN(budgetMin) && typeof jobBudgetMin !== 'undefined') {
          budgetMin = parseFloat(jobBudgetMin);
        }

        if (isNaN(budgetMax) && typeof jobBudgetMax !== 'undefined') {
          budgetMax = parseFloat(jobBudgetMax);
        }

        // Kiểm tra nếu có thể lấy được budgetMin và budgetMax
        if (!isNaN(budgetMin) && !isNaN(budgetMax)) {
          // So sánh với budgetMin và budgetMax
          if (price < budgetMin || price > budgetMax) {
            const minFormatted = new Intl.NumberFormat('vi-VN').format(budgetMin);
            const maxFormatted = new Intl.NumberFormat('vi-VN').format(budgetMax);
            return showError(priceError, `Mức lương phải nằm trong khoảng ${formattedBudgetMin} - ${formattedBudgetMax}`);
          }
        }
      } catch (e) {
        console.error("Lỗi khi kiểm tra khoảng lương:", e);
        // Không hiển thị lỗi cho người dùng, chỉ ghi log
      }

      return true;
    });

    // Expected day validation
    expectedDayInput.addEventListener('input', function() {
      clearError(expectedDayError);

      if (this.value === '') {
        return showError(expectedDayError, 'Vui lòng nhập thời gian hoàn thành');
      }

      const days = parseInt(this.value);
      if (isNaN(days) || days <= 0) {
        return showError(expectedDayError, 'Thời gian hoàn thành phải là số ngày dương');
      }

      return true;
    });

    // Introduction validation
    introductionInput.addEventListener('input', function() {
      clearError(introductionError);

      if (this.value.trim() === '') {
        return showError(introductionError, 'Vui lòng nhập giới thiệu của bạn');
      }

      if (this.value.length < 50) {
        return showError(introductionError, 'Giới thiệu phải có ít nhất 50 ký tự');
      }

      return true;
    });

    // CV selection
    window.selectCV = function(cvId) {
      // Đảm bảo rằng event hiện hữu
      if (!event) return;

      // Remove selected class from all CV items
      const cvItems = document.querySelectorAll('.cv-item');
      cvItems.forEach(item => {
        item.classList.remove('selected');
      });

      // Add selected class to the clicked CV item
      event.currentTarget.classList.add('selected');

      // Check the radio button
      const radio = event.currentTarget.querySelector('.cv-radio');
      if (radio) radio.checked = true;

      // Clear error message
      clearError(cvError);
    };

    // File upload handler - Sửa lỗi upload file 2 lần
    attachmentInput.addEventListener('change', function() {
      // Reset file preview first
      filePreview.style.display = 'none';
      fileName.textContent = '';

      if (!this.files || !this.files.length) return;

      const file = this.files[0];
      const validTypes = ['.pdf', '.docx', '.jpg', '.jpeg'];
      const extension = '.' + file.name.split('.').pop().toLowerCase();

      // Kiểm tra loại file
      if (!validTypes.includes(extension)) {
        alert('Chỉ chấp nhận file PDF, DOCX, JPG, JPEG');
        this.value = ''; // Reset input file
        return;
      }

      // Kiểm tra kích thước (5MB)
      if (file.size > 5 * 1024 * 1024) {
        alert('File không được vượt quá 5MB');
        this.value = ''; // Reset input file
        return;
      }

      // Hiển thị tên file
      fileName.textContent = file.name;
      filePreview.style.display = 'flex';
    });

    // Remove file
    window.removeFile = function() {
      attachmentInput.value = '';
      filePreview.style.display = 'none';
    };

    // Form validation on submit
    formElement.addEventListener('submit', function(event) {
      let isValid = true;
      clearError(formError);

      // Kiểm tra xem người dùng có CV nào không
      if (!hasCVs()) {
        // Nếu không có CV, ngăn form submit
        showError(formError, 'Bạn cần tạo CV trước khi ứng tuyển');
        event.preventDefault();
        return false;
      }

      // Validate CV selection - chỉ kiểm tra khi có CVs
      if (hasCVs()) {
        let cvSelected = false;
        const cvRadios = document.querySelectorAll('.cv-radio');
        cvRadios.forEach(radio => {
          if (radio.checked) cvSelected = true;
        });

        if (!cvSelected) {
          showError(cvError, 'Vui lòng chọn CV của bạn');
          isValid = false;
        }
      }

      // Price validation
      if (priceInput.value === '') {
        showError(priceError, 'Vui lòng nhập mức lương mong muốn');
        isValid = false;
      } else {
        try {
          const price = parseFloat(priceInput.value.replace(/,/g, ''));

          // Lấy giá trị từ các phần tử meta nếu có
          let budgetMin = 0;
          let budgetMax = Infinity;

          // Thử lấy giá trị từ meta data nếu có
          const minElement = document.querySelector('meta[name="budget-min"]');
          const maxElement = document.querySelector('meta[name="budget-max"]');

          if (minElement) {
            budgetMin = parseFloat(minElement.getAttribute('content'));
          }

          if (maxElement) {
            budgetMax = parseFloat(maxElement.getAttribute('content'));
          }

          if (isNaN(price) || price <= 0) {
            showError(priceError, 'Mức lương phải là số dương');
            isValid = false;
          }
          else if (!isNaN(budgetMin) && !isNaN(budgetMax) && (price < budgetMin || price > budgetMax)) {
            const minFormatted = new Intl.NumberFormat('vi-VN').format(budgetMin);
            const maxFormatted = new Intl.NumberFormat('vi-VN').format(budgetMax);
            showError(priceError, `Mức lương phải nằm trong khoảng ${minFormatted} ₫ - ${maxFormatted} ₫`);
            isValid = false;
          }
        } catch (e) {
          console.error("Lỗi khi kiểm tra giá:", e);
          showError(priceError, 'Mức lương không hợp lệ');
          isValid = false;
        }
      }

      // Expected day validation
      if (expectedDayInput.value === '') {
        showError(expectedDayError, 'Vui lòng nhập thời gian hoàn thành');
        isValid = false;
      } else {
        const days = parseInt(expectedDayInput.value);
        if (isNaN(days) || days <= 0) {
          showError(expectedDayError, 'Thời gian hoàn thành phải là số ngày dương');
          isValid = false;
        }
      }

      // Introduction validation
      if (introductionInput.value.trim() === '') {
        showError(introductionError, 'Vui lòng nhập giới thiệu của bạn');
        isValid = false;
      } else if (introductionInput.value.length < 50) {
        showError(introductionError, 'Giới thiệu phải có ít nhất 50 ký tự');
        isValid = false;
      }

      // Hiển thị lỗi tổng quát nếu có lỗi
      if (!isValid) {
        event.preventDefault();
        showError(formError, 'Vui lòng kiểm tra lại các thông tin đã nhập');

        // Cuộn lên đầu trang để người dùng thấy lỗi
        window.scrollTo({ top: 0, behavior: 'smooth' });
        return false;
      }
      // Nếu hợp lệ, form sẽ tự submit
    });

    // Hàm format tiền tệ (không dùng thuộc tính style: 'currency' để tránh lỗi)
    function formatCurrency(value) {
      if (value == null || isNaN(value)) return '0 ₫';

      return new Intl.NumberFormat('vi-VN', {
        minimumFractionDigits: 0,
        maximumFractionDigits: 0
      }).format(value) + ' ₫';
    }

    // Thêm logic để xử lý phần kéo thả file
    const attachmentArea = document.querySelector('.attachment-area');
    if (attachmentArea) {
      // Bỏ xử lý click vào area để tránh mở file browser 2 lần
      // Chỉ giữ lại xử lý cho các sự kiện kéo thả

      // Add drag and drop functionality for attachment
      attachmentArea.addEventListener('dragover', function(e) {
        e.preventDefault();
        this.classList.add('drag-over');
      });

      attachmentArea.addEventListener('dragleave', function() {
        this.classList.remove('drag-over');
      });

      attachmentArea.addEventListener('drop', function(e) {
        e.preventDefault();
        this.classList.remove('drag-over');

        if (e.dataTransfer.files.length > 0) {
          // Xóa file cũ trước khi set file mới
          attachmentInput.value = '';
          filePreview.style.display = 'none';
          fileName.textContent = '';

          // Set file mới
          attachmentInput.files = e.dataTransfer.files;

          // Trigger change event manually để kích hoạt handler đã đăng ký
          const event = new Event('change');
          attachmentInput.dispatchEvent(event);
        }
      });
    }
  });
</script>
</body>
</html>