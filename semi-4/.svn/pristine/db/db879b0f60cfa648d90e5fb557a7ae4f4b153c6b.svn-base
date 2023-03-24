<%@page import="com.semi4.dao.ReviewBoardDao"%>
<%@page import="com.semi4.vo.ReviewBoard"%>
<%@page import="com.semi4.vo.Purchase"%>
<%@page import="java.util.List"%>
<%@page import="com.semi4.vo.User"%>
<%@page import="com.semi4.dao.PurchaseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("reviewtitle");
	String content = request.getParameter("reviewcontent");
	int purchaseNo = Integer.parseInt(request.getParameter("reviewpurchaseno"));
	PurchaseDao purchaseDao = PurchaseDao.getInstance();
	Purchase purchase = purchaseDao.getPurchasesByPurchaseNo(purchaseNo);
	User loginedUser = (User) session.getAttribute("LOGINED_USER");
	int userNo = loginedUser.getNo();
	ReviewBoard board = new ReviewBoard();
	board.setPurchase(purchase);
	board.setTitle(title);
	board.setUser(loginedUser);
	board.setContent(content);
	String from = request.getParameter("from");
	
	ReviewBoardDao reviewboardDao = ReviewBoardDao.getInstance();
	reviewboardDao.insertReview(board);
	System.out.println("제목내용구매번호" + title + content + purchaseNo);
	
	response.sendRedirect("reviewboard.jsp");
	
%>
