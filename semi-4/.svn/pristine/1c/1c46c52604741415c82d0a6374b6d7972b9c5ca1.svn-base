<%@page import="com.semi4.utils.NumberUtils"%>
<%@page import="com.ibatis.sqlmap.engine.mapping.sql.dynamic.elements.IsEmptyTagHandler"%>
<%@page import="com.semi4.vo.Publisher"%>
<%@page import="com.semi4.dao.PublisherDao"%>
<%@page import="com.semi4.vo.Genre"%>
<%@page import="com.semi4.dao.GenreDao"%>
<%@page import="com.semi4.vo.Pagination3"%>
<%@page import="com.semi4.dao.GameDao"%>
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
<%@ include file="../common/navbar.jsp"%>
<div class="container">
<%
	GameDao gameDao = GameDao.getInstance();

	// 키워드로 요청한 페이지 번호
	int pageNo = 1;
	try {
		pageNo = Integer.parseInt(request.getParameter("pageno"));
	} catch (NumberFormatException ex) {}
	
	// 스몰키워드 호출하기 (빅키워드는 네비바에서 호출하였다.)
	String smallKeyword = StringUtils.nullToBlank(request.getParameter("smallkeyword"));
	
	Map<String, Object> param = new HashMap<>();
	if (!bigKeyword.isEmpty()) {
		param.put("bigkeyword", bigKeyword);
	}
	if (!smallKeyword.isEmpty()) {
		param.put("smallkeyword", smallKeyword);
	}
	
	// 총 데이터 숫자
	int totalCnt = gameDao.selectKeywordGamesCount(param);
	
	// 키워드 페이징 처리에 필요한 값들을 제공하는 Pagination3 객체 생성
	Pagination3 pagination3 = new Pagination3(pageNo, totalCnt);
	
	param.put("begin", pagination3.getBeginIndex());
	param.put("end", pagination3.getEndIndex());
	
	List<Game> games = gameDao.selectKeywordGames(param);
	
	GenreDao genreDao = GenreDao.getInstance();
	List<Genre> genres = genreDao.getAllGenres();
	
	PublisherDao publisherDao = PublisherDao.getInstance();
	List<Publisher> publishers = publisherDao.getAllPublishers();
