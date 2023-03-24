<%@page import="java.util.Date"%>
<%@page import="com.semi4.utils.DateUtil"%>
<%@page import="com.semi4.vo.ProfitResult"%>
<%@page import="com.semi4.dao.ProfitResultDao"%>
<%@page import="com.semi4.vo.Profit"%>
<%@page import="com.semi4.vo.Publisher"%>
<%@page import="com.semi4.dao.PublisherDao"%>
<%@page import="java.util.List"%>
<%@page import="com.semi4.vo.Genre"%>
<%@page import="com.semi4.dao.GenreDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.semi4.dao.ProfitDao"%>
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
			<div class="col-sm-9" style="border-left: 2px solid grey; height:1000px;">
				<div class="row">
				<div class="col-sm-12">
					<h3 class="text-center" style="font-weight: bold;">일간 수익 조회</h3><br><br>
						<a href="adminProfits.jsp"><button class="btn btn-default">총 수익</button></a>
						<a href="adminProfitByDay.jsp"><button class="btn btn-primary">일간 수익</button></a>
						<a href="adminProfitByMonth.jsp"><button class="btn btn-default">월간 수익</button></a>
						<hr/>
						<div class="row">
							<div class="col-md-12">
										
									<%
										String profitday = request.getParameter("profitday");
										if (profitday == null) {
											Date today = new Date();
											profitday = DateUtil.dateToString(today);
										}	
									
										Map<String, String> opt = new HashMap<>();
										opt.put("opt", "day");
										opt.put("keyword", profitday);	
										
									%>
								
									<div class="table-responsive">
									<div class="text-center" style="font-weight: bold;">
										<h4><strong>날짜 선택</strong></h4>
										<form method="post" action="adminProfitByDay.jsp">
											<input class="text-center" type="date" name="profitday" id="profit-day" value="<%=profitday!= null ? profitday : ""%>">
											<button class="btn btn-primary" type="submit">조회하기</button>
										</form>
									</div><hr/>
										<h4 class="text-center" style="font-weight: bold;">일간 수익 테이블</h4>
										
										<table class="table table-dark table-hover" style="border:2px solid black; width:100%;">
											<thead>
												<tr>
													<th></th>
										<%
											GenreDao genreDao = GenreDao.getInstance();
											List<Genre> allGenres =  genreDao.getAllGenres();											
											for(Genre genre : allGenres) {
										%>
													<th><%=genre.getName() %></th>
													
										<%
											}	
										%>
													<th class="info" style="font-weight: bold;">합계</th>
												</tr>
											</thead>
											<tbody>
										<%
											ProfitResultDao profitResultDao = ProfitResultDao.getInstance();
											List<ProfitResult> results = profitResultDao.getProfitResults(opt);
											for(ProfitResult result : results) {
										%>
												<tr>
													<td><%=result.getPublisherName() %></td>
													<td><%=result.getAction() %></td>
													<td><%=result.getAdventure() %></td>
													<td><%=result.getSports() %></td>
													<td><%=result.getRpg() %></td>
													<td><%=result.getFps() %></td>
													<td><%=result.getPuzzle() %></td>
													<td><%=result.getSim() %></td>
													<td><%=result.getStr() %></td>
													<td><%=result.getEtc() %></td>
													<td class="info" style="font-weight: bold;"><%=result.getTotal() %></td>
												</tr>
										<%
											}
										
										%>
												<tr class="info" style="font-weight: bold;">
													<td>장르별 총수익</td>
											<%
												ProfitResult resultTotal = profitResultDao.getTotalProfitResult(opt);
												
											%>
													<td><%=resultTotal.getAction() %></td>
													<td><%=resultTotal.getAdventure() %></td>
													<td><%=resultTotal.getSports() %></td>
													<td><%=resultTotal.getRpg() %></td>
													<td><%=resultTotal.getFps() %></td>
													<td><%=resultTotal.getPuzzle() %></td>
													<td><%=resultTotal.getSim() %></td>
													<td><%=resultTotal.getStr() %></td>
													<td><%=resultTotal.getEtc() %></td>
													<td><%=resultTotal.getTotal() %></td>
												</tr>
											</tbody>
										</table>
									</div>
							</div>
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