<%@page import="com.semi4.vo.ReviewBoard"%>
<%@page import="com.semi4.dao.ReviewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int pageNo = Integer.parseInt(request.getParameter("pageno"));
	int reviewNo = Integer.parseInt(request.getParameter("reviewno"));
	String title = request.getParameter("reviewtitle");
	String content = request.getParameter("reviewcontent");
	
	ReviewBoardDao reviewboardDao = ReviewBoardDao.getInstance();
	ReviewBoard board = reviewboardDao.getReviewBoardByNo(reviewNo);
	board.setTitle(title);
	board.setContent(content);
	
	reviewboardDao.updateReviewboard(board);
	
	response.sendRedirect("reviewmodifiedresult.jsp");
	
%>