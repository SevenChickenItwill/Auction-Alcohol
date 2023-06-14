<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Alcohol</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
		crossorigin="anonymous">
	
	<style>
		body {
			background-color: black;
		}
		
		h1 {
			color: white;
			font-size: 1.4rem;
			font-weight: bold;
			font-family: Courier New;
		}
	</style>

</head>
<body>

	<div>
		<header>
			<h1>회원가입</h1>
		</header>
		<c:url var="signupEmail" value="/signup/signupEmail"></c:url>
		<form id="signupEmailForm" method="post" action="${ signupEmail }">
			<div>
				<label for="userEmail">이메일</label> <br /> <input type="text"
					id="userEmail" name="userEmail" placeholder="EMAIL" required
					autofocus />
			</div>
		</form>
		<div>
			<input type="submit" id="btnNext" value="다음" />
			
				    
		
			
			
		</div>





		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script src="../static/js/signupEmail.js"></script>
	</div>
</body>
</html>