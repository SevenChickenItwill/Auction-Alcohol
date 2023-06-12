<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Alcohol</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<h1>휴대폰 번호 변경</h1>
	</header>
	
	<div>
		<label>휴대폰 번호</label>
		<br />
		<input type="text" id="userAccountPhoneModify" name="userAccountPhoneModify" required />
	</div>
	<div>
		<input type="submit" id="btnPhoneCancel" value="취소" />
		<input type="submit" id="btnPhoneUpdate" value="수정하기" />
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
		<script src="../static/js/userAccountPhoneUpdate.js"></script>
</body>
</html>