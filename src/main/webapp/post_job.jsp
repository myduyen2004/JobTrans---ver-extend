<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en-US">

<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>
    <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large'/>

    <!--new css -->
    <link href="./css/post_job.css" rel="stylesheet"/>

</head>
<%@include file="includes/header-01.jsp" %>
<body style="font-family: Inter, sans-serif ">
<div class="container">
    <form class="form-container" action="job" method="post" enctype="multipart/form-data">
        <h3 style="color: #0a0a2b; font-weight: bolder">ĐĂNG CÔNG VIỆC MỚI</h3>
        <br>
        <input type="hidden" name="action" value="post-job">

        <div class="form-group">
            <label class="form-label" for="title">Tiêu đề:</label>
            <input id="title" name="title" class="form-control" type="text" placeholder="Nhập tiêu đề công việc">
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label class="form-label" for="category">Phân loại:</label>
                    <select id="category" name="category" class="form-control">
                        <option disabled selected>Chọn phân loại</option>
                        <c:forEach var="category" items="${jobDao.getAllCategory()}">
                            <option value="${category.categoryId}">${category.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label class="form-label">Tag:</label>
                    <div class="tag-container">
                        <div class="tag-item">
                            <select name="tag" class="form-control">
                                <option disabled selected>Chọn Tag</option>
                                <c:forEach var="tag" items="${jobDao.getAllTag()}">
                                    <option value="${tag.tagId}">${tag.tagName}</option>
                                </c:forEach>
                            </select>
                            <button type="button" id="add-tag" class="btn-add">
                                <i class="fas fa-plus-circle fa-lg"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="form-label" for="numOfMems">Số người tuyển dụng:</label>
            <input id="numOfMems" name="numOfMems" class="form-control" type="number"
                   placeholder="Nhập số lượng cần tuyển">
        </div>

        <div class="form-group">
            <label class="form-label" for="description">Mô tả:</label>
            <textarea id="description" name="description" class="form-control"
                      placeholder="Mô tả chi tiết về công việc"></textarea>
        </div>

        <div class="form-group">
            <label class="form-label" for="requirement">Yêu cầu:</label>
            <textarea id="requirement" name="requirement" class="form-control"
                      placeholder="Yêu cầu đối với ứng viên"></textarea>
        </div>

        <div class="form-group">
            <label class="form-label" for="benefit">Quyền lợi:</label>
            <textarea id="benefit" name="benefit" class="form-control"
                      placeholder="Quyền lợi dành cho ứng viên"></textarea>
        </div>

        <div class="form-group">
            <label class="form-label">Ngân sách:</label>
            <div class="row">
                <div class="col-6">
                    <div class="budget-group" id="budgetMin">
                        <span class="budget-label">MIN</span>
                        <input class="budget-input" name="budgetMin" id="budgetMinInput" type="number" value='0'>
                    </div>
                </div>
                <div class="col-6">
                    <div class="budget-group" id="budgetMax">
                        <span class="budget-label">MAX</span>
                        <input class="budget-input" name="budgetMax" id="budgetMaxInput" type="number" value='0'>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="form-label">Kiểm tra:</label>
            <div class="radio-group">
                <label class="radio-container">
                    <input name="kiemtra" type="radio" value="yes" id="kiemtra-yes">
                    Có
                </label>
                <label class="radio-container">
                    <input name="kiemtra" type="radio" value="no" id="kiemtra-no" checked>
                    Không
                </label>
            </div>
        </div>

        <div id="kiemtra-options" class="form-group hidden">
            <div class="row">
                <div class="col-12">
                    <label class="form-label" for="kiemtra-content">Nội dung kiểm tra:</label>
                    <textarea id="kiemtra-content" name="kiemtra-content" class="form-control"
                              placeholder="Nhập nội dung kiểm tra"></textarea>
                </div>
                <div class="col-6">
                    <label class="form-label" for="kiemtra-required">Bắt buộc:</label>
                    <select id="kiemtra-required" name="kiemtra-required" class="form-control">
                        <option value="yes">Có</option>
                        <option value="no">Không</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="form-label">Tệp đính kèm:</label>
            <div class="file-upload">
                <label class="file-upload-label" for="upload">
                    <i class="fas fa-upload"></i>
                    Chọn tệp
                </label>
                <input type="file" name="file" id="upload" multiple style="display: none;">
                <div id="file-names" style="margin-top: 10px; font-style: italic;"></div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label class="form-label" for="interviewDate">Ngày phỏng vấn:</label>
                    <input id="interviewDate" name="interviewDate" class="form-control" type="date">
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label class="form-label" for="dueDate">Ngày hết hạn tuyển dụng:</label>
                    <input id="dueDate" name="dueDate" class="form-control" type="date">
                </div>
            </div>
        </div>

        <div class="button-group">
            <button type="submit" class="btn btn-primary">Đăng tin tuyển dụng</button>
            <button type="reset" class="btn btn-outline">Làm mới</button>
        </div>
    </form>
</div>
<%@include file="includes/footer.jsp" %>
<script>
    // Add Tag Section
    document.getElementById('add-tag').addEventListener('click', function () {
        const tagContainer = document.querySelector('.tag-section');
        const newTag = document.createElement('div');
        newTag.classList.add('tag-item');
        newTag.classList.add('mt-2');
        newTag.innerHTML = `
                <select name="tag" class="px-2 py-2 text-center" style="width: 300px;">
                                <option disabled selected>Chọn Tag</option>
                                <c:forEach var="tag" items="${jobDao.allTag}">
                                    <option value="${tag.tagId}">${tag.tagName}</option>
                                </c:forEach>
                </select>
                <button type="button" class="btn-remove">
                    <i class="fas fa-trash p-2 remove-tag" style="border-radius: 10px; border: 1px solid #6787FE50;"></i>
                </button>
            `;
        tagContainer.appendChild(newTag);
    });

    // Remove Skill
    document.addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-tag')) {
            e.target.closest('.tag-item').remove();
        }
    });
