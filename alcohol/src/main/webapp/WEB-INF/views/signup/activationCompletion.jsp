<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

a.btn {
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

a.btn:hover {
	background-color: #333;
	
}
</style>
</head>
<body>
	<header>
		<h1>계정 활성화</h1>
	</header>

	<div>
		<p>계정이 활성화 되었습니다.<br />이제 술면조 홈페이지를 이용하실 수 있습니다.</p>
	</div>
	<div>
		<a class="btn btn-outline-primary" href="/alcohol/signup/signupEmail">로그인 하러가기</a>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>
