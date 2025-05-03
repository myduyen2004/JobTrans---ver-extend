<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:useBean id="accDao" class="jobtrans.dal.AccountDAO" scope="session"/>
    <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đánh giá</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: rgb(21, 42, 105);
            --primary-light: rgba(21, 42, 105, 0.1);
            --primary-gradient: linear-gradient(135deg, rgb(21, 42, 105), rgb(61, 92, 175));
            --secondary-color: #4a5568;
            --accent-color: #6787FE;
            --light-gray: #f7fafc;
            --white: #ffffff;
            --border-radius: 12px;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .bg-custom-gradient {
            background: linear-gradient(300deg, rgba(103, 135, 254, 0.4) 0%, rgb(43, 61, 159) 20%);
        }
        .report-header {
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }
        .report-content {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
        }
        .reporter-info {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .reporter-details {
            margin-left: 15px;
        }
        .btn {
            padding: 14px 28px;
            border: none;
            border-radius: 50px;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            min-width: 200px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-primary {
            background: linear-gradient(to right, var(--accent-color), rgb(61, 92, 175));
            color: white;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, rgb(61, 92, 175), var(--accent-color));
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(103, 135, 254, 0.3);
        }

        .btn-primary:active {
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<%@include file="includes/header-01.jsp"%>
<body>
<%@include file="includes/toast-notification.jsp"%>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-10 col-md-9 p-4" style="margin-left: 150px">
            <div class="report-header row">
                <h2 class="col-8">Chi tiết đánh giá</h2>
                <a href="job?action=viewPartnerList&jobId=${jobId}" class="col-4"><button class="btn btn-primary">Quay lại danh sách đối tác >></button></a>
            </div>

            <div class="row" style="display: flex; flex-direction: row; justify-content: center;">
                <div class="col-lg-8">
                    <!-- Report Details -->
                    <div class="card mb-4">
                        <div class="card-header bg-custom-gradient text-white">
                            <h5 class="mb-0"><i class="fas fa-exclamation-circle me-2"></i>Thông tin đánh giá</h5>
                        </div>
                        <div class="card-body">
                            <div class="reporter-info">
                                <img src="${accDao.getAccountById(feedback.fromUserId).avatar}" alt="${accDao.getAccountById(feedback.fromUserId).accountName}" class="avatar">
                                <div class="reporter-details">
                                    <h6 class="mb-0">${accDao.getAccountById(feedback.fromUserId).accountName}</h6>
                                    <small class="text-muted">${accDao.getAccountById(feedback.fromUserId).email}</small>
                                </div>
                            </div>

                            <div class="mb-3">
                                <h6 class="text-secondary">Người dùng được đánh giá:</h6>
                            </div>
                            <div class="reporter-info" style="padding-left: 20px;">
                                <img src="${accDao.getAccountById(feedback.toUserId).avatar}" alt="${accDao.getAccountById(feedback.toUserId).accountName}" class="avatar">
                                <div class="reporter-details">
                                    <h6 class="mb-0">${accDao.getAccountById(feedback.toUserId).accountName}</h6>
                                    <small class="text-muted">${accDao.getAccountById(feedback.toUserId).email}</small>
                                </div>
                            </div>

                            <div class="mb-3">
                                <h6 class="text-secondary">Thời gian đánh giá:</h6>
                                <p><fmt:formatDate value="${feedback.createdAt}" pattern="dd/MM/yyyy"/></p>
                            </div>

                            <div class="starRate mb-3">
                                <h6 class="text-secondary">Đánh giá:</h6>
                                <c:forEach var="i" begin="1" end="5">
                                    <c:choose>
                                        <c:when test="${feedback.rating >= i}">
                                            <i class="fas fa-star" style="color: #f8d825;"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="far fa-star" style="color: #f8d825;"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>

                            <div class="mb-3">
                                <h6 class="text-secondary">Nội dung đánh giá:</h6>
                                <div class="report-content">
                                    <p>${feedback.content}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>
