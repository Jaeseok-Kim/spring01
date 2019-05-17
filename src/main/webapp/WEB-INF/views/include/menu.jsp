<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
  </style>
  <script>
  $( function() {
    function loginCheck(){
    	$.ajax({
    		type: 'post',
    		url: '${path}/member/loginCheck.do',
    		dataType: 'json',
    		data: {
    			userid: $("#userid").val(),
    			passwd: $("#passwd").val()
    		},
    		success: function(result){
    			  if(result.idResult!=1){
    				$('#msg').html("존재하지 않는 ID입니다.");
    			}else if(!result.pwResult){
    				$('#msg').html("비밀번호가 맞지 않습니다.");
    			} else window.location.href = '${path}/';
    		}
    	});
    };

    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      buttons: {
        "Log-in" : loginCheck,
        Cancel: function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
      }
    });
 
    form = dialog.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      loginCheck();
    });
 
    $( "#login" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
  } );
  </script>

<div style="text-align:center;">
	<a href="${path}/">MAIN</a>
	<a href="${path}/member/list.do">회원 목록</a>
	<c:if test="${sessionScope.userid == null }">
		<a href="${path}/member/write.do">신규 회원 등록</a>
	</c:if>
		<div style="text-align:right;">			
			<c:if test="${sessionScope.userid == null }">
				<button id="login">Log-in</button>
			</c:if>
			<c:if test="${sessionScope.userid != null }">
				<a href="${path}/member/logout.do">Log-out</a>
			</c:if>
		</div>

	
</div>

<!-- 로그인 Modal -->
<div id="dialog-form" title="Log-in">
  <form>
    <fieldset>
      <label for="name">ID</label>
      <input type="text" name="userid" id="userid" class="text ui-widget-content ui-corner-all">
      <label for="password">Password</label>
      <input type="password" name="passwd" id="passwd" class="text ui-widget-content ui-corner-all">
 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
  <div id="msg" style="color:red"></div>
</div>



<hr>