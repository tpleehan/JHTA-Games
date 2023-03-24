<%@page import="com.semi4.vo.GameLike"%>
<%@page import="com.semi4.dao.GameLikeDao"%>
<%@page import="com.semi4.dao.LikeDao"%>
<%@page import="com.semi4.vo.Game"%>
<%@page import="com.semi4.dao.GameDao"%>
<%@page import="com.semi4.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인여부 체크하기
	User user = (User) session.getAttribute("LOGINED_USER");
	if (user == null) {
		response.sendRedirect("../loginform.jsp?fail=deny");
		return;
	}
	
	int pageNo = Integer.parseInt(request.getParameter("pageno"));
	int gameNo = Integer.parseInt(request.getParameter("gameno"));
	
	GameDao gameDao = GameDao.getInstance();
	Game game = gameDao.getGameByNo(gameNo);
	
	GameLikeDao gameLikeDao = GameLikeDao.getInstance();
	GameLike gameLike = new GameLike();
	gameLike.setGame(game);
	gameLike.setUser(user);

	int count = gameLikeDao.selectGameLikeCntByNo(gameLike);
	if(count == 1) {
		gameLikeDao.deleteGameLikes(gameLike);
		int likeCnt = game.getLikeCount();
		likeCnt --;
		game.setLikeCount(likeCnt);
		gameDao.updateGame(game);
		
		response.sendRedirect("gamedetail.jsp?gameno="+gameNo+"&pageno="+pageNo);		
	}else {
		gameLikeDao.insertGameLikes(gameLike);
		int likeCnt = game.getLikeCount();
		likeCnt ++;	
		game.setLikeCount(likeCnt);
		gameDao.updateGame(game);
		
		response.sendRedirect("gamedetail.jsp?gameno="+gameNo+"&pageno="+pageNo);
		
	}
	
	
	
	
	
%>