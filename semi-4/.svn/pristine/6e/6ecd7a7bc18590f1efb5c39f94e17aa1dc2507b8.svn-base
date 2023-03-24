<%@page import="com.semi4.dao.QnaAnswerDao"%>
<%@page import="com.semi4.vo.Admin"%>
<%@page import="com.semi4.dao.AdminDao"%>
<%@page import="com.semi4.vo.QnaBoard"%>
<%@page import="com.semi4.dao.QnaBoardDao"%>
<%@page import="com.semi4.vo.QnaAnswer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	Admin admin = (Admin) session.getAttribute("LOGINED_ADMIN");
	String content = request.getParameter("answerwriting");
	int pageNo = Integer.parseInt(request.getParameter("pageno"));
	int qnaNo = Integer.parseInt(request.getParameter("answerqnano"));
	
	QnaBoardDao qnaboardDao = QnaBoardDao.getInstance();
	QnaBoard board = qnaboardDao.getBoardByQnaNo(qnaNo);
		
	QnaAnswer answer = new QnaAnswer();	
	answer.setAdmin(admin);
	answer.setContent(content);
	answer.setQnaBoard(board);
	
	QnaAnswerDao qnaAnswerDao = QnaAnswerDao.getInstance();
	qnaAnswerDao.insertQnaAnswer(answer);
	
	response.sendRedirect("qnaboarddetail.jsp?qnaboardno=" + qnaNo + "&pageno=" + pageNo);
%>