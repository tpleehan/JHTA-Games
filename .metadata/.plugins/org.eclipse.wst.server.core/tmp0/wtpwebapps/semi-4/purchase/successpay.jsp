<%@page import="com.semi4.dao.PurchaseDao"%>
<%@page import="com.semi4.vo.Purchase"%>
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
<%@ include file="../common/navbar.jsp"%>
<%
	if (loginedUser == null) {
		response.sendRedirect("../loginform.jsp");
		return;
	}
	
	int purchaseNo = Integer.parseInt(request.getParameter("purchaseno"));
	PurchaseDao purchaseDao = PurchaseDao.getInstance();
	
	Purchase purchase = purchaseDao.getPurchasesByPurchaseNo(purchaseNo);
%>
<div class="container">
	<div class="row">
		<div class="col-span-12">
			<div class="jumbotron text-center">
				<p>JHTA Games를 이용해주셔서 감사합니다.<p>
				<span style="background-color: yellow; font-weight: bold; font-size: 45px; ">홍길동님, 
				<span style="color: red;" >주문이 완료</span>되었습니다.</span>
				<p><%=loginedUser.getName() %>님이 주문하신 주문번호는</p>
				<p><%=purchase.getNo() %>입니다.</p>
				<p>주문하신 상품은</p>
				<span style="color: blue; font-weight: bold;"><%=loginedUser.getEmail() %>으로 발송해드리겠습니다.</span>
			</div>
		</div>	
	</div>
	<div class="row">
		<div class="col-span-12 text-right">
			<a href="gamemenu.jsp" class="btn btn-success btn-lg">홈으로</a>
		</div>
	</div>
</div>
</body>
</html>