<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>칠면주조에 오신걸 환영합니다 - 로그인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<style>
.wrapper {
	display: grid;
	place-items: center;
	align-items: end;
	min-height: 30vh;
}

.content {
	font-family: system-ui, serif;
	font-size: 2rem;
	padding: 1rem;
	border-radius: 1rem;
}

.formWrapper {
	display: grid;
	place-items: center;
	min-height: 84px;
    box-sizing: border-box;
}

.formContent {
	font-family: system-ui, serif;
	font-size: 2rem;
	padding: 36px;
	display: flex;
	border-radius: 1rem;
}

.inputEmail {
	padding-top: 16px;
	padding-right: 16px;
	padding-left: 12px;
	padding-bottom: 16px;
}

.btnWrapper {
	display: grid;
	place-items: center;
	justify-items: end;
	padding-top: 8px;
}

.btnContent {
	font-family: system-ui, serif;
	font-size: 2rem;
	padding: 8px;
    padding-inline: 40px;
	border-radius: 1rem;
}

.textWrapper {
	display: grid;
	place-items: center;
}

.textContent {
	font-family: system-ui, serif;
	font-size: 18px;
	padding: 30px;
	border-radius: 1rem;
}

.main {
	display: flex;
	justify-content: center;
}

</style>

</head>
<body>
	<div style="outline: none" class="main">
		<div>
			<div>
				<header aria-label="가입 또는 로그인을 위해 이메일을 입력하세요. group" tabindex="0">
					<div>
						<i aria-label="turkey brewery"> </i>
					</div>
						<h1 aria-label="가입 또는 로그인을 위해 이메일을 입력하세요." class="wrapper" ><span class="content">가입
							또는 로그인을 위해 이메일을 입력하세요.</span></h1>
				</header>
				<div>
					<c:url var="signupEmail" value="/signup/signupEmail"></c:url>
					<form id="signupEmailForm">
						<div class="formWrapper row">
							<div class="formContent col-md-12">
								<label for="userEmail"></label> 
								<input type="text" id="userEmail" name="userEmail" placeholder="이메일" requiredm
									autofocus class="inputEmail form-control rounded " />
							</div>
						</div>
					</form>
					<div class="textWrapper">
						<div class="textContent">계속 진행하면 칠면주조의 개인정보 처리방침 및 이용약관에 동의하게 됩니다.</div>
					</div>
					
					<div class="btnWrapper d-grid gap-2 d-md-flex justify-content-md-end">
						<input type="submit" id="btnNext" value="다음" class="btnContent btn btn-dark me-md-2" />
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="../static/js/signupEmail.js"></script>

</body>
</html>