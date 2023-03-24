<%@page import="com.semi4.vo.Game"%>
<%@page import="com.semi4.vo.PurchaseItem"%>
<%@page import="com.semi4.dao.PurchaseItemDao"%>
<%@page import="com.semi4.dao.GameDao"%>
<%@page import="com.semi4.vo.Purchase"%>
<%@page import="java.util.List"%>
<%@page import="com.semi4.dao.PurchaseDao"%>
<%@page import="com.semi4.dao.ReviewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
		<%
			if (loginedUser != null) {
		%>
			<form id="register-form" class="well" action="reviewboardaddreg.jsp" method="post">
				<div class="form-group">
					<label>구매한 제품</label>
					<select class="form-control" name="reviewpurchaseno">
					<%
						
						int userNo = loginedUser.getNo();
						PurchaseItemDao purchaseItemDao = PurchaseItemDao.getInstance();
						List<PurchaseItem> items = purchaseItemDao.getPurchasesItemsByUserNo(userNo);
						
						for (PurchaseItem item : items) {
							GameDao gameDao = GameDao.getInstance();
							Game foundGame = gameDao.getGameByNo(item.getGame().getNo());
							System.out.println(item.getPurchase().getNo());
					%>
						<option value="<%=item.getPurchase().getNo() %>" <%=foundGame.getNo() == item.getGame().getNo() ? "selected" : "" %>><%=foundGame.getTitle() %>, <%=item.getAmount() %>개</option>
					<%		
						}
					%>
					</select>
				</div>
				<div class="form-group">
					<label>글제목</label>
					<input type="text" class="form-control" name="reviewtitle" id="review-title" />
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" name="reviewcontent" id="review-content" rows="15"></textarea>
				</div>
				<div class="text-right">
					<button type="submit" onclick="checkFormfield()" type="button" class="btn btn-primary" >등록</button>
					<a href="reviewboard.jsp"><button type="button" class="btn btn-default">취소</button></a>
				</div>
			</form>
			<%
			}
			%>
		</div>
	</div>
<script type="text/javascript">
	function checkFormfield() {
		var title = document.querySelector("#review-title").value;
		if (title == "") {
			alert("제목을 입력하십시오");
			return;
		}
		var content = document.qurySelector("#review-content").value;
		if (content == "") {
			alert("내용을 입력하십시오");
			return;
			
		}
		document.querySelector("#register-form").submit();
	}
</script>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>