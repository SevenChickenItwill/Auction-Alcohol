<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Alcohol</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous">
	</head>
	<body>
		<header>
           <h1>계정 활성화 시키기</h1>
        </header>
        
         <div>
         <c:url var="activationAccount" value="/signup/activationUserAccount"></c:url>
         <form id="activationForm" method="post" action="${ activationAccount }">
            <label for="userEmail">이메일</label>
            <input type="email" id="userEmail" name="userEmail" required readonly />
         <div>  
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" placeholder="PASSWORD" required><br>
         </div>
        </form>
    </div>
    <div>
        <button id="btnActivationAccount">활성화 시키기</button>
    </div>
     <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
     <script src="../static/js/userActivationUserAccount.js"></script>
            
	</body>
</html>