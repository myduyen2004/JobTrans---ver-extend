<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>

    <title>Nạp tiền vào ví</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/vnpay.css">
</head>
<body>
<%@include file="/includes/header-01.jsp" %>

<%--        <%@include file="/includes/sidebar.jsp" %>--%>
            <div class="container">
                <div class="header clearfix">

                    <h3 class="text-muted">Nộp tiền qua cổng thanh toán điện tử</h3>
                </div>
                <h3>Nạp thêm tiền</h3>
                    <form action="./payment" id="frmCreateOrder" method="post">
                        <div class="form-group">
                            <label for="amount">Số tiền</label>
                            <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="10000" />
                        </div>
                        <h4>Chọn phương thức thanh toán</h4>
                        <div class="form-group">
                            <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                            <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                            <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>

                            <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                            <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">
                            <label for="bankCode">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>

                            <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                            <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>

                            <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                            <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>

                        </div>
                        <div class="form-group">
                            <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                            <input type="radio" id="language" Checked="True" name="language" value="vn">
                            <label for="language">Tiếng việt</label><br>
                            <input type="radio" id="language" name="language" value="en">
                            <label for="language">Tiếng anh</label><br>

                        </div>
                        <button type="submit" class="btn btn-default">Thanh toán</button>
                    </form>
            </div>
            <div class="dashboard-footer-spacer"></div>
    <%@include file="/includes/footer.jsp" %>
<link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
<script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
<script type="text/javascript">
    $("#frmCreateOrder").submit(function () {
        var postData = $("#frmCreateOrder").serialize();
        var submitUrl = $("#frmCreateOrder").attr("action");
        $.ajax({
            type: "POST",
            url: submitUrl,
            data: postData,
            dataType: 'JSON',
            success: function (x) {
                if (x.code === '00') {
                    if (window.vnpay) {
                        vnpay.open({width: 768, height: 600, url: x.data});
                    } else {
                        location.href = x.data;
                    }
                    return false;
                } else {
                    alert(x.Message);
                }
            }
        });
        return false;
    });
</script>
</body>
</html>
