<%@page import="com.semi4.utils.NumberUtils"%>
<%@page import="com.semi4.vo.NoticeBoard"%>
<%@page import="com.semi4.dao.NoticeBoardDao"%>
<%@page import="com.semi4.vo.GameLike"%>
<%@page import="com.semi4.dao.GameLikeDao"%>
<%@page import="com.semi4.dao.ReviewBoardDao"%>
<%@page import="com.semi4.utils.DateUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.semi4.vo.Publisher"%>
<%@page import="com.semi4.vo.Genre"%>
<%@page import="com.semi4.vo.Game"%>
<%@page import="java.util.List"%>
<%@page import="com.semi4.dao.PublisherDao"%>
<%@page import="com.semi4.dao.GenreDao"%>
<%@page import="com.semi4.dao.GameDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>JHTA Games</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body onload="showMainImg()">
<%@ include file="common/navbar.jsp" %>
<div class="container">
<%
	GameDao gameDao = GameDao.getInstance();
	GenreDao genreDao = GenreDao.getInstance();
	PublisherDao publisherDao = PublisherDao.getInstance();
	GameLikeDao gameLikeDao = GameLikeDao.getInstance();
	
	List<Game> gamesDate = gameDao.getMainGamesByDate();
	List<Game> gamesAtoZ = gameDao.getMainGamesByAtoZ();
	List<Game> gamesLikes = gameDao.getMainGamesByLikes();
