<%@page import="com.semi4.vo.Profit"%>
<%@page import="com.semi4.dao.ProfitDao"%>
<%@page import="com.semi4.vo.PurchaseItem"%>
<%@page import="com.semi4.vo.Purchase"%>
<%@page import="com.semi4.vo.Game"%>
<%@page import="com.semi4.dao.PurchaseItemDao"%>
<%@page import="com.semi4.dao.PurchaseDao"%>
<%@page import="com.semi4.dao.GameDao"%>
<%@page import="com.semi4.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인여부 체크
	User user = (User) session.getAttribute("LOGINED_USER");
	if (user == null) {
		response.sendRedirect("../loginform.jsp?fail=deny");
	}
	
	int gameNo = Integer.parseInt(request.getParameter("gameno"));
	
	GameDao gameDao = GameDao.getInstance();
	PurchaseDao purchaseDao = PurchaseDao.getInstance();
	PurchaseItemDao purchaseItemDao = PurchaseItemDao.getInstance();
	
	int totalPrice = 0;
	
	Game foundGame = gameDao.getGameByNo(gameNo);
	totalPrice = foundGame.getDiscountPrice();
	
	int purchaseNo = purchaseDao.getPurchaseNo();
	
	Purchase purchase = new Purchase();
	purchase.setNo(purchaseNo);
	purchase.setUser(user);
	purchase.setTotalPrice(totalPrice);
		
	purchaseDao.insertPurchase(purchase);
	
	PurchaseItem purchaseItem = new PurchaseItem();
	purchaseItem.setPurchase(purchase);
	purchaseItem.setGame(foundGame);
	purchaseItem.setAmount(1);
	purchaseItem.setPrice(foundGame.getDiscountPrice());
	
	purchaseItemDao.insertPurchaseItem(purchaseItem);
	
	// Profit DB에 수익정보 담기
	ProfitDao profitDao = ProfitDao.getInstance();
	Profit profit = new Profit();
	profit.setGenre(foundGame.getGenre());
	profit.setPublisher(foundGame.getPublisher());
	profit.setSales(foundGame.getDiscountPrice());
	
	profitDao.insertProfits(profit);
	
	response.sendRedirect("successpaydirect.jsp?purchaseno=" + purchaseNo);
%>