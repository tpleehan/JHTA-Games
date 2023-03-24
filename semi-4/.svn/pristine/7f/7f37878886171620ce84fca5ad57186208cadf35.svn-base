<%@page import="com.semi4.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pageNo = Integer.parseInt(request.getParameter("pageno"));
	int reviewNo = Integer.parseInt(request.getParameter("reviewno"));
	int comNo = Integer.parseInt(request.getParameter("commentno"));
	String from = request.getParameter("from");
	
	CommentDao commentDao = CommentDao.getInstance();
	commentDao.deleteComment(comNo);
	
	response.sendRedirect("reviewboarddetail.jsp?pageno=" +pageNo + "&reviewno=" +reviewNo + "&from=" +from);
%>