<%@page import="com.semi4.vo.Like"%>
<%@page import="com.semi4.dao.LikeDao"%>
<%@page import="com.semi4.vo.ReviewBoard"%>
<%@page import="com.semi4.dao.ReviewBoardDao"%>
<%@page import="com.semi4.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User loginedUser = (User) session.getAttribute("LOGINED_USER");
	int pageNo = Integer.parseInt(request.getParameter("pageno"));
	int reviewNo = Integer.parseInt(request.getParameter("reviewno"));
	String from = request.getParameter("from");
	
	//좋아요 마이너스
	ReviewBoardDao reviewboardDao = ReviewBoardDao.getInstance();
	ReviewBoard board = reviewboardDao.getReviewBoardByNo(reviewNo);
	int likeCount = board.getLikeCount();
	likeCount--;
	board.setLikeCount(likeCount);
	reviewboardDao.updateReviewboardlike(board);
	
	//라이크객체 삭제
	LikeDao likeDao = LikeDao.getInstance();
	likeDao.deletelikes(reviewNo);
	
	response.sendRedirect("reviewboarddetail.jsp?pageno=" +pageNo + "&reviewno=" +reviewNo + "&from=" +from);
%>