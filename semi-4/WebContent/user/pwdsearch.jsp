<%@page import="com.semi4.vo.User"%>
<%@page import="com.semi4.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String userId = request.getParameter("userid");
	String userEmail = request.getParameter("useremail");
	
	UserDao userDao = UserDao.getInstance();
	
	User user = userDao.getUserById(userId);
	
	if(user == null) {
		response.sendRedirect("pwdsearchform.jsp?fail=invalid");
		return;
	}
	
	if(!user.getEmail().equals(userEmail)) {
		response.sendRedirect("pwdsearchform.jsp?fail=invalid");
		return;
	}
	
	if("N".equals(user.getEnabled())) {
		response.sendRedirect("pwdsearchform.jsp?fail=exituser");
		return;
	}
	// 비밀번호 찾기 후 찾아진 비밀번호 폼으로 이동
	response.sendRedirect("pwdsearchcompletedform.jsp?userid="+userId);
%>