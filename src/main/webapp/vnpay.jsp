<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">

    <title>Nạp tiền &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large' />


    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        h1, h2, h3, h4, h5 {
            color: #2c3e50;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
        }

        .profile {
            display: flex;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .avatar {
            text-align: center;
            width: 30%;
        }

        .avatar img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
            border: 3px solid #007bff;
        }

        .rating {
            color: gold;
            font-size: 20px;
        }

        .cv-button {
            background: #007bff;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
            transition: background 0.3s ease-in-out;
        }

        .cv-button:hover {
            background: #0056b3;
        }

        .info {
            width: 70%;
            padding-left: 20px;
        }

        .info h2 {
            border-bottom: 2px solid #007bff;
            display: inline-block;
            padding-bottom: 5px;
        }

        .section {
            margin-top: 20px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .section h2 {
            color: #2c3e50;
            border-bottom: 2px solid #007bff;
            display: inline-block;
            padding-bottom: 5px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        input[type="number"], input[type="radio"] {
            margin-right: 5px;
        }

        input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            transition: border-color 0.3s ease-in-out;
        }

        input[type="number"]:focus {
            border-color: #007bff;
            outline: none;
        }

        button {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s ease-in-out;
        }

        button:hover {
            background-color: #218838;
        }

        /* Breadcrumbs */
        .breadcrumbs {
            background: #007bff;
            padding: 10px;
            border-radius: 5px;
        }

        .breadcrumbs h1 {
            color: white;
            margin: 0;
            font-size: 22px;
        }

        .breadcrumbs ul {
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .breadcrumbs ul li {
            display: inline;
            color: white;
        }

        .breadcrumbs ul li a {
            color: #f8f9fa;
            text-decoration: none;
        }

        .breadcrumbs ul li a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .profile {
                flex-direction: column;
                text-align: center;
            }

            .avatar {
                width: 100%;
            }

            .info {
                width: 100%;
                padding-left: 0;
            }

            .form-group {
                text-align: center;
            }

            input[type="number"] {
                width: 80%;
            }
        }
        body {
            overflow-x: hidden;
        }
        .container {
            max-width: 100%;
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
                            Nạp tiền vào ví </h1>
                        <ul class="trail-items" itemscope itemtype="http://schema.org/BreadcrumbList">
                            <li class="trail-item trail-begin"><a href="../index.html"><span
                                        itemprop="name">Tài khoản</span></a>
                                <meta itemprop="position" content="1" />
                            </li>
                            <li class="trail-item trail-end"><span itemprop="item"><span
                                        itemprop="name">Nộp tiền</span></span>
                                <meta itemprop="position" content="2" />
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="section-padding">
        <div class="container">
            <div class="row justify-content-center flex-row-reverse">
                <div class="search-result col-xl-9">
                    <div class="report-container col-xl-12">
                        <div class="header clearfix">
                            <h3 class="" style="color: #6787FE;font-weight: 800;">Thanh toán qua cổng điện tử</h3>
                        </div>
                        <h4>Nạp thêm tiền</h4>
                        <div class="table-responsive">
                            <form action="./payment" id="frmCreateOrder" method="post">        
                                <div class="form-group">
                                    <label for="amount">Số tiền</label>
                                    <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="10000" />
                                </div>
                                <h4>Chọn phương thức thanh toán</h4>
                                <div class="form-group">
                                    <h5 style="font-weight:500;">Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                                    <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                                    <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>

                                    <h5 style="font-weight:500;">Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                                    <input type="radio" name="bankCode" value="VNPAYQR">
                                    <label for="bankCode">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>

                                    <input type="radio" name="bankCode" value="VNBANK">
                                    <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>

                                    <input type="radio" name="bankCode" value="INTCARD">
                                    <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>

                                </div>
                                <div class="form-group">
                                    <h5 style="font-weight:500;">Chọn ngôn ngữ giao diện thanh toán:</h5>
                                    <input type="radio" id="language" Checked="True" name="language" value="vn">
                                    <label for="language">Tiếng việt</label><br>
                                    <input type="radio" id="language" name="language" value="en">
                                    <label for="language">Tiếng anh</label><br>

                                </div>
                                <button type="submit" class="btn btn-default" style="background-color: #0f1b63" href>Thanh toán</button>
                            </form>
                        </div>

                    </div>
                </div>


                <div class="col-xl-3 position-relative">

                </div>
            </div>
        </div>
    </section>
    </div>
</body>
</html>
