<%-- 
    Document   : reportUser
    Created on : Mar 4, 2025, 10:23:19 AM
    Author     : qn407
--%>

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

    <title>Projects &#8211; ProLancer</title>
    <meta name='robots' content='max-image-preview:large' />

    <style>
        .report-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            height: fit-content;
        }

        .reason-section, .evidence-section {
            margin-top: 15px;
        }

        .reason {
            display: flex;
            align-items: center;
            margin: 8px 0;
            margin-left: 80px;
        }

        .reason input {
            margin-right: 10px;
        }

        .upload-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #5A67D8;
            color: white;
            font-size: 14px;
            border-radius: 8px;
            cursor: pointer;
        }

        .upload-btn:hover {
            background-color: #4C51BF;
        }

        .material-symbols--upload {
            display: inline-block;
            width: 23px;
            height: 23px;
            --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23000' d='M11 16V7.85l-2.6 2.6L7 9l5-5l5 5l-1.4 1.45l-2.6-2.6V16zm-5 4q-.825 0-1.412-.587T4 18v-3h2v3h12v-3h2v3q0 .825-.587 1.413T18 20z'/%3E%3C/svg%3E");
            background-color: currentColor;
            -webkit-mask-image: var(--svg);
            mask-image: var(--svg);
            -webkit-mask-repeat: no-repeat;
            mask-repeat: no-repeat;
            -webkit-mask-size: 100% 100%;
            mask-size: 100% 100%;
        }

        .submit-section {
            text-align: center;
            margin-top: 100px;
        }
    </style>
</head>

<body>
    <section class="section-padding">
        <div class="container">
            <div class="row justify-content-center flex-row-reverse">
                <div class="search-result col-xl-9">
                    <div class="report-container col-xl-12">
                        <h2 style="text-align: center;">Báo cáo người dùng</h2>
                        <form action="#" method="post">
                            <div class="reason-section">
                                <label>Lý do báo cáo:</label>
                                <div class="reason">
                                    <input type="radio" name="reason" id="reason1">
                                    <label for="reason1">Dùng từ ngữ thô thiển, vi phạm chuẩn mực cộng đồng</label>
                                </div>
                                <div class="reason">
                                    <input type="radio" name="reason" id="reason2">
                                    <label for="reason2">Giả mạo, mạo danh người dùng khác</label>
                                </div>
                                <div class="reason">
                                    <input type="radio" name="reason" id="reason3">
                                    <label for="reason3">Spam, quấy rối</label>
                                </div>
                                <div class="reason">
                                    <input type="radio" name="reason" id="reason4">
                                    <label for="reason4">Bán, tiết lộ thông tin khách hàng trái phép</label>
                                </div>
                            </div>
                
                            <div class="evidence-section">
                                <label class="evidence">Bằng chứng:</label>
                                <button type="button" class="upload-btn"><span class="material-symbols--upload"></span> Upload bằng chứng cụ thể</button>
                            </div>

                            <div class="submit-section">
                                <button type="submit" class="report-btn"> Gửi báo cáo</button>
                            </div>
                        </form>
                    </div>
                </div>


                <div class="col-xl-3 position-relative">
                </div>
            </div>
        </div>
    </section>
</body>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

</html>