%>
	<div class= "row">
		<div class="col-sm-12">
			<div class="row" style="margin-top: 20px;">
				<div class="col-sm-9">		
					<img id="intromain" border="0" style="width: 924px; height: 450px;">					
				</div>
				<div class="col-sm-3">
					<div class="row" align="center">
						<div style="margin-top: 15px;">
							<a href="purchase/gamemenu.jsp?publisher="><img src="resources/images/logoImages/blizzardLogo.png" style="height: 60px; width: 120px; margin-left: 40px;"></a>
						</div>
						<div style="margin-top: 15px;">
							<a href="purchase/gamemenu.jsp?publisher="><img src="resources/images/logoImages/capcomLogo.png" style="height: 60px; width: 120px; margin-left: 40px;"></a>
						</div>
						<div style="margin-top: 15px;">
							<a href="purchase/gamemenu.jsp?publisher="><img src="resources/images/logoImages/eaLogo.png" style="height: 60px; width: 90px; margin-left: 40px;"></a>
						</div>
						<div style="margin-top: 15px;">
							<a href="purchase/gamemenu.jsp?publisher="><img src="resources/images/logoImages/koeiLogo.png" style="height: 60px; width: 120px; margin-left: 40px;"></a>
						</div>
						<div style="margin-top: 15px;">
							<a href="purchase/gamemenu.jsp?publisher="><img src="resources/images/logoImages/rockLogo.png" style="height: 60px; width: 90px; margin-left: 40px;"></a>
						</div>
						<div style="margin-top: 15px;">
							<a href="purchase/gamemenu.jsp?publisher="><img src="resources/images/logoImages/segaLogo.png" style="height: 60px; width: 120px; margin-left: 40px;"></a>
						</div>
					</div>
				</div>
			</div>			
			
			<div class="row" style="margin-top: 10px;">
				<div class="col-sm-3">
					<div class="row" style="margin-top: 10px;">
						<div class="col-sm-6"><strong><span style="font-size: 16px;">공지사항</span></strong></div>							
						
						<div class="col-sm-6" style="text-align: right;"><a href="board/noticeboard/noticeboard.jsp" style="font-size: 13px;">+ 더보기</a></div>	
					</div>
					
					<div class="row">
						<div class="list-group" style="margin-top: 15px;">
						<%
							NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
							List<NoticeBoard> noticeBoards = noticeBoardDao.getNoticeByDate();
							
							
							for (NoticeBoard noticeBoard : noticeBoards) {
						%>
							<a href="board/noticeboard/noticeDetail.jsp?no=<%=noticeBoard.getNo() %>&pageno=1&from=home.jsp" class="list-group-item" style="width:270px; margin-left:10px; white-space:nowrap; text-overflow: ellipsis; overflow: hidden;">
							<%=noticeBoard.getTitle() %></a>
						<%
							}
						%>
							
						</div>
					</div>
				</div>
				<div class="col-sm-9">
					<div class="row">
						<div class="col-sm-12">
							<ul class="nav nav-tabs" style="margin-right: 30px;">
								<li class="active"><a data-toggle="tab" href="#showGamesList1">최신 게임</a></li>
								<li><a data-toggle="tab" href="#showGamesList2">가나다순</a></li>
								<li><a data-toggle="tab" href="#showGamesList3">좋아요순</a></li>
							</ul>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12 tab-content" style="right: 15px;">
							
							<div class="tab-pane fade in active" id="showGamesList1">
								<%
									for (Game game1 : gamesDate) {								
								%>
								<div class="col-sm-4" style="margin-top: 20px;">
									<div class="panel panel-default">
										<div class="panel-body">
											<a href="purchase/gamedetail.jsp?gameno=<%=game1.getNo() %>">
											<img src="resources/images/gameImages/<%=game1.getImageFileName() %>" width="230px" height="150px">
											</a>
											<div style="max-height: 56px; height: 56px;">
												<a href="purchase/gamedetail.jsp?gameno=<%=game1.getNo()%>"><strong style="font-size: 20px;"><%=game1.getTitle() %></strong></a>
											</div>
											<div>
											<%
												Genre foundGenre = genreDao.getGenreByGenreNo(game1.getGenre().getNo());
												Publisher foundPublisher = publisherDao.getPublisherByNo(game1.getPublisher().getNo());
											%>
												<span class="label label-light" style="background: #222;"><%=foundGenre.getName() %></span>
												<span class="label label-light" style="background: brown;"><%=foundPublisher.getName() %></span>							
												<span class="pull-right" style="font-size: 13px;"><br><%=DateUtil.gameDateToMonth(game1.getCreateDate()) %></span>
											</div>
											<div>
												<span>정상가: <del><%=NumberUtils.numberWithComma(game1.getPrice()) %> 원</del></span>
											</div>
											<div>
											<span>판매가: <strong><%=NumberUtils.numberWithComma(game1.getDiscountPrice()) %> 원</strong></span>
											<%
												Game foundGame = gameDao.getGameByNo(game1.getNo());
											%>
											<p class="pull-right">좋아요 <%=foundGame.getLikeCount() %></p>
											</div>
											<div style="border-bottom: 1px solid grey;"></div>
											<div style ="padding-top: 10px;">		
												<a href="purchase/addcart.jsp?gameno=<%=game1.getNo() %>" class="btn btn-warning pull-left"><span class="glyphicon glyphicon glyphicon-shopping-cart"></span> 장바구니 담기</a>
												<a href="purchase/orderdirectform.jsp?gameno=<%=game1.getNo() %>" class="btn btn-primary pull-right">구매하기</a>
											</div>
										</div>
									</div>
								</div>
									<%
										}
									%>
							</div>
							
							<div class="tab-pane fade" id="showGamesList2">
									<%
									for (Game game2 : gamesAtoZ) {								
								%>
								<div class="col-sm-4" style="margin-top: 20px;">
									<div class="panel panel-default">
										<div class="panel-body">
											<a href="purchase/gamedetail.jsp?gameno=<%=game2.getNo()%>">
											<img src="resources/images/gameImages/<%=game2.getImageFileName() %>" width="230px" height="150px">
											</a>
											<div style="max-height: 56px; height: 56px;">
												<a href="purchase/gamedetail.jsp?gameno=<%=game2.getNo()%>"><strong style="font-size: 20px;"><%=game2.getTitle() %></strong></a>
											</div>
											<div>
											<%
												Genre foundGenre = genreDao.getGenreByGenreNo(game2.getGenre().getNo());
												Publisher foundPublisher = publisherDao.getPublisherByNo(game2.getPublisher().getNo());
											%>
												<span class="label label-light" style="background: #222;"><%=foundGenre.getName() %></span>
												<span class="label label-light" style="background: brown;"><%=foundPublisher.getName() %></span>							
											<%
												SimpleDateFormat date = new SimpleDateFormat("yy.MM.dd");
											%>
												<span class="pull-right" style="font-size: 13px;"><br><%=date.format(game2.getCreateDate()) %></span>
											</div>
											<div>
												<span>정상가: <del><%=NumberUtils.numberWithComma(game2.getPrice()) %> 원</del></span>
											</div>
											<div>
											<span>판매가: <strong><%=NumberUtils.numberWithComma(game2.getDiscountPrice()) %> 원</strong></span>
											<%
												Game foundGame = gameDao.getGameByNo(game2.getNo());
											%>
											<p class="pull-right">좋아요 <%=foundGame.getLikeCount() %></p>
											</div>
											<div style="border-bottom: 1px solid grey;"></div>
											<div style ="padding-top: 10px;">		
												<a href="purchase/addcart.jsp?gameno=<%=game2.getNo() %>" class="btn btn-warning pull-left"><span class="glyphicon glyphicon glyphicon-shopping-cart"></span> 장바구니 담기</a>
												<a href="purchase/orderdirectform.jsp?gameno=<%=game2.getNo() %>" class="btn btn-primary pull-right">구매하기</a>
											</div>
										</div>
									</div>
								</div>
									<%
										}
									%>
							</div>
							
							<div class="tab-pane fade" id="showGamesList3">
									<%
									for (Game game3 : gamesLikes) {								
								%>
								<div class="col-sm-4" style="margin-top: 20px;">
									<div class="panel panel-default">
										<div class="panel-body">
											<a href="purchase/gamedetail.jsp?gameno=<%=game3.getNo()%>">
											<img src="resources/images/gameImages/<%=game3.getImageFileName() %>" width="230px" height="150px">
											</a>
											<div style="max-height: 56px; height: 56px;">
												<a href="purchase/gamedetail.jsp?gameno=<%=game3.getNo()%>"><strong style="font-size: 20px;"><%=game3.getTitle() %></strong></a>
											</div>
											<div>
											<%
												Genre foundGenre = genreDao.getGenreByGenreNo(game3.getGenre().getNo());
												Publisher foundPublisher = publisherDao.getPublisherByNo(game3.getPublisher().getNo());
											%>
												<span class="label label-light" style="background: #222;"><%=foundGenre.getName() %></span>
												<span class="label label-light" style="background: brown;"><%=foundPublisher.getName() %></span>							
											<%
												SimpleDateFormat date = new SimpleDateFormat("yy.MM.dd");
											%>
												<span class="pull-right" style="font-size: 13px;"><br><%=date.format(game3.getCreateDate()) %></span>
											</div>
											<div>
												<span>정상가: <del><%=NumberUtils.numberWithComma(game3.getPrice()) %> 원</del></span>
											</div>
											<div>
											<span>판매가: <strong><%=NumberUtils.numberWithComma(game3.getDiscountPrice()) %> 원</strong></span>
											<%
												Game foundGame = gameDao.getGameByNo(game3.getNo());
											%>
											<p class="pull-right">좋아요 <%=foundGame.getLikeCount() %></p>
											</div>
											<div style="border-bottom: 1px solid grey;"></div>
											<div style ="padding-top: 10px;">		
												<a href="purchase/addcart.jsp?gameno=<%=game3.getNo() %>" class="btn btn-warning pull-left"><span class="glyphicon glyphicon glyphicon-shopping-cart"></span> 장바구니 담기</a>
												<a href="purchase/orderdirectform.jsp?gameno=<%=game3.getNo() %>" class="btn btn-primary pull-right">구매하기</a>
											</div>
										</div>
									</div>
								</div>
									<%
										}
									%>
							</div>
						
						</div>
						<div class="row" style="margin-bottom: 50px; margin-top: 10px; margin-right: 35px;">
							<div class="col-sm-12" align="right">
								<a href="purchase/gamemenu.jsp">전체보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="hidden">
<%
	List<Game> mainGames = gameDao.getAllGames();
	int imageIndex = 0;
	for(Game ga : mainGames) {
		String gameName = ga.getImageFileName();
%>		
	<input type="text" name="mainImg" id="mainImg-<%=imageIndex++ %>"value="<%=gameName %>">
<%
	}
%>
	<input type="text" id="main-count" value="<%=mainGames.size() %>">
</div>

</body>
<%@ include file="common/footer.jsp" %>
<script type="text/javascript">	
	var mainImgArray = new Array();
	var count = document.getElementById("main-count").value;
	
	for(var i=0; i<count; i++ ) {
		var file = document.getElementById("mainImg-"+i).value;
		mainImgArray[i] = "resources/images/gameImages/"+file;
	}
	
	
	function showMainImg() {
		var count = document.getElementById("main-count").value;
		var mainImgNum = Math.trunc(Math.random()*count);
		var objMainImg = document.getElementById("intromain");
		objMainImg.src = mainImgArray[mainImgNum];
		
		setTimeout("showMainImg()", 1500);	
	}
	
</script>
</html>