<%-- Document : favoriteListJob Created on : Mar 2, 2025, 4:13:55 PM Author : qn407 --%>

    <%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

            <style id="prolancer_opt-dynamic-css" title="dynamic-css" class="redux-options-output">
                .container-a {
                    width: 1046px;
                    margin: 0 auto;
                    padding: 20px;
                    position: relative;
                }

                .container-a::before {
                    content: "";
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    width: 600px;
                    height: 400px;
                    background-repeat: no-repeat;
                    background-size: 100%;
                    background-position: center;
                    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%236787FE' d='M6 20q-1.25 0-2.125-.875T3 17H1V6q0-.825.588-1.412T3 4h14v4h3l3 4v5h-2q0 1.25-.875 2.125T18 20t-2.125-.875T15 17H9q0 1.25-.875 2.125T6 20m0-2q.425 0 .713-.288T7 17t-.288-.712T6 16t-.712.288T5 17t.288.713T6 18m-3-3h.8q.425-.45.975-.725T6 14t1.225.275T8.2 15H15V6H3zm15 3q.425 0 .713-.288T19 17t-.288-.712T18 16t-.712.288T17 17t.288.713T18 18m-1-5h4.25L19 10h-2zm-8-2.5'/%3E%3C/svg%3E");
                    opacity: 0.4;
                    z-index: -1;
                }

                .title {
                    text-align: center;
                    color: black;
                    font-size: 32px;
                    font-family: Inter, sans-serif;
                    font-weight: 700;
                    margin-bottom: 20px;
                }

                .section {
                    color: black;
                    font-size: 24px;
                    font-family: Inter, sans-serif;
                    font-weight: 500;
                    margin-top: 20px;
                    margin-bottom: 20px;
                }

                .input-box {
                    width: auto;
                    height: 47px;
                    background: white;
                    box-shadow: 0px 0px 10px rgba(103, 135, 254, 0.8);
                    display: flex;
                    align-items: center;
                    padding-left: 21px;
                    font-size: 16px;
                    font-family: Inter, sans-serif;
                    font-weight: 500;
                    color: black;
                    margin: 10px;
                }

                
                .input-box::placeholder {
                    color: #B2B2B2; /* Màu chữ placeholder */
                    opacity: 1; /* Đảm bảo placeholder hiển thị đúng màu */
                }

                .button {
                    width: 377px;
                    height: 51px;
                    background: #6787FE;
                    border-radius: 100px;
                    color: white;
                    font-size: 20px;
                    font-family: Inter, sans-serif;
                    font-weight: 500;
                    text-align: center;
                    line-height: 51px;
                    margin: 20px auto;
                    cursor: pointer;
                }

                .material-symbols--local-shipping-outline {
                    display: inline-block;
                    width: 24px;
                    height: 24px;
                    background-repeat: no-repeat;
                    background-size: 100% 100%;
                    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%236787FE' d='M6 20q-1.25 0-2.125-.875T3 17H1V6q0-.825.588-1.412T3 4h14v4h3l3 4v5h-2q0 1.25-.875 2.125T18 20t-2.125-.875T15 17H9q0 1.25-.875 2.125T6 20m0-2q.425 0 .713-.288T7 17t-.288-.712T6 16t-.712.288T5 17t.288.713T6 18m-3-3h.8q.425-.45.975-.725T6 14t1.225.275T8.2 15H15V6H3zm15 3q.425 0 .713-.288T19 17t-.288-.712T18 16t-.712.288T17 17t.288.713T18 18m-1-5h4.25L19 10h-2zm-8-2.5'/%3E%3C/svg%3E");
                }
            </style>
        </head>

        <body>

                <section class="section-padding">
                    <div class="container">
                        <div class="row justify-content-center flex-row-reverse">
                            <div class="search-result col-xl-9">

                                <div class="container-a">
                                    <div class="title">Thông tin vận chuyển</div>

                                    <div class="section">Địa chỉ người gửi</div>
                                    <div class="col-xl-12" style="display: flex;">
                                        <input type="text" class="input-box" placeholder="Thành phố, Tỉnh" style="border-radius: 16px;">
                                        <input type="text" class="input-box" placeholder="Quận, huyện" style="border-radius: 16px;">
                                        <input type="text" class="input-box" placeholder="Phường, xã" style="border-radius: 16px;">
                                    </div>
                                    <div class="col-xl-12" style="display: flex;">
                                        <input type="text" class="input-box" placeholder="Địa chỉ cụ thể" style="border-radius: 16px;">
                                        <input type="text" class="input-box" placeholder="Họ và tên" style="border-radius: 16px;">
                                        <input type="text" class="input-box" placeholder="Số điện thoại" style="border-radius: 16px;">
                                    </div>

                                    <div class="section">Địa chỉ người nhận</div>

                                    <div class="col-xl-12" style="display: flex;">
                                        <input type="text" class="input-box" placeholder="Thành phố, Tỉnh" style="border-radius: 16px;">
                                        <input type="text" class="input-box" placeholder="Quận, huyện" style="border-radius: 16px;">
                                        <input type="text" class="input-box" placeholder="Phường, xã" style="border-radius: 16px;">
                                    </div>
                                    <div class="col-xl-12" style="display: flex;">
                                        <input type="text" class="input-box" placeholder="Địa chỉ cụ thể" style="border-radius: 16px;">
                                        <input type="text" class="input-box" placeholder="Họ và tên" style="border-radius: 16px;">
                                        <input type="text" class="input-box" placeholder="Số điện thoại" style="border-radius: 16px;">
                                    </div>

                                    <div class="section">Thông tin đơn hàng</div>
                                    <div class="col-xl-12" style="display: flex;">
                                        <input type="text" class="input-box" placeholder="Tên sản phẩm" style="border-radius: 16px;">
                                        <input type="number" class="input-box" placeholder="Số lượng" style="border-radius: 16px;">
                                        <input type="text" class="input-box" placeholder="Khối lượng" style="border-radius: 16px;">
                                    </div>
                                    <div style="text-align: center;">
                                        <button class="button">Xác nhận thông tin đơn hàng</button>
                                    </div>
                                </div>

                            </div>
                            <div class="col-xl-3">
                            </div>
                        </div>
                    </div>
                </section>
        </body>
        </html>