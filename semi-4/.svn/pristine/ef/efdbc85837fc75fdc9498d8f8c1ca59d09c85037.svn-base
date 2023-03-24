<%@page import="com.semi4.vo.Profit"%>
<%@page import="com.semi4.dao.ProfitDao"%>
<%@page import="com.semi4.dao.PurchaseItemDao"%>
<%@page import="com.sun.org.apache.xpath.internal.FoundIndex"%>
<%@page import="com.semi4.dao.GameDao"%>
<%@page import="com.semi4.dao.CartDao"%>
<%@page import="com.semi4.vo.Cart"%>
<%@page import="com.semi4.vo.Game"%>
<%@page import="com.semi4.dao.PurchaseDao"%>
<%@page import="com.semi4.vo.PurchaseItem"%>
<%@page import="com.semi4.vo.Purchase"%>
<%@page import="com.semi4.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인여부 체크
	User user = (User) session.getAttribute("LOGINED_USER");
	if (user == null) {
		response.sendRedirect("../loginform.jsp?fail=deny");
		return;
	}
	
	String[] cartNos = request.getParameterValues("cartno");
	
	CartDao cartDao = CartDao.getInstance();
	GameDao gameDao = GameDao.getInstance();
	PurchaseDao purchaseDao = PurchaseDao.getInstance();
	PurchaseItemDao purchaseItemDao = PurchaseItemDao.getInstance();

	int totalPrice = 0;
	
	for (String cartNo : cartNos) {
		Cart foundCart = cartDao.getCarItemtByCartNo(Integer.parseInt(cartNo));	
		Game foundGame = gameDao.getGameByNo(foundCart.getGame().getNo());
		
		totalPrice += foundGame.getDiscountPrice() * foundCart.getAmount();
	}

	int purchaseNo = purchaseDao.getPurchaseNo();
	
	Purchase purchase = new Purchase();
	purchase.setNo(purchaseNo);
	purchase.setUser(user);
	purchase.setTotalPrice(totalPrice);
	
	purchaseDao.insertPurchase(purchase);
	
	
	for (String cartNo : cartNos) {
		Cart foundCart = cartDao.getCarItemtByCartNo(Integer.parseInt(cartNo));	
		Game foundGame = gameDao.getGameByNo(foundCart.getGame().getNo());
		
		totalPrice += foundGame.getDiscountPrice() * foundCart.getAmount();
		
		PurchaseItem purchaseItem = new PurchaseItem();
		purchaseItem.setPurchase(purchase);
		purchaseItem.setGame(foundGame);
		purchaseItem.setAmount(foundCart.getAmount());
		purchaseItem.setPrice(foundGame.getDiscountPrice());
		
		purchaseItemDao.insertPurchaseItem(purchaseItem);
		
		// 수익 정보 DB에 담기
		ProfitDao profitDao = ProfitDao.getInstance();
		Profit profit = new Profit();
		profit.setGenre(foundGame.getGenre());
		profit.setPublisher(foundGame.getPublisher());
		
		int sales = foundGame.getDiscountPrice() * foundCart.getAmount();
		profit.setSales(sales);
		profitDao.insertProfits(profit);
	
		// 구매한 카트 삭제하기
		cartDao.deleteCartItem(foundCart);
	}
	
	
	
	response.sendRedirect("successpay.jsp?purchaseno=" + purchaseNo);
%>