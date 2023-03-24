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

	// 변경할 비밀번호 DB에 저장
	User user = (User) session.getAttribute("LOGINED_USER");
	user.setPassword(password);
	
	// 회원의 비밀번호 변경하기 
	userDao.updateUserChagePwd(user);
	
	// 현재 페이지로 이동
	response.sendRedirect("usermodifiesform.jsp");

%>