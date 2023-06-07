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
		<div class="card-header">
			<input type="checkbox" id="myCheckbox" name="myCheckbox"
				value="checkboxValue" onchange="toggleSelectAll()"> <label
				class="py-6" for="myCheckbox">전체선택</label> <span class="btninit"
				onclick="deleteSelectedItems()">삭제</span>
		</div>
		<div class="card-boby">
			<c:forEach var="basket" items="${list}">
				<div>
					<input type="checkbox" name="myCheckbox"
						id="checkbox-${basket.basketid}"
						oninput="updateTotalOrderAmount()"> <label>${basket.brandname}</label>
					<hr>
					<label>${basket.pname}</label><br> <label>주문수량</label> <input
						style="width: 50px;" id="inputQuantity-${basket.basketid}"
						type="number" value="${basket.quantity}"
						oninput="updateOrderAmount(${basket.basketid})"> <br>

					<label>주문금액</label> <label id="orderAmount-${basket.basketid}"
						class="mx-2" data-price="${basket.price}">
						${(basket.quantity * basket.price)}원 </label>

					<hr>
				</div>
			</c:forEach>

		</div>
		<div class="card-footer">
			<label>총 주문금액</label> <label id="totalAmount">원</label> <br> <a>결제하기</a>
		</div>
	</div>
	<script>
	const updateOrderAmount = (basketid) => {
		const orderAmount = document.getElementById(`inputQuantity-${basketid}`).value;
		console.log(orderAmount);
	};
	</script>
</body>
</html>
