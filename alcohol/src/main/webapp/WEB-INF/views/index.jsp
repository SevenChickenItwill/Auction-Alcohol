<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>payment</title>
    </head>
    <body>
        <header>
            <h1>결제 메인 페이지</h1>
        </header>
        
        <nav>
            <ul>
                <li>
                    <c:url value="/payment/pay" var="checkPay" >
                        <c:param name="num" value="0" />
                    </c:url>
                    <a href="${checkPay}" >결제 확인 페이지</a>
                </li>
            </ul>
        </nav>
    </body>
</html>