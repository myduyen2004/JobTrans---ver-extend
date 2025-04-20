<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="jobtrans.model.Account"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:useBean id="accDao" class="jobtrans.dal.AccountDAO" scope="session"/>
    <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"/>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large'/>

    <!--new css -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="css/job-post-detail-employee.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body style="font-family: Inter,sans-serif">
<div class="row py-4 banner_title">
    <div class="col-10">
        <p style="font-size: 40px; font-weight: 700; color: white; padding-left: 50px;">${job.jobTitle}</p>
    </div>
</div>

<%--Main--%>
<main class="container mx-auto mt-8 mb-5" style="width: 1280px;">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
        <section class="col-span-3">
            <div class="container">
                <div class="row">
                    <h2 class="text-center col-11" style="font-size: 32px; font-weight: bold;">Thông tin công việc</h2>
                    <a class="col-1" href="#" onclick="toggleHeart(this)">
                        <span class="text-end" style="font-size:32px;">
                            <i class="far fa-heart"></i>
                        </span>
                    </a>
                </div>
                <div class="content">
                    <h2 class="header-title mb-2">Mô tả chi tiết công việc</h2>
                    <ul class="content-list mb-4">
                        <li>${job.jobDescription}</li>
                    </ul>
                    <h2 class="header-title">Yêu cầu ứng viên</h2>
                    <ul class="content-list mb-4">
                        <li>${job.requirements}</li>
                    </ul>
                    <h2 class="header-title">Quyền lợi</h2>
                    <ul class="content-list mb-4">
                        <li>${job.benefit}</li>
                    </ul>
                    <h2 class="header-title mb-3">Tệp đính kèm</h2>
                    <c:choose>
                        <c:when test="${empty job.attachment or job.attachment.trim() == ''}">
                            <p>Không có tệp đính kèm</p>
                        </c:when>
                        <c:otherwise>
                            <div class="file-attachment mb-4 ml-3 d-flex row">
                                <div class="col-2 d-flex flex-row align-items-center">
                                    <i class="fas fa-file" style="font-size: 40px;"></i>
                                </div>
                                <a href="job?action=download&fileName=${job.attachment}&jobId=${job.jobId}">
                                    <div class="space-y-4">
                                        <p>${job.attachment}</p>
                                    </div>
                                </a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <h2 class="text-center mb-3 mt-3" style="font-size: 32px; font-weight: bold;">Các chào giá nhận được</h2>
            <c:forEach items="${greetings}" var="o">
                <div class="post-box bg-white p-4 rounded-lg shadow-md flex items-center justify-between"
                     style="width: 860px; height: 135px; margin-bottom: 10px;">
                    <div class="flex items-center space-x-4">
                        <img alt="Profile picture of the job poster" class="rounded-full" height="80"
                             src="${accDao.getAccountById(o.jobSeekerId).avatar}"
                             width="80"/>
                        <div class="space-y-2" style="width: 480px;">
                            <div>
                                <span style="margin-right: 20px; font-size: 20px; font-weight: 700;">${accDao.getAccountById(o.jobSeekerId).accountName}</span>
                            </div>
                            <div style="font-size: 16px; font-weight: bold;">
                                Điểm số: ${accDao.getAccountById(o.jobSeekerId).point}
                            </div>
                            <p>
                                <span style="font-size: 16px; font-weight: bold;">Giá đề xuất: </span>
                                <bdi>
                                        ${o.price}<span class="woocommerce-Price-currencySymbol">&#8363;</span>
                                </bdi>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </section>
        <aside>
            <div style="background-color: #6787FE; color: white; border-radius: 15px;">
                <h2 class="header-title text-center" style="font-weight: normal">Ngân sách</h2>
                <p class="text-center" style="font-size: 30px;"><strong>${job.budgetMin} VND</strong></p>
                <p class="text-center" style="font-size: 24px;"><strong>-</strong></p>
                <p class="text-center" style="font-size: 30px;"><strong>${job.budgetMax} VND</strong></p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-md mt-3" style="border: solid 1px #6787FE; border-radius: 15px;">
                <ul style="font-size: 16px;">
                    <li class="mb-2"><strong>Trạng thái:</strong> ${job.statusPost}</li>
                    <li class="mb-2"><strong>Nhà tuyển dụng:</strong> ${accDao.getAccountById(job.postAccountId).accountName}</li>
                    <li class="mb-2"><strong>Phân loại:</strong> ${jobDao.getCategoryById(job.categoryId).categoryName}</li>
                    <li class="mb-2"><strong>Kiểm tra:</strong>
                        <c:choose>
                            <c:when test="${job.haveTested}">
                                Có
                            </c:when>
                            <c:otherwise>
                                Không
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li class="mb-2"><strong>Phỏng vấn:</strong>
                        <c:choose>
                        <c:when test="${job.haveInterviewed}">
                        Có
                        </c:when>
                        <c:otherwise>
                        Không
                        </c:otherwise>
                        </c:choose>
                    <li class="mb-2"><strong>Ngày đăng:</strong> <fmt:formatDate value="${job.postDate}" pattern="dd/MM/yyyy" /></li>
                    <li class="mb-2"><strong>Ngày hết hạn:</strong> <fmt:formatDate value="${job.dueDatePost}" pattern="dd/MM/yyyy" /></li>
                </ul>
            </div>
            <div class="bg-white p-2 rounded-lg shadow-md text-center" style="font-size: 18px;">
                <a href="job?action=pre-update&jobId=${job.jobId}">
                    <button class="text-white mt-3"
                            style="border-radius: 5px; background-color: #6787FE; padding: 5px 10px 5px 10px; width: 250px;">
                        Cập nhật công việc
                    </button>
                </a>
                <a href="job?action=pre-update&jobId=${job.jobId}">
                    <button class="text-white mt-3"
                            style="border-radius: 5px; background-color: #6787FE; padding: 5px 10px 5px 10px; width: 250px;">
                        Cập nhật kiểm tra
                    </button>
                </a>
                <a href="job?action=posted-job-detail&jobId=${job.jobId}">
                    <button class="text-white mt-3"
                            style="border-radius: 5px; background-color: #6787FE; padding: 5px 10px 5px 10px; width: 250px;">
                        Cập nhật phỏng vấn
                    </button>
                </a>
                <a href="job?action=deleteJob&jobId=${job.jobId}">
                    <button class="text-white mt-3"
                            style="border-radius: 5px; background-color: red; padding: 5px 10px 5px 10px; width: 250px;">
                        Xóa công việc
                    </button>
                </a>
            </div>

        </aside>
    </div>
</main>

<script>
    function toggleHeart(element) {
        const icon = element.querySelector('i');
        if (icon.classList.contains('far')) {
            // Chuyển sang trái tim đầy màu đỏ
            icon.classList.remove('far');
            icon.classList.add('fas');
            icon.style.color = '#fa0000';
        } else {
            // Chuyển lại trái tim viền
            icon.classList.remove('fas');
            icon.classList.add('far');
            icon.style.color = ''; // Hoặc set lại màu ban đầu nếu có
        }
    }
</script>

</body>
</html>
