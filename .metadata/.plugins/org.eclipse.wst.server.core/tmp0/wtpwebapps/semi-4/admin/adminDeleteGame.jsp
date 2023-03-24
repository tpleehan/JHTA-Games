<%@page import="com.semi4.dao.CartDao"%>
<%@page import="com.semi4.dao.PurchaseItemDao"%>
<%@page import="com.semi4.vo.GameImage"%>
<%@page import="java.util.List"%>
<%@page import="com.semi4.dao.GameImageDao"%>
<%@page import="com.semi4.vo.Admin"%>
<%@page import="com.semi4.vo.Game"%>
<%@page import="com.semi4.dao.GameDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	int gameNo = Integer.parseInt(request.getParameter("gameno"));
	String password = request.getParameter("password");
	Admin loginedAdmin = (Admin) session.getAttribute("LOGINED_ADMIN");
	String adminPassword = loginedAdmin.getPassword();
	//관리자 비밀번호 확인 후 비밀번호가 일치하지 않으면 수정/삭제 페이지로 돌려보내기
	if(password != null) {
		if(!password.equals(adminPassword)) {
			response.sendRedirect("adminDeleteGameForm.jsp?result=pwderror&gameno="+gameNo+"");
			return;
		}
	}
	
	
	GameDao gameDao = GameDao.getInstance();
	//입력받은 게임번호로 등록되어 있는 GameImage 삭제하기
	GameImageDao gameImageDao = GameImageDao.getInstance();
	gameImageDao.deleteGameImagesByGameNo(gameNo);
	
	//삭제한 게임의 구매내역 삭제하기
	PurchaseItemDao purchaseItemDao = PurchaseItemDao.getInstance();
	purchaseItemDao.deletePurchaseItemByGameNo(gameNo);
	//장바구니 삭제하기
	CartDao cartDao = CartDao.getInstance();
	cartDao.deleteCartByGameNo(gameNo);
	// 게임 삭제하기
	gameDao.deleteGameByNo(gameNo);
	
	

	response.sendRedirect("adminEditGameForm1.jsp?result=delete");
%>
