<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Test JSTL</title>
</head>
<body>
<c:set var="testList" value="<%= new java.util.ArrayList<String>() {{ add(\"Item 1\"); }} %>"/>
<c:if test="${fn:length(testList) > 0}">
    <p>List có phần tử.</p>
</c:if>
<c:forEach var="item" items="${testList}">
    <p>${item}</p>
</c:forEach>
</body>
</html>