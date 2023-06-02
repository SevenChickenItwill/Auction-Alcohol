<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</head>
<body>
    <div>
        <header>
            <h1>술면조 회원가입</h1> <!-- 메인 회원가입 페이지 -->
        </header>
        
        <nav>
            <ul>
                <li>
                    
                </li>
            </ul>
        </nav>
        
        
        <main>
        <div>
            <label>회원정보를 입력해주세요</label>
        </div>
            <div>
                <form>
                    <div>
                        <div> 
                            <input type="text" id="id" name="id" placeholder="아이디" required />
                        </div>
                        <div>
                            <input type="password" id="password" name="password" placeholder="비밀번호" required />
                        </div>
                        <div>
                            <input type="password" id="passwordSame" name="passwordSame" placeholder="비밀번호 확인" required />
                        </div>
                        <div>
                            <input type="email" id="email" name="email" placeholder="email@abc.com" required />
                        </div>
                        <div>
                            <input type="number" id="age" name="age" placeholder="나이" required />
                        </div>
                        <div>
                            <label>생년월일</label>
                            <br />
                            <input type="date" id="birthday" name="birthday" required />
                        </div>
                    </div>
                    <div>
                        <!-- 광고를 기능을 사용한다면 사용 -->
                        <div>
                            <!-- 라디오버튼 -->
                            <!-- 이름이 같으면 둘중 하나만 선택 가능 -->
                            <input type="radio" name="receive" value="f" id="rb1" required />
                            <label for="rb1">수신 동의</label>
                            <input type="radio" name="receive" value="f" checked="checked" id="rb2" required ㄴ/>
                            <label for="rb2">수신 거부</label>
                        </div>
                    </div>
                        <div>
                        <div>
                            <!-- 체크박스 -->
                            <input type="radio" name="city" value="1" id="cb1" required />
                            <label for="cb1">남성</label>
                            <input type="radio" name="city" value="1" id="cb2" required />
                            <label for="cb2">여성</label>
                        </div>
                    </div>
                    <div>
                        <div>
                            <input type="text" id="name" name="name" placeholder="이름" required />
                        </div>
                        <div>
                            <input type="text" id="phone" name="phone" placeholder="전화번호" required>
                        </div>
                        <div>
                            <input type="submit" value="회원가입" />
                        </div>
                    </div>
                </form>
            </div>    
        </main>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
    </div>
</body>
</html>