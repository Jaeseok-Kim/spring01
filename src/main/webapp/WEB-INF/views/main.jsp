<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="include/header.jsp" %>
<style>
.container{
	display: none; /* Hidden by default */
  	z-index: 1; /* Sit on top */
  	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
}
button:hover {
  opacity: 0.8;
}
.btn-google {
  color: white;
  background-color: #3b5998;
}
/* Add Zoom Animation */
#card {
  -webkit-animation: animatezoom 0.7s;
  animation: animatezoom 0.7s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}
</style>

</head>
<body>
<%@ include file="include/menu.jsp" %>
<script>
	var modal = document.getElementById('container');
	
	window.onclick(function(event){
		if(event.target == modal){
			modal.style.display = "none";
		}
	})
</script>

<h2>${message }</h2>


<div id="ajax"></div>

</body>
</html>