%>

 	<div class="row" style="padding-bottom: 35px;">
 		<div class="col-sm-12">
 			<h1 style="border-top: 1px solid grey;"><span style="font-size: 13px; font-weight: bold;">게임검색</span></h1>
 		</div>
 	</div>
 	<div class="row" id="search-box">
 		<form id="smallkeyword-form" method="get" action="searchform.jsp">
 		<input type="hidden" name="pageno" id="page-no" value="<%=pageNo %>">
 		
	 	<div class="col-sm-12 form-group panel panel-default">
	 		<div class="panel-body" style="padding-top: 30px; padding-bottom: 30px; height: 100px; vertical-align: center;">
	 			<div class="col-sm-3">
	 				<span style="float: right; font-weight: bold;">결과 내 재검색</span>
	 			</div>
	 			<div class="col-sm-7">
	 				<div class="form-group">
               	   		<input type="text" name="smallkeyword" id="smallkeyword-search" class="form-control" style="width: 475px; float: left;" value="<%=smallKeyword%>">
               			<button class="btn btn-default" type="button" style="margin-left: 5px;" onclick="smallSearch()">
                       	<i class="glyphicon glyphicon-search"></i></button>
                   		<button class="btn btn-default" type="button" onclick="initSearch()">초기화</button>
                   	</div>
	 			</div>
	 		<div class="col-sm-2"></div>
	 		</div>
	 	</div>
	 	<div class="col-sm-12 form-group panel panel-default">
	 		<div class="panel-body">
	 			<div class="col-sm-3"><span style="float: right;">검색어 :</span></div>
	 			<input type="hidden" name="bigkeyword" value="<%=bigKeyword%>">
	 			<div class="col-sm-6">
	 				<span class="label label-default" style="float: left;"><%=bigKeyword %></span>
	 				<span class="label label-primary" style="float: left; margin-left: 5px;"><%=smallKeyword %></span>
	 			</div>
	 			<div class="col-sm-3"></div>
	 		</div>
	 	</div>
	 	</form>
	 	
	 	<div class="col-sm-12 panel-group">
	 		<%
	 			if (!games.isEmpty()) {
	 				for (Game game : games) {
	 					Genre genre = genreDao.getGenreByGenreNo(game.getGenre().getNo());
	 					Publisher publisher = publisherDao.getPublisherByNo(game.getPublisher().getNo());
	 		%>
	 		<div class="panel panel-default">
	 			<div class="panel-body">
	 				<div class="col-sm-3"><a href="gamedetail.jsp?gameno=<%=game.getNo() %>"><img src="../resources/images/gameImages/<%=game.getImageFileName() %>" style="height: 81px; width: 173px;"></a></div>
	 				<div class="col-sm-5"><h4><a href="gamedetail.jsp?gameno=<%=game.getNo() %>" style="font-size: 18px;">[<%=publisher.getName() %>] <%=game.getTitle() %></a></h4>
	 					<div>
	 						<span class="label label-light" style="background: #222;"><%=genre.getName() %></span>
							<span class="label label-light" style="background: brown;"><%=publisher.getName() %></span>
						</div>
					</div>
					<div class="col-sm-2">
						<div><h4><span style="font-size: 18px;"><del><%=NumberUtils.numberWithComma(game.getPrice()) %> 원</del></span></h4></div>
						<div><h4><span style="font-size: 18px;"><%=NumberUtils.numberWithComma(game.getDiscountPrice()) %> 원</span></h4></div>
					</div>
					<div class="col-sm-2">
						<div><a href="addcart.jsp?gameno=<%=game.getNo() %>" class="btn btn-warning"><span class="glyphicon glyphicon glyphicon-shopping-cart"></span> 담기</a></div>
						<div><a href="orderdirectform.jsp?gameno=<%=game.getNo() %>" class="btn btn-primary" style="margin-top: 10px;">구매하기</a></div>
					</div>
	 			</div>
	 		</div>
	 		<%
	 				} 
	 			}	else if (games.isEmpty()) {
	 		%>
	 			<div>
	 				<h4 style="text-align: center;">검색된 결과가 없습니다.</h4>
	 			</div>
	 		<%
	 			}
	 		%>
	 	</div>	 	
	 	<div class="row">
	 		<div class="col-sm-12 text-center">
	 			<ul class="pagination">
	 			<%
	 				if (pageNo > 1) {
	 			%>
	 				<li><a href="<%=pageNo -1%>" onclick="searchPage(<%=pageNo -1%>, event)">이전</a></li>
	 			<%
	 				} else {
	 			%>
	 				
	 			<%
	 				}
	 			%>
	 			<%
	 					if (pagination3.getBeginPage() !=0 || pagination3.getEndPage() !=0) {
	 						for (int i=pagination3.getBeginPage(); i<=pagination3.getEndPage(); i++) {
	 			%>
	 					<li class="<%=pageNo == i ? "active" : ""%>"><a href="<%=i %>" onclick="searchPage(<%=i %>, event)"><%=i %></a></li>
				<%
							}
	 					}
				%>
				<%
					if (pageNo < pagination3.getTotalPagesCount()) {
				%>
					<li><a href="<%=pageNo + 1 %>" onclick="searchPage(<%=pageNo + 1 %>, event)">다음</a></li>
				<%	
					} else {
				%>
					
				<%	
					}
				%>
	 			</ul>
	 		</div>
	 	</div>
 	</div>
</div>
<script type="text/javascript">
	function searchPage(pageno, e) {	
		if (e) {
			e.preventDefault();
		}
		document.getElementById("page-no").value = pageno;
	
		document.getElementById("smallkeyword-form").submit();
	}

	function smallSearch() {
		var smallkeyword = document.getElementById("smallkeyword-search").value;
		
		if (smallkeyword = "") {
			alert("검색어를 입력하세요.")
			return;
		}
		
		document.getElementById("smallkeyword-form").submit();
	}

	function initSearch() {
		document.getElementById("smallkeyword-search").value = null;
		document.getElementById("keyword-search").value = null;
		document.getElementById("smallkeyword-form").submit();
		document.getElementById("bigkeyword-form").submit();
	}
</script>
</body>
<%@ include file="../common/footer.jsp"%>
</html>