<%-- 
    Document   : vnpay-return
    Created on : Mar 4, 2025, 10:23:46 AM
    Author     : qn407
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="jobtrans.controller.web.payment.Config"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">

    <title>Nạp tiền vào ví &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large' />

    <style>
        .return {
            display: inline-block;
            padding: 10px 20px;
            background-color: #0f1b63; /* Màu xanh dương */
            color: #fff; /* Màu chữ trắng */
            text-decoration: none;
            border-radius: 5px; /* Bo góc */
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.2s, box-shadow 0.2s, color 0.3s;
            box-shadow: 0 5px 15px rgba(42, 65, 232, 0.3); /* Hiệu ứng bóng */
            margin-top: 20px; /* Khoảng cách phía trên */
        }

        .return:hover {
            background-color: #0f1b63; /* Màu khi hover */
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(42, 65, 232, 0.4); /* Hiệu ứng bóng khi hover */
            text-decoration: none; /* Bỏ gạch chân khi hover */
            color: #fff; /* Chữ chuyển sang màu trắng */
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
    <section class="section-padding">
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>
        <!--Begin display -->
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
            </div>
            <div class="">
                <div class="form-group">
                    <label >Mã giao dịch thanh toán:</label>
                    <label><%=request.getParameter("vnp_TxnRef")%></label>
                </div>
                <div class="form-group">
                    <label >Số tiền:</label>
                    <label><%=request.getParameter("vnp_Amount")%></label>
                </div>
                <div class="form-group">
                    <label >Mô tả giao dịch:</label>
                    <label><%=request.getParameter("vnp_OrderInfo")%></label>
                </div>
                <div class="form-group">
                    <label >Mã lỗi thanh toán:</label>
                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                </div>
                <div class="form-group">
                    <label >Mã giao dịch tại CTT VNPAY-QR:</label>
                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                </div>
                <div class="form-group">
                    <label >Mã ngân hàng thanh toán:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div>
                <div class="form-group">
                    <label >Thời gian thanh toán:</label>
                    <label><%=request.getParameter("vnp_PayDate")%></label>
                </div>
                <div class="form-group">
                    <label >Tình trạng giao dịch:</label>
                    <label>
                        <%
                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                    out.print("Thành công");
                                } else {
                                    out.print("Không thành công");
                                }

                            } else {
                                out.print("invalid signature");
                            }
                        %></label>
                </div>

                <br><br>
                <div>

                <%
                    if (signValue.equals(vnp_SecureHash)) {
                        if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {%>
                <a href="./profile?action=addWallet" class="return" >Quay về ví của bạn</a>
                <%                } else {%>
                <a href="./home" class="return" >Quay về trang chủ</a>
                <%                }%>

                <%            } else {%>
                <a href="./home" class="return" >Quay về trang chủ</a>
                <%            }
                %>

            </div>
            </div>
        </div>
    </section>
    </div>

    <!--======= Back to Top =======-->
    <div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>

</body>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

</html>
