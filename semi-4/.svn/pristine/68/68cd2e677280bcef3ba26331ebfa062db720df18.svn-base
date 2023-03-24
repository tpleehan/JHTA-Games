<%@page import="com.semi4.dao.CartDao"%>
<%@page import="com.semi4.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인여부 체크하기
	User user = (User) session.getAttribute("LOGINED_USER");
	if (user == null) {
		response.sendRedirect("../loginform.jsp?fail=deny");
		return;
	}
	
	CartDao cartDao = CartDao.getInstance();
	cartDao.deleteAllMyCart(user.getNo());
	
	response.sendRedirect("cart.jsp");
%>