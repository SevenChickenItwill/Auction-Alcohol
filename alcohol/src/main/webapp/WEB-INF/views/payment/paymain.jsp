<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Payment</title>
</head>

<body>
	<h1>결제 메인 페이지</h1>
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
	
	<h2>주문 예정 상품</h2>
    <table>
        <thead>
            <tr>
                <th>상품명</th>
                <th>가격</th>
                <th>수량</th>
                <th>합계</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>macBook</td>
                <td>$2,200</td>
                <td>1</td>
                <td>$2,200</td>
            </tr>
            <tr>
                <td>iPhone</td>
                <td>$1,100</td>
                <td>1</td>
                <td>$1,100</td>
            </tr>
            <tr>
                <td>전통주</td>
                <td>15,000원</td>
                <td>4</td>
                <td>60,000원</td>
            </tr>
            <!-- 추가 상품들을 동적으로 생성할 수도 있습니다. -->
        </tbody>
    </table>
    <form action="/process-payment" method="POST">
        <!-- 결제 관련 폼 요소들을 추가하세요 -->
    </form>
    
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
	<button type="button" id="kakaopay" class="btn btn-primary">카카오페이 결제하기</button>

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
	
	<ul>
		<li><c:url value="/payment/information" var="paymentInformation">
				<c:param name="num" value="0" />
			</c:url><a href="${paymentInformation}">결제 내역 보기</a>
		</li>
	</ul>
</body>
</html>