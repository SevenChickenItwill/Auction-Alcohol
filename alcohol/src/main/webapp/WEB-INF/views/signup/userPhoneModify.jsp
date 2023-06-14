<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
    <c:url var="userPhoneModify" value="/signup/userPhoneModify" ></c:url>
    <form id="accountForm" >
    <div>
    <input class="d-none" type="text" id="userEmail" name="userEmail" value="${ sessionScope.userEmail }">    
		<label>휴대폰 번호</label>
		<br />
		<input type="text" id="userAccountPhoneModify" name="userPhone" placeholder="PHONE" required />
	</div>
    </form>
	<div>
        <button id="btnPhoneCancel">취소</button>
        <button id="btnPhoneUpdate">수정하기</button>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
		<script src="../static/js/userAccountPhoneUpdate.js"></script>
</body>
</html>