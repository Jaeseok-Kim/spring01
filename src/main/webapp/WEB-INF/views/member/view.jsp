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

<script>
	$(function(){
		$("#updateBtn").click(function(){
			document.form1.action="${path}/member/update.do"
			document.form1.submit();
		});
		$("#deleteBtn").click(function(){
			if(confirm("삭제하시겠습니까??")){
				document.form1.action="${path}/member/delete.do"
				document.form1.submit();	
			}
		});
	});
</script>

<h2>회원 정보</h2>

<form name="form1" method="post" action="${path}/member/update.do">

<table border="1" width="90%">
	<tr align="center">
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>이메일</td>
		<td>핸드폰</td>
		<td>코멘트</td>
		<td>등록일자</td>
	</tr>
	<tr>
		<td><input type="text" name="userid" value="${member.userid }" readonly></td>
		<td><input type="password" name="passwd"></td>
		<td><input type="text" name="name" value="${member.name}"></td>
		<td><input type="text" name="email" value="${member.email}"></td>
		<td><input type="text" name="phone" value="${member.phone}"></td>
		<td><input type="text" name="comment" value="${member.comment}"></td>
		<td><fmt:formatDate value="${member.join_date}" timeZone="Asia/Hong-kong" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	</tr>
	
</table>
<input type="button" value="수정" id="updateBtn">
<input type="button" value="회원삭제" id="deleteBtn">
</form>
<div style="color:red">${message }</div>


</body>
</html>