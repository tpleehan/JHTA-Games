<%@page import="com.semi4.vo.Comment"%>
<%@page import="com.semi4.dao.CommentDao"%>
<%@page import="com.semi4.vo.ReviewBoard"%>
<%@page import="com.semi4.dao.ReviewBoardDao"%>
<%@page import="com.semi4.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pageNo = Integer.parseInt(request.getParameter("pageno"));
	String content = request.getParameter("commentcontent");
	int reviewNo = Integer.parseInt(request.getParameter("reviewno"));
	ReviewBoardDao reviewboardDao = ReviewBoardDao.getInstance();
	ReviewBoard board =  reviewboardDao.getReviewBoardByNo(reviewNo);
	User loginedUser = (User) session.getAttribute("LOGINED_USER");
	String from = request.getParameter("from");
	
	Comment comment = new Comment();
	comment.setContent(content);
	comment.setReviewBoard(board);
	comment.setUser(loginedUser);
	
	CommentDao commentDao = CommentDao.getInstance();
	commentDao.insertComment(comment);
	
	response.sendRedirect("reviewboarddetail.jsp?pageno=" +pageNo + "&reviewno=" +reviewNo + "&from=" +from);
%>