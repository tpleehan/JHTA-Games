<%@page import="com.semi4.vo.Pagination1"%>
<%@page import="com.semi4.dao.PurchaseItemDao"%>
<%@page import="com.semi4.vo.PurchaseItem"%>
<%@page import="com.semi4.vo.Purchase"%>
<%@page import="com.semi4.dao.PurchaseDao"%>
<%@page import="com.semi4.utils.NumberUtils"%>
<%@page import="com.semi4.utils.DateUtil"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
     <title></title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body>
<%@ include file="../common/navbar.jsp" %>

<%
   if (loginedUser == null) {
      response.sendRedirect("../loginform.jsp");
      return;
   }
%>
<%
	PurchaseDao purchaseDao = PurchaseDao.getInstance();
    List<Purchase> purchases = purchaseDao.getPurchasesByUserNo(loginedUser.getNo());
   
    GameDao gameDao = GameDao.getInstance();
      
    PurchaseItemDao purchaseItemDao = PurchaseItemDao.getInstance();
    List<PurchaseItem> purchaseItems = purchaseItemDao.getAllPurchasesItems();
   
    //요청한 페이지 번호
    int pageNo = NumberUtils.stringToNumber(request.getParameter("pageno"), 1);
   
    //한페이지에 보여질 테이블개수 요청
    int record = NumberUtils.stringToNumber(request.getParameter("record"), 10);
   
    Map<String, Object> criteria = new HashMap<String, Object>();
    
    //총 데이터 개수
    int totalRows = purchaseDao.getOrderByCount(loginedUser.getNo());
    //페이징 처리에 필요한 값들을 제공하는 Pagination객체 생성
    Pagination1 pagination = new Pagination1(pageNo, totalRows, record);
   
    //데이터 조회
    criteria.put("begin", pagination.getBeginIndex());
    criteria.put("end", pagination.getEndIndex());    
    criteria.put("un", loginedUser.getNo());
   
    List<Purchase> orderpage = purchaseDao.getOrderByPage(criteria);
%>
<div class="wrap docs-section" style="height: 635px;">
   <div class="container">
   <form id="mypage-form" method="get" action="userorderform.jsp">
      <input type="hidden" id = "page-no" name="pageno" value="<%=pageNo %>">
      
      <div id="t3-content" class="t3-content col-xs-12" style="padding-top:0;">
         <div id="system-message-container"></div>
         <h1 style="font-size:30px">마이페이지</h1>
         <div class="layout container-fluid">
            <ul class="nav navbar-nav">
               <li class=""><a href="userinfoform.jsp" ><span>정보수정</span></a></li>
               <li class=""><a href="userorderform.jsp" ><span>주문내역</span></a></li>
               <li class=""><a href="userqnaform.jsp" ><span>Q&amp;A내역</span></a></li>
               <li class=""><a href="userreviewform.jsp" ><span>리뷰내역</span></a></li>
               <li class=""><a href="../purchase/cart.jsp" ><span>장바구니</span></a></li>
               <li class=""><a href="userleaveform.jsp" ><span>회원탈퇴</span></a></li>
            </ul>
         </div>
         <div class="container col-sm-12">
            <table class="table table-bordered">
               <thead>
                  <tr>
                  	<th style="width: 10%">결제번호</th>
			        <th style="width: 50%">상품명</th>
			        <th style="width: 10%">결제금액</th>
			        <th style="width: 10%">구매수량</th>
			        <th style="width: 12%">구매일자</th>
			        <th style="width: 8%">비고</th>
                   </tr>
               </thead>
               <tbody>
                <%
                   if (purchases.isEmpty()) {
                %>
                   <tr>
                      <td colspan="12" style="font-size: 40px; text-align: center">구매하신 내역이 없습니다.</td>
                   </tr>
                <%
                   } else {
                      List<PurchaseItem> itemss = purchaseItemDao.getOrderByOrderUser(criteria);
                      for (PurchaseItem it : itemss) {
                      
                %>            
                      <tr>
                          <td><%=it.getPurchase().getNo() %></td>
                          <td><%=it.getGame().getTitle() %></td>
                          <td><%=NumberUtils.numberWithComma(it.getAmount()*it.getPrice()) %>원</td>
                          <td><%=it.getAmount() %>개</td>
                          <td><%=DateUtil.dateToString(it.getPurchase().getCreateDate()) %></td>
                          <td></td>
                       </tr>
                <%
                      }
                   }
                %>
   
                </tbody>
            </table>
         </div>
         
         <div class="col-sm-12 text-center">
              <div class="row">
                  <ul class="pagination">
	                   <%
	                      if (pageNo > 1) {
	                   %>
	                   	  	  <li><a href="" onclick="searchBoards(<%=pageNo - 1%>, event)">&laquo;</a></li>
	                   <%
	                      }
	                   %>
	                       
	                   <%
	                      for (int num = pagination.getBeginPage(); num <= pagination.getTotalPageCount(); num++) {
	                   %>
		                      <li class="<%=pageNo == num ? "active" : "" %>">
		                         <a href="" onclick="searchBoards(<%=num %>, event)"><%=num %></a>
		                      </li>
	                   <%
	                      }
	                   %>
	                   <%
	                      if (pageNo < pagination.getTotalPageCount()) {
	                   %>
	                      	  <li><a href="" onclick="searchBoards(<%=pageNo + 1%>, event)">&raquo;</a></li>
	                   <%
	                      } 
	                   %>
	               </ul>
               </div>
           </div>
      </div>
      </form>
   </div>
</div> 
<script type="text/javascript">
   function searchBoards(pageno, e) {
         if (e) {
            e.preventDefault();
         }   
         // 전달받은 페이지번호를 form의 히든필드에 값으로 담는다.
         document.getElementById("page-no").value = pageno;
         // 폼을 서버로 보낸다.
         // 폼의 pageno, sort, record, searchopt, searchkeyword값이 서버로 제출된다.
         document.getElementById("mypage-form").submit();
   }
</script>
</body>
<%@ include file="../common/footer.jsp" %>
</html>