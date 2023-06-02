<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<h1>배송지 변경/수정 페이지</h1>
		</header>
	</div>
	
	<div>
		<main class="my-2">
			<div class="card">
				<form class="card-body" id="modifyForm">
					<div class="my-2">
						<label class="form-label" for="order_name">주문자 이름</label>
						 <textarea class="form-control" id="order_name" name="order_name">${ payment.order_name }</textarea>
					</div>
					<div class="my-2">
						<label class="form-label" for="order_adress">주소</label>
						<textarea class="form-control" id="order_adress" name="order_adress">${ payment.order_adress }</textarea>
					</div>
					<div class="my-2">
						<label class="form-label" for="order_phone">핸드폰 번호</label>
						 <textarea class="form-control" name="order_phone" id="order_phone">${ payment.order_phone }</textarea>
					</div>
					<div class="my-2">
						<label class="form-label" for="order_email">이메일</label>
						 <textarea class="form-control" name="order_email" id="order_email">${ payment.order_email }</textarea>
					</div>
				</form>
				<div class="card-footer">
					<div class="d-flex justify-content-center">
						<button class="mx-1 btn btn-outline-danger" id="btnBack">뒤로가기</button>
						<button class="mx-1 btn btn-outline-success" id="btnUpdate">업데이트</button>
					</div>
				</div>
			</div>
		</main>
		<script src="./../static/js/payment-adressmodify.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous">
		</script>	
	</div>
</body>
</html>