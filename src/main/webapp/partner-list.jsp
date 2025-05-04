<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en-US">

<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="session"/>
    <jsp:useBean id="accDAO" class="jobtrans.dal.AccountDAO" scope="session"/>
    <jsp:useBean id="feedbackDAO" class="jobtrans.dal.FeedbackDAO" scope="session"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đối tác &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large'/>
    <link rel="stylesheet" href="./css/partner-list.css">
</head>

<body style="font-family: Inter, sans-serif">
<%@include file="includes/header-01.jsp" %>
<div class="row">
    <div class="col-6">
        <h3 class="text-center mb-3 bg-custom-gradient" style="font-size: 24px; font-weight: 500; border-radius: 0; clip-path: polygon(0 0, 95% 0, 100% 50%, 95% 100%, 0 100%);">Đối tác của tôi</h3>
    </div>
    <div class="col-6">
    </div>
</div>
<section class="section-padding m-4">
    <div class="container">
        <div class="row justify-content-center flex-row-reverse">
            <div class="search-result col-xl-9">
                <div class="post-box bg-white rounded-lg shadow-md items-center justify-between mb-3"
                     style="border: solid 2px #6787FE50; border-radius: 30px; ">
                    <div class="row m-3">
                        <div class="col-md-2 my-auto">
                            <div class="my-auto01">
                                <a href="#">
                                    <img src="${loggedAccount.avatar}" alt="Avatar"
                                         style="width: 80%; border-radius: 50%;"/>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-7 my-auto">
                            <div class="service-content">
                                <div class="service-item-seller">
                                    <div class="row">
                                        <div>
                                            <div class="d-flex">
                                                <div class="my-auto">
                                                    <span class="mb-3" style="font-weight: bold; font-size: 18px;">Tôi
                                                    </span>
                                                    <span> |
                                                        <c:if test="${loggedAccount.verifiedAccount}">
                                                            <i class="fas fa-check-circle verified text-primary ms-2"
                                                               title="Verified"></i>
                                                        </c:if>
                                                        <c:if test="${loggedAccount.accountId == jobDAO.getJobById(jobId).postAccountId}">
                                                            <i class="fas fa-tag"></i> Người thuê
                                                        </c:if>
                                                    </span>
                                                    <span style="font-size: 18px;"> | Điểm số: </span><span
                                                        style="font-size: 18px;">${loggedAccount.point}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <div class="d-flex">
                                        <div style="margin-right: 10px;">
                                            <a href="#"
                                               style="background-color: #FF6363; border-radius: 10px; padding: 10px 10px 10px 10px; text-decoration: none; color: white;">Bị
                                                báo cáo</a>
                                        </div>
                                        <div style="margin-right: 10px;">
                                            <a href="#" onclick="toggleFeedbackList()"
                                               style="background-color: #FFF085; border-radius: 10px; padding: 10px 10px 10px 10px; text-decoration: none; color: black;">Được
                                                đánh giá</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 my-auto">
                            <c:if test="${jobFee != null and not empty jobFee}">
                                <div class="text-center">
                                    <p style="font-weight: 800; margin: 0">Lương theo hợp đồng</p>
                                    <p style="margin: 0">${jobFee}</p>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div id="feedbackList"
                     style="width: 600px; border-radius: 10px; display: none; padding-bottom: 10px; padding-top: 10px; margin-bottom: 10px; margin-left: auto; margin-right: auto; background-color: rgba(204,204,204,0.22)">
                    <h5 class="text-center mb-3 bg-custom-gradient">Các đánh nhận được</h5>
                    <c:if test="${feedbackList != null and not empty feedbackList}">
                        <c:forEach items="${feedbackList}" var="o">
                            <div class="row m-3">
                                <div class="col-md-2 my-auto">
                                    <div class="my-auto01">
                                        <a href="#">
                                            <img src="${accDAO.getAccountById(o.fromUserId).avatar}" alt="Avatar"
                                                 style="width: 80px; height: 80px; border-radius: 50%;"/>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-8 my-auto">
                                    <div class="my-auto01">
                                        <span class="mb-3"
                                              style="font-weight: bold; font-size: 16px;">${accDAO.getAccountById(o.fromUserId).accountName}
                                                        <c:if test="${accDAO.getAccountById(o.fromUserId).verifiedAccount}">
                                                            <i class="fas fa-check-circle verified text-primary ms-2"
                                                               title="Verified"></i>
                                                        </c:if>
                                        </span>
                                    </div>
                                    <div class="starRate">
                                        <c:forEach var="i" begin="1" end="5">
                                            <c:choose>
                                                <c:when test="${o.rating >= i}">
                                                    <i class="fas fa-star" style="color: #f8d825;"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="far fa-star" style="color: #f8d825;"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-md-4 my-auto" class="d-flex"
                                     style="flex-direction: row; justify-content: end;">
                                    <div style="margin-right: 10px;">
                                        <a href="job?action=viewFeedback&jobId=${jobId}&toUserId=${o.toUserId}&fromUserId=${o.fromUserId}"
                                           style="color: white; background-color: #6787FE; border-radius: 10px; padding: 10px 10px 10px 10px; text-decoration: none;">Xem
                                            chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${feedbackList == null or empty feedbackList}">
                        <p class="text-center">Không có đánh giá nào từ đối tác</p>
                    </c:if>
                </div>

                <!-- Modal for Evaluation Confirmation -->
                <div id="evaluationModal" class="modal">
                    <div class="modal-content">
                        <p>Chỉ được đánh giá một lần!</p>
                        <p>Bạn có muốn tiếp tục đánh giá không?</p>
                        <div class="d-flex justify-content-center">
                            <a id="confirmEvaluation" href="#" class="confirm-btn">Đánh giá</a>
                            <button onclick="closeModal()" class="cancel-btn">Quay lại</button>
                        </div>
                    </div>
                </div>
                <div>
                    <h3 class="text-center mb-3 bg-custom-gradient" style="font-size: 24px; font-weight: 500; width: 800px;margin-left: auto; margin-right: auto;">Danh sách đối tác</h3>
                </div>
                <c:forEach var="o" items="${partnerList}">
                    <div class="post-box bg-white rounded-lg shadow-md items-center justify-between mb-3"
                         style="border: solid 2px #6787FE50; border-radius: 30px;">
                        <p style="background-color: #6787FE50; width: 100px; padding: 5px 10px 5px 10px; border-bottom-right-radius: 30px; border-top-left-radius: 30px;">
                            Đối tác <i class="fas fa-bolt"></i>
                        </p>
                        <div class="row m-3">
                            <div class="row">
                                <div class="col-md-2 my-auto">
                                    <div class="my-auto01">
                                        <a href="#">
                                            <img src="${o.avatar}" alt="Avatar"
                                                 style="width: 80%; height: 80%; border-radius: 50%;"/>
                                        </a>
                                    </div>
                                </div>

                                <div class="col-md-10 my-auto">
                                    <div class="service-content">
                                        <div class="service-item-seller">
                                            <div class="row">
                                                <div class="col-5">
                                                    <div class="d-flex">
                                                        <div class="my-auto">
                                                        <span class="mb-3"
                                                              style="font-weight: bold; font-size: 18px;">${o.accountName}
                                                            <c:if test="${o.verifiedAccount}">
                                                            <i class="fas fa-check-circle verified text-primary ms-2"
                                                               title="Verified"></i>
                                                            </c:if>
                                                        </span>
                                                            <span style="font-size: 18px">  | Điểm số: </span>
                                                            <span style="font-size: 18px">${o.point}</span>
                                                            <ul class="list-inline mb-lg-0 mt-2">
                                                                <li class="list-inline-item mb-2">
                                                                    <i class="fas fa-users"></i> ${o.typeAccount}
                                                                </li>
                                                                <c:if test="${o.accountId == jobDAO.getJobById(jobId).postAccountId}">
                                                                    <li class="list-inline-item">
                                                                        <i class="fas fa-tag"></i> Người thuê
                                                                    </li>
                                                                </c:if>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-7" style="padding: 0;">
                                                    <div class="d-flex"
                                                         style="flex-direction: row; justify-content: end;">
                                                        <div style="margin-right: 10px;">
                                                            <a href="#" class="btn"
                                                               style="color: white; background-color: #6787FE;">Xem chi tiết
                                                            </a>
                                                        </div>
                                                        <div style="margin-right: 10px;">
                                                            <a href="job-manage-process?action=view-report-form&jobId=${jobId}&accountId=${o.accountId}" class="btn"
                                                               style="color: white; background-color: #FF6363;">Báo cáo
                                                            </a>
                                                        </div>
                                                        <div>
                                                            <c:if test="${feedbackDAO.getFeedbackByToUserIdAndJobIdAndFromUserId(o.accountId, jobId, loggedAccount.accountId) == null}">
                                                                <a href="#" class="btn"
                                                                   onclick="openModal('job?action=loadPostFeedback&jobId=${jobId}&toUserId=${o.accountId}')"
                                                                   style="color: black; background-color: #FFF085;">Đánh giá
                                                                </a>
                                                            </c:if>

                                                            <c:if test="${feedbackDAO.getFeedbackByToUserIdAndJobIdAndFromUserId(o.accountId, jobId, loggedAccount.accountId) != null}">
                                                                <a href="job?action=viewFeedback&jobId=${jobId}&toUserId=${o.accountId}&fromUserId=${loggedAccount.accountId}" class="btn"
                                                                   style="color: black; background-color: #FFF085; border-radius: 10px; padding: 10px 10px 10px 10px; text-decoration: none;">Xem đánh giá
                                                                </a>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<%@include file="includes/footer.jsp" %>

<script>
    function toggleFeedbackList() {
        var feedbackList = document.getElementById("feedbackList");
        if (feedbackList.style.display === "none") {
            feedbackList.style.display = "block";
        } else {
            feedbackList.style.display = "none";
        }
    }

    function openModal(href) {
        var modal = document.getElementById("evaluationModal");
        var confirmBtn = document.getElementById("confirmEvaluation");
        confirmBtn.href = href;
        modal.style.display = "block";
    }

    function closeModal() {
        var modal = document.getElementById("evaluationModal");
        modal.style.display = "none";
    }

    // Đóng modal khi nhấp ra ngoài
    window.onclick = function (event) {
        var modal = document.getElementById("evaluationModal");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
</body>
</html>
