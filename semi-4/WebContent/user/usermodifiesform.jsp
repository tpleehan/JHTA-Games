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

<div class="wrap docs-section" style="height: 640px;">
	<div class="container">
		<div id="t3-content" class="t3-content col-xs-12" style="padding-top:0;">
			<div id="system-message-container"></div>
			<h1 style="font-size:30px">내정보수정</h1>
			<div class="layout container-fluid">
				<ul class="nav navbar-nav">
					<!-- 내정보 수정의 경우 비밀번호 입력 후 다른 페이지 이동을 하고 다시 정보수정으로 갈 때 비밀번호를 다시 물어본다. 해킹 방지  -->
					<li class=""><a href="userinfoform.jsp" ><span>내정보수정</span></a></li>
					<li class=""><a href="#" ><span>주문내역</span></a></li>
					<li class=""><a href="userqnaform.jsp" ><span>Q&amp;A내역</span></a></li>
					<li class=""><a href="userreviewform.jsp" ><span>리뷰내역</span></a></li>
					<li class=""><a href="../purchase/cart.jsp" ><span>장바구니</span></a></li>
					<li class=""><a href="userleaveform.jsp" ><span>회원탈퇴</span></a></li>
				</ul>
			</div>
			<% User user = (User) session.getAttribute("LOGINED_USER"); %>
			<form id="usermodifies-form" class="well" action="usermodifies.jsp" method="post">
				<div class="form-group" >
					<div class="form-inline form-group" style="padding-bottom:30px;">
						<label class="col-sm-2">아이디</label>
						<div class="col-sm-10">
						<p style="font-size: 18px;"><%= user.getId() %></p>
						</div>
					</div>
					<div class="form-inline form-group" style="padding-bottom:30px;" > 
						<label class="col-sm-2">비밀번호</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="userpwd" id="user-pwd" />
							<span id="passwordHelpBlock" class="text-muted" style="margin-left: 10px;">영문소문자, 숫자를 포함하여 8자이상 16이하로 생성하세요.</span>
						</div>
					</div>
					
					<div class="form-inline form-group" style="padding-bottom:30px;">
						<label class="col-sm-2">비밀번호 확인</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="usercheckpwd" id="user-checkedpwd" />
						</div>
					</div>
					
					<div class="form-inline form-group" style="padding-bottom:30px;">
						<label class="col-sm-2">이름</label>
						<div class="col-sm-10">
						<p style="font-size: 18px;"><%= user.getName() %></p>	
						</div>
					</div>
					
					<div class="form-inline form-group" style="padding-bottom:30px;">
						<label class="col-sm-2">전화번호</label>
						<div class="col-sm-10">
						<p style="font-size: 18px;"><%= user.getTel() %></p>
						</div>
					</div>
					
					<div class="form-inline form-group" style="padding-bottom:30px;">
						<label class="col-sm-2">이메일</label>
							<div class="checkbox col-sm-10">
							<p style="font-size: 18px;"><%= user.getEmail() %></p>
							</div>
					</div>
					
					<div class="form-inline form-group" style="padding-bottom:30px;">
						<label class="col-sm-2">이메일 수신</label>
						<div class="checkbox col-sm-10">
							<input type="checkbox" class="control-label" name="coluseremail" id="emailChecked" />
								정보/이벤트 메일 수신에 동의합니다
						</div>
					</div>
					<div class="text-center" style="padding-top:20px;">
						<button onclick="modifiesUserfrm()" type="button" class="btn btn-primary">정보 수정</button>
					</div>	
				</div>
			</form>
		</div>
	</div>
</div> 

<script type="text/javascript">
	function modifiesUserfrm() {
		var pwd = document.querySelector("#user-pwd").value;
		if(pwd.length<8 || pwd.length>16){
			alert("비밀번호는 영문소문자, 숫자 포함 8자리 이상 ~ 16이하로 입력해주세요.");
			return false;
		}
		var num = pwd.search(/[0-9]/g);
		var eng = pwd.search(/[a-z]/ig)
		if(num < 0 || eng <0) {
			alert("비밀번호는 영문소문자, 숫자 포함 8자리 이상 ~ 16이하로 입력해주세요.");
			return false;
		}
		
		var checkdpwd = document.querySelector("#user-checkedpwd").value;
		if (document.querySelector("#user-pwd").value != document.querySelector("#user-checkedpwd").value) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		document.querySelector("#usermodifies-form").submit();
		alert("정보가 수정되었습니다.");
	}
</script>

</body>
<%@ include file="../common/footer.jsp" %>
</html>