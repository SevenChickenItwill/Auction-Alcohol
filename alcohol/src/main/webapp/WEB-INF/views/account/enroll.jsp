<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Spring 3</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
    crossorigin="anonymous">
</head>
<body>
     <header>
        <h3>회원가입 페이지</h3>
     </header>

    <div class="card">
        <form id="enrollAccount" class="card-body" >
            <input id="newId" type="text" placeholder="아이디 입력" /> 
            <br /> 
            <input id="newPassword" type="text" placeholder="비밀번호 입력" /> 
            <br />
            <input id="btnEnroll" type="button" value="가입완료" />    
        </form>
    </div>


    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    </div>
    
    <script src="../static/js/enroll-account.js"></script>
</body>
</html>