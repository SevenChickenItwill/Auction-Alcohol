<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Alcohol</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

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

form {
	max-width: 600px;
	margin: 0 auto;
	padding: 2rem;
	background-color: #fff;
}

form label {
	display: block;
	font-weight: bold;
	margin-bottom: 0.5rem;
	color: #fff;
}

form input[type="text"] {
	width: 100%;
	padding: 0.5rem;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin-bottom: 1rem;
	background-color: #fff;
}

div {
	text-align: center;
	margin-top: 1rem;
}

button {
	display: inline-block;
	padding: 0.5rem 1rem;
	background-color: #000; 
	color: #fff;
	border: none;
	border-radius: 4px;
	font-weight: bold;
	text-transform: uppercase;
	letter-spacing: 2px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #333;
}

button#btnPhoneCancel {
	margin-right: 1rem;
	background-color: #777;
}

</style>

</head>
<body>
	<header>
		<h1>휴대폰 번호 변경</h1>
	</header>

	<div>
	<c:url var="userPhoneModify" value="/signup/userPhoneModify" />
	<form id="accountForm" action="${userPhoneModify}" method="post">
		<div>
			<input class="d-none" type="text" id="userEmail" name="userEmail" value="${ sessionScope.userEmail }">
			<label>휴대폰 번호</label>
			<input type="text" id="userAccountPhoneModify" name="userPhone" placeholder="전화번호" required />
		</div>
	</form>
	<div >
		<button id="btnPhoneCancel">취소</button>
		<button id="btnPhoneUpdate">수정하기</button>
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script src="../static/js/userAccountPhoneUpdate.js"></script>
</body>
</html>
