<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Activate your account</title>
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

div {
	text-align: center;
	margin-top: 1rem;
}

p {
	margin-bottom: 1rem;
}

form {
	display: inline-block;
	margin-top: 1rem;
}

input[type="email"],
input[type="password"] {
	width: 300px;
	padding: 0.5rem;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
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
</style>
</head>
<body>
	<header>
		<h1>계정 활성화 시키기</h1>
	</header>

	<div>
		<p>귀하의 계정은 비활성화 되어있습니다.<br />로그인을 하려면 계정을 활성화 시켜야합니다.<br />해당 이메일의 기존 비밀번호를 입력하세요.</p>
	</div>
	<div>
		<c:url var="activationAccount" value="/signup/activationAccount"></c:url>
		<form id="activationForm" method="post" action="${ activationAccount }">
			<label for="userEmail">이메일</label> <br />
			<input type="email" id="userEmail" name="userEmail" required readonly />
			<div>
				<label for="activationPassword">비밀번호</label> <br />
				<input type="password" id="activationPassword" name="activationPassword" placeholder="PASSWORD" required
					autofocus />
			</div>
		</form>
	</div>
    <div>
       <a class="btn" href="/alcohol/signup/findByUserPassword">비밀번호 찾기</a>
    </div>
 
	<div>
		<button id="btnActivationAccount">활성화 시키기</button>
	</div>
	<script>
		// userEmail 값을 JavaScript 변수로 가져옵니다.
		var userEmail = "${userEmail}";

		// userEmail 값을 입력 필드에 설정합니다.
		document.getElementById("userEmail").value = userEmail;
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script src="../static/js/userActivationAccount.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</body>
</html>
