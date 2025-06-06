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
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>KẾT QUẢ THANH TOÁN</title>
    <link rel="stylesheet" href="css/vnpay-return.css">
</head>
<%@include file="includes/header-01.jsp"%>
<body>
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

        <%
            if (signValue.equals(vnp_SecureHash)) {
                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {%>
        <a href="./profile?action=addWallet" class="return" >Click để xác nhận</a>
        <%                } else {%>
        <a href="./home" class="return" >Quay về trang chủ</a>
        <%                }%>

        <%            } else {%>
        <a href="./home" class="return" >Quay về trang chủ</a>
        <%            }
        %>

    </div>
    <p>
        &nbsp;
    </p>
</div>
<%@include file="includes/footer.jsp"%>

</body>

</html>
