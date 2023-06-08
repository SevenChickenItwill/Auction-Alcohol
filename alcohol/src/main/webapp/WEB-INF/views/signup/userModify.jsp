<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h1>회원 정보관리</h1>
	</header>
	<c:url var="userModify" value="/signup/userModify"></c:url>
	<form id="accountPasswordForm" method="post" action="${ userModify }">
	<div>
		<h2>계정</h2>
	</div>
	<div>
		<label>이메일</label> 
		<br /> 
		<input type="email" id="userAccountEmail"
			name="userAccountEmail" readonly value="${ userEmail }"/>
	</div>
	<div>
		<label>비밀번호</label> 
		<br /> 
		<input type="password"
			id="userAccountPassword" name="userAccountPassword" value="${ userPassword }" />
		<button id="btnAccountPassword">수정</button>
	</div>
	
	<!-- 
	<c:url var="userModify" value="/signup/userModify"></c:url>
	<form id="AccountPhoneForm" method="post" action="userModify">
	 -->
	<div>
		<label>전화번호</label> 
		<br /> 
		<input type="text" id="userAccountPhone"
			name="userAccountPhone" value="${ userPhone }"/>
		<button id="btnAccountPhone">수정</button>
	</div>
	<div>
		<label>생년월일</label> 
		<br /> 	
		<input type="date"
			id="userAccountBirthday" name="userAccountBirthday" value="${ userBirthday }" readonly>
	</div>
	</form>
	<br />
	<div>
		<label>계정 삭제</label>
		<button id="btnAccountDelete">삭제</button>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script src="../static/js/userAccountList.js"></script>
</body>
</html>