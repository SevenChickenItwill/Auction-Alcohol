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
</head>
<body>
    <div>
        <header>
            <h1>술면조 가입</h1>
            <!-- 회원가입 버튼을 누르면 회원가입이 완료되었다고 알려주는 페이지 -->
        </header>


        <div class="card text-center">

            <div>
                <h5 >술면조 회원가입이 완료되었습니다.</h5>
                <label>즐거운 쇼핑 되세요.</label>
                <br />
                <c:url var="userMainPage" value="/signup/main"></c:url>    
                <a class="btn btn-outline-primary" href="${ userMainPage }">확인</a>
            </div>

        </div>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
        <script src="../static/js/signup.js"></script>
    </div>
</body>
</html>