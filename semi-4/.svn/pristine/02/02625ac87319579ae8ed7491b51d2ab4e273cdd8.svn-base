<%@page import="com.semi4.dao.ReviewBoardDao"%>
<%@page import="com.semi4.vo.ReviewBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title> </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<%@ include file="../../common/navbar.jsp" %>
<body>
<div class="container">
	<div class="col-sm-12">
		<div class="row">
			<h2>게시글 수정하기</h2>	
			<%
				request.setCharacterEncoding("utf-8");
				
				int pageNo = Integer.parseInt(request.getParameter("pageno"));
				int reviewNo = Integer.parseInt(request.getParameter("reviewno"));
				
				ReviewBoardDao reviewboardDao = ReviewBoardDao.getInstance();
				ReviewBoard board = reviewboardDao.getReviewBoardByNo(reviewNo);
			%>
			<form id="modified-form" class="well" method="post" action="reviewmodifyreg.jsp">
				<input type="hidden" name="reviewno" value="<%=board.getNo() %>" />
				<input type="hidden" name="pageno" value="<%=pageNo %>" />
				<div class="form-group">
					<label>작성자</label>
					<input type="text" name="reviewusername" id="review-username" class="form-control" value="<%=board.getUser().getName() %>" readonly="readonly" />
				</div>
				<div class="form-group">
					<label>제목</label>
					<input type="text" name="reviewtitle" id="review-title" class="form-control" value="<%=board.getTitle() %>" />
				</div>
				<div class="form-group">
					<label>본문</label>
					<textarea name="reviewcontent" id="review-content" class="form-control" rows="15"><%=board.getContent() %></textarea>
				</div>
				<div class="text right">
					<button type="button" class="btn btn-primary" onclick="checkForm()">수정</button>
					<a href="reviewboarddetail.jsp?pageno=<%=pageNo %>&reviewno=<%=board.getNo() %>" class="btn btn-default pull-right">취소</a>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	function checkForm() {
		var title = document.querySelector("#review-title").value;
		if (title == "") {
			alert("수정할 제목을 입력하십시오.");
			return;
		}
		var content = document.querySelector("#review-content").value;
		if (content == "") {
			alert("수정할 본문을 입력하십시오.");
			return;
		}
		document.querySelector("#modified-form").submit();
	}
</script>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>