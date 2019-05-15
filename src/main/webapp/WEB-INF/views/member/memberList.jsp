<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>회원 목록</h2>


	<table border="1" width="700px">
	
	<tr>
		<td>순번</td>
		<td>아이디</td>
		<td>이름</td>
		<td>이메일</td>
		<td>가입일</td>
	</tr>
	
	<c:set var="rownum" value="${map.count - map.page.getCurrentPage()*10 + 10}" />
	<c:forEach var="row" items="${map.member}">
	
		<tr>
			<td>${rownum}</td>
			<td>${row.userid }</td>
			<td><a href="${path}/member/view.do?userid=${row.userid}">${row.name }</a></td>
			<td>${row.email }</td>
			<td><fmt:formatDate value="${row.join_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
		
	<c:set var="rownum" value="${rownum-1 }"/>
	</c:forEach>
	</table>

<jsp:include page="../include/paging.jsp">
     <jsp:param name="currentPage" value="${map.page.getCurrentPage()}"/>
     <jsp:param name="startPage" value="${map.page.getStartPage()}"/>
     <jsp:param name="endPage" value="${map.page.getEndPage()}"/>
     <jsp:param name="totalPage" value="${map.page.getTotalPage()}"/>
</jsp:include>

</body>
</html>