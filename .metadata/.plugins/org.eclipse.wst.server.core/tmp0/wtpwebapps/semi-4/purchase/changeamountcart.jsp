<%@page import="com.semi4.dao.CartDao"%>
<%@page import="com.semi4.vo.Game"%>
<%@page import="com.semi4.vo.Cart"%>
<%@page import="com.semi4.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인여부 체크하기
	User user = (User)session.getAttribute("LOGINED_USER");
	if (user == null) {
		response.sendRedirect("../loginform.jsp?fail=deny");
		return;
	}
	
	// 불러오기
	int cartNo = Integer.parseInt(request.getParameter("cartno")); 
	int cartAmount = Integer.parseInt(request.getParameter("amount")); 
	
	CartDao cartDao = CartDao.getInstance();
	Cart foundCart = cartDao.getCarItemtByCartNo(cartNo);
	
	foundCart.setAmount(cartAmount);
	cartDao.updateCartItemAmount(foundCart);
	
	response.sendRedirect("cart.jsp");
%>