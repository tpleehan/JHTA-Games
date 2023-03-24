<%@page import="com.semi4.vo.GameLike"%>
<%@page import="com.semi4.dao.GameLikeDao"%>
<%@page import="com.semi4.utils.NumberUtils"%>
<%@page import="com.semi4.vo.GameImage"%>
<%@page import="com.semi4.dao.GameImageDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.semi4.dao.GenreDao"%>
<%@page import="com.semi4.vo.Genre"%>
<%@page import="com.semi4.vo.Publisher"%>
<%@page import="com.semi4.dao.PublisherDao"%>
<%@page import="java.util.List"%>
<%@page import="com.semi4.dao.GameDao"%>
<%@page import="com.semi4.vo.Game"%>
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
    <style type="text/css">
	 #like {
	  box-shadow: 1px 1px 0 rgba(255,255,255,0.5) inset;
	  border-radius: 3px;
	  border: 1px solid;
	  display: inline-block;
	  height: 18px;
	  line-height: 18px;
	  padding: 0 8px;
	  position: relative;
	
	  font-size: 12px;
	  text-decoration: none;
	  text-shadow: 0 1px 0 rgba(255,255,255,0.5);
	}
	.btn-counter { margin-right: 39px; }
	.btn-counter:after,
	.btn-counter:hover:after { text-shadow: none; }
	.btn-counter:after {
	  border-radius: 3px;
	  border: 1px solid #d3d3d3;
	  background-color: white;
	  padding: 0 8px;
	  color: #777;
	  content: attr(data-count);
	  left: 100%;
	  margin-left: 8px;
	  margin-right: -13px;
	  position: absolute;
	  top: -1px;
	}
	.btn-counter:before {
	  transform: rotate(45deg);
	  filter: progid:DXImageTransform.Microsoft.Matrix(M11=0.7071067811865476, M12=-0.7071067811865475, M21=0.7071067811865475, M22=0.7071067811865476, sizingMethod='auto expand');
	
	  background-color: #eee;
	  border: 1px solid #d3d3d3;
	  border-right: 0;
	  border-top: 0;
	  content: '';
	  position: absolute;
	  right: -13px;
	  top: 5px;
	  height: 6px;
	  width: 6px;
	  z-index: 1;
	  zoom: 1;
	}
  
  #like {
  background-color: white;
  border-color: #bbb;
  color: #666;
	}
	#like:hover,
	#like.active {
	  text-shadow: 0 1px 0 #b12f27;
	  background-color: #f64136;
	  border-color: #b12f27;
	}
	#like:active { box-shadow: 0 0 5px 3px rgba(0,0,0,0.2) inset; }
	#like span { color: #f64136; }
	#like:hover, #like:hover span,
	#like.active, #like.active span { color: #eeeeee; }
	#like:active span {
	  color: #b12f27;
	  text-shadow: 0 1px 0 rgba(255,255,255,0.3);
	}
  </style>
</head>
<body>
<%@ include file="../common/navbar.jsp"%>
<%	
	GameDao gameDao = GameDao.getInstance();
	int gameNo = Integer.parseInt(request.getParameter("gameno"));	

	GenreDao genreDao = GenreDao.getInstance();
	PublisherDao publisherDao = PublisherDao.getInstance();
	GameImageDao gameImageDao = GameImageDao.getInstance();
	
	Game foundGame = gameDao.getGameByNo(gameNo);
	Genre foundGenre = genreDao.getGenreByGenreNo(foundGame.getGenre().getNo());
	Publisher foundPublisher = publisherDao.getPublisherByNo(foundGame.getPublisher().getNo());
	
	List<GameImage> gameImages = gameImageDao.getGameImagesByGameNo(foundGame.getNo());
	// System.out.println(foundGame.getTitle());
%>
<div class="container">
<div>
	<h1>[<%=foundPublisher.getName() %>] <%=foundGame.getTitle() %></h1>
