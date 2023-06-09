<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>Payment</title>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
			crossorigin="anonymous">
	</head>
	
<body>
	<div class="container-fluid">
	   <header class="my-2 p-5 text-center text-bg-dark">
	       <h1>주문이 완료 되었습니다.</h1>
	   </header>
	</div>
	
	
	<c:url var="payment" value="/payment/information" />
    <form id="paymentForm" method="get" action="${ payment }">
	
	<nav>
		<div>
			<label for="name" >주문자 이름</label>
			<input type="text" id="name" name="name" value="${ name }" readonly />
		</div>
		<div>
			<label for="productCount">상품 수량</label>
			<input type="text" id="productCount" name="productCount" value="${ productCount }" readonly />
		</div>
		<div>
			<label for="productPrice">상품 가격</label>
			<input type="text" id="productPrice" name="productPrice" value="${ productPrice }" readonly />
		</div>
		<div>
			<label for="totalPrice">총 결제금액</label>
			<input type="text" id="totalPrice" name="totalPrice" value="${ totalPrice }" readonly />
		</div>	
	</nav>
	</form>
	<div>
		<button id="btnPaymentDetail">주문 상세목록</button>
		<button id="btnMainPage">쇼핑 계속하기</button>
	</div>
			
		
	 <script src="../static/js/productCompletion.js"></script>
</body>
</html>