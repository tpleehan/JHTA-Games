<%@page import="com.semi4.vo.QnaBoard"%>
<%@page import="com.semi4.vo.QnaAnswer"%>
<%@page import="com.semi4.dao.QnaAnswerDao"%>
<%@page import="com.semi4.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("qnaboardno"));

	QnaBoardDao qnaboardDao = QnaBoardDao.getInstance();
	qnaboardDao.deleteQnaBoard(no);
	
	response.sendRedirect("qnaboarddelete.jsp");
	
%>