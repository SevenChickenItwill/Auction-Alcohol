<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
           <h1>비밀번호 찾기</h1>
        </header>
        
        <div>
           <p>비밀번호를 찾기 위해 이름, 이메일 및 전화번호를 입력하세요.</p>
        </div>
        
        <form id="findPasswordForm" method="post" 
              action="/signup/findByUserPassword"></form>
        <div>
          <label for="userName">이름</label>
          <br />
          <input type="text" id="userAccountName" name="userAccountName" placeholder="NAME" required>
        </div>
        <div>
          <label for="userEmail">이메일</label>
          <br />
          <input type="email" id="userAccountEmail" name="userAccountEmail" placeholder="EMAIL" required autofocus />
        </div>
        <div>
          <label>전화번호</label>
          <br />
          <input type="text" id="userAccountPhone" name="userAccountPhone" placeholder="PHONE" required />
        </div>
        <div>
          <button id="btnFindPassword">확인</button>
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
        <script src="../static/js/findByUserPassword.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
                
	</body>
</html>