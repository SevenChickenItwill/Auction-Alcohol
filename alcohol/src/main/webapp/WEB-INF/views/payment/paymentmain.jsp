<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charSet="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment</title>
  <script src="https://js.tosspayments.com/v1/payment-widget"></script>
  <style>
    #payment-button{ width:100%; padding:15px; background-color:#3065AC; color:white; border-radius:3px; font-size:16px; border:none; margin-top:10px}
	.title {margin: 0 0 4px; font-size: 24px; font-weight: 600;color: #4e5968;}
  </style>
</head>
<body>
  <!-- 상품 정보 -->
  <div class="title">상품 정보</div>
  <p>전통주</p>
  <p>결제 금액: 15,000원</p>
  <form id="discount-coupon">
    <input type="checkbox" id="coupon"/>5,000원 할인받기 
  </form>
  <div class="title">배송지 정보</div>
  	<ul>
		<li><c:url value="/payment/modify" var="adressModify">
				<c:param name="num" value="0" />
			</c:url><a href="${adressModify}">배송지 수정</a>
		</li>
	</ul>
  <hr>	

  <!-- 결제 방법 -->
  <div class="title">결제 방법</div>
  <div id="payment-method"></div>
  <div id="agreement"></div> 
  <button id="payment-button">결제하기</button>
  
  <li>
  <c:url value="/payment/information" var="paymentinformation">
		<c:param name="num" value="0" />
  </c:url><a href="${paymentinformation}">주문/결제 내역</a>
  </li>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous">
</script>	
<script src="./../static/js/payment-paymentmain.js"></script>
</body>
</html>