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
<div class="container">
	<div class="page-header">
		<h3>공지사항 게시글 삭제 확인</h3>
	</div>
	<%
		int no = Integer.parseInt(request.getParameter("no"));
		String del = request.getParameter("result");
		if (del != null) {
	%>
		<script type="text/javascript">
			opener.location.href = "adminNotice.jsp?result=delete";
			self.close();
		</script>
	<%
		return;
		}
	%>
	
	<form  class="hidden" method="post" id="delete-ok" action="noticeDelete.jsp">
		<div>
			<input type="text" id="delete-ok" name="no" value="<%=no %>">
		</div>
	</form>
	
	<div class="text-center">
		<div>
			<label>게시글을 삭제하시려면 <strong style="font-weight: bold; color: red;">묻고더블로지워</strong> 를 입력하세요.</label>
			<input type="text" id="delete-check" 
			 value="" style="display: inline-block; width: 200px; margin-top: 20px;">
				<button type="button" onclick="deleteNotice()" class="btn btn-danger btn-md">삭제하기</button>
		</div>
	</div>
</div>
<script type="text/javascript">
	function deleteNotice() {
		var str = document.getElementById("delete-check").value;
		if(str != "묻고더블로지워") {
			alert("확인문구를 정확히 입력하세요");
			return;
		}
		document.getElementById("delete-ok").submit();
	}
</script>
</body>
</html>