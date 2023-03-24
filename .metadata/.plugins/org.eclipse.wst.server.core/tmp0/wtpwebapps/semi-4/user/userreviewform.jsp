<%@page import="com.semi4.utils.DateUtil"%>
<%@page import="com.semi4.dao.ReviewBoardDao"%>
<%@page import="com.semi4.vo.ReviewBoard"%>
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
	ReviewBoardDao reviewBoardDao = ReviewBoardDao.getInstance();
	List<ReviewBoard> reviewBoards = reviewBoardDao.getReviewsByUserNo(loginedUser.getNo());
%>
<div class="wrap docs-section" style="height: 635px;">
	<div class="container">

			<div id="t3-content" class="t3-content col-xs-12" style="padding-top:0;">
				<div id="system-message-container">
				<h1 style="font-size:30px">마이페이지</h1>
				</div>
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
						        <th style="width: 10%">작성일자</th>
						        <th style="width: 10%">좋아요수</th>
						        <th style="width: 10%">조회수</th>
						        <th style="width: 8%;">비고</th>
						    </tr>
					    </thead>
					    <tbody>
					    <%
					    	if (reviewBoards.isEmpty()) {
					    %>
					    	<tr>
				    			<td colspan="12" style="font-size: 40px; text-align: center">문의하신 내역이 없습니다.</td>
				    		</tr>
					    <%
					    	} else {
					    		for (ReviewBoard reviewBoard : reviewBoards) { 
					    			
					    %>
						    <tr>
					    		<td><%=reviewBoard.getNo() %></td>
						        <td><%=reviewBoard.getTitle() %></td>
						        <td><%=DateUtil.dateToString(reviewBoard.getCreateDate())%></td>
						        <td><%=reviewBoard.getLikeCount()%></td>
						        <td><%=reviewBoard.getCount()%></td>
						        <td>
							      	<a href="../board/reviewboard/reviewboarddetail.jsp?reviewno=<%=reviewBoard.getNo() %>&pageno=<%=1 %>&from=userreviewform.jsp"
							      		class="btn btn-default btn-xs" style="font-size: 13px;">내글보기
							      	</a>
						        </td>
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
</body>
<%@ include file="../common/footer.jsp" %>
</html>