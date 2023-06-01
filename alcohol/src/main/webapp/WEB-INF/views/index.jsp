<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
         <meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>Alcohol</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" 
         rel="stylesheet"
         integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
         crossorigin="anonymous">
	</head>
	<body>
	<div>
		<header>
            <h1>로그인 페이지</h1>
        </header>
        
        <nav>
            <ul>
                <li> <!-- 회원가입 페이지로 이동 -->
                    <c:url var="userSignupEmailPage" value="/signup/signupEmail"></c:url>
                    <a class="btn btn-outline-primary" href="${ userSignupEmailPage }">회원가입 페이지</a>
                </li>
            </ul>
            
        </nav>
        
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" 
        crossorigin="anonymous"></script>
	</div>
	</body>
</html>