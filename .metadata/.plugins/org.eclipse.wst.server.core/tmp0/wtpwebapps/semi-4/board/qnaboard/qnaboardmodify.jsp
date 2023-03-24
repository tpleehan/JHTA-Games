<%@page import="com.semi4.vo.QnaBoard"%>
<%@page import="com.semi4.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Q&amp;A 게시글 수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<%@ include file="../../common/navbar.jsp" %>
<body>
<div class="container">
		<%
		if (loginedUser == null) {
			response.sendRedirect("../loginform.jsp");
			return;
		}
	%>
	<div class="row" style="border-bottom: 1px solid grey;">	
		<h2>게시글 수정하기</h2>
	</div>
	<div class="row"><br>
		<div class="col-sm-3">
			
		</div>
		<div class="col-sm-9">
			<div class="row">
				<div class="col-sm-12">
					<form id="modified-form" class="well" action="qnaboardmodifyreg.jsp" method="post">
						<%
							int pageNo = Integer.parseInt(request.getParameter("pageno"));
							int no = Integer.parseInt(request.getParameter("qnaboardno"));
							QnaBoardDao qnaboardDao = QnaBoardDao.getInstance();
							QnaBoard qnaBoard = qnaboardDao.getBoardByQnaNo(no);
						%>
						
							<input type="hidden"  name="qnaboardno" id="qna-no" readonly="readonly" value="<%=qnaBoard.getNo() %>" />
						
						<div class="form-group">
							<label>글쓴이</label>
							<input type="text" class="form-control" name="qnaboardname" id="qna-name" readonly="readonly" value="<%=qnaBoard.getUser().getName() %>" />
						</div>
						<div class="form-group">
							<label>제목</label>
							<input type="text" class="form-control" name="qnaboardtitle" id="qna-title" value="<%=qnaBoard.getTitle() %>" />
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" name="qnaboardcontent" id="qna-content" rows="15"><%=qnaBoard.getContent() %></textarea>
						</div>
						<div class="text-right">
							<button onclick="checkFormfield()" type="button" class="btn btn-primary">수정</button>
							<a href="qnaboarddetail.jsp?pageno=<%=pageNo %>&qnaboardno=<%=qnaBoard.getNo() %>" class="btn btn-default pull-right">취소</a>						
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function checkFormfield() {
		var title = document.querySelector("#qna-title").value;
		if(title == "") {
			alert("수정할 제목을 입력하세요");
			return;
		}
		var content = document.querySelector("#qna-content").value;
		if(content == "") {
			alert("수정할 내용을 입력하세요");
			return;	
		}
		document.querySelector("#modified-form").submit();
	}
</script>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>