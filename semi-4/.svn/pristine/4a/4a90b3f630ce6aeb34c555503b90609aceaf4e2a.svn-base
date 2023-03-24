<%@page import="com.semi4.dao.UserDao"%>
<%@page import="com.semi4.vo.QnaAnswer"%>
<%@page import="com.semi4.dao.QnaAnswerDao"%>
<%@page import="com.semi4.utils.NumberUtils"%>
<%@page import="com.semi4.utils.DateUtil"%>
<%@page import="com.semi4.vo.QnaBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.semi4.dao.QnaBoardDao"%>
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

<%
	if (loginedUser == null) {
		response.sendRedirect("../loginform.jsp");
		return;
	}
%>
<%
	QnaBoardDao qnaBoardDao = QnaBoardDao.getInstance();
	List<QnaBoard> qnaboards = qnaBoardDao.getQnaBoardUserById(loginedUser.getNo());
	
	UserDao userDao = UserDao.getInstance();
	QnaAnswerDao qnaAnswerDao = QnaAnswerDao.getInstance();
%>

<div class="wrap docs-section" style="height: 635px;">
	<div class="container">
		<div id="t3-content" class="t3-content col-xs-12" style="padding-top:0;">
			<div id="system-message-container"></div>
			<h1 style="font-size:30px">마이페이지</h1>
			<div class="layout container-fluid">
				<ul class="nav navbar-nav">
					<li class=""><a href="userinfoform.jsp" ><span>정보수정</span></a></li>
					<li class=""><a href="userorderform.jsp" ><span>주문내역</span></a></li>
					<li class=""><a href="userqnaform.jsp" ><span>Q&amp;A내역</span></a></li>
					<li class=""><a href="userreviewform.jsp" ><span>리뷰내역</span></a></li>
					<li class=""><a href="../purchase/cart.jsp" ><span>장바구니</span></a></li>
					<li class=""><a href="userleaveform.jsp" ><span>회원탈퇴</span></a></li>
				</ul>
			</div>
			<div class="container col-sm-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th style="width: 10%">번호</th>
					        <th style="width: 50%">제목</th>
					        <th style="width: 12%">작성일자</th>
					        <th style="width: 10%">조회수</th>
					        <th style="width: 10%">처리내역</th>
					        <th style="width: 8%;">비고</th>
					    </tr>
					</thead>
				    <tbody>
				    <%
				    	if (qnaboards.isEmpty()) {
				    %>
				    	<tr>
				    		<td colspan="12" style="font-size: 40px; text-align: center">문의하신 내역이 없습니다.</td>
				    	</tr>
				    <%
				    	} else {
				    		for (QnaBoard qnaBoard : qnaboards) {
				    			User user = new User();
	                            user = userDao.getUserByNo(qnaBoard.getUser().getNo());
	                            qnaBoard.setUser(user);
	                            int answerCount = qnaAnswerDao.getQnaAnswerCountByNo(qnaBoard.getNo());
				    			
	                            if (loginedUser != null && loginedUser.getNo().intValue() == qnaBoard.getUser().getNo().intValue()) {
				    %>
						    	<tr>
							        <td><%=qnaBoard.getNo()%></td>
							        <td><%=qnaBoard.getTitle()%></td>
							        <td><%=DateUtil.dateToString(qnaBoard.getCreateDate())%></td>
							        <td><%=qnaBoard.getCount()%></td>
			        <% 
									if(answerCount == 1) {
						
					%>
									<td><span class="label label-success" style="font-size: 13px;">답변완료</span></td>
					<%
									} else {
					%>
									<td><span class="label label-default" style="font-size: 13px;">답변대기</span></td>
					<%				
									
									}
					%>
							        <td>
							        	<a href="../board/qnaboard/qnaboarddetail.jsp?qnaboardno=<%=qnaBoard.getNo() %>&pageno=<%=1 %>&from=userqnaform.jsp"
							        		class="btn btn-default btn-xs" style="font-size: 13px;">내글보기</a></td>
							      	
						        </tr>
				    <%
				    			}
				    		}
				    	}
				    %>
	
				    </tbody>
				</table>
			</div>
		</div>
	</div>
</div> 
</body>
<%@ include file="../common/footer.jsp" %>
</html>