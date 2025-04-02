<%--
    Document   : sidebar
    Created on : 17 thg 3, 2025, 22:37:15
    Author     : mac
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        /* CSS for Dashboard Sidebar */
        .dashboard-sidebar {
            width: 240px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif;
            margin: 0 40px;
            padding: 15px;
        }

        /* Sidebar Header */
        .dashboard-sidebar-header {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .dashboard-sidebar-header strong {
            font-style: italic;
            color: #6787FE;
        }

        .dashboard-sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .dashboard-sidebar ul li {
            padding: 12px 15px;
            font-weight: 500;
            cursor: pointer;
            /*transition: background 0.3s ease, color 0.3s ease;*/
            border-radius: 6px;
        }

        .dashboard-sidebar ul li:hover {
            background: #6787FE;
            color: white;
        }

        .dashboard-sidebar ul li a {
            text-decoration: none;
            color: black;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: color 0.3s ease;
        }

        .dashboard-sidebar ul li:hover a {
            color: white;
        }

        .dropdown {
            position: relative;
            color: black;
        }

        .dropdown ul {
            display: none;
            padding-left: 20px;
        }

        .dropdown.active ul {
            display: block;
        }

        .dropdown.active a{
            color: black;
        }

        .logout {
            color: red;
            font-weight: bold;
        }

        .logout a {
            color: red;
        }

        .logout:hover {
            background: #ffdddd;
        }

        /* Nút mở popup */

        .btn-change-password {
            display: inline-block;
            color: #6787FE;
            text-decoration: none;
            cursor: pointer;
        }


        /* Overlay của modal */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
            justify-content: center;
            align-items: center;
        }

        /* Container modal */
        .modal-container {
            background: white;
            width: 550px;
            height: 300px;
            padding: 20px 25px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            position: relative;
            z-index: 1000; /* Đảm bảo modal ở trên */

        }

        /* Header modal */
        .modal-header {
            display: flex;
            flex-direction: column;
            align-items: flex-start; /* Canh trái */
            margin-bottom: 10px;
            position: relative;
            width: 100%;
        }

        /* Nút đóng (X) vẫn ở góc phải */
        .modal-close {
            position: absolute;
            top: 0;
            right: 0;
            background: none;
            border: none;
            font-size: 22px;
            cursor: pointer;
            color: #555;
        }

        .modal-close:hover {
            color: #000;
        }
        /* Tiêu đề */
        .modal-title {
            font-size: 18px;
            font-weight: bold;
            color: #6787FE;
            margin-bottom: 4px;
            width: 100%; /* Để chiếm hết dòng */
            text-align: left;
        }

        /* Mô tả dưới tiêu đề */
        .modal-description {
            font-size: 14px;
            color: #666;
            width: 100%;
            text-align: left;
            margin: 0;
        }
        /* Form nhập mật khẩu */
        .modal-form {
            display: flex;
            flex-direction: column;
        }

        .modal-input {
            margin-bottom: 12px;
            padding: 12px;
            border: 1px solid #DDDDDD;
            border-radius: 8px;
            font-size: 14px;
            background: #f8f8f8;
            width: 100%;
        }



        #highlight-input::placeholder {
            color: #6787FE;
            opacity: 1;
        }

        .modal-input,
        .highlight-input {
            pointer-events: auto;
            opacity: 1;
            border: 1px solid #ccc;
        }


        .modal-footer {
            display: flex;
            justify-content: center;
            width: 100%;
            margin-top: 15px;
        }

        /* Nút xác nhận */
        .modal-button {
            width: 80%;
            height: min-content;
            padding: 10px 0;
            font-size: 16px;
            font-weight: bold;
            background-color: #6787FE;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-align: center;
            transition: 0.3s;
        }

        .modal-button:hover {
            background-color: #F0F3FF;
            color: #6787FE;
            border: 1px solid #DDDDDD;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <div class="col-xl-2 dashboard-sidebar">
        <div class="dashboard-sidebar-inner" data-simplebar>
            <div class="dashboard-nav-container">

                <div class="dashboard-sidebar-header">
                    <strong>Job</strong><span style="font-style: normal; color: black;">Trans</span>
                </div>

                <div class="dashboard-nav">
                    <div class="dashboard-nav-inner">

                        <ul data-submenu-title="Quản lí công việc">
                            <li class="dropdown">Quản Lí Công Việc <i class="fa fa-chevron-down"></i>
                                <ul>
                                    <li><a href="">Danh Sách Các Việc Đã Ứng Tuyển</a></li>
                                    <li><a href="">Công Việc Của Tôi</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul data-submenu-title="Quản lí CV">
                            <li class="dropdown">Quản Lí CV <i class="fa fa-chevron-down"></i>
                                <ul>
                                    <li><a href="">Quản lý CV</a></li>
                                    <li><a href="">Tải CV</a></li>
                                </ul>
                            </li>
                            <li><a href=""><i class="icon-line-awesome-dollar"></i> Danh sách nhà tuyển dụng</a></li>
                        </ul>
                        <ul data-submenu-title="Tài khoản">
                            <li><a href=""><i class="icon-line-awesome-dollar"></i> Nạp tiền vào ví</a></li>
                            <li><a href=""><i class="icon-line-awesome-dollar"></i> Sửa thông tin</a></li>
                            <li><a class="btn-change-password"><i class="icon-material-outline-settings"></i> Đổi mật khẩu</a>
                            </li>
                            <li class="logout"><a href=""><i class="icon-material-outline-power-settings-new"></i> Đăng Xuất</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal-overlay" id="modal">
        <div style="width: 728px; height: 600px; position: relative">
            <div style="width: 728px; height: 600px; left: 0px; top: 0px; position: absolute">
                <div style="width: 728px; height: 600px; left: 0px; top: 0px; position: absolute; background: white; border-radius: 40px"></div>
                <div data-svg-wrapper style="left: 670.73px; top: 24.95px; position: absolute">
                    <svg class="modal-close" id="close-modal"  width="37" height="38" viewBox="0 0 37 38" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M18.7847 21.1059L11.4145 28.4761C11.1387 28.7519 10.7877 28.8898 10.3616 28.8898C9.93538 28.8898 9.58442 28.7519 9.30866 28.4761C9.0329 28.2004 8.89502 27.8494 8.89502 27.4232C8.89502 26.9971 9.0329 26.6461 9.30866 26.3703L16.6789 19.0001L9.30866 11.6298C9.0329 11.354 8.89502 11.0031 8.89502 10.5769C8.89502 10.1507 9.0329 9.79975 9.30866 9.52399C9.58442 9.24823 9.93538 9.11035 10.3616 9.11035C10.7877 9.11035 11.1387 9.24823 11.4145 9.52399L18.7847 16.8943L26.155 9.52399C26.4308 9.24823 26.7817 9.11035 27.2079 9.11035C27.6341 9.11035 27.985 9.24823 28.2608 9.52399C28.5366 9.79975 28.6744 10.1507 28.6744 10.5769C28.6744 11.0031 28.5366 11.354 28.2608 11.6298L20.8905 19.0001L28.2608 26.3703C28.5366 26.6461 28.6744 26.9971 28.6744 27.4232C28.6744 27.8494 28.5366 28.2004 28.2608 28.4761C27.985 28.7519 27.6341 28.8898 27.2079 28.8898C26.7817 28.8898 26.4308 28.7519 26.155 28.4761L18.7847 21.1059Z" fill="black"/>
                    </svg>
                </div>
            </div>
            <div style="width: 671.69px; height: 123px; left: 20.15px; top: 80px; position: absolute">
                <div style="width: auto; left: 0px; top: 32px; position: absolute; color: #6787FE; font-size: 32px; font-family: 'Inter', sans-serif; font-weight: 700; word-wrap: break-word">Đổi mật khẩu</div>
                <div style="width: 233.28px; height: 21px; left: 0px; top: 0px; position: absolute">
                    <div style="width: auto; left: 0px; top: 0px; position: absolute; color: black; font-size: 18px; font-family: 'Inter', sans-serif; font-weight: 400; word-wrap: break-word">Nguyễn Văn User </div>
                    <div style="width: 76.42px; left: 156.86px; top: 0px; position: absolute; color: black; font-size: 18px; font-family: 'Inter', sans-serif; font-weight: 400; word-wrap: break-word">JobTrans</div>
                    <div style="width: 18px; height: 0px; left: 146.81px; top: 3px; position: absolute; transform: rotate(90deg); transform-origin: top left; border: 1px black solid; margin-left: 5px;"></div>
                </div>
                <div style="width: 671.69px; left: 0px; top: 81px; position: absolute; color: black; font-size: 18px; font-family: 'Inter', sans-serif; font-weight: 400; word-wrap: break-word">Mật khẩu của bạn phải có tối thiểu 8 ký tự, đồng thời bao gồm cả chữ số, chữ cái in hoa.</div>
            </div>
            <div style="width: 667.67px; height: 334px; left: 20.15px; top: 226px; position: absolute">
                <form action="profile" method="GET">
                <input type="hidden" id="action" name="action" value="changePassword" required>
                <div style="width: 667.67px; height: 74px; position: relative; margin-bottom: 25px;">
                    <input type="password" placeholder="Mật khẩu hiện tại" id="currentPassword" name="currentPassword"
                           style="width: 100%; height: 100%; border-radius: 30px; border: 1px solid #DDDDDD; padding-left: 29px; font-size: 18px; font-family: 'Inter', sans-serif; font-weight: 700; color: #9B9B9B;" required>
                </div>
                <div style="width: 667.67px; height: 74px; position: relative; margin-bottom: 25px;">
                    <input type="password" id="highlight-input" placeholder="Mật khẩu mới" id="newPassword" name="newPassword"
                           style="width: 100%; height: 100%; border-radius: 30px; border: 1px solid #DDDDDD; padding-left: 29px; font-size: 18px; font-family: 'Inter', sans-serif; font-weight: 700; color: #6787FE; background: #F0F3FF;" required>
                </div>
                <div style="width: 667.67px; height: 74px; position: relative;">
                    <input type="password" placeholder="Nhập lại mật khẩu" id="repeatNewPassword" name="repeatNewPassword"
                           style="width: 100%; height: 100%; border-radius: 30px; border: 1px solid #DDDDDD; padding-left: 29px; font-size: 18px; font-family: 'Inter', sans-serif; font-weight: 700; color: #9B9B9B;" required>
                </div>
                <div style="width: 497.73px; height: 45px; left: 87.48px; top: 289px; position: absolute; background: #6787FE; border-radius: 40px"></div>
                <div style="left: 295.85px; top: 301px; position: absolute; color: white; font-size: 18px; font-family: 'Inter', sans-serif; font-weight: 700; word-wrap: break-word">
                    <input type="submit" value="Xác nhận"></div>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll(".dropdown").forEach(function (item) {
                item.addEventListener("click", function () {
                    this.classList.toggle("active");
                });
            });
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const openModal = document.querySelector(".btn-change-password");
            const closeModal = document.querySelector("#close-modal");
            const modal = document.querySelector("#modal");

            openModal.addEventListener("click", function (event) {
                event.preventDefault();
                modal.style.display = "flex";
            });

            closeModal.addEventListener("click", function () {
                modal.style.display = "none";
            });

            window.addEventListener("click", function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            });
        });
    </script>
    <script>
        document.querySelector(".modal-button").addEventListener("click", function (event) {
            event.preventDefault();
        });
    </script>

</html>
