<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<%
    // Tạo data mẫu (List of Maps)
    List<Map<String, String>> allReports = new ArrayList<>();
    allReports.add(new HashMap<String, String>() {{ put("nguoiBaoCao", "Nguyễn A"); put("tieuChiViPham", "Chửi tục"); put("congViec", ""); }});
    allReports.add(new HashMap<String, String>() {{ put("nguoiBaoCao", "Trần B"); put("tieuChiViPham", "Spam"); put("congViec", "Design banner"); }});
    allReports.add(new HashMap<String, String>() {{ put("nguoiBaoCao", "Lê C"); put("tieuChiViPham", "Thông tin sai lệch"); put("congViec", ""); }});
    allReports.add(new HashMap<String, String>() {{ put("nguoiBaoCao", "Phạm D"); put("tieuChiViPham", "Quấy rối"); put("congViec", "Hình ảnh phản cảm"); }});
    allReports.add(new HashMap<String, String>() {{ put("nguoiBaoCao", "Hoàng E"); put("tieuChiViPham", "Vi phạm bản quyền"); put("congViec", ""); }});
    allReports.add(new HashMap<String, String>() {{ put("nguoiBaoCao", "Vũ F"); put("tieuChiViPham", "Chậm tiến độ"); put("congViec", "Không giao hàng đúng hẹn"); }});
    allReports.add(new HashMap<String, String>() {{ put("nguoiBaoCao", "Đặng G"); put("tieuChiViPham", "Lừa đảo"); put("congViec", ""); }});
    allReports.add(new HashMap<String, String>() {{ put("nguoiBaoCao", "Bùi H"); put("tieuChiViPham", "Nội dung độc hại"); put("congViec", "Lời lẽ thù hận"); }});
    allReports.add(new HashMap<String, String>() {{ put("nguoiBaoCao", "Cao I"); put("tieuChiViPham", "Tiết lộ thông tin cá nhân"); put("congViec", ""); }});
    allReports.add(new HashMap<String, String>() {{ put("nguoiBaoCao", "Mai K"); put("tieuChiViPham", "Gian lận"); put("congViec", "Khuyến mãi ảo"); }});

    // Số lượng đối tượng trên mỗi trang
    int recordsPerPage = 2; // Hiển thị 2 đối tượng trên mỗi trang

    // Lấy số trang hiện tại từ request
    String pageParam = request.getParameter("page");
    int currentPage = 1;
    if (pageParam != null && !pageParam.isEmpty()) {
        try {
            currentPage = Integer.parseInt(pageParam);
        } catch (NumberFormatException e) {
            // Mặc định là trang 1 nếu không phải số
        }
    }

    // Tính toán index bắt đầu và kết thúc cho trang hiện tại
    int startIndex = (currentPage - 1) * recordsPerPage;
    int endIndex = Math.min(startIndex + recordsPerPage, allReports.size());

    // Lấy danh sách đối tượng cho trang hiện tại
    List<Map<String, String>> currentReportList = allReports.subList(startIndex, endIndex);

    // Tính tổng số trang
    int totalPages = (int) Math.ceil((double) allReports.size() / recordsPerPage);

    // Đặt các thuộc tính vào request để hiển thị trên JSP
    request.setAttribute("currentReportList", currentReportList);
    request.setAttribute("currentPage", currentPage);
    request.setAttribute("totalPages", totalPages);
    request.setAttribute("recordsPerPage", recordsPerPage);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách báo cáo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #6787FE;
            padding-bottom: 10px;
        }

        .header h1 {
            color: #0F1B63;
            margin: 0;
        }

        .menu-icon {
            background-color: #6787FE;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .menu-icon span {
            display: block;
            width: 25px;
            height: 3px;
            background-color: white;
            margin: 2px 0;
        }

        .dropdown-menu {
            position: absolute;
            right: 20px;
            background-color: #f9f9f9;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            display: none;
        }

        .dropdown-menu a {
            color: #0F1B63;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-menu a:hover {
            background-color: #6787FE;
            color: white;
        }

        .show {
            display: block;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th {
            background-color: #0F1B63;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .pagination {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }

        .pagination a {
            color: #0F1B63;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
            margin: 0 4px;
            border-radius: 5px;
        }

        .pagination a.active {
            background-color: #6787FE;
            color: white;
            border: 1px solid #6787FE;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            right: 250px;

        }

        .dropdown-content a {
            color: #0F1B63;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {background-color: #6787FE; color: white;}

        .show-dropdown {
            display: block;
        }
    </style>

    <style>
        /* styles.css */
        .banner {
            background-image: url('./img/anh1/anh1.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            text-align: center;
            width: 100%; /* Chiều rộng 100% (tương đương 12 cột trên layout full-width) */
            padding-top: 50px; /* Giảm padding trên */
            padding-bottom: 50px; /* Giảm padding dưới */
            color: white; /* Đặt màu chữ */

            /* max-height: 300px; */
        }

        .banner h1 {
            margin: 0; /* Loại bỏ margin mặc định của h1 */
            text-align: center;
            font-size: 40px;
            margin-right: 215px;

        }
        .inforDetail{
            font-size: 20px;
            align-self: flex-start
        }
        .contentBanner {
            display: flex;
            flex-direction: column; /* Sắp xếp các phần tử con theo cột */
            align-items: center; /* Căn giữa các phần tử con theo chiều ngang */
            /* Các стили khác cho contentBanner */
        }





    </style>
</head>
<body>
<section>
    <div class="breadcrumbs banner" style="padding-bottom: 30px;padding-top: 10px;padding-top: 20px;margin-bottom: 50px;">
        <div class="container" style="right: 80px;">
            <div class="contentBanner">

                 <div class="inforDetail">Thông tin người dùng >> </div>
                <h1>Danh sách báo cáo</h1>

            </div>

        </div>
    </div>

</section>
<div class="container">
    <div class="header">
        <h1>Danh sách báo cáo</h1>
        <div class="dropdown">
            <button class="menu-icon" onclick="toggleDropdown()">
                <span></span>
                <span></span>
                <span></span>
            </button>
            <div id="myDropdown" class="dropdown-content">
                <a href="#">Bởi đối tác</a>
                <a href="#">Bởi người dùng khác</a>
            </div>
        </div>
    </div>

    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>Người báo cáo</th>
            <th>Tiêu chí vi phạm</th>
            <th>Công việc</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="report" items="${currentReportList}" varStatus="loop">
            <tr href="/reportDetail.jsp">
                <td>${(currentPage - 1) * recordsPerPage + loop.index + 1}</td>
                <td>${report.nguoiBaoCao}</td>
                <td>${report.tieuChiViPham}</td>
                <td>${report.congViec}</td>
            </tr>
        </c:forEach>
        <c:if test="${empty currentReportList}">
            <tr><td colspan="4">Không có báo cáo nào để hiển thị.</td></tr>
        </c:if>
        </tbody>
    </table>

    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="?page=${currentPage - 1}">&laquo;</a>
        </c:if>
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <a href="?page=${i}" class="active">${i}</a>
                </c:when>
                <c:otherwise>
                    <a href="?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="?page=${currentPage + 1}">&raquo;</a>
        </c:if>
    </div>
</div>

<script>

    //popup của phần 3 gạch
    function toggleDropdown() {
        document.getElementById("myDropdown").classList.toggle("show-dropdown");
    }

    window.onclick = function(event) {
        if (!event.target.matches('.menu-icon') && !event.target.matches('.menu-icon span')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            for (var i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show-dropdown')) {
                    openDropdown.classList.remove('show-dropdown');
                }
            }
        }
    }
</script>
</body>
</html>