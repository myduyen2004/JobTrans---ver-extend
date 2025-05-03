<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en-US">

<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>
    <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"/>
    <jsp:useBean id="accDAO" class="jobtrans.dal.AccountDAO" scope="session"/>
    <jsp:useBean id="feedbackDAO" class="jobtrans.dal.FeedbackDAO" scope="session"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JobTrans &#8211; Đánh giá đối tác</title>
    <meta name='robots' content='max-image-preview:large'/>
    <!--new css -->
    <link href="./css/post_job.css" rel="stylesheet"/>
    <style>
        .star-rating {
            display: inline-flex;
            font-size: 24px;
            cursor: pointer;
        }

        .star-rating i {
            color: #ccc; /* Màu mặc định cho ngôi sao chưa chọn */
            margin-right: 5px;
        }

        .star-rating i.filled {
            color: #f8d825; /* Màu cho ngôi sao đã chọn */
        }

        .error-message{
            color: red;
        }
    </style>
</head>
<%@include file="includes/header-01.jsp" %>
<body style="font-family: Inter, sans-serif ">
<div class="container">
    <form class="form-container" action="job" method="post">
        <h3 style="color: #0a0a2b; font-weight: bolder">Đánh giá đối tác
            - ${accDAO.getAccountById(toUserId).accountName}</h3>
        <br>
        <input type="hidden" name="action" value="postFeedback">
        <input type="hidden" name="toUserId" value="${toUserId}">
        <input type="hidden" name="jobId" value="${jobId}">
        <input type="hidden" name="rating" id="rating" value="0">

        <div class="form-group">
            <label class="form-label">Đánh giá:</label>
            <div class="star-rating" id="star-rating">
                <i class="far fa-star" style="color: #f8d825;"></i>
                <i class="far fa-star" style="color: #f8d825;"></i>
                <i class="far fa-star" style="color: #f8d825;"></i>
                <i class="far fa-star" style="color: #f8d825;"></i>
                <i class="far fa-star" style="color: #f8d825;"></i>
            </div>
<%--            <div id="rating-error" class="error-message" style="display: none;">Vui lòng chọn số sao đánh giá!</div>--%>
        </div>

        <div class="form-group">
            <label class="form-label" for="content">Nội dụng:</label>
            <input id="content" name="content" class="form-control" type="text" placeholder="Nhập nội dung đánh giá...">
        </div>

        <div class="button-group">
            <button type="submit" class="btn btn-primary">Gửi đánh giá</button>
            <button type="reset" class="btn btn-outline">Làm mới</button>
        </div>
    </form>
</div>
<%@include file="includes/footer.jsp" %>

<%--Xử lí validate--%>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const stars = document.querySelectorAll("#star-rating i");
        const ratingInput = document.getElementById("rating");
        const ratingError = document.getElementById("rating-error");

        // Hàm cập nhật giao diện ngôi sao
        function updateStars(rating) {
            stars.forEach((star, index) => {
                if (index < rating) {
                    star.classList.remove("far");
                    star.classList.add("fas", "filled");
                } else {
                    star.classList.remove("fas", "filled");
                    star.classList.add("far");
                }
            });
        }

        // Xử lý hover
        stars.forEach((star, index) => {
            star.addEventListener("mouseover", () => {
                updateStars(index + 1);
            });

            star.addEventListener("mouseout", () => {
                // Khi chuột rời đi, hiển thị lại số sao đã chọn (nếu có)
                updateStars(ratingInput.value);
            });

            // Xử lý click
            star.addEventListener("click", () => {
                ratingInput.value = index + 1; // Lưu giá trị số sao vào input hidden
                updateStars(index + 1); // Cập nhật giao diện
                ratingError.style.display = "none"; // Ẩn thông báo lỗi nếu có
            });
        });

        // Validate form khi submit
        document.querySelector("form").addEventListener("submit", function (e) {
            let isValid = true;

            // Xóa các thông báo lỗi cũ
            document.querySelectorAll(".error-message").forEach(el => el.remove());

            // Validate rating
            const starRating = document.getElementById("star-rating");
            if (ratingInput.value === "0") {
                const error = document.createElement("div");
                error.className = "error-message";
                error.style.color = "red";
                error.style.marginTop = "4px";
                error.style.fontStyle = "italic";
                error.style.fontSize = "14px";
                error.textContent = "Vui lòng chọn số sao đánh giá!";
                starRating.insertAdjacentElement("afterend", error);
                isValid = false;
            }

            // Validate content
            const content = document.getElementById("content");
            if (!content.value.trim()) {
                const error = document.createElement("div");
                error.className = "error-message";
                error.style.color = "red";
                error.style.marginTop = "4px";
                error.style.fontStyle = "italic";
                error.style.fontSize = "14px";
                error.textContent = "Nội dung này không được để trống!";
                content.insertAdjacentElement("afterend", error);
                isValid = false;
            }

            if (!isValid) {
                e.preventDefault(); // Ngăn form submit nếu có lỗi
            }
        });
    });
</script>

</body>
</html>
