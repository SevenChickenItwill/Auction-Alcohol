<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
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
	</body>
</html>