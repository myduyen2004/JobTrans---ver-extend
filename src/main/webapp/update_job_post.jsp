<%--
    Document   : update_job_post
    Created on : Mar 12, 2025, 9:08:51 AM
    Author     : ADM
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="./css/update_job_post.css" rel="stylesheet"/>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>

<body style="font-family: Inter, sans-serif">

<!-- Preloading -->
<div id="preloader">
    <div class="spinner">
        <div class="uil-ripple-css"><div></div><div></div></div>
    </div>
</div>

<div class="py-4 banner_title">
    <h1 class="text-white font-weight-bold" style="padding-left: 50px;">CẬP NHẬT TIN TUYỂN DỤNG</h1>
</div>

<div class="mt-3 mb-3" style="border: solid 1px #6787FE; border-radius: 20px; margin-left: 90px; margin-right: 90px;">
    <form class="p-6" action="job" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="update-job">
        <input type="hidden" name="jobId" value="${job.jobId}">
        <input type="hidden" name="post-account-id" value="${job.postAccountId}">
        <div style="padding-left: 20px; padding-right: 20px">
            <div class="mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2" for="title">
                    Tiêu đề:
                </label>
                <input id="title" name="title" class="px-2 py-2" type="text" value="${job.jobTitle}"/>
            </div>
            <div class="mb-4 flex space-x-4">
                <div class="d-flex w-1/2 form-group">
                    <label class="block text-gray-700 font-bold mb-2" for="category">
                        Phân loại:
                    </label>
                    <select id="category" name="category" class="px-2 py-2 text-center" style="width: 300px;">
                        <option disabled selected>${jobDao.getCategoryById(job.categoryId).categoryName}</option>
                        <c:forEach var="category" items="${jobDao.getAllCategory()}">
                            <option value="${category.categoryId}">${category.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="d-flex w-1/2 form-group row">
                    <label class="block text-gray-700 font-bold mb-2 text-top">
                        Tag:
                    </label>
                    <div class="tag-section">
                        <div class="tag-item">
                            <select name="tag" class="px-2 py-2 text-center" style="width: 300px;">
                                <option disabled selected>Chọn Tag</option>
                                <c:forEach var="tag" items="${jobDao.getAllTag()}">
                                    <option value="${tag.tagId}">${tag.tagName}</option>
                                </c:forEach>
                            </select>
                            <button type="button" id="add-tag" class="btn-add">
                                <i class="fas fa-plus p-2" style=" border-radius: 10px; border: 1px solid #6787FE50;"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex  mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2" for="numOfMems">
                    Số người tuyển dụng:
                </label>
                <input id="numOfMems" name="numOfMems" class="px-2 py-2" type="number" value="${job.numOfMember}"/>
            </div>
            <div class="d-flex mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2" for="description">
                    Mô tả:
                </label>
                <textarea id="description" name="description" class="px-2 py-2h-32">
                    ${job.jobDescription}
                        </textarea>
            </div>
            <div class="d-flex mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2" for="requirement">
                    Yêu cầu:
                </label>
                <textarea id="requirement" name="requirement" class="px-2 py-2h-32">
                    ${job.requirements}
                        </textarea>
            </div>
            <div class="d-flex mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2" for="benefit">
                    Quyền lợi:
                </label>
                <textarea id="benefit" name="benefit" class="px-2 py-2h-32">
                    ${job.benefit}
                        </textarea>
            </div>
            <div class="mb-4 flex space-x-4">
                <div class="d-flex form-group">
                    <label class="block text-gray-700 font-bold mb-2">
                        Ngân sách:
                    </label>
                    <div class="flex space-x-2">
                        <input class="px-2 py-2 min text-center" placeholder="MIN" type="text" value="MIN"/>
                        <input class="px-2 py-2 text-center" name="budgetMin" style="margin-right: 50px;" type="text" value="${job.budgetMin}"/>
                        <input class="px-2 py-2 max text-center" placeholder="MAX" type="text" value="MAX"/>
                        <input class="px-2 py-2 text-center" name="budgetMax" type="text" value="${job.budgetMax}"/>
                    </div>
                </div>
            </div>
            <div class="d-flex mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2">
                    Kiểm tra:
                </label>
                <div class="flex items-center space-x-4">
                    <label class="flex items-center">
                        <input class="mr-2" name="kiemtra" type="radio" value="yes"/>
                        Có
                    </label>
                    <label class="flex items-center">
                        <input class="mr-2" name="kiemtra" type="radio" value="no"/>
                        Không
                    </label>
                </div>
            </div>
            <div class="d-flex mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2">
                    Tệp đính kèm:
                </label>
                <div>
                    <input class="p-2" type="file" name="file" id="upload" multiple/>
                </div>
            </div>
            <div class="d-flex w-1/4 form-group">
                <label class="block text-gray-700 font-bold mb-2" for="interviewDate">
                    Ngày phỏng vấn:
                </label>
                <input id="interviewDate" name="interviewDate" class="px-2 py-2" type="date"/>
            </div>
            <div class="d-flex form-group">
                <label class="block text-gray-700 font-bold mb-2" for="linkInterview">
                    Đường dẫn phỏng vấn:
                </label>
                <input id="linkInterview" name="linkInterview" class="px-2 py-2" type="text"/>
            </div>
            <div class="d-flex w-1/4 mb-4 form-group">
                <label class="block text-gray-700 font-bold mb-2" for="dueDate">
                    Ngày hết hạn:
                </label>
                <input id="dueDate" name="dueDate" class="px-2 py-2" type="date"/>
            </div>
            <div class="flex space-x-4 justify-content-center">
                <input class="w-1/4 px-4 py-2 text-white" type="submit"
                       style="background-color: #6787FE; border: solid 1px #6787FE; border-radius: 50px; flex: none;" value="Cập nhận tin tuyển dụng"/>
                <input class="w-1/4 px-4 py-2 text-white" type="reset"
                       style="background-color: #6787FE; border: solid 1px #6787FE; border-radius: 50px; flex: none;" value="Làm mới"/>
            </div>
        </div>
    </form>
</div>

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
</body>
</html>
