<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Alcohol</title>
	</head>
	<body>
		<header>
			<h1>주소 변경</h1>
		</header>
		<c:url var="userAddressModify" value="/signup/userAddressModify"></c:url>
		<form id="userAccount" name="" method="post" action="${userAddressModify}"></form>
		
		<div>
			<label>주소</label>
			<br />
			<select>
				<option></option>
				<option></option>
				<option></option>
				<option></option>
				<option></option>
				<option></option>
				<option></option>
				<option></option>
			</select>
		</div>
		
	</body>
</html>