<%--
    Document   : update_job_post
    Created on : Mar 12, 2025, 9:08:51 AM
    Author     : ADM
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en-US">

<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large' />

    <!--new css -->
<%--    <script src="https://cdn.tailwindcss.com"></script>--%>
    <link href="./css/update_job_post.css" rel="stylesheet"/>
<%--    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">--%>
</head>
<%@include file="includes/header-01.jsp"%>
<body style="font-family: Inter, sans-serif">

<div class="py-4 banner_title">
    <h1 class="text-white font-weight-bold" style="padding-left: 50px;">CẬP NHẬT TIN TUYỂN DỤNG</h1>
</div>

<div class="mt-3 mb-3" style="border: solid 1px #6787FE; border-radius: 20px; margin-left: 90px; margin-right: 90px;">
    <form class="form-container" action="job" method="post" enctype="multipart/form-data">
        <h3 style="color: #0a0a2b; font-weight: bolder">CẬP NHẬT CÔNG VIỆC</h3>
        <br>
        <input type="hidden" name="action" value="update-job">
        <input type="hidden" name="jobId" value="${job.jobId}">
        <input type="hidden" name="post-account-id" value="${job.postAccountId}">

        <div class="form-group">
            <label class="form-label" for="title">Tiêu đề:</label>
            <input id="title" name="title" class="form-control" type="text" placeholder="Nhập tiêu đề công việc" value="${job.jobTitle}">
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label class="form-label" for="category">Phân loại:</label>
                    <select id="category" name="category" class="form-control">
                        <option disabled selected>${jobDao.getCategoryById(job.categoryId).categoryName}</option>
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
            <input id="numOfMems" name="numOfMems" class="form-control" type="number" placeholder="Nhập số lượng cần tuyển" value="${job.numOfMember}">
        </div>

        <div class="form-group">
            <label class="form-label" for="description">Mô tả:</label>
            <textarea id="description" name="description" class="form-control" placeholder="Mô tả chi tiết về công việc">${job.jobDescription}</textarea>
        </div>

        <div class="form-group">
            <label class="form-label" for="requirement">Yêu cầu:</label>
            <textarea id="requirement" name="requirement" class="form-control" placeholder="Yêu cầu đối với ứng viên">${job.requirements}</textarea>
        </div>

        <div class="form-group">
            <label class="form-label" for="benefit">Quyền lợi:</label>
            <textarea id="benefit" name="benefit" class="form-control" placeholder="Quyền lợi dành cho ứng viên">${job.benefit}</textarea>
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
                    <textarea id="kiemtra-content" name="kiemtra-content" class="form-control" placeholder="Nhập nội dung kiểm tra"></textarea>
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
            <c:if test="${job.dueDatePost != null}">
            <div class="col-6">
                <div class="form-group">
                    <label class="form-label" for="dueDate">Ngày hết hạn tuyển dụng:</label>
                    <input id="dueDate" name="dueDate" class="form-control" type="date" value="${job.dueDatePost}">
                </div>
            </div>
            </c:if>
        </div>

        <div class="button-group">
            <button type="submit" class="btn btn-primary">Cập nhật tin tuyển dụng</button>
            <button type="reset" class="btn btn-outline">Làm mới</button>
        </div>
    </form>
</div>
<%@include file="includes/footer.jsp"%>
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
    document.getElementById('kiemtra-yes').addEventListener('change', function() {
        if (this.checked) {
            document.getElementById('kiemtra-options').classList.remove('hidden');
        }
    });

    document.getElementById('kiemtra-no').addEventListener('change', function() {
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
    document.getElementById('add-tag').addEventListener('click', function() {
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
        newTagItem.querySelector('.remove-tag').addEventListener('click', function() {
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
</body>
</html>
