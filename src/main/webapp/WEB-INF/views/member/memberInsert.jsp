<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>

<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>회원 등록</h2>

<form name="reg" method="post" action="${path}/member/insert.do">
	<table border="1" width="400px">
		<tr>
			<td>아이디</td>
			<td><input name="userid"></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input name="name"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input name="email"></td>
		</tr>
		<tr>
			<td>PHONE</td>
			<td><input name="phone"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" name="gender" value="M">남
				<input type="radio" name="gender" value="F">여
			</td>
			<tr>
			<td>코멘트</td>
			<td>
  				<input type="text" name="comment" style="width:200px; height:150px">
  			</td>
		</tr>
		</tr>
		
		<tr>
			<td colspan="2" align="center"><input type="submit" value="REGISTER"></td>
		</tr>
	</table>



</form>


</body>
</html>