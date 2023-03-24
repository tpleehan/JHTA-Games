<%@page import="com.semi4.dao.QnaBoardDao"%>
<%@page import="com.semi4.vo.User"%>
<%@page import="com.semi4.vo.QnaBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	User loginedUser = (User) session.getAttribute("LOGINED_USER");
	String title = request.getParameter("qnaboardtitle");
	String content = request.getParameter("qnaboardcontent");
	
	QnaBoard qnaBoard = new QnaBoard();
	qnaBoard.setTitle(title);
	qnaBoard.setContent(content);
	qnaBoard.setUser(loginedUser);
	
	QnaBoardDao qnaBoardDao = QnaBoardDao.getInstance();
	qnaBoardDao.insertQnaBoard(qnaBoard);
	
	response.sendRedirect("qnaboard.jsp");
		
%>