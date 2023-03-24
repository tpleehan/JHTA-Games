<%@page import="com.semi4.utils.NumberUtils"%>
<%@page import="com.semi4.dao.GameDao"%>
<%@page import="com.semi4.vo.Game"%>
<%@page import="com.semi4.vo.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.semi4.dao.CartDao"%>
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
<%@ include file="../common/navbar.jsp"%>
<%
	if (loginedUser == null) {
		response.sendRedirect("../loginform.jsp");
		return;
	}
%>
<div class="container">
<div class="row" style="margin-bottom: 10px;">
	<div class="col-sm-12" style="margin-bottom: 10px;">
		 <span style="font-size: 30px;"><%=loginedUser.getName() %> 님의 장바구니입니다.</span>
	</div>
	
	<div class="docs-section col-sm-12">
					<p class="text-danger"><strong>※ JHTA Games의 정상가 기준은 소비자 금액으로 적용 되었습니다.</strong></p>
					<p class="text-danger"><strong>※ 장바구니는 최소 1개의 상품을 선택 후 주문을 하시길 바랍니다.</strong></p>
					<p class="text-danger"><strong>※ 상품할인 이벤트 시 상품을 구매할 때 가격을 유의하시길 바랍니다. (모든 상품을 이벤트를 하지 않기 때문에 일부상품은 제외될수 있습니다.)</strong></p>
	<div class="col-sm-12" style="border-bottom: 1px solid grey;"></div>
	</div><br/>
	
	<%
		CartDao cartDao = CartDao.getInstance();
		List<Cart> carts = cartDao.getCartItemsByUserNo(loginedUser.getNo());
	%>
	<form id="cart-form" class="form-inline" action="deleteselectedcart.jsp" method="get">
	<div class="col-sm-12">
		<table class="table">
			<thead>
				<tr>
					<th><input type="checkbox" id="ck-all" onchange="changeAllAndNone()"/></th>
					<th>이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>할인가격</th>
					<th>합계</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<%
				if (carts.isEmpty()) {
			%>
				<tr>
					<td colspan="8" class="text-center">장바구니에 담긴 상품이 없습니다</td>
				</tr>
			<%
				} else {
					for (Cart cart : carts) {
			%>
				<tr>
					<td><input type="checkbox" name="cartno" value="<%=cart.getNo() %>" onchange="updateTotalPrice()"></td>
					<td><img src="../resources/images/gameImages/<%=cart.getGame().getImageFileName() %>" width="220px;" height="100px;"></td>
					<td><a href="gamedetail.jsp?gameno=<%=cart.getGame().getNo() %>"><%=cart.getGame().getTitle() %></a></td>
					<td>
						<select class="form-control" id="amount-<%=cart.getNo() %>" style="margin-bottom: 10px;">
							<option value="1" <%=1 ==cart.getAmount()?"selected":"" %> >1</option>
							<option value="2" <%=2 ==cart.getAmount()?"selected":"" %> >2</option>
							<option value="3" <%=3 ==cart.getAmount()?"selected":"" %> >3</option>
							<option value="4" <%=4 ==cart.getAmount()?"selected":"" %> >4</option>
							<option value="5" <%=5 ==cart.getAmount()?"selected":"" %> >5</option>
							<option value="6" <%=6 ==cart.getAmount()?"selected":"" %> >6</option>
							<option value="7" <%=7 ==cart.getAmount()?"selected":"" %> >7</option>
							<option value="8" <%=8 ==cart.getAmount()?"selected":"" %> >8</option>
							<option value="9" <%=9 ==cart.getAmount()?"selected":"" %> >9</option>					
						</select>
					</td>
					<td><del id="p-<%=cart.getNo() %>"><%=NumberUtils.numberWithComma(cart.getGame().getPrice()) %> 원</del></td>
					<td><span id="dp-<%=cart.getNo() %>"><%=NumberUtils.numberWithComma(cart.getGame().getDiscountPrice()) %></span> 원</td>
					<td><strong id="sp-<%=cart.getNo() %>"><%=NumberUtils.numberWithComma(cart.getGame().getDiscountPrice() * cart.getAmount()) %></strong> 원</td>
					<td><a href="" class="btn btn-info btn-xs" onclick="updateAmount(<%=cart.getNo() %>, event)">변경</a></td>
					<td><a href="deletecart.jsp?cartno=<%=cart.getNo() %>" class="btn btn-danger btn-xs">삭제</a></td>
				</tr>
			<%
					}
				}
			%>
				<tr>
					<td colspan="9">
						<a href="deleteallcart.jsp" class="btn btn-default">전체 삭제</a>
						<button class="btn btn-default" onclick="delSelectedItem(event)">선택 삭제</button>
					</td>
				</tr>
				<tr>
					<td colspan="7">합계:</td>
					<td colspan="2"><strong id="total-price-box"></strong>원</td>
				</tr>
			</tbody>
		</table>
	</div>
	</form>
	<div class="row">
		<!-- text-right 오른쪽 정렬 -->
		<div class="col-sm-12 text-right">	
			<a href="gamemenu.jsp" class="btn btn-danger btn-lg">홈으로</a>
			<a href="#" onclick="selectOrder(event)" class="btn btn-primary btn-lg">주문하기</a>
		</div>
	</div>
