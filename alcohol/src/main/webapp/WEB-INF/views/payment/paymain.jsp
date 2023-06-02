<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Payment</title>
	<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
			crossorigin="anonymous">
</head>
<header class="my-2 p-5 text-center text-bg-dark">
	<h1>결제 메인 페이지</h1>
</header>

<body>
	<h2>배송지</h2>
	<ul>
		<li><c:url value="/payment/modify" var="adressModify">
				<c:param name="num" value="0" />
			</c:url><a href="${adressModify}">배송지 수정</a>
		</li>
	</ul>
    <form action="/save-shipping-address" method="POST">
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required>
        <br><br>
        <label for="address">주소:</label>
        <textarea id="address" name="address" required></textarea>
        <br><br>
        <label for="phone">전화번호:</label>
        <input type="tel" id="phone" name="phone" required>
        <br><br>
    </form>
    
    <h2>상품정보</h2>
    <form action="/save-shipping-address" method="POST">
        <label for="name">상품이름</label>
        <input type="text" id="name" name="name" required>
        <br><br>
        <label for="address">상품설명</label>
        <textarea id="address" name="address" required></textarea>
        <br><br>
        <label for="phone">가격</label>
        <input type="tel" id="phone" name="phone" required>
        <br><br>
    </form>

	<form method="post" action="/kakaoPay">
		<button>카카오 페이 결제하기</button>
	</form>	
	<!-- 
    <h2>결제 방법 선택</h2>
    <form action="/process-payment" method="POST">
        <input type="radio" id="credit-card" name="paymentMethod" value="credit-card" checked>
        <label for="creditCard">신용카드</label>
        <br>
        <input type="radio" id="bank-transfer" name="paymentMethod" value="bank-transfer">
        <label for="bankTransfer">계좌 이체</label>
        <br>
        <input type="radio" id="cashDirect" name="paymentMethod" value="cashDirect">
        <label for="cashDirect">무통장 입금</label>
        <br><br>
        <input type="submit" value="결제">
    </form>
    
	<form>
		<label for="cardNumber">카드 번호:</label>
	 	<input type="text" id="cardNumber" name="cardNumber" required><br><br>
	  	<label for="expirationDate">만료 날짜:</label>
	   	<input type="text" id="expirationDate" name="expirationDate" required><br><br>
	    <label for="cvv">CVV 번호:</label> 
		<input type="text" id="cvv" name="cvv" required><br><br>
		<label for="cardHolderName">카드 소유자 이름:</label>
		<input type="text" id="cardHolderName" name="cardHolderName" required><br><br>
		<input type="submit" value="결제하기">
	</form>
	-->
	
	<ul>
		<li><c:url value="/payment/information" var="paymentInformation">
				<c:param name="num" value="0" />
			</c:url><a href="${paymentInformation}">결제 내역 보기</a>
		</li>
	</ul>
</body>
</html>