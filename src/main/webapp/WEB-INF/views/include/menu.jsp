<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="text-align:center;">
	<a href="${path}/">MAIN</a>
	<a href="${path}/member/list.do">회원 목록</a>
	<a href="${path}/member/write.do">신규 회원 등록</a>
	
	<!-- <div style="text-align:right;">
		<button onclick="document.getElementById('modal').style.display='block'" style="width:auto;">Login</button>
	</div> -->
	
	<div style="text-align:right;">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Log-in</button>
	</div>

</div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Log-in</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-signin" method="POST">
              <div class="form-label-group">
              	<label for="inputEmail">ID</label>
                <input name="userid" id="inputEmail" class="form-control" placeholder="ID" required autofocus>              
              </div>

              <div class="form-label-group">
               	<label for="inputPassword">Password</label>
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember password</label>
              </div>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
              <hr class="my-2">
              <button class="btn btn-lg btn-secondary btn-block text-uppercase" data-dismiss="modal">Cancel</button>
            </form>
      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
    </div>
  </div>
</div>


<hr>