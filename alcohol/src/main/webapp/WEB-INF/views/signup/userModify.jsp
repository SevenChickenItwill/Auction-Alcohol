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
		<h1>ȸ�� ��������</h1>
	</header>
	<c:url var="userModify" value="/signup/userModify"></c:url>
	<form id="userAccountForm" method="post" action="${ userModify }">
	<div>
		<h2>����</h2>
	</div>
	<div>
		<label>�̸���</label> 
		<br /> 
		<input type="text" id="userAccountEmail"
			name="userAccountEmail" readonly />
	</div>
	<div id="userAccountDiv">
		<label>��й�ȣ</label> 
		<br /> 
		<input type="text"
			id="userAccountPassword" name="userAccountPassword" />
		<input type="submit" id="btnAccountPassword" value="����"/>
	</div>
	</form>
	<div>
		<label>��ȭ��ȣ</label> 
		<br /> 
		<input type="text" id="userAccountPhone"
			name="userAccountPhone" />
		<button id="btnAccountPhone">����</button>
	</div>
	<div>
		<label>�������</label> 
		<br /> 	
		<input type="date"
			id="userAccountBirthday" name="userAccountBirthday" readonly>
	</div>
	
	<br />
	<div>
		<label>���� ����</label>
		<button id="btnAccountDelete">����</button>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script src="../static/js/userAccountList.js"></script>
</body>
</html>