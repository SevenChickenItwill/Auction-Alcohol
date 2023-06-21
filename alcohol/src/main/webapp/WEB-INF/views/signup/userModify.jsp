<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Member information management</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #fff;
}

header {
	text-align: center;
	padding: 2rem;
	background-color: #fff;
	color: #000;
}

.container {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	min-height: 100vh;
}

.content {
	background-color: #fff;
	border-radius: 1rem;
	padding: 2rem;
	max-width: 600px;
	width: 100%;
}

.inputField {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin-top: 10px;
}

.inputDiv {
	margin-bottom: 15px;
}

.btn {
	display: inline-block;
	background-color: #000;
	color: #fff;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 4px;
	margin-top: 10px;
}

.btn:hover {
	background-color: #333;
}

.deactivate-account {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 20px;
}

.deactivate-account label {
	margin-right: 10px;
}
</style>

</head>
<body>
	<header>
		<h1>회원 정보관리</h1>
	</header>

	<div class="container">
		<div class="content">

			<c:url var="userModify" value="/signup/userModify"></c:url>
			<form id="accountForm" method="post" action="${userModify}">
				<div>
					<h2>계정</h2>
					<hr>
				</div>
				<div class="inputDiv col-md-12">
					<label for="userEmail">이메일</label> <input class="inputField"
						type="email" id="userAccountEmail" name="userAccountEmail"
						readonly value="${dto.userEmail}" />
				</div>
				<c:url var="userPasswordModify" value="userPasswordModify">
					<c:param name="userEmail" value="${dto.userEmail}"></c:param>
				</c:url>
				<div class="inputDiv col-md-12">
					<label for="userPassword">비밀번호</label> <input class="inputField"
						type="password" id="userAccountPassword"
						name="userAccountPassword" value="${dto.userPassword}" readonly />
					<div style="display: flex; justify-content: flex-end;">
						<a class="btn" href="${userPasswordModify}">수정</a>
					</div>
				</div>
				<div class="inputDiv col-md-12">
					<label for="userPhone">전화번호</label> <input class="inputField"
						type="text" id="userAccountPhone" name="userAccountPhone"
						value="${dto.userPhone}" readonly />
					<c:url var="userPhoneModify" value="userPhoneModify">
						<c:param name="userEmail" value="${dto.userEmail}"></c:param>
					</c:url>
					<div style="display: flex; justify-content: flex-end;">
					<a class="btn" href="${userPhoneModify}">수정</a>
					</div>
				</div>
				<div class="inputDiv col-md-12">
					<label for="userAddress">주소</label> <input class="inputField"
						type="text" id="userAccountAddress" name="userAccountAddress"
						value="${dto.userAddress}" readonly />
					<c:url var="userAddressModify" value="userAddressModify">
						<c:param name="userEmail" value="${dto.userEmail}"></c:param>
					</c:url>
					<div style="display: flex; justify-content: flex-end;">
					<a class="btn" href="${userAddressModify}">수정</a>
					</div>
				</div>
				<div class="inputDiv col-md-12">
					<label for="userAccountBirthday">생년월일</label> <input
						class="inputField" type="date" id="userAccountBirthday"
						name="userAccountBirthday" value="${dto.userBirthday}" readonly>
				</div>
			</form>
			<div style="display: flex; justify-content: space-around;">
			<div class="deactivate-account">
				 <a class="btn" href="/alcohol/signup/deactivationAccount">계정 비활성화</a>
			</div>
			<div class="deactivate-account">
				<c:url value="/auction/auctionview" var="mypage"></c:url>
				<a href="${ mypage }" class="btn">완 료</a>
			</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>

</body>
</html>
