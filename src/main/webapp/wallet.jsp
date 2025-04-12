<%-- 
    Document   : wallet
    Created on : Mar 4, 2025, 10:23:59 AM
    Author     : qn407
--%>

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
    <meta name='robots' content='max-image-preview:large'/>

    <style>
        .profile {
            display: flex;
            align-items: center;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0px 7px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            margin-right: 15px;
        }

        .user-info {
            border-right: 1px solid black;
            width: 300px;
        }

        .user-info h2 {
            margin: 0;
        }

        .rating {
            display: flex;
            align-items: center;
        }

        .rating img {
            width: 16px;
            height: 16px;
            margin-left: 5px;
        }

        .devicon--linkedin {
            display: inline-block;
            width: 24px;
            height: 24px;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 128 128'%3E%3Cpath fill='%230076b2' d='M116 3H12a8.91 8.91 0 0 0-9 8.8v104.42a8.91 8.91 0 0 0 9 8.78h104a8.93 8.93 0 0 0 9-8.81V11.77A8.93 8.93 0 0 0 116 3'/%3E%3Cpath fill='%23fff' d='M21.06 48.73h18.11V107H21.06zm9.06-29a10.5 10.5 0 1 1-10.5 10.49a10.5 10.5 0 0 1 10.5-10.49m20.41 29h17.36v8h.24c2.42-4.58 8.32-9.41 17.13-9.41C103.6 47.28 107 59.35 107 75v32H88.89V78.65c0-6.75-.12-15.44-9.41-15.44s-10.87 7.36-10.87 15V107H50.53z'/%3E%3C/svg%3E");
            margin-left: 10px;
        }

        .material-symbols--star {
            display: inline-block;
            width: 24px;
            height: 24px;
            --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23000' d='m5.825 21l1.625-7.025L2 9.25l7.2-.625L12 2l2.8 6.625l7.2.625l-5.45 4.725L18.175 21L12 17.275z'/%3E%3C/svg%3E");
            background-color: currentColor;
            -webkit-mask-image: var(--svg);
            mask-image: var(--svg);
            -webkit-mask-repeat: no-repeat;
            mask-repeat: no-repeat;
            -webkit-mask-size: 100% 100%;
            mask-size: 100% 100%;
            color: #FFDB5B;
        }

        .user-info hr {
            width: 2px;
            height: fit-content;
            margin: 0 10px;

        }

        .user-stats {
            display: flex;
            justify-content: space-between;
            gap: 40px;
            text-align: center;
            max-width: 500px;
            margin: auto;
        }

        .user-stats div {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 80px;
        }

        .balance {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0px 7px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;

        }

        .balance h3 {
            margin-top: 0;
        }

        .balance p {
            font-size: 20px;
            font-weight: bold;
        }

        .balance .buttons {
            display: flex;
            gap: 10px;
        }

        .deposit,
        .withdraw {
            padding: 10px 20px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s, box-shadow 0.2s, color 0.3s;

        }

        .deposit {
            background-color: #6787FE;
            color: white;
        }

        .deposit:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(42, 65, 232, 0.4);
            background-color: #F0F3FF;
            color: #6787FE;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .table-header h3 {
            margin-bottom: 0;
        }

        a {
            display: block;
            text-decoration: none;
            color: black;
        }

        a:hover {
            text-decoration: underline;
            color: #000000;
        }

        .transactions {
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0px 7px rgba(0, 0, 0, 0.1);
            background-color: #F0F3FF;
        }

        .transactions table {
            width: 100%;
            margin-top: 10px;
            border: none;

        }

        .transactions th,
        .transactions td {
            border: none;
            padding: 10px;
            text-align: left;
        }

        .transactions th {
            border-bottom: 2px solid black
        }

        .success {
            color: green;
            font-weight: 400;
        }

        .failed {
            color: red;
            font-weight: 400;
        }
    </style>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html, body {
            overflow-x: hidden;
            width: 100%;
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
                                    itemprop="name">Tài khoản</span></a>
                                <meta itemprop="position" content="1"/>
                            </li>
                            <li class="trail-item trail-end"><span itemprop="item"><span
                                    itemprop="name">Ví của tôi</span></span>
                                <meta itemprop="position" content="2"/>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="section-padding">
        <section class="container">
            <div class="row justify-content-center flex-row-reverse col-xl-12">
                <div class="search-result col-xl-9">
                    <div class=" col-xl-12">

                        <div class="profile">
                            <img src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg"
                                 alt="Avatar" class="avatar">
                            <div class="user-info">
                                <h2>Nguyễn Văn User</h2>
                                <div class="rating">
                                    <span class="material-symbols--star"></span>
                                    <span class="material-symbols--star"></span>
                                    <span class="material-symbols--star"></span>
                                    <span class="material-symbols--star"></span>
                                    <span class="material-symbols--star"></span>
                                    <span class="devicon--linkedin"></span>
                                </div>
                            </div>


                            <div class="user-stats ">
                                <div>
                                    <p><strong>Số điểm</strong></p>
                                    <p>1200</p>
                                </div>
                                <div>
                                    <p><strong>Đang theo dõi</strong></p>
                                    <p>50</p>
                                </div>
                                <div>
                                    <p><strong>Người theo dõi</strong></p>
                                    <p>200</p>
                                </div>
                            </div>
                        </div>

                        <div class="balance">
                            <div>
                                <h3>Số dư tài khoản:</h3>
                                <p><strong>100.000</strong> Coin</p>
                            </div>
                            <div class="buttons">
                                <button class="deposit">Nạp</button>
                                <button class="deposit" disabled>Rút</button>
                            </div>
                        </div>

                        <div class="transactions">
                            <div class="table-header">
                                <h3>Giao dịch gần đây</h3>
                                <a href="#">Xem thêm ></a>
                            </div>
                            <table>
                                <thead>
                                `
                                <tr>
                                    <th>Giờ</th>
                                    <th>Số tiền</th>
                                    <th>Hình thức</th>
                                    <th>Trạng thái</th>
                                    <th>Nội dung</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>16:00:41 15/01/2025</td>
                                    <td>500.000</td>
                                    <td>Nạp tiền</td>
                                    <td class="success">Thành công</td>
                                    <td>Nạp tiền vào JobTrans</td>
                                </tr>
                                <tr>
                                    <td>20:56:23 15/01/2025</td>
                                    <td>200.000</td>
                                    <td>Rút tiền</td>
                                    <td class="failed">Thất bại</td>
                                    <td>Rút tiền vào ví cá nhân</td>
                                </tr>
                                <tr>
                                    <td>21:01:36 15/01/2025</td>
                                    <td>200.000</td>
                                    <td>Rút tiền</td>
                                    <td class="success">Thành công</td>
                                    <td>Rút tiền vào ví cá nhân</td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>

                </div>

            </div>
        </section>
    </section>
</div>
</body>
</html>