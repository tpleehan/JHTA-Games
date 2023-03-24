<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Q&amp;A 게시글 추가</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="container">
	<%
		
		if (loginedUser == null) {
			response.sendRedirect("../loginform.jsp");
			return;
		}
	%>	
	<div class="row" style="height: 450px;">
		<div class="col-sm-12">
			<form id="register-form" class="well" action="qnaboardaddreg.jsp" method="post">
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" name="qnaboardtitle" id="qna-title" />
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" name="qnaboardcontent" id="qna-content" rows="15"></textarea>
				</div>
				<div class="text-right">
					<button onclick="checkFormfield()" type="button" class="btn btn-primary">등록</button>
					<a href="qnaboard.jsp"><button type="button" class="btn btn-default">취소</button></a>
				</div>
			</form>
		</div>
	</div>
	<div>
	</div>
</div>
<script type="text/javascript">
function checkFormfield() {
	var title = document.querySelector("#qna-title").value;
	if(title == "") {
		alert("제목을 입력하세요");
		return;
	}
	var content = document.querySelector("#qna-content").value;
	if(content == "") {
		alert("내용을 입력하세요");
		return;	
	}
	document.querySelector("#register-form").submit();
}
</script>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>