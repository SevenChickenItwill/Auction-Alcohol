<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
		<h1>비민번호 번경</h1>
	</header>
	
	<c:url var="userPasswordModify" value="/signup/userPasswordModify"></c:url>
	<form id="userAccountModifyForm" method="post" action="${ userPasswordModify }">
	<div>
		<label>현제 비밀번호</label>
		<br />
		<input type="text" id="userAccountPasswordModivy" name="userAccountPasswordModivy"/>
	</div>
	<div>
		<label>새 비밀번호</label>
		<br />
		<input type="text" id="userAccountNewPasswordModify" name="userAccountNewPAsswordModify"/>
	</div>
	<div>
		<label>새 비밀번호 확인</label>
		<br />
		<input type="text" id="userAccountNewPasswordCheckModify" name="userAccountNewPasswordCheckModify" />
	</div>
	</form>
	<div>
		<input type="submit" id="btnCancel" value="취소"/>
		<input type="submit" id="btnPasswordUpdate" value="수정하기"/>
	</div>
	<div>
		
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
		<script src="../static/js/userAccountUpdate"></script>
</body>
</html>