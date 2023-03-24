<%@page import="com.semi4.dao.QnaAnswerDao"%>
<%@page import="com.semi4.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int qnaNo = Integer.parseInt(request.getParameter("qnaboardno"));

	QnaAnswerDao qnaanswerDao = QnaAnswerDao.getInstance();
	qnaanswerDao.deleteQnaAnswerbyQnaNo(qnaNo);

	QnaBoardDao qnaboardDao = QnaBoardDao.getInstance();
	qnaboardDao.deleteQnaBoard(qnaNo);
	
	response.sendRedirect("qnaboarddelete.jsp");
%>