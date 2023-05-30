<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment</title>
</head>
<body>
	<header class="my-2 p-5 text-center text-bg-dark">
		<h1>결제 페이지</h1>
	</header>


	<ul>
		<li><c:url value="/payment/pay" var="checkPay">
				<c:param name="num" value="0" />
			</c:url> <a href="${checkPay}">결제 확인 페이지</a>
		</li>
	</ul>
	
	<div class="card">
		
		
	</div>


	<form method="post" action="/kakaopay">
		<button>카카오페이 결제하기<button>
	</form>
	<form method="post" action="/naverpay">
		<button>네이버페이 결제하기<button>
	</form>



</body>
</html>