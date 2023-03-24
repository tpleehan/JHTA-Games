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
	<div class="row">
		<!-- MAIN CONTENT -->
		<div id="t3-content" class="t3-content col-xs-12">
			<div id="system-message-container"></div>
			<% User user = (User) session.getAttribute("LOGINED_USER"); %>
			<div id="cart-view" class="cart-view" style="padding-top:20px">
				<div class="docs-section">
					<p class="text-danger"><strong>※ 회원탈퇴 시 해당 아이디로는 재가입을 하실 수 없습니다.</strong></p>
					<p class="text-danger"><strong>※ 또한 구매한 게임상품은 환불이 불가능하며, 탈퇴 후 재가입을 하셔도 상품을 다시 구매해야 합니다.</strong></p>
					<p class="text-danger"><strong>※ 탈퇴 시 모든 정보는 지워집니다. 신중한 선택 부탁드립니다.</strong></p>
				</div><br/>
				<form id="userleave-form" class="well" action="userleave.jsp" method="post">
						<div class="form-group" >
							<div class="form-inline form-group" style="padding-bottom:30px;">
								<label class="col-sm-2">아이디</label>
								<div class="col-sm-10">
								<p style="font-size: 18px;"><%= user.getId() %></p>
								</div>
							</div>
							<div class="form-inline form-group"  style="padding-bottom:30px;">
								<label class="col-sm-2">비밀번호</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" name="userpwd" id="user-pwd" style="width: 233px;"/>
								</div>
							</div>
							<div class="form-inline form-group"  style="padding-bottom:30px;">
								<label class="col-sm-2">탈퇴사유</label>
								<div class="col-sm-10">
									<select name="reason" class="form-control" required>
										<option value="">:::탈퇴사유를 선택해 주세요:::</option>
										<option value="">고객서비스 불만</option>
										<option value="">교환/환불 불만</option>
										<option value="">방문 빈도가 낮음</option>
										<option value="">상품가격 불만</option>
										<option value="">개인 정보유출 우려</option>
										<option value="">쇼핑몰의 신뢰도 불만</option>
										<option value="">쇼핑 기능 불만</option>
									</select>
								</div>
							</div>
							<div class="text-center" style="padding-top:20px;">
								<button onclick="userleavefrm()" type="button" class="btn btn-danger">회원탈퇴</button>
								<a href="../home.jsp"><button type="button" class="btn btn-primary">취소하기</button></a>
							</div>	
						</div>
					</form>
			</div>
		</div>
	</div>
</div>
<%
	User pwdUser = (User) session.getAttribute("LOGINED_USER");
%>
<input class="hidden" type="text" id="pwduser" value="<%=pwdUser.getPassword() %>">

<script type="text/javascript">
	function userleavefrm() {
		var pwd = document.querySelector("#user-pwd").value;
		if (pwd == "") {
			alert("비밀번호를 입력하세요.");
			return;
		} 
				
		var pwd = document.querySelector("#user-pwd").value;
		var checkpwd = document.querySelector("#pwduser").value;
		if (pwd != checkpwd) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		document.querySelector("#userleave-form").submit();
		alert("회원탈퇴 처리되었습니다.");
	}
</script>

</body>
<%@ include file="../common/footer.jsp" %>
</html>