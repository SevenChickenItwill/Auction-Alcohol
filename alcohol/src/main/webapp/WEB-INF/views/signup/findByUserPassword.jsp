<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Find Password</title>
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
 
 .container{
 display: flex;
 flex-direction: column;
 align-items: stretch;
     min-height: 100vh;
     max-width: 600px;
     border-radius: 1rem;
     padding: 2rem;
}



 form {
     max-width: 600px;
     margin-bottom: 20px;
     
 }
 
 label {
     
     margin-bottom: 5px;
     font-weight: bold;
 }
 
 input[type="text"] {
     width: 100%;
     padding: 10px;
     border: 1px solid #ccc;
     border-radius: 4px;
     margin-bottom: 50px;
     color: #000;
     background-color: #fff;
 }
 
 input[type="email"] {
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
 
 
 
 button#btnFindPassword:hover {
     background-color: #333;
 }
 
 ul {
  margin-bottom: 30px;
 }
 
 </style> 
           
	</head>
	<body>
		<header>
           <h1>비밀번호 찾기</h1>
        </header>
 
        <div class="container">  
         <div class="content">
         <label>비밀번호를 찾기 위해 이름, 이메일 및 전화번호를 입력하세요.</label>
        </div>
        
        <form id="findPasswordForm" method="post" 
              action="/signup/findByUserPassword"></form>
        <div>
          <label for="userName">이름</label>
          <br />
          <input type="text" id="userAccountName" name="userAccountName" placeholder="이름" required autofocus />
        </div>
        <div>
          <label for="userEmail">이메일</label>
          <br />
          <input type="email" id="userAccountEmail" name="userAccountEmail" placeholder="이메일" required />
        </div>
        <div>
          <label>전화번호</label>
          <br />
          <input type="text" id="userAccountPhone" name="userAccountPhone" placeholder="전화번호" required />
        </div>
        <div style="display: flex; justify-content: flex-end;">
          <button id="btnFindPassword">확인</button>
        </div>
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
        <script src="../static/js/findByUserPassword.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
                
	</body>
</html>