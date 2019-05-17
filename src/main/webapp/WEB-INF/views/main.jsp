<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="include/header.jsp" %>
</head>
<body>
<%@ include file="include/menu.jsp" %>


<h2>${message }</h2>
<h2>test ID : cr7</h2>
<h2>test P/W : 1234</h2>
<c:if test="${sessionScope.userid != null }">
	<h4>${sessionScope.name} (${sessionScope.userid})님의 방문을 환영합니다.</h4>
</c:if>


</body>
</html>