</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-sm-8">
					<div class="row">
						<div class="col-sm-12"></div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<img class="img-thumbnail" src="../resources/images/gameImages/<%=foundGame.getImageFileName() %>" id="img"
								style="width: 100%; max-width: 100%;">
						</div>
					</div>
					<div style="width: 750px; overflow:auto; white-space: nowrap;'">	<!-- 가로 스크롤바 기능 -->
						<!-- 자바스크립트로 구현하기 -->
						<%
							int count = 1;
							for (GameImage image : gameImages) {
						%>		
								<img class="img-thumbnail" style="width: 143px; max-width: 183px; height:81px; max-height: 81px;" src="../resources/images/gameImages/<%=image.getImage() %>" id="img<%=count++ %>" onclick="changeImg(event)">
						<%	
							}
						%>
					</div>
					
					<div class="row">
						<div class="col-sm-12">
							<ul class="nav nav-tabs" style="margin-top: 10px;">
								<li class="active"><a data-toggle="tab" href="#showTabMenu1">게임정보</a></li>
								<li><a data-toggle="tab" href="#showTabMenu2">시스템 요구사항</a></li>
							</ul>
						</div>
					</div>
						
					<div class="row">
						<div class="col-sm-12 tab-content" style="margin-top: 5px;">
							<div class="tab-pane fade in active" id="showTabMenu1">
								<textarea style="width: 750px; height: 400px;" rows="30"><%=foundGame.getIntro() %></textarea>
							</div>				
							<div class="tab-pane fade" id="showTabMenu2">
								<textarea style="width: 750px; height: 400px;" rows="30"><%=foundGame.getRequire() %></textarea>
							</div>
						</div>		
					</div>	
				</div>
				
				<div class="col-sm-4">
					<div class="row">
						<div class="col-sm-12">
							<img class="img" src="../resources/images/gameImages/<%=foundGame.getImageFileName() %>" width="375px;" height="120px;">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3" style="padding: 10px 1px 0px 0px;">
							<div class="col-sm-12">
								<span style="font-size: 14px;">정상가</span>
							</div>
							<div class="col-sm-12">
								<span style="font-size: 14px;">할인가</span>
							</div>
						</div>
						<div class="col-sm-9" style="padding: 10px 1px 0px 0px;">
							<div class="col-sm-12">
								<span style="font-size: 14px;"><del><%=NumberUtils.numberWithComma(foundGame.getPrice()) %> 원</del></span>
							</div>
							<div class="col-sm-12">
								<span style="font-size: 18px;"><strong><%=NumberUtils.numberWithComma(foundGame.getDiscountPrice()) %> 원</strong></span>
							</div>
						</div>
					</div>
					<div class="row" style="border-top: 1px solid grey">
						<div class="col-sm-3" style="padding: 10px 1px 0px 0px;">
							<div class="col-sm-12">
								<span style="font-size: 14px;">출시일</span>
							</div>
							<div class="col-sm-12">
								<span style="font-size: 14px;">장르</span>
							</div>
							<div class="col-sm-12">
								<span style="font-size: 14px;">퍼블리셔</span>
							</div>
						</div>
						<div class="col-sm-9" style="padding: 10px 1px 0px 0px;">
							<div class="col-sm-12">
							<%
								SimpleDateFormat date = new SimpleDateFormat("yy.MM.dd");
							%>
								<span style="font-size: 14px;"><%=date.format(foundGame.getCreateDate()) %></span>
							</div>
							<div class="col-sm-12">
								<span style="font-size: 14px;"><%=foundGenre.getName() %></span>
							</div>
							<div class="col-sm-12">
								<span style="font-size: 14px;"><%=foundPublisher.getName() %></span>
							</div>
							<div class="col-sm-12">
							<%int pageNo = 1; %>
							<%
								GameLikeDao gameLikeDao = GameLikeDao.getInstance();
								GameLike gameLike = new GameLike();
								gameLike.setGame(foundGame);
								gameLike.setUser(loginedUser);
								int likeCnt = gameLikeDao.selectGameLikeCntByNo(gameLike);
								// 좋아요 한 경우
								if(likeCnt == 1) {
							%>
								<a href="gamelike.jsp?gameno=<%=gameNo %>&pageno=<%=pageNo %>" id="like" class="btn btn-counter pull-right" data-count="<%=foundGame.getLikeCount() %>" 
								style="text-shadow: 0 1px 0 #b12f27; background-color: #f64136; border-color: #b12f27;" >
								<span style="color: white; text-shadow: 0 1px 0 rgba(255,255,255,0.3);">&#x2764;</span></a>
							<% 
									
								} else {
							%>
								<a href="gamelike.jsp?gameno=<%=gameNo %>&pageno=<%=pageNo %>" id="like" class="btn btn-counter pull-right" data-count="<%=foundGame.getLikeCount() %>"  ><span>&#x2764;</span></a>
							<%		
								}
							%>
								
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12"
							style="border-top: 1px solid grey; text-align: center; padding-top: 15px;">
							<a href="addcart.jsp?gameno=<%=foundGame.getNo() %>" class="btn btn-warning"><span
								class="glyphicon glyphicon glyphicon-shopping-cart"></span> 장바구니
								담기</a> <a href="orderdirectform.jsp?gameno=<%=foundGame.getNo() %>" class="btn btn-danger">구매</a>
						</div>
					</div>
				</div>		
			</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../common/footer.jsp"%>
<script type="text/javascript">
		function changeImg(e) {
		e.preventDefault();
		
		var imagePath = e.target.getAttribute("src");
		
		// document.querySelector("#img") --> <img/> 엘리먼트
		document.querySelector("#img").setAttribute("src", imagePath);
	}
</script>
</html>