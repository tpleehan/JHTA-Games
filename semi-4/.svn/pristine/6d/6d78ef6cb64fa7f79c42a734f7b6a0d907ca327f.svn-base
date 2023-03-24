<%@page import="com.semi4.utils.StringUtils"%>
<%@page import="com.semi4.vo.Admin"%>
<%@page import="com.semi4.vo.QnaAnswer"%>
<%@page import="java.util.List"%>
<%@page import="com.semi4.dao.QnaAnswerDao"%>
<%@page import="com.semi4.dao.UserDao"%>
<%@page import="com.semi4.utils.NumberUtils"%>
<%@page import="com.semi4.vo.QnaBoard"%>
<%@page import="com.semi4.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Q&amp;a 게시글 상세 정보</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<%@ include file="../../common/navbar.jsp"%>
<body>
	<div class="container">
		<div style="border-bottom: 1px solid grey;">
			<h2>Q&amp;a 게시글 상세 정보</h2>
		</div>

		<div class="col-sm-12">
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="60%">
				</colgroup>
				<%
					request.setCharacterEncoding("utf-8");
					
					String from = request.getParameter("from");
					int pageNo = Integer.parseInt(request.getParameter("pageno"));
					Admin adminUser = (Admin) session.getAttribute("LOGINED_ADMIN");
					int qnaNo = NumberUtils.stringToNumber(request.getParameter("qnaboardno"));

					QnaBoardDao qnaBoardDao = QnaBoardDao.getInstance();
					QnaBoard qnaBoard = qnaBoardDao.getBoardByQnaNo(qnaNo);
					int count = qnaBoard.getCount();
					count++;
					qnaBoard.setCount(count);
					qnaBoardDao.updateQnaCountByno(qnaBoard);
				%>
				<br>
				<thead>
					<tr>
						<th class="info">글번호</th>
						<th><%=qnaBoard.getNo()%></th>
					</tr>
					<tr>
						<th class="info">제목</th>
						<th><%=qnaBoard.getTitle()%></th>
					</tr>
					<tr>
						<th class="info">글쓴이</th>
						<th><%=qnaBoard.getUser().getName()%></th>
					</tr>
					<tr>
						<th style="vertical-align: top;" class="info">본문</th>
						<th><textarea class="col-12" style="width: 100%; min-height : 300px;  resize: none; border: 0;" readonly><%=qnaBoard.getContent()%></textarea></th>
					</tr>
					<tr>
						<th class="info">조회수</th>
						<th><%=qnaBoard.getCount()%></th>
					</tr>
				</thead>
			</table>

			<div class="row">
				<%
					QnaAnswerDao qnaAnswerDao = QnaAnswerDao.getInstance();
					QnaAnswer answer = qnaAnswerDao.getQnaAnswerByNo(qnaNo);
				
					//변수를 Integer로 만들어서 .intValue()를 사용해서 int값으로 뽑아서 비교
					if (loginedUser != null && loginedUser.getNo().intValue() == qnaBoard.getUser().getNo().intValue()) {
				%>
				<div class="col-sm-6">
					<a href="qnaboardmodify.jsp?qnaboardno=<%=qnaBoard.getNo() %>&pageno=<%=pageNo %>" class="btn btn-warning">수정</a> 
						<%
							if (answer != null) {
						%>
						<a href="qnaboarddeleteanswercontent.jsp?qnaboardno=<%=qnaBoard.getNo() %>" class="btn btn-danger">삭제</a>
						<%
							} else {
						%>
						<a href="qnaboarddeletereg.jsp?qnaboardno=<%=qnaBoard.getNo() %>" class="btn btn-danger">삭제</a>
						<%
							}
						%>
				</div>
				<%
					} else {
				%>
				<div class="col-sm-6">
					<a href="qnaboardmodify.jsp?qnaboardno=<%=qnaBoard.getNo() %>"class="btn btn-warning disabled">수정</a> 
					<a href="qnaboarddeletereg.jsp?qnaboardno=<%=qnaNo %>" class="btn btn-danger disabled">삭제</a>
				</div>
				<%
					}
				%>
				<div class="col-sm-6">
					<%
						if ("qnaboard.jsp".equals(from)) {
					%>
						<a href="qnaboard.jsp?pageno=<%=pageNo %>" class="btn btn-success pull-right">목록</a>
					<%
						} else if("userqnaform.jsp".equals(from)) {
					%>
						<a href="../../user/userqnaform.jsp?" class="btn btn-success pull-right">돌아가기</a>
					<%
						}
					%>
				</div>
			</div>

			<hr />

			<%
				
				
				//queryforlist는 배열안에 값이 없으면 0이지만 queryforobject는 배열안에 값이 없으면  null이 된다.
				//위에서 answer라는 객체를 만들었으나 밑에 1번에 들어갈 값이 null이어서 nullexception이 생겨서 에러가 생긴다.
				if (answer != null) {
			%>
				<div class="row"
					style="border-bottom: 1px dotted #999; padding-top: 10px;">
					<div class="col-sm-12">
						<div>
							<!-- 여기1번 -->
							<strong><%=answer.getAdmin().getName()%></strong>
							<%
								if (adminUser != null) {
							%>
							<div id="first-box" class="pull-right">
								<button class="btn btn-warning btn-xs" onclick="goModify();">댓글수정</button>
								<a href="answerdeleteform.jsp?qnano=<%=qnaNo%>&pageno=<%=pageNo %>" class="btn btn-danger btn-xs">댓글삭제</a>
							</div>
							<%
								}
							%>
						</div>
						<p id="first-content"><%=answer.getContent()%></p><br>
						<form id="second-form" action="qnaanswerupdatereg.jsp"method="post" style="display: none; margin-bottom: 10px;">
							<input type="hidden" name="pageno" value="<%=pageNo %>" />
							<input type="hidden" name="qnano" value="<%=qnaNo %>" />
							<div id="second-box" style="display: none; margin-bottom: 10px;" class="pull-right">	
								<button type="button" class="btn btn-default btn-xs" onclick="submitReply()">댓글수정</button>
								<button type="button" class="btn btn-default btn-xs" onclick="backReply()">취소</button>							
							</div>
							<input type="hidden" name="qnano" value="<%=qnaNo%>">
							<textarea id="qna-content" class="form-control" name="qnacontent" style="margin-bottom: 10px;"><%=answer.getContent() %></textarea>
						</form>
						<br>
					</div>
				</div>
			
			<%
				}
				
				if (adminUser != null) {
					if (answer == null) {
			%>
				<form id="answer-form" name="answer" class="well" method="get" action="qnaboarddetailanswerreg.jsp" style="margin-top: 15px;">
					<div class="form-group"> 
						<input class="hidden" name="answerqnano" id="answer-qnano" value="<%=qnaNo %>" /> 
						<input class="hidden" name="pageno" value="<%=pageNo %>" />
						<label>댓글쓰기</label>
						<textarea class="form-control" id="answer-writing" name="answerwriting" rows="3"></textarea>
						<br>
						<button class="btn btn-info pull-right">등록</button>
						<br>
					</div>
				</form>
			<%
						}
					}
			%>
		</div>
	</div>
	<script type="text/javascript">
		function goModify() {
			document.getElementById("first-box").style.display = "none";
			document.getElementById("second-box").style.display = "block";
			document.getElementById("first-content").style.display = "none";
			document.getElementById("second-form").style.display = "block";
		}

		function submitReply() {
			var content = document.getElementById("qna-content").value;
			if (content == "") {
				alert("내용을 입력하고 수정버튼을 눌러주세요");
				return;
			}
			document.getElementById("second-form").submit();
		}
		
		function backReply() {
			document.getElementById("first-box").style.display = "block";
			document.getElementById("second-box").style.display = "none";
			document.getElementById("first-content").style.display = "block";
			document.getElementById("second-form").style.display = "none";
		}
	</script>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>