<%@page import="com.semi4.dao.AdminDao"%>
<%@page import="com.semi4.vo.NoticeBoard"%>
<%@page import="com.semi4.dao.NoticeBoardDao"%>
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
<title>공지사항 게시글 상세 정보</title>
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
			<h2>공지사항 게시글 상세 정보</h2>
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
					int noticeNo = NumberUtils.stringToNumber(request.getParameter("no"));

					NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
					NoticeBoard noticeBoard = noticeBoardDao.getNoticeByNo(noticeNo);
					AdminDao adminDao = AdminDao.getInstance();
					Admin admin = adminDao.getAdminById(noticeBoard.getAdmin().getId());
					int count = noticeBoard.getCount();
					count++;
					noticeBoard.setCount(count);
					noticeBoardDao.updateNoticeCountByNo(noticeBoard);
				%>
				<thead>
					<tr>
						<th class="info">글번호 </th>
						<th><%=noticeBoard.getNo()%></th>
					</tr>
					<tr>
						<th class="info">제목</th>
						<th><%=noticeBoard.getTitle()%></th>
					</tr>
					<tr>
						<th class="info">글쓴이</th>
						<th><%=admin.getName()%></th>
					</tr>
					<tr>
						<th style="vertical-align: top;" class="info">본문</th>
						<th><textarea class="col-12" style="width: 100%; min-height : 300px;  resize: none; border: 0;" readonly><%=noticeBoard.getContent()%></textarea></th>
					</tr>
					<tr>
						<th class="info">조회수</th>
						<th><%=noticeBoard.getCount()%></th>
					</tr>
				</thead>
			</table>
			
				<div class="col-sm-6 pull-right">
					<%
						if ("noticeboard.jsp".equals(from)) {
					%>
						<a href="noticeboard.jsp?pageno=<%=pageNo %>" class="btn btn-success pull-right" style="margin-bottom: 30px;">목록</a>
					<%
						} else if("home.jsp".equals(from)) {
					%>
						<a href="../../home.jsp" class="btn btn-success pull-right" style="margin-bottom: 30px;">돌아가기</a>
					<%
						}
					%>
				</div>
			</div>

			<hr />
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