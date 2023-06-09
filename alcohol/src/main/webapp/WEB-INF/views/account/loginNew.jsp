<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta charset="UTF-8">
		<title>전통주 매장 술면조에 오신 걸 환영합니다.</title>
		<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    crossorigin="anonymous">
	</head>
	<body class="bg-color-blue">
		<header>
			<h1>로그인 및 회원 가입을 진행해주세요.</h1>
		</header>
		<main>
			<div class="form form-control">
				<form class="form" id="loginform">
					<label for="userEmail">아이디</label>
					<input class="card" type="text" id="userEmail" name="userEmail" required="required"
					/>
					<label for="userPassword">비밀번호</label>
					<input class="card" type="password" id="userPassword" name="userPassword" required="required" />
					
				</form>
			</div>
			<div class="form form-control">
				<button class="btn" id="btnSubmit">로그인</button>
				<button class="btn" id="btnSignUp">회원가입</button>
			</div>
		</main>

<script src="../static/js/login.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
	</body>
</html>