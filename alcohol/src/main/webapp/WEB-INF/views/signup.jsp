.<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    <style>
    	body {
    		background-color: black;
    		color: white;
    	}
    </style>
</head>
<body>
    <div>
        <header>
            <h1>회원가입</h1> <!-- 메인 회원가입 페이지 -->
        </header>
        
        <main>
        <div>
            <h5>회원정보를 입력해주세요</h5>
        </div>
            <div>
                <c:url var="signup" value="/signup/signup" />
                <form id="signupForm" method="post" action="${ signup }">
                    <div>
                        <div>
                            <label for="userName">Name</label>
                            <br />
                            <input type="text" id="userName" name="userName" placeholder="이름*" required  autofocus />
                        </div>
                        <div>
                            <label for="userPassword">PASSWORD</label>
                            <br />
                            <input type="password" id="userPassword" name="userPassword" placeholder="비밀번호*" required />
                        </div>
                        <div>
                            <label for="userPasswordCheck">PASSWORD CHECK</label>
                            <br />
                            <input type="password" id="userPasswordCheck" name="userPasswordCheck" placeholder="비밀번호 확인*" required />
                        </div>
                        
                            <ul>
                                <li>
                                    <label>8자 이상 20자 미만</label>
                                </li>
                                <li>
                                    <label>숫자, 특수 기호, 알파벳으로만 구성되어야 합니다.</label>                                
                                </li>
                            </ul>
                        
                        <div>
                            <label for="userAddress">ADRESS</label>
                            <br />
                            <input type="text" id="userAddress" name="userAddress" placeholder="주소*" required >
                        </div>
                        <div> 
                            <label for="userPhone">PHONE NUMBER</label>
                            <br />
                            <input type="text" id="userPhone" name="userPhone" placeholder="핸드폰 번호*" required>
                            <!--  <small id="phoneErrorMessage" style="color: red;"></small> -->
                        </div>
                        <div>
                            <label for="userNickname">NICKNAME</label>
                            <br />
                            <input type="text" id="userNickname" name="userNickname" placeholder="별명*"	 required />
                            <button id="btnNicknameCheck" >중복체크</button>
                        </div>  
                    </div>
                    <div>
                        <div>
                            <!-- 체크박스 -->
                            <input type="radio" name="userGender" value="남성" id="userGender" required />
                            <label for="cb1">남성</label>
                            <input type="radio" name="userGender" value="여성" id="userGender" required />
                            <label for="cb2">여성</label>
                        </div>
                    </div>
                    <div>
                        <div>
                            <label>생년월일</label>
                            <br />
                            <input type="date" id="userBirthday" name="userBirthday" required />
                        </div>
                        <div>
                            <input type="text" class="d-none" id="userEmail" name="userEmail" placeholder="email@abc.com" value="${ userEmail }" required />
                        </div>
                    </div>
                    
                    <br />                    
                </form>
                    <div>    
                        <div>
                            <input type="submit" id="btnCancel" value="취소">
                            <input type="submit" id="btnSignup" value="회원가입" />
                        </div>
                    </div>    
                </div>
                
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="../static/js/signup.js"></script>
    </div>
</body>
</html>