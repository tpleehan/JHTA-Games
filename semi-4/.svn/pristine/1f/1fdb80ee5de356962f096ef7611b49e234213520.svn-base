<%@page import="com.semi4.vo.NoticeBoard"%>
<%@page import="com.semi4.dao.NoticeBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	int boardNo = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int pageNo = Integer.parseInt(request.getParameter("pageno"));
	
	
	NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
	NoticeBoard noticeBoard = noticeBoardDao.getNoticeByNo(boardNo);
	
	noticeBoard.setTitle(title);
	noticeBoard.setContent(content);
	
	noticeBoardDao.updateNotice(noticeBoard);
	
	response.sendRedirect("noticeDetail.jsp?no="+boardNo+"&pageno="+pageNo);
%>