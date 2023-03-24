<%@page import="com.semi4.dao.NoticeBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));

	NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
	noticeBoardDao.deleteNoticeByNo(no);
	
	response.sendRedirect("deleteCheckPopup.jsp?result=delete&no=" + no);
%>