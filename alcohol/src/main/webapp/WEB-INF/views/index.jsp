<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    <div>

        <h1>메인 페이지</h1>

        <nav>
            <div>
                <ul>
                   <li>
                      <c:url var="loginPage" value="/account/login" /> 
                      <a href="${ loginPage }">로그인</a>
                   </li>
                   <li>
                      <c:url var="enrollPage" value="/account/enroll" /> 
                      <a href="${ enrollPage }">회원가입</a>
                   </li>
                                  <li>
                    <c:url var="tempPage" value="/bulletinboard/comment/templist" />
                    <a href="${ tempPage }">임시페이지</a>
                </li>
                <li>
                    <c:url value="/bulletinboard/board/list?num=0" var="boardList" >
                        <c:param name="num" value="0" />
                    </c:url>
                    <a href="${boardList}" >거래</a>
                </li>
                </ul>
            </div>
        </nav>


        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
    </div>
</body>

</html>