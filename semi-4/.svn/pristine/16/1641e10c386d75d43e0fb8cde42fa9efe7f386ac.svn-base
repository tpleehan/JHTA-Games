<%@page import="com.semi4.vo.Like"%>
<%@page import="com.semi4.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.semi4.dao.CommentDao"%>
<%@page import="com.semi4.vo.Comment"%>
<%@page import="com.semi4.vo.ReviewBoard"%>
<%@page import="com.semi4.dao.ReviewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int reviewNo = Integer.parseInt(request.getParameter("reviewno"));
	CommentDao commentDao = CommentDao.getInstance();
	List<Comment> comments = commentDao.getCommentByReviewNo(reviewNo);

	LikeDao likeDao = LikeDao.getInstance();
	List<Like> like = likeDao.getlikeByNo(reviewNo);
	
	if (like != null) {
		likeDao.deletelikes(reviewNo);
	}
	
	if (comments != null) {
		for (Comment comment : comments) {
			commentDao.deleteComment(comment.getNo());
		}
	}

	ReviewBoardDao reviewboardDao = ReviewBoardDao.getInstance();
	ReviewBoard board = reviewboardDao.getReviewBoardByNo(reviewNo);
	
	reviewboardDao.deleteReviewboard(reviewNo);
	
	response.sendRedirect("reviewboard.jsp");
%>
