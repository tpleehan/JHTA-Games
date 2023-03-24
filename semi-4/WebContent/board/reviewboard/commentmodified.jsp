<%@page import="com.semi4.vo.User"%>
<%@page import="com.semi4.vo.Comment"%>
<%@page import="com.semi4.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	

	User loginedUser = (User) session.getAttribute("LOGINED_USER");
	int pageNo = Integer.parseInt(request.getParameter("pageno"));
	int comNo = Integer.parseInt(request.getParameter("commentno"));
	String content = request.getParameter("commentcontent");
	String from = request.getParameter("from");

	System.out.println(comNo + "," + content);
	
	CommentDao commentDao = CommentDao.getInstance();
	Comment comment = commentDao.getCommentByNo(comNo);
	
	comment.setContent(content);
	commentDao.updateComment(comment);

	int reviewNo = comment.getReviewBoard().getNo();
	
	response.sendRedirect("reviewboarddetail.jsp?pageno=" +pageNo + "&reviewno=" +reviewNo + "&from=" +from);
%>