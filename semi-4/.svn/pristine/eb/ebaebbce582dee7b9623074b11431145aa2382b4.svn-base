<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 	 <title>JHTA Games</title>
 	 <meta charset="utf-8">
 	 <meta name="viewport" content="width=device-width, initial-scale=1">
 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>

<div class="container" style="height: 640px;">
	<div id="loginmainbody" class="col-sm-12">
		<div class="row"> 
			<div class="head-right col-sm-6 col-sm-offset-3" style="padding-top: 10px;">
				<h3>비밀번호 찾기 - 본인확인</h3>
				<%
					String fail = request.getParameter("fail");
				%>
				
				<%
					if ("invalid".equals(fail)) {
				%>
					<div class="row">
						<div class="col-sm-12">
							<div class="alert alert-danger">
								<strong>아이디 혹은 이메일이 일치하지 않습니다.</strong> 
							</div>
						</div>
					</div>
				<%
					}
				%>
				
				<%
					if ("exituser".equals(fail)) {
				%>
					<div class="row">
						<div class="col-sm-12">
							<div class="alert alert-danger">
								<strong>탈퇴된 고객 정보입니다. 회원가입 후 이용하시기 바랍니다.</strong> 
							</div>
						</div>
					</div>
				<%
					}
				%>	
				
				<form class="well" action="pwdsearch.jsp" method="post" id="pwd-form" >
					<div class="form-group">
						<label>아이디</label>
						<input type="text" class="form-control" name="userid" id="user-id"/>
					</div>
					<div class="form-group">
						<label>이메일</label>
						<input type="text" class="form-control" name="useremail" id="user-email"/>
					</div>
					<div class="text-center">
						<button onclick="pwdFormfield()" type="button" class="btn btn-success" style="margin-top: 20px; width: 300px;">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function pwdFormfield() {
		var id = document.querySelector("#user-id").value;
		if (id == "") {
			alert("아이디를 입력하세요.");
			return;
		}
		var email = document.querySelector("#user-email").value;
		if (email == "") {
			alert("이메일을 입력하세요.");
			return;
		}
		
		document.querySelector("#pwd-form").submit();
		
		}
</script>
</body>
<%@ include file="../common/footer.jsp" %>
</html>