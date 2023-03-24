<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<title></title>
 	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>

<div class="wrap docs-section" style="height: 635px;">
	<div class="container">
		<div id="t3-content" class="t3-content col-xs-12" style="padding-top:0;">
			<div id="system-message-container"></div>
			<h1 style="font-size:30px">마이페이지</h1>
				<div class="layout container-fluid">
					<ul class="nav navbar-nav">
						<li class=""><a href="userinfoform.jsp" ><span>정보수정</span></a></li>
						<li class=""><a href="userorderform.jsp" ><span>주문내역</span></a></li>
						<li class=""><a href="userqnaform.jsp" ><span>Q&amp;A내역</span></a></li>
						<li class=""><a href="userreviewform.jsp" ><span>리뷰내역</span></a></li>
						<li class=""><a href="../purchase/cart.jsp" ><span>장바구니</span></a></li>
						<li class=""><a href="userleaveform.jsp" ><span>회원탈퇴</span></a></li>
					</ul>
				<div class="head-right col-sm-6 col-sm-offset-3">
					<div class="login-wrap" style="margin-top:32px;margin-bottom:32px;padding:0">
						<div class="page-header">
							<h3><strong>비밀번호 확인</strong></h3>
						</div>
						<div class="well">
							<form name="userinfoFrm" id="userinfoFrm" method="post" class="form-horizontal" action="usermodifiesform.jsp">
							<div class="form-group">
								<div class="col-sm-12 control-label" style="text-align: left;">
									<label id="password-check" class="required">비밀번호</label>
								</div>
								<div class="col-sm-8">
									<input type="password" class="form-control" size="20"  id="formpwd">
								</div>
								<div class="col-sm-4">
									<button onclick="pwdCheckFormfield()" type="button" class="btn btn-primary" id="btn-pwd-chk">비밀번호 확인</button>
								</div>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> 
<%
	User foundUser = (User) session.getAttribute("LOGINED_USER");
%>
<input class="hidden" type="text" id="checkpwd" value="<%=foundUser.getPassword() %>">

<script type="text/javascript">		
	function pwdCheckFormfield() {
		var pwd = document.querySelector("#formpwd").value;
		if (pwd == "") {
			alert("비밀번호를 입력하세요.");
			return;
		} 
				
		var pwd = document.querySelector("#formpwd").value;
		var checkpwd = document.querySelector("#checkpwd").value;
		if (pwd != checkpwd) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		document.querySelector("#userinfoFrm").submit();
		}
</script>

</body>
<%@ include file="../common/footer.jsp" %>
</html>