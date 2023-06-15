<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>

<body>

	<header>
		<h1>장바구니 페이지</h1>
	</header>
	<hr />
	<h4 class="mx-2 text-center">장바구니</h4>
	<div class="card">
		<c:url var="paymentmain" value="/payment/paymentmain"/>
		<form id="myForm" action="${ paymentmain }" method="post">
		<div class="card-header">
			<input type="checkbox" id="allCheckbox" name="allCheckbox"/> 
			<label class="py-6" for="allCheckbox">전체선택</label> 
			<span class="btn" id="btnDeleteBasket" >삭제</span>
		</div>
		
		<div class="card-boby">
				<c:forEach var="basket" items="${list}">
					<div id="div-${ basket.basketid }" class="btn">
						<input type="checkbox" id="checkbox-${ basket.basketid }" data-id="${ basket.basketid }" name="checkbox"> 
						<input id="productid-${ basket.basketid }" value="${ basket.productid }" class="d-none">
						<input id="basketid-${ basket.basketid }" value="${ basket.basketid }" class="d-none">	
						<label>${basket.brandname}</label>
						<hr>
						<label>${basket.pname}</label>
						<br> 
						<label>상품금액 ${ basket.price }</label>
						<br>
						<label>주문수량</label>
						<input
							style="width: 50px;" id="quantity-${basket.basketid}" data-id="${ basket.basketid }"
							type="number" value="${basket.quantity}" data-name="inputQuantity" data-initQuantity="${ basket.quantity }"> 
						<input class="d-none" id="price-${ basket.basketid }" value="${ basket.price }" data-id="${ basket.basketid }">
						<br>
						<label>주문금액</label> 
						<span id="orderAmount-${basket.basketid}" class="mx-2" 
							  data-value="${(basket.quantity * basket.price)}">
							${(basket.quantity * basket.price)}원
						</span>
						<hr>
					</div>
				</c:forEach>
		</div>
		
		<div class="card-footer">
			<label>총 주문금액</label> <label id="totalAmount" data-totalAmount="0">0원</label> 
			<br>
			<input id="paymentSubmit" class="btn" type="submit" value="결제하기">
		</div>
			</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="./static/js/basket2.js"></script>
</body>
</html>
