<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Alcohol</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<h1>비밀번호 변경</h1>
	</header>
	
	<c:url var="userPasswordModify" value="/signup/userPasswordModify"></c:url>
	<form id="userAccountModifyForm" method="post" action="${ userPasswordModify }">
	<div>
		<label>현재 비밀번호</label>
		<br />
		<input type="password" id="userAccountPasswordModify" name="userAccountPasswordModivy" placeholder="CURRENTPASSWORD"/>
	</div>
	<div>
		<label>새 비밀번호</label>
		<br />
		<input type="password" id="userAccountNewPasswordModify" name="userAccountNewPAsswordModify" placeholder="NEWPASSWORD" required />
	</div>
	<div>
		<label>새 비밀번호 확인</label>
		<br />
		<input type="password" id="userAccountNewPasswordCheckModify" name="userAccountNewPasswordCheckModify" placeholder="NEWPASSWORDCHECK" required />
	</div>
	</form>
	<div>
		<input type="submit" id="btnPasswordCancel" value="취소"/>
		<input type="submit" id="btnPasswordUpdate" value="수정하기"/>
	</div>
	<div>
		
	<ul>
		<li>
			<label>비밀번호 설정 요건:</label>
		</li>
		<li>
			<label>8자 이상 20자 미만</label>
		</li>
		<li>
			<label>숫자, 특수 기호, 알파벳으로만 구성되어야 합니다.</label>
		</li>
	</ul>
		
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
		<script src="../static/js/userAccountPasswordUpdate.js"></script>
</body>
</html>