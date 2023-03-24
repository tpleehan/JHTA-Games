<%@page import="com.semi4.vo.User"%>
<%@page import="com.semi4.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// 비밀번호	
	String password = request.getParameter("userpwd");

	// 싱글톤방식으로 생성된 UserDao객체 획득
	UserDao userDao = UserDao.getInstance();

	// 세션에 있는 유저의 정보들을 가져와 변경할 유저정보를 DB에 저장
	User user = (User) session.getAttribute("LOGINED_USER");
	userDao.dropOutUser(user.getNo());
	
	// 회원탈퇴 후 홈으로 이동
	session.invalidate();	// 세션을 무효화시킨다. session을 재시작하여 저장된 정보를 날려버린다.
	response.sendRedirect("../home.jsp");
	
	

%>