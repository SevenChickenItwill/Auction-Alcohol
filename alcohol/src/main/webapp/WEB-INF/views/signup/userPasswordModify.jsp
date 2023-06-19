 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 
 .container {	
     display: flex;
     justify-content: center; 
     align-items: stretch;
     min-height: 100vh;
 }
 
 .content {
     border-radius: 1rem;
     padding: 2rem;
     max-width: 600px;
     width: 100%;
 }
 
 form {
     max-width: 600px;
     margin-bottom: 20px;
     
 }
 
 label {
     
     margin-bottom: 5px;
     font-weight: bold;
 }
 
 input[type="password"] {
     width: 100%;
     padding: 10px;
     border: 1px solid #ccc;
     border-radius: 4px;
     margin-bottom: 50px;
     color: #000;
     background-color: #fff;
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
 
 
 button#btnPasswordCancel {
  margin-right: 1rem;
  background-color: #777;
 }
 
 button#btnPasswordUpdate:hover {
     background-color: #333;
 }
 
 ul {
 	margin-bottom: 30px;
 }
 
 </style>
 
 </head>
 <body>
     <header>
         <h1>비밀번호 변경</h1>
     </header>
     
     <div class="container">
         <div class="content">
     
     <c:url var="userPasswordModify" value="/signup/userPasswordModify"></c:url>
     <form id="userAccountModifyForm">
         <div class="form-group">
             <input type="hidden" id="userEmail" name="userEmail" value="${sessionScope.userEmail}" />
             <label for="userAccountPasswordModify">현재 비밀번호</label>
             <input type="password" id="userPassword" name="userPassword" placeholder="현재 비밀번호" required />
         </div>
         <div class="form-group">
             <label for="userAccountNewPasswordModify">새 비밀번호</label>
             <input type="password" id="userAccountNewPasswordModify" name="userAccountNewPasswordModify" placeholder="새 비밀번호" required />
         </div>
         <div class="form-group">
             <label for="userAccountNewPasswordCheckModify">새 비밀번호 확인</label>
             <input type="password" id="userAccountNewPasswordCheckModify" name="userAccountNewPasswordCheckModify" placeholder="새 비밀번호 확인" required />
         </div>
         <div>
         <div>
         <ul>
             <li>비밀번호 설정 요건:</li>
             <li>8자 이상 20자 미만</li>
             <li>숫자, 특수 기호, 알파벳으로만 구성되어야 합니다.</li>
         </ul>
     	</div>
     	</div>
     	<div style="display: flex; justify-content: flex-end;">
         	<button id="btnPasswordCancel" >취소</button>
         	<button id="btnPasswordUpdate" >수정하기</button>
     	</div>
     </form>
 
     
     
     </div>
     </div>
 
     <script
         src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
         crossorigin="anonymous"></script>
     <script src="../static/js/userAccountPasswordUpdate.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 </body>
 </html>
