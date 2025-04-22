<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <button id="create-cv-btn" class="submit-btn" style="background: linear-gradient(to right, #ff9800, #ff5722);">
              <i class="fas fa-plus"></i> Tạo CV mới
            </button>
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
      errorElement.textContent = message;
      errorElement.style.display = 'block';
      return false;
    }

    // Clear error function
    function clearError(errorElement) {
      errorElement.textContent = '';
      errorElement.style.display = 'none';
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

      // Định nghĩa budgetMin và budgetMax (kiểu BigDecimal - dùng số nguyên để tránh sai số)
      const budgetMin = parseFloat(${job.budgetMin}); // Chuyển sang số
      const budgetMax = parseFloat(${job.budgetMax}); // Chuyển sang số

      // Kiểm tra nếu budgetMin hoặc budgetMax không hợp lệ
      if (isNaN(budgetMin) || isNaN(budgetMax)) {
        return showError(priceError, 'Khoảng lương không hợp lệ');
      }

      // So sánh với budgetMin và budgetMax
      if (price < budgetMin || price > budgetMax) {
        return showError(priceError, `Mức lương phải nằm trong khoảng <fmt:formatNumber value="${job.budgetMin}" type="currency" currencySymbol="₫" groupingUsed="true" /> - <fmt:formatNumber value="${job.budgetMax}" type="currency" currencySymbol="₫" groupingUsed="true" />`);
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
      // Remove selected class from all CV items
      const cvItems = document.querySelectorAll('.cv-item');
      cvItems.forEach(item => {
        item.classList.remove('selected');
      });

      // Add selected class to the clicked CV item
      event.currentTarget.classList.add('selected');

      // Check the radio button
      const radio = event.currentTarget.querySelector('.cv-radio');
      radio.checked = true;

      // Clear error message
      clearError(cvError);
    };

    // File upload handler
    attachmentInput.addEventListener('change', function() {
      if (!this.files.length) return;

      const file = this.files[0];
      const validTypes = ['.pdf', '.docx', '.jpg', '.jpeg'];
      const extension = '.' + file.name.split('.').pop().toLowerCase();

      // Kiểm tra loại file
      if (!validTypes.includes(extension)) {
        alert('Chỉ chấp nhận file PDF, DOCX, JPG, JPEG');
        this.value = '';
        return;
      }

      // Kiểm tra kích thước (5MB)
      if (file.size > 5 * 1024 * 1024) {
        alert('File không được vượt quá 5MB');
        this.value = '';
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

      // Validate CV selection
      const cvList = document.querySelectorAll('.cv-radio');
      if (cvList.length > 0) {
        let cvSelected = false;
        cvList.forEach(radio => {
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
        const price = parseInt(priceInput.value.replace(/,/g, '')) || 0;
        const budgetMax = ${job.budgetMax.intValue()};
        const budgetMin = ${job.budgetMin.intValue()};

        if (price <= 0) {
          showError(priceError, 'Mức lương phải là số dương');
          isValid = false;
        }
        else if (price < budgetMin || price > budgetMax) {
          showError(priceError, `Mức lương phải nằm trong khoảng <fmt:formatNumber value="${job.budgetMin}" type="currency" currencySymbol="₫" groupingUsed="true" /> - <fmt:formatNumber value="${job.budgetMax}" type="currency" currencySymbol="₫" groupingUsed="true" />`);
          isValid = false;
        }
      }

      // Expected day validation
      if (expectedDayInput.value === '') {
        showError(expectedDayError, 'Vui lòng nhập thời gian hoàn thành');
        isValid = false;
      } else if (parseInt(expectedDayInput.value) <= 0) {
        showError(expectedDayError, 'Thời gian hoàn thành phải là số ngày dương');
        isValid = false;
      }

      // Introduction validation
      if (introductionInput.value.trim() === '') {
        showError(introductionError, 'Vui lòng nhập giới thiệu của bạn');
        isValid = false;
      } else if (introductionInput.value.length < 50) {
        showError(introductionError, 'Giới thiệu phải có ít nhất 50 ký tự');
        isValid = false;
      }

      // Chỉ preventDefault khi không hợp lệ
      if (!isValid) {
        event.preventDefault();
        showError(formError, 'Vui lòng kiểm tra lại các thông tin đã nhập');
      }
      // Nếu hợp lệ, form sẽ tự submit mà không cần gọi submit() lại
    });

// Hàm format tiền tệ
    function formatCurrency(value) {
      return new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
      }).format(value);
    }

    // Add style to make attachment area look interactive
    // const attachmentArea = document.querySelector('.attachment-area');
    // if (attachmentArea) {
    //   attachmentArea.addEventListener('click', function() {
    //     attachmentInput.click();
    //   });
    //
    //   // Add drag and drop functionality for attachment
    //   attachmentArea.addEventListener('dragover', function(e) {
    //     e.preventDefault();
    //     this.classList.add('drag-over');
    //   });
    //
    //   attachmentArea.addEventListener('dragleave', function() {
    //     this.classList.remove('drag-over');
    //   });
    //
    //   attachmentArea.addEventListener('drop', function(e) {
    //     e.preventDefault();
    //     this.classList.remove('drag-over');
    //
    //     if (e.dataTransfer.files.length > 0) {
    //       attachmentInput.files = e.dataTransfer.files;
    //
    //       // Trigger change event manually
    //       const event = new Event('change');
    //       attachmentInput.dispatchEvent(event);
    //     }
    //   });
    // }
  });
</script>
  </body>
</html>