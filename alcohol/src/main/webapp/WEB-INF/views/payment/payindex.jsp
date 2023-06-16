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
		<header>
		<div class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container">
				<a href="#" class="navbar-brand d-flex align-items-center"> 
				
						<path
							d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
						<circle cx="12" cy="13" r="4"></circle></svg> <strong>Album</strong>
				</a>


				<c:url var="paymain" value="/payment/payindex">
				</c:url>
				<a href="${paymain}">결제하기</a>

				<c:url value="/bulletinboard/board/list" var="boardList" >
                    <c:param name="num" value="0" />
                </c:url>
				<a href="${ boardList }" class="text-danger">커뮤니티</a>

				<c:url var="homePage" value="/bulletinboard/board/home" />
				<a href="${ homePage }">임시홈페이지</a>

				<input class="d-none" type="text" id="userid" name="userid" value="${ sessionScope.userNickname }" readonly="readonly"/>
				<span>${ sessionScope.userNickname }</span>
				<span style="corlor:white">로그아웃</span>
				<span>마이페이지</span>
			</div>
		</div>
	</header>
	</header>
	<div class="mx-2 my-3 text-center">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
  		<path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"></path>
		</svg>
		장바구니
	</div>
	<div class="card mx-2">
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
						<input id="price-${ basket.basketid }" value="${ basket.price }" class="d-none">	
						<label>${basket.brandname}</label>
						<hr>
						<label>${basket.pname}</label>
						<br> 
						<br> 
						<label style="text-align: left;">상품금액 ${ basket.price }</label>
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
			<input id="paymentSubmit" class="btn" type="submit" value="주문하기">
		</div>
			</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="./static/js/basket2.js"></script>
</body>
</html>
