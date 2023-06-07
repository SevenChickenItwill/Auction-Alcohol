<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>   
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
            <h1>가입 또는 로그인을 위해 이메일을 입력하세요.</h1>
        </header>
          <c:url var="signupEmail" value="/signup/signupEmail" ></c:url>
        <form id="signupEmailForm" method="post" action="${ signupEmail }">
            <div>
                <label for="userEmail">이메일</label>
                <br />
                <input type="text" id="userEmail" name="userEmail" placeholder="EMAIL" required  autofocus />
                <span id="idCk" class="dpn"></span>
                <button id="btnEmailCheck">인증번호 받기</button>
            </div>
            <div>
                <label for="userEmail">인증번호</label>
                <br />
                <input type="text" id="userEmailCheck" name="userEmailCheck" placeholder="AUTENTICATION NUMBER" disabled="disabled" maxlength="6" required  />
                <span id="mailCheckWarn"></span>
            </div>
            </div> 
            <div>
                <input type="submit" id="btnNext" value="다음" />
            </div>
        </form>
        
        
        
        
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" 
        crossorigin="anonymous"></script>
        <script src="../static/js/signupEmail.js"></script>
<<<<<<< HEAD
	
=======
	</div>
>>>>>>> a8c802486c6414e73de5f95c071a1b783388ad78
	</body>
</html>