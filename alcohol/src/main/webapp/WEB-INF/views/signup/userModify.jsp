<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<style>
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.content {
    font-family: system-ui, serif;
    font-size: 36px;
    border-radius: 1rem;
    padding: 1rem;
    width: 400px;
}

.main {
    display: flex;
    flex-direction: column;
}

.form-group {
    display: flex;
    align-items: center;
    margin-bottom: 1rem;
}

.form-group label {
    margin-right: 1rem;
}

.form-group input {
    flex-grow: 1;
    padding: 12px;
    border-radius: 4px;
    border: 1px solid #ccc;
}

.form-group .btn {
    margin-left: 1rem;
}

.deactivate-account {
    display: flex;
    align-items: center;
}

.deactivate-account label {
    margin-right: 1rem;
}
</style>


</head>
<body>
	<header>
		<h1>회원 정보관리</h1>
	</header>
	
	<div style="display: flex;
    justify-content: center;">
    <div style="
    width: 800px;>
	
	<c:url var="userModify" value="/signup/userModify"></c:url>
	<form id="accountForm" method="post" action="${ userModify }">
		<div>
			<h2>계정</h2>
		</div>
		<div class="form-group">
			<label for="userEmail">이메일</label> 
			<input type="email" id="userAccountEmail"
				name="userAccountEmail" readonly value="${ dto.userEmail }" />
			<c:url var="userPasswordModify" value="userPasswordModify">
                 <c:param name="userEmail" value="${ dto.userEmail }"></c:param>
            </c:url>        
			<a class="btn btn-outline-primary" 
               href="${ userPasswordModify }">수정</a>
		</div>
		<div class="form-group">
			<label for="userPassword">비밀번호</label> 
			<input type="password"
				id="userAccountPassword" name="userAccountPassword"
				value="${ dto.userPassword }" readonly />
		</div>
		<div class="form-group">
			<label for="userPhone">전화번호</label> 
			<input type="text" id="userAccountPhone"
				name="userAccountPhone" value="${ dto.userPhone }" readonly />
            <c:url var="userPhoneModify" value="userPhoneModify">
                 <c:param name="userEmail" value="${ dto.userEmail }"></c:param>
            </c:url>
            <a class="btn btn-outline-primary" 
               href="${ userPhoneModify }">수정</a>
		</div>
		<div class="form-group">
			<label for="userAddress">주소</label>
			<input type="text" id="userAccountAddress" 
                name="userAccountAddress" value="${ dto.userAddress }" readonly />
            <c:url var="userAddressModify" value="userAddressModify">
                 <c:param name="userEmail" value="${ dto.userEmail }"></c:param>
            </c:url>
			<a class="btn btn-outline-primary"
               href="${ userAddressModify }">수정</a>
		</div>
		<div class="form-group">
			<label for="userAccountBirthday">생년월일</label> 
			<input type="date"
				id="userAccountBirthday" name="userAccountBirthday"
				value="${ dto.userBirthday }" readonly>
		</div>
	</form>
	<div class="deactivate-account">
		<label>계정 비활성화</label>
		<a class="btn btn-outline-primary" 
           href="/alcohol/signup/deactivationAccount">비활성화</a>
	</div>
	</div>
</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	
</body>
</html>
