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
	
	<input class="card" type="text" id="userid" name="userid" value="${ sessionScope.userNickName }" readonly="readonly"/>
	 
	<div>
		<main class="my-2">
			<div class="card">
				<form class="card-body" id="modifyForm">
					<div class="my-2">
						<label class="form-label" for="userNickName">이름</label>
						 <textarea class="form-control" id="userNickName" name="userNickName">${ user.userNickName }</textarea>
					</div>
					<div class="my-2">
						<label class="form-label" for="userAddress">주소</label>
						<textarea class="form-control" id="userAddress" name="userAddress">${ user.userAddress }</textarea>
					</div>
					<div class="my-2">
						<label class="form-label" for="userPhone">핸드폰 번호</label>
						 <textarea class="form-control" name="userPhone" id="userPhone">${ user.userPhone }</textarea>
					</div>
					<div class="my-2">
						<label class="form-label" for="userEmail">이메일</label>
						 <textarea class="form-control" name="userEmail" id="userEmail">${ user.userEmail }</textarea>
					</div>
				</form>
				
				<div class="card-footer">
					<div class="d-flex justify-content-center">
						<button class="mx-1 btn btn-outline-danger" id="btnCencle">수정취소</button>
						<button class="mx-1 btn btn-outline-success" id="btnUpdate">수정하기</button>				
					</div>
				</div>
			</div>
		</main>
	</div>
	
	<script src="./../static/js/payment-modifyy.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous">
	</script>	
</body>
</html>