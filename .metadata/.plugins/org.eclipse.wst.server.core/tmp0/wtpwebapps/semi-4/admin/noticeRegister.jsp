<%@page import="com.semi4.vo.Admin"%>
<%@page import="com.semi4.dao.AdminDao"%>
<%@page import="com.semi4.vo.NoticeBoard"%>
<%@page import="com.semi4.dao.NoticeBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	// 입력받은 값 불러오기
	String title = request.getParameter("title");
	String adminId = request.getParameter("admin");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	// 읽어온 값 NoticeBoard 객체에 세팅하기
	NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
	NoticeBoard notice = new NoticeBoard();
	AdminDao adminDao = AdminDao.getInstance();
	Admin admin = adminDao.getAdminById(adminId);
	
	notice.setTitle(title);
	notice.setContent(content);
	notice.setAdmin(admin);
	
	// 세팅한 값 등록하기
	noticeBoardDao.insertNotice(notice);
	
	response.sendRedirect("adminNotice.jsp?result=success");
	
%>