<%@page import="com.semi4.vo.User"%>
<%@page import="com.semi4.dao.UserDao"%>
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
<div class="container">
	<div class="page-header">
		<h3>아이디 중복체크</h3>
	</div>
	<% 
		String userId = request.getParameter("userid");
	
		UserDao userDao = UserDao.getInstance();
		User user = userDao.getUserById(userId);
		
		boolean isPassed = true;
		if (userId == null) {
			isPassed = false;
		} else {
			if (user != null) {
				isPassed = false;
			}
		}
	%>
	<div class="text-center">
		<form id="idcheck-form" class="form-inline" action="idcheckpopup.jsp" method="post">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" class="form-control" name="userid" id="user-id" value="<%=userId != null ? userId : "" %>" <%=isPassed ? "readonly" : "" %> style="display: inline-block; width: 200px;">
				<%
					if (!isPassed) {
				%>
					<button type="button" onclick="idCheck()" class="btn btn-primary btn-md">체크</button>
				<%	
					} else {
				%>
					<button type="button" onclick="useId()" class="btn btn-primary btn-md">사용하기</button>
				<%	
					}
				%>
			</div>
		</form>
	</div>
	
	<div class="text-center">
		<span id="userIdHelpBlock" class="text-muted" style="margin-left: 10px;"> 영문소문자, 숫자를 포함하여 8자이상 12이하로 생성하세요.</span>			
	</div>		
	
	<%
		if (user!= null && !isPassed) {
	%>
		<div class="alert alert-danger">
			<strong>아이디 중복</strong>
			이미 사용중인 아이디입니다.
		</div>
	
	<%	
		}
	%>
	
	<%
		if (isPassed) {
	%>
		<div class="alert alert-success">
			<strong>아이디 사용하기</strong>
			사용가능한 아이디입니다.
		</div>
	
	<%	
		}
	%>
	
</div>
<script type="text/javascript">
	function idCheck() {
		var value = document.getElementById("user-id").value;
		if (value == "") {
			alert("아이디를 입력하세요");
			return;
		}
		if (value.length<8 || value.length>12) {
			alert("영문소문자, 숫자를 포함 8자리 이상 ~ 12이하로 입력해주세요.");
			return;
		}
		
		document.getElementById("idcheck-form").submit();
	}
	
	function useId() {
		var value = document.getElementById("user-id").value;
		opener.document.getElementById("user-id").value = value;
		self.close();
	}
	
</script>
</body>
</html>
