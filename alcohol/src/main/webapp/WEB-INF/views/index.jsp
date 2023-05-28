<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
        <header>
            <h1>메인페이지</h1>
        </header>
        
        <nav>
            <ul>
                <li>
                    <c:url value="/deal/comment/comment-list" var="commentList" >
                        <c:param name="num" value="0" />
                    </c:url>
                    <a href="${commentList}" >거래</a>
                </li>
            </ul>
        </nav>
    </body>
</html>