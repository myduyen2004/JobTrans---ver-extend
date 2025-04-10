<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">

    <title>Projects &#8211; ProLancer</title>

    <style id="prolancer_opt-dynamic-css" title="dynamic-css" class="redux-options-output">
        .card {
            width: 1351px;
            height: 208px;
            background: white;
            border-radius: 20px;
            border: 5px solid #CED9FE;
            position: relative;
            margin: 20px 0px;
        }

        .avatar {
            width: 150px;
            height: 150px;
            position: absolute;
            top: 29px;
            left: 15px;
            border-radius: 100px;
            margin-left: 20px;
        }

        .title {
            position: absolute;
            left: 255px;
            top: 49px;
            font-size: 32px;
            font-weight: 500;
            color: black;
        }

        .date {
            position: absolute;
            left: 1170px;
            top: 52px;
            font-size: 20px;
            font-family: Roboto;
            font-weight: 700;
            color: #4C4B4B;
        }

        .info {
            position: absolute;
            font-size: 20px;
            font-family: Roboto;
            font-weight: 400;
            color: #616161;
        }

        .sender {
            left: 255px;
            top: 116px;
        }

        .sender-address {
            left: 255px;
            top: 156px;
        }

        .receiver {
            left: 803px;
            top: 116px;
        }

        .receiver-address {
            left: 803px;
            top: 156px;
        }

        .status-box-success {
            width: auto;
            height: 39px;
            position: absolute;
            left: 506px;
            top: 52px;
            background: #0F9143;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
        }

        .status-box-waiting {
            width: auto;
            height: 39px;
            position: absolute;
            left: 506px;
            top: 52px;
            background: #CE4040;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
        }

        .status-box-shipping {
            width: auto;
            height: 39px;
            position: absolute;
            left: 506px;
            top: 52px;
            background: #CEB240;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
        }

        .status-text {
            color: white;
            font-size: 16px;
            font-family: Inter;
            font-weight: 400;
        }

        .detail-box {
            width: 138px;
            height: 48px;
            position: absolute;
            left: 1158px;
            top: 91px;
            background: #0B1741;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .detail-text {
            color: white;
            font-size: 20px;
            font-family: Inter;
            font-weight: 700;
            padding: 0;
        }

        .material-symbols--menu-rounded {
            display: inline-block;
            width: 36px;
            height: 36px;
            --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23000' d='M4 18q-.425 0-.712-.288T3 17t.288-.712T4 16h16q.425 0 .713.288T21 17t-.288.713T20 18zm0-5q-.425 0-.712-.288T3 12t.288-.712T4 11h16q.425 0 .713.288T21 12t-.288.713T20 13zm0-5q-.425 0-.712-.288T3 7t.288-.712T4 6h16q.425 0 .713.288T21 7t-.288.713T20 8z'/%3E%3C/svg%3E");
            background-color: black;
            -webkit-mask-image: var(--svg);
            mask-image: var(--svg);
            -webkit-mask-repeat: no-repeat;
            mask-repeat: no-repeat;
            -webkit-mask-size: 100% 100%;
            mask-size: 100% 100%;
        }

        #filter-list {
            display: none;
            position: absolute;
            top: 45px;
            left: 0;
            width: 250px;
            background: white;
            border-radius: 5px;
            padding: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }
    </style>
</head>

<body>
<section class="section-padding">
    <div class="container">
        <div class="justify-content-center">

            <div style="position: relative; display: inline-block;">
                <button id="filter-btn"
                        style="width: 100px; height: 40px; display: flex; align-items: center; gap: 5px; padding: 5px 10px; background: white; border-radius: 5px; cursor: pointer;">
                    <span class="material-symbols--menu-rounded"></span>
                    <span style="color: black; font-size: 20px; font-family: Inter; font-weight: 500;">Lọc</span>
                </button>

                <div id="filter-list">
                    <label><input type="radio" name="sort" value="success"> Thành công</label><br>
                    <label><input type="radio" name="sort" value="waiting"> Đang chờ duyệt</label><br>
                    <label><input type="radio" name="sort" value="shipping"> Đang vận chuyển</label>
                </div>
            </div>

            <div class="card">
                <img class="avatar"
                     src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg"/>
                <div class="title">Lập trình web</div>
                <div class="date">20-02-2020</div>
                <div class="info sender">Người gửi: Nguyễn An C</div>
                <div class="info sender-address">Địa chỉ: Ngũ Hành Sơn - Đà Nẵng</div>
                <div class="info receiver">Người nhận: Nguyễn Văn A</div>
                <div class="info receiver-address">Địa chỉ: Ba Đình - Hà Nội</div>
                <div class="status-box-success">
                    <span class="status-text">Thành công</span>
                </div>
                <button class="detail-box detail-text">Chi tiết</button>
            </div>

            <div class="card">
                <img class="avatar"
                     src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg"/>
                <div class="title">Lập trình web</div>
                <div class="date">20-02-2020</div>
                <div class="info sender">Người gửi: Nguyễn An C</div>
                <div class="info sender-address">Địa chỉ: Ngũ Hành Sơn - Đà Nẵng</div>
                <div class="info receiver">Người nhận: Nguyễn Văn A</div>
                <div class="info receiver-address">Địa chỉ: Ba Đình - Hà Nội</div>
                <div class="status-box-waiting">
                    <span class="status-text">Đang chờ duyệt</span>
                </div>
                <button class="detail-box detail-text">Chi tiết</button>
            </div>

            <div class="card">
                <img class="avatar"
                     src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg"/>
                <div class="title">Lập trình web</div>
                <div class="date">20-02-2020</div>
                <div class="info sender">Người gửi: Nguyễn An C</div>
                <div class="info sender-address">Địa chỉ: Ngũ Hành Sơn - Đà Nẵng</div>
                <div class="info receiver">Người nhận: Nguyễn Văn A</div>
                <div class="info receiver-address">Địa chỉ: Ba Đình - Hà Nội</div>
                <div class="status-box-shipping">
                    <span class="status-text">Đang vận chuyển</span>
                </div>
                <button class="detail-box detail-text">Chi tiết</button>
            </div>
        </div>
    </div>
</section>

</body>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

</html>