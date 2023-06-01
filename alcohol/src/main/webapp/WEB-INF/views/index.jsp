<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Alcohol</title>
    </head>
    <body>
    <div>
        <header >
            <h1>메인 페이지</h1>
        </header>
        
    <nav>
        <ul>
            <div>
                <li>
                    <c:url var="tempPage" value="/bulletinboard/comment/templist" />
                    <a href="${ tempPage }">임시페이지</a>
                </li>
                <li>
                    <c:url value="/bulletinboard/board/list" var="boardList" >
                        <c:param name="num" value="0" />
                    </c:url>
                    <a href="${boardList}" >거래</a>
                </li>
            </div>    
        </ul>
    </nav>    
 </div>
    </body>
</html>