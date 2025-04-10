<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chỉnh sửa thông tin &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large' />

    <style id="prolancer_opt-dynamic-css" title="dynamic-css" class="redux-options-output">
        .profile {
            width: 300px;
            text-align: center;
        }

        .avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin: 20px auto;
        }

        .stars {
            color: #FFDB5B;
            font-size: 20px;
        }

        .avatar-btn {
            background: #0B1741;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 10px;
            width: 120px;
            height: fit-content;
            margin-top: 10px;
            cursor: pointer;
        }

        .member-since {
            color: #7F7A7A;
            font-size: 14px;
            margin-top: 10px;
        }

        .info {
            flex: 1;
            padding: 20px;
        }

        h2 {
            font-size: 32px;
            color: #0B1741;
            margin-left: 24%;
            margin-bottom: 40px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: auto auto;
            gap: 10px 20px;
            align-items: center;
            margin-left: 30px;
        }

        .info-grid p {
            font-size: 20px;
            margin: 5px 0;
        }

        .info-grid p:nth-child(odd) {
            font-weight: bold;
        }

        .buttons {
            margin-top: 0;
        }

        .intro-container {
            margin-top: 70px;
            width: 100%;
            height: fit-content;
            position: relative;
            background: #E8E6E6;
            border-radius: 30px;
            padding: 50px 79px;
        }

        .intro-title {
            text-align: center;
            color: #0B1741;
            font-size: 32px;
            font-family: Inter, sans-serif;
            font-weight: 900;
        }

        .intro-text {
            color: black;
            font-size: 24px;
            font-family: Inter, sans-serif;
            font-weight: 300;
            line-height: 35px;
            word-wrap: break-word;
            margin-top: 30px;
        }

        input[type=date] {
            width: 100%;
            border: 1px solid #dfdfdf;
            height: 60px;
            border-radius: 50px;
            padding: 0 15px;
            -webkit-transition: .3s linear;
            -o-transition: .3s linear;
            transition: .3s linear;
        }
    </style>
    <style>
        .upload-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #0B1741;
            color: white;
            border: none;
            border-radius: 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-align: center;
        }

        .upload-btn:hover {
            background-color: #1c2a70;
        }
        .account-type-label {
            font-size: 18px;
            margin-bottom: 10px;
            font-weight: 600;
            color: #2c3e50;
        }

        .account-type-box {
            display: flex;
            align-items: center;
            background-color: #6787fe;
            color: white;
            font-weight: bold;
            padding: 14px 20px;
            border-radius: 14px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            width: fit-content;
            transition: all 0.3s ease;
            cursor: default;
        }

        .account-type-box:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.25);
        }

        .account-type-box .icon01 {
            margin-right: 12px;
            font-size: 20px;
            color: white; /* Icon trắng */
        }

        .account-text {
            font-size: 16px;
        }

    </style>
    <style>
        .toast-success {
            background-color: #51a351 !important;
            color: white !important;
        }

        .toast-error {
            background-color: #bd362f !important;
            color: white !important;
        }
    </style>
</head>

<body>

<div class="row main-content" id="mainContent">
<section>
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-md-12 my-auto">
                    <h1>
                        Tài khoản </h1>
                    <ul class="trail-items" itemscope itemtype="http://schema.org/BreadcrumbList">
                        <li class="trail-item trail-begin"><a href="../index.html"><span
                                itemprop="name">Chỉnh sửa thông tin</span></a>
                            <meta itemprop="position" content="1" />
                        </li>

                    </ul>
                </div>
            </div>

        </div>
    </div>
</section>


<section class="section-padding">
    <div class="container">
        <form action="profile" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
            <div class="justify-content-center col-xl-12" style="display: flex;">
                <div class="profile col-xl-4">
                    <img class="avatar"
                         src="${account.avatar}"
                         alt="Avatar">
                    <div class="stars">
                        <span>★★★★★</span>
                    </div>
                    <br>
                    <label for="avatar-upload" class="upload-btn">Thay avatar</label>
                    <input id="avatar-upload" class="file-upload" type="file" name="avatar" accept="image/*" style="display: none;" />
                    <input type="hidden" name="avatemp" value="${account.avatar}" accept="image/*"/>
                </div>
                <div class="info col-xl-6">
                    <h2>Thông tin tài khoản</h2>
                    <div class="info-grid">
                        <p class="account-type-label">Loại tài khoản</p>
                        <div class="account-type-box">

                            <c:if test="${account.type == 'Individual'}">
                                <i class="fas fa-user icon01"></i>
                                <span class="account-text">Cá nhân</span>
                            </c:if>
                            <c:if test="${account.type == 'Group'}">
                                <i class="fas fa-users icon01"></i>
                                <span class="account-text">Nhóm</span>
                            </c:if>

                        </div>

                        <p>Họ và tên</p>
                        <input type="text" name="fullName" value="${account.accountName}" required>
                        <p>Ngày sinh</p>
<%--                        <fmt:formatDate value="${account.dateOfBirth}" pattern="dd/MM/yyyy" var="formattedDob"/>--%>
                        <input type="date" id="dob" name="dob" value="${account.dateOfBirth}" required>
                        <%--            <input type="date" name="dob" value="${account.dateOfBirth}" required>--%>
                        <p>Giới tính</p>
                        <select name="gender">
                            <option value="Nam" ${account.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                            <option value="Nữ" ${account.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                        </select>
                        <p>Chuyên môn</p>
                        <input type="text" name="specialty" value="${account.specialist}" required>
                        <p>Email</p>
                        <input type="email" name="email" value="${account.email}" required>
                        <p>SĐT</p>
                        <input type="text" name="phone" value="${account.phone}" required>
                    </div>
                </div>
                <div class="buttons col-xl-3" style="text-align: center">
                    <input type="hidden" name="accountId" value="${account.accountId}">
                    <button type="submit" class="save-btn" style="margin-bottom: 20px">Lưu thông tin</button>
                </div>
            </div>
            <div class="intro-container">
                <div class="intro-title">Giới thiệu chung</div>
                <textarea name="introduction" class="intro-text">${account.bio}</textarea>
            </div>
        </form>
    </div>
</section>

</div>
</body>
<script>
    // Lấy ngày hôm nay
    const today = new Date();
    const yyyy = today.getFullYear();
    const mm = String(today.getMonth() + 1).padStart(2, '0');
    const dd = String(today.getDate()).padStart(2, '0');

    const maxDate = `${yyyy}-${mm}-${dd}`;

    // Gán giá trị max vào input
    document.getElementById("dob").setAttribute("max", maxDate);
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const fileInput = document.getElementById("avatar-upload");
        const avatarImage = document.querySelector(".avatar");

        fileInput.addEventListener("change", function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    avatarImage.src = e.target.result; // gán ảnh tạm thời
                }
                reader.readAsDataURL(file); // đọc file ảnh
            }
        });
    });
</script>
<script>
    $(document).ready(function () {
        <% if (request.getAttribute("success") != null) { %>
        toastr.success('<%= request.getAttribute("success") %>');
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
        toastr.error('<%= request.getAttribute("error") %>');
        <% } %>
    });
</script>
</html>