<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Hiển thị ảnh</title>
</head>
<body>
<%@include file="./includes/header-01.jsp" %>
<c:choose>
  <c:when test="${not empty pdfData}">
    <img src="./cv_docs/${pdfData}" alt="CV Image" style="max-width:100%; height:auto;margin-left: 400px;margin-top: 50px;margin-bottom: 20px">
  </c:when>
  <c:otherwise>
    <p>Không có ảnh để hiển thị.</p>
  </c:otherwise>
</c:choose>
<%@include file="includes/footer.jsp"%>

</body>
</html>