</script>
<script>
    // Xử lý hiển thị tùy chọn kiểm tra
    document.getElementById('kiemtra-yes').addEventListener('change', function () {
        if (this.checked) {
            document.getElementById('kiemtra-options').classList.remove('hidden');
        }
    });

    document.getElementById('kiemtra-no').addEventListener('change', function () {
        if (this.checked) {
            document.getElementById('kiemtra-options').classList.add('hidden');
        }
    });

    <%--// Hiển thị tên file khi upload--%>
    <%--document.getElementById('upload').addEventListener('change', function() {--%>
    <%--    const fileName = this.files.length > 0 ?--%>
    <%--        (this.files.length > 1 ? `${this.files.length} tệp đã chọn` : this.files[0].name) :--%>
    <%--        'Chọn tệp';--%>
    <%--    this.previousElementSibling.textContent = fileName;--%>
    <%--});--%>

    // Thêm tag mới
    document.getElementById('add-tag').addEventListener('click', function () {
        const tagContainer = document.querySelector('.tag-container');
        const newTagItem = document.createElement('div');
        newTagItem.className = 'tag-item';
        newTagItem.innerHTML = `
                <select name="tag" class="form-control">
                    <option disabled selected>Chọn Tag</option>
                    <c:forEach var="tag" items="${jobDao.getAllTag()}">
                        <option value="${tag.tagId}">${tag.tagName}</option>
                    </c:forEach>
                </select>
                <button type="button" class="btn-add remove-tag">
                    <i class="fas fa-times-circle fa-lg"></i>
                </button>
            `;
        tagContainer.appendChild(newTagItem);

        // Thêm sự kiện xóa tag
        newTagItem.querySelector('.remove-tag').addEventListener('click', function () {
            newTagItem.remove();
        });
    });
</script>
<script>
    document.getElementById("upload").addEventListener("change", function () {
        const fileList = this.files;
        const fileNames = Array.from(fileList).map(file => file.name);
        document.getElementById("file-names").innerHTML = fileNames.length
            ? "Đã chọn: " + fileNames.join(", ")
            : "Không có tệp nào được chọn";
    });
</script>

<%--Xử lí validate--%>
<script>
    document.querySelector("form").addEventListener("submit", function (e) {
        let isValid = true;
        const today = new Date().toISOString().split("T")[0]; // YYYY-MM-DD

        // Xóa các thông báo lỗi cũ
        document.querySelectorAll(".error-message").forEach(el => el.remove());

        function showError(input, message) {
            const error = document.createElement("div");
            error.className = "error-message";
            error.style.color = "red";
            error.style.marginTop = "4px";
            error.textContent = message;
            input.insertAdjacentElement("afterend", error);
        }

        // Validate Tiêu đề
        const title = document.getElementById("title");
        if (!title.value.trim()) {
            showError(title, "Nội dung này không được để trống!");
            isValid = false;
        }

        // Validate Phân loại
        const category = document.getElementById("category");
        if (!category.value) {
            showError(category, "Nội dung này không được để trống!");
            isValid = false;
        }

        // Validate Số người tuyển dụng
        const numOfMems = document.getElementById("numOfMems");
        if (!numOfMems.value || numOfMems.value <= 0) {
            showError(numOfMems, "Nội dung này không được để trống và phải lớn hơn 0!");
            isValid = false;
        }

        // Validate Mô tả
        const description = document.getElementById("description");
        if (!description.value.trim()) {
            showError(description, "Nội dung này không được để trống!");
            isValid = false;
        }

        // Validate Ngân sách
        const budgetMin = document.getElementById("budgetMin");
        const budgetMinInput = document.getElementById("budgetMinInput");
        if (!budgetMinInput.value || budgetMinInput.value <= 0) {
            showError(budgetMin, "Ngân sách Min không được để trống và phải lớn hơn 0!");
            isValid = false;
        }

        const budgetMax = document.getElementById("budgetMax");
        const budgetMaxInput = document.getElementById("budgetMaxInput");
        let budgetError = "";

        if (!budgetMaxInput.value || budgetMaxInput.value <= 0) {
            budgetError = "Ngân sách Max không được để trống và phải lớn hơn 0!";
            showError(budgetMax, budgetError);
            isValid = false;
        } else if (parseInt(budgetMaxInput.value) <= parseInt(budgetMinInput.value)) {
            budgetError = "Ngân sách Max phải lớn hơn Min";
            showError(budgetMax, budgetError);
            isValid = false;
        }

        // Validate ngày phỏng vấn
        const interviewDate = document.getElementById("interviewDate");

        if (interviewDate.value && interviewDate.value <= today) {
            showError(interviewDate, "Ngày phỏng vấn phải lớn hơn ngày hiện tại!");
            isValid = false;
        }

        // Validate ngày hết hạn tuyển dụng
        const dueDate = document.getElementById("dueDate");

        if (!dueDate.value.trim()) {
            showError(dueDate, "Nội dung này không được để trống!")
            isValid = false;
        } else {
            if (dueDate.value && dueDate.value <= today) {
                showError(dueDate, "Ngày hết hạn tuyển dụng phải lớn hơn ngày hiện tại!");
                isValid = false;
            }
        }

        if (!isValid) {
            e.preventDefault(); // Ngăn form submit nếu có lỗi
        }
    });
</script>

</body>
</html>
