<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html lang="ko">
	<head>
	  <meta charSet="utf-8"/>
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
				rel="stylesheet"
				integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
				crossorigin="anonymous">
	  <title>Payment</title>
	  <script src="https://js.tosspayments.com/v1/payment-widget"></script>
	  <style>
	    #payment-button{ width:100%; padding:15px; background-color:#3065AC; color:white; border-radius:3px; font-size:16px; border:none; margin-top:10px}
		.title {margin: 0 0 4px; font-size: 24px; font-weight: 600;color: #4e5968;}
	  </style>
	</head>

	<body>
	  <!-- 상품 정보 영역
	  <div class="title">주문 예정 상품 정보</div>
	  <div class="my-2">
			<label class="form-label" for="name">판매자</label>
			<input class="form-control" id="name" value="${ payment.order_name }" readonly />
		</div>
		<div class="my-2">	
			<label class="form-label" for="phone">상품</label> <input
				class="form-control" id="phone" value="${ payment.order_phone }" readonly />
		</div>
		<div class="my-2">
			<label class="form-label" for="adress">상품정보</label>
			<textarea class="form-control" id="adress" readonly>${ payment.order_adress }</textarea>
		</div>
		<div class="my-2">
			<label class="form-label" for="email">이메일</label> <input
				class="form-control" id="email" value="${ payment.order_email }" readonly />
		</div>
		<hr>	
	  
	  <form id="discount-coupon">
	    <input type="checkbox" id="coupon"/>5,000원 할인받기 
	  </form>
	  <hr>	
	   -->
	  
	  	<div class="title">배송지 정보</div>
	  	<input class="card" type="text" id="userid" name="userid" value="${ sessionScope.userNickname }" readonly="readonly"/>
	  		<li>
	  			<c:url value="/payment/modify" var="adressModify">
	  				<c:param name="userNickname" value="대한" />
				</c:url><a href="${adressModify}">배송지 수정</a>
			</li>
		<div class="my-2">
			<label class="form-label" for="userNickname">이름</label>
			<input class="form-control" id="userNickname" value="${ user.userNickname }" readonly />
		</div>
		<div class="my-2">
			<label class="form-label" for="userAddress">주소</label>
			<textarea class="form-control" id="userAddress" readonly>${ user.userAddress }</textarea>
		</div>
		<div class="my-2">	
			<label class="form-label" for="userPhone">핸드폰 번호</label>
			<input class="form-control" id="userPhone" value="${ user.userPhone }" readonly />
		</div>
		<div class="my-2">
			<label class="form-label" for="userEmail">이메일</label>
			<input class="form-control" id="userEmail" value="${ user.userEmail }" readonly />
		</div>
		<hr>	
		
		<div class="title">계산서</div>		
		<hr>
	
	  <!-- 결제 방법 영역 -->
	  <div class="title">결제 방법</div>
	  <img src="../static/img/small.png">
	  <br>
	  <c:url value="/payment/paymentsuccess" var="paymentsuccess">
			<c:param name="num" value="0" />
	  </c:url><a href="${paymentsuccess}">주문/결제 내역</a>
	  	
	<script src="./../static/js/payment-paymentmain.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
				crossorigin="anonymous">
	</script>	
	</body>
</html>