</div>
</div>
</body>
<%@ include file="../common/footer.jsp"%>
<script type="text/javascript">
	
	function selectOrder(event) {
		event.preventDefault();
		// checkbox 접근 후 체크된 개수 파악하기
		var checkedSize = document.querySelectorAll("input[name='cartno']:checked").length;
		if (checkedSize == 0) {
			alert("선택된 상품이 없습니다.");
			return;
		}
		
		// getElementById("cart-form")을 호출해서 .setAttribute(action을 orderform.jsp)로 바꾸기
		document.getElementById("cart-form").setAttribute("action", "orderform.jsp")
		// 수정한 cart-form을 보내기
		document.getElementById("cart-form").submit();
	}
	
	function changeAllAndNone() {
		// 전체 체크박스의 현재 체크여부 조회하기
		var checkedStatus = document.querySelector("#ck-all").checked;
		
		// name이 "ck-gameno"인 모든 엘리먼트를 호출하기
		var checkBoxes = document.querySelectorAll("input[name='cartno']");
		
		for (var i=0; i<checkBoxes.length; i++) {
			var checkBox = checkBoxes[i];
			checkBox.checked = checkedStatus;
		}
		updateTotalPrice();
	}
	
	function updateAmount(cartNo, e) {
		e.preventDefault();
		var amount = document.getElementById("amount-" + cartNo).value;
		
		// 주소창에 주소를 바꾼다 : location.href
		location.href="changeamountcart.jsp?cartno=" + cartNo + "&amount=" + amount;
	}
	
	function delSelectedItem(e) {
		event.preventDefault();
		var checkedBox= document.querySelectorAll("input[name='cartno']:checked");
		if (checkedBox.length == 0) {
			alert("선택된 상품이 없습니다.");
			return;
		}
		document.getElementById("cart-form").submit();
	}
	
	function updateTotalPrice() {
		var totalBox = document.getElementById("total-price-box")
		
		var checkedCheckBoxes = document.querySelectorAll("input[name='cartno']:checked");
		if (checkedCheckBoxes.length == 0) {
			totalBox.textContent = 0;
			return;
		}
		
		var totalPrice = 0
		for (var i=0; i<checkedCheckBoxes.length; i++) {
			var checkbox = checkedCheckBoxes[i];
			var cartno = checkbox.value;
			
			var str = document.getElementById("sp-"+cartno).textContent;
			str = str.replace(/,/g, "");
			var sumPrice = parseInt(str);
			totalPrice += sumPrice;
		}
		var currency = new Number(totalPrice);
		totalBox.textContent = currency.toLocaleString();
	}
	
	
</script>
</html>