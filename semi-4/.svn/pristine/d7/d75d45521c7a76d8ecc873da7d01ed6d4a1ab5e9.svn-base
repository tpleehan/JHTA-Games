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
<%@ include file="../common/navbar.jsp" %>

<div class="wrap docs-section" style="height: 640px;">
	<div class="container">
		<div id="t3-content" class="t3-content col-xs-12" style="padding-top:0;">
			<div id="system-message-container"></div>
			<h1 style="font-size:30px; text-align: center;">비밀번호 찾기</h1>
		
			<%
				String userId = request.getParameter("userid"); 
				UserDao userDao = UserDao.getInstance();
				User user = userDao.getUserById(userId);
			%>
			<div class="head-right col-sm-6 col-sm-offset-3" style="padding-top: 10px;">
			<form id="pwdsearch-form" class="well" action="pwdsearch.jsp" method="post">
				<div class="form-group" >
					<div class="form-inline form-group" style="padding-top:10px; text-align: center;" > 
						<h3>요청하신 비밀번호는 다음과 같습니다.</h3><br/>
						<p style="font-size: 26px;">비밀번호 : <%=user.getPassword() %></p>
					</div>
					
					<div class="text-center" style="padding-top:10px;">
						<a href="../loginform.jsp"><button type="button" class="btn btn-primary">확인</button></a>
					</div>	
				</div>
			</form>
			</div>
		</div>
	</div>
</div> 

</body>
<%@ include file="../common/footer.jsp" %>
</html>