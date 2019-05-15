<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<%
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	int startPage = Integer.parseInt(request.getParameter("startPage"));
	int endPage = Integer.parseInt(request.getParameter("endPage"));
	int totalPage = Integer.parseInt(request.getParameter("totalPage"));
%>
<meta charset="UTF-8">
<style>
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}
</style>
</head>
<body>

<div class="pagination">
	
	<c:if test="<%=startPage>1 %>">
		<a href="${path}/member/list.do?currentPage=1">처음</a>
	</c:if>
	<c:if test="<%=currentPage>1 %>">
		<a href="${path}/member/list.do?currentPage=<%=currentPage-1 %>">&laquo;</a>
	</c:if>
	
	<%
		for(int i=startPage;i<=endPage;i++){
			if(i == currentPage){
	%>			
			<a href="${path}/member/list.do?currentPage=<%=i %>"><b><%=i %></b></a>
	<% 
			}else{
	%>
			<a href="${path}/member/list.do?currentPage=<%=i %>"><%=i %></a>
	<%
			}
		}
	%>
	<c:if test="<%=currentPage<totalPage %>">
		<a href="${path}/member/list.do?currentPage=<%=currentPage+1 %>">&raquo;</a>
	</c:if>
	<c:if test="<%=endPage < totalPage %>">
		<a href="${path}/member/list.do?currentPage=<%=totalPage %>">끝</a>
	</c:if>
	
</div>

</body>
</html>