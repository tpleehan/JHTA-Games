<%@page import="com.semi4.dao.QnaAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int pageNo = Integer.parseInt(request.getParameter("pageno"));
	int no = Integer.parseInt(request.getParameter("qnano"));
	
	QnaAnswerDao qnaanswerDao = QnaAnswerDao.getInstance();
	qnaanswerDao.deleteQnaAnswerbyQnaNo(no);
	
	response.sendRedirect("qnaboarddetail.jsp?qnaboardno=" + no + "&pageno=" + pageNo);
%>