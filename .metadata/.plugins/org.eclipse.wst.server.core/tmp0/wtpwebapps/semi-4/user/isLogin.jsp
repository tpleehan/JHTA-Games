<%@page import="com.semi4.vo.Admin"%>
<%@page import="com.semi4.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//세션 객체에서 LOGINED_ADMIN으로 저장된 관리자 객체 조회
	User checkUser = (User) session.getAttribute("LOGINED_User");
	
	if(checkUser == null) {
		
		response.sendRedirect("../loginform.jsp");
		return;
	}
	
%>