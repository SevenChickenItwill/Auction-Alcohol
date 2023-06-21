<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta charset="UTF-8">
<title>칠면주조에 오신걸 환영합니다 - 로그인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">

<style>
.wrapper {
	width: 700px;
	display: grid;
	place-items: center;
	justify-items: start;
	align-items: end;
	min-height: 20vh;
	margin-top: 100px;
	margin-bottom: 30px;
}

.content {
	font-family: system-ui, serif;
	font-size: 42px;
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
	margin-top: 90px;
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
	height: 100%;
	display: flex;
	justify-content: center;
}

</style>

</head>
<body>
	<div style="outline: none" class="main">
		<div>
			<div>
				<header aria-label="비밀번호를 입력하세요. group" tabindex="0">
					<div>
						<i aria-label="turkey brewery"> </i>
					</div>
					<h1 aria-label="비밀번호를 입력하세요." class="wrapper">
						<span class="content">비밀번호를 입력하세요.</span>
					</h1>
				</header>
				<div>
					<form id="loginform">
						<div class="formWrapper row">
							<div class="formContent col-md-12">
								<input class="d-none" type="text" id="userEmail"
									name="userEmail" value="${ userEmail }" required="required"  />
								<label for="userPassword"></label> 
								<input class="inputEmail form-control rounded" type="password" id="userPassword" name="userPassword"
									required="required" autofocus />
							</div>
						</div>
                    </form>
                    <div style="padding-left: 25px;">
                   <a class="btn" href="/alcohol/signup/findByUserPassword" style="padding-left: 0px;">비밀번호 찾기</a>
                </div>
               </div>
				<div class="btnWrapper d-grid gap-2 d-md-flex justify-content-md-end">
					<input type="submit" class="btnContent btn btn-dark me-md-2" id="btnSubmit" value="로그인" />
				</div>
			</div>
		</div>

	</div>
	<script src="../static/js/logins.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>