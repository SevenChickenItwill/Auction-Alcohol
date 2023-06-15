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
</head>
<body>
	<header>
		<h1>회원 정보관리</h1>
	</header>
	<c:url var="userModify" value="/signup/userModify"></c:url>
	<form id="accountForm" method="post" action="${ userModify }">
		<div>
			<h2>계정</h2>
		</div>
		<div>
			<label for="userEmail">이메일</label> 
			<br /> 
			<input type="email" id="userAccountEmail"
				name="userAccountEmail" readonly value="${ dto.userEmail }" />
		</div>
		<div>
			<label for="userPassword">비밀번호</label> 
			<br />
            
			<input type="password"
				id="userAccountPassword" name="userAccountPassword"
				value="${ dto.userPassword }" readonly />
            <c:url var="userPasswordModify" value="userPasswordModify">
                 <c:param name="userEmail" value="${ dto.userEmail }"></c:param>
            </c:url>        
			<a class="btn btn-outline-primary" 
               href="${ userPasswordModify }">수정</a>
		</div>

		<!-- 
	<c:url var="userModify" value="/signup/userModify"></c:url>
	<form id="AccountPhoneForm" method="post" action="userModify">
	 -->
		<div>
			<label for="userPhone">전화번호</label> 
			<br /> 
			<input type="text" id="userAccountPhone"
				name="userAccountPhone" value="${ dto.userPhone }" readonly />
            <c:url var="userPhoneModify" value="userPhoneModify">
                 <c:param name="userEmail" value="${ dto.userEmail }"></c:param>
            </c:url>
            <a class="btn btn-outline-primary" 
               href="${ userPhoneModify }">수정</a>
		</div>
		<div>
			<label for="userAddress">주소</label>
			<br />
			<input type="text" id="userAccountAddress" 
                name="userAccountAddress" value="${ dto.userAddress }" readonly />
                <c:url var="userAddressModify" value="userAddressModify">
                 <c:param name="userEmail" value="${ dto.userEmail }"></c:param>
                </c:url>
			<a class="btn btn-outline-primary"
               href="${ userAddressModify }">수정</a>
		</div>
		
		<div>
			<label for="">생년월일</label> 
			<br /> 
			<input type="date"
				id="userAccountBirthday" name="userAccountBirthday"
				value="${ dto.userBirthday }" readonly>
		</div>
	</form>
	<br />
 
	<div>
		<label>계정 비활성화</label>
		<a class="btn btn-outline-primary" 
           href="/alcohol/signup/deactivationAccount">비활성화</a>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	
</body>
</html>