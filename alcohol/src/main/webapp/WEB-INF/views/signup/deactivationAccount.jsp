<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Deactivate your account</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #fff;
            }

            header {
                text-align: center;
                padding: 2rem;
                background-color: #fff;
                color: #000;
            }

            form {
                max-width: 600px;
                margin: 0 auto;
                padding: 2rem;
                background-color: #fff;
            }

            form label {
                display: block;
                font-weight: bold;
                margin-bottom: 0.5rem;
                color: #000;
            }

            form select {
                width: 100%;
                padding: 0.5rem;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-bottom: 1rem;
                color: #000;
                background-color: #fff;
            }

            form input[type="password"] {
                width: 100%;
                padding: 0.5rem;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-bottom: 1rem;
                color: #000;
                background-color: #fff;
            }

            div {
                text-align: center;
                margin-top: 1rem;
            }

            button {
                display: inline-block;
                padding: 0.5rem 1rem;
                background-color: #000;
                color: #fff;
                border: none;
                border-radius: 4px;
                font-weight: bold;
                text-transform: uppercase;
                letter-spacing: 2px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #333;
            }
        </style>
	</head>
	<body>
		<header>
            <h1>계정 비활성화</h1>
        </header>
        
        <div>
            <c:url var="accountDelete" value="/signup/deactivation"></c:url>
            <form id="accountDeleteForm" method="post" action="${ accountDelete }">
                <input class="d-none" type="text" id="userEmail" name="userEmail" value="${ sessionScope.userEmail }">
            <div>
                <label for="reason">계정 비활성화 사유</label>
                <select name="reason" id="reason">
                    <option value="option1">사유 1: 다른 계정 이용</option>
                    <option value="option2">사유 2: 개인정보 보호를 위해</option>
                    <option value="option3">사유 3: 더 이상 서비스가 필요 없음</option>
                    <option value="option4">사유 4: 제공되는 기능이 만족스럽지 않음</option>
                    <option value="option5">사유 5: 기타</option>
                </select>
                <br><br>
                <p>계정을 비활성화 하려면 현재 비밀번호를 입력하세요.</p>
                <label for="password">비밀번호</label>
                <input type="password" id="accountPassword" name="accountPassword" required>
            </div>   
            </form>
            <br />   
                <button id="btnAccountDelete">계정 비활성화</button>
        </div>
        <script
              src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
              integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
              crossorigin="anonymous"></script>
        <script src="../static/js/userDeactivationAccount.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	</body>
</html>
