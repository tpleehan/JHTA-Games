<%@page import="com.semi4.vo.QnaAnswer"%>
<%@page import="com.semi4.dao.QnaAnswerDao"%>
<%@page import="com.semi4.utils.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int pageNo = Integer.parseInt(request.getParameter("pageno"));
	int no = NumberUtils.stringToNumber(request.getParameter("qnano"));
	String content = request.getParameter("qnacontent");
	
	QnaAnswerDao qnaAnswerDao = QnaAnswerDao.getInstance();
	QnaAnswer answer = qnaAnswerDao.getQnaAnswerByNo(no);
		
	answer.setContent(content);	
	qnaAnswerDao.updateQnaAnswer(answer);
	
	response.sendRedirect("qnaboarddetail.jsp?qnaboardno=" + no + "&pageno=" + pageNo);
%>