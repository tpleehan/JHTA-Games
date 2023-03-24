<%@page import="com.semi4.vo.QnaBoard"%>
<%@page import="com.semi4.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int no = Integer.parseInt(request.getParameter("qnaboardno"));
	String title = request.getParameter("qnaboardtitle");
	String content = request.getParameter("qnaboardcontent");
	
	QnaBoardDao qnaBoardDao = QnaBoardDao.getInstance();
	QnaBoard qnaBoard = qnaBoardDao.getBoardByQnaNo(no);
	
	qnaBoard.setTitle(title);
	qnaBoard.setContent(content);
	
	qnaBoardDao.updateQnaBoard(qnaBoard);
	
	response.sendRedirect("qnaboardmodifiedresult.jsp");
%>