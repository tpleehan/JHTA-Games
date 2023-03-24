<%@page import="com.semi4.vo.QnaAnswer"%>
<%@page import="com.semi4.dao.QnaAnswerDao"%>
<%@page import="com.semi4.utils.DateUtil"%>
<%@page import="com.semi4.dao.UserDao"%>
<%@page import="com.semi4.vo.QnaBoard"%>
<%@page import="com.semi4.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>관리자 페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript"> $(window).scroll(function(event){ if(jQuery(window).scrollTop() > 
  	jQuery(".banner").offset().top) { jQuery("#chase").css("position", "fixed"); } else if((jQuery(window).scrollTop() 
	< jQuery(".banner").offset().top)) { jQuery("#chase").css("position", "static"); } }); </script>
	<style>
		#admin-list.admin-off {display:none;}
		#game-list.game-off {display:none;}
		.link {color:black; font-weight: bold; }
	</style>
	<style type="text/css">
	  .table {
	  TABLE-layout:fixed;
	  overflow: hidden; 
	  text-overflow: ellipsis;
	  white-space: nowrap; 
	  }
	</style>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<%@ include file="isLogin.jsp" %>
<div class="container">
	<!-- 관리자 페이지 상단 글씨 -->
	<div class="row">
		<div class="col-sm-12" style="border-bottom:2px solid grey;">
			<h1><a class="link" href="adminMain.jsp" style="text-decoration:none;"><strong>관리자 페이지</strong></a></h1>
			
		</div>
	</div>
	<!-- 관리자 페이지 좌측 tab 선택 부분 -->

	<div class="banner col-sm-3">
		<div id="chase" style="top:0px;">
			<div class="col-sm-12">
				<h4><a class="link" href="adminNotice.jsp" style="text-decoration:none;">공지사항</a></h4>
			</div>
			<div class="col-sm-12">
				<h4><a class="link" href="adminQna.jsp" style="text-decoration:none">QNA 게시판 관리</a></h4>
			</div>
			<div class="col-sm-12">
				<h4><a class="link" href="adminProfits.jsp" style="text-decoration:none">수익 조회</a></h4>
			</div>
			<div class="col-sm-12">
				<h4><a class="link" href="" style="text-decoration:none" onclick="gamelist(event)">게임 관리
				<span class="caret"></span>
				</a></h4>
				<ul id="game-list" class="game-off" style="list-style-type: none;">
					<li style="padding-bottom:5px;"><a class="link" href="adminGameRegisterForm.jsp" style="text-decoration:none">새로운 게임 등록</a></li>
					<li><a class="link" href="adminEditGameForm1.jsp" style="text-decoration:none">게임정보 수정/삭제</a></li>
				</ul>
			</div>
			<div class="col-sm-12">
				<h4><a class="link" href="" style="text-decoration:none" onclick="adminList(event)">관리자 계정 관리
				<span class="caret"></span>
				</a></h4>
				<ul id="admin-list" class="admin-off" style="list-style-type: none;">
					<li style="padding-bottom:5px;"><a class="link" href="adminClientRegisterForm.jsp" style="text-decoration:none">관리자 생성</a></li>
					<li style="padding-bottom:5px;"><a class="link" href="adminClientEditForm.jsp" style="text-decoration:none">관리자 수정</a></li>
					<li ><a class="link" href="adminClientDeleteForm.jsp" style="text-decoration:none">관리자 삭제</a></li>
				</ul>
			</div>
		</div>
	</div>
		
	<!-- 구분선 -->
		
			<!-- 관리자 페이지 우측 메인컨텐츠 부분 -->
		<div class="col-sm-9" style="border-left: 2px solid grey;">
			<div class="row">
				<div class="col-sm-12">
					<h3 class="text-center" style="font-weight: bold;">QNA 게시판 관리</h3><br><br>
						<a href="adminQna.jsp"><button class="btn btn-default">전체 게시글 보기</button></a>
						<a href="adminQnaNoAnswer.jsp"><button class="btn btn-default">답변대기 게시글 보기</button></a>
						<a href="adminQnaAnswerCompleted.jsp"><button class="btn btn-primary">답변완료 게시글 보기</button></a>
						<hr/>
						
					<div>
						<table class="table">
							<colgroup>
                          		 <col width="15%">
                          		 <col width="35%">
                          		 <col width="15%">
                         		 <col width="15%">
                         		 <col width="10%">
                         		 <col width="10%">
                      		</colgroup>
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>응답상태</th>
								</tr>
							</thead>
							<tbody>
						<%
							QnaBoardDao qnaBoardDao = QnaBoardDao.getInstance();
							List<QnaBoard> qnas = qnaBoardDao.getAllQnaBoards();
							QnaAnswerDao qnaAnswerDao = QnaAnswerDao.getInstance();
							UserDao userDao = UserDao.getInstance();
							for(QnaBoard qna : qnas) {
								User writer = userDao.getUserByNo(qna.getUser().getNo());
								int answerCount = qnaAnswerDao.getQnaAnswerCountByNo(qna.getNo());
								if(answerCount == 1) {
						%>
								<tr>
									<td><%=qna.getNo() %></td>
									<td><a href="adminQnadetail.jsp?qnaNo=<%=qna.getNo() %>&where=completed"><%=qna.getTitle() %></a></td>
									<td><%=writer.getName() %></td>
									<td><%=DateUtil.dateToString(qna.getCreateDate()) %></td>
									<td><%=qna.getCount() %></td>
									
									<td><span class="label label-success">답변완료</span></td>
						
								</tr>
						<% 		
								}
							}
						%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
function adminList(event) {
	event.preventDefault();
	
	var value = document.getElementById("admin-list").getAttribute("class");
	if (value == "admin-off"){
		document.getElementById("admin-list").setAttribute("class", "admin-on");
		
	} else {
		document.getElementById("admin-list").setAttribute("class", "admin-off");
	}
	
}


function gamelist(event) {
	event.preventDefault();
	
	var value = document.getElementById("game-list").getAttribute("class");
	if (value == "game-off"){
		document.getElementById("game-list").setAttribute("class", "game-on");
		
	} else {
		document.getElementById("game-list").setAttribute("class", "game-off");
	}
}
</script>
</body>
</html>