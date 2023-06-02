<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Auction</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" 
              crossorigin="anonymous">
</head>
<body>
    <header>
        <h1>${ list2.auctionName } / ${ list2.pname }</h1>
    </header>
    <main>
    	<%-- 로그인 완성되면 바꿔야할 변수, 세션값 받아오기 --%>
    	<c:set var="loginid" value="다훈"></c:set>
    	<input class="d-none" id="loginid" name="loginid" type="text" value="${ loginid }" />
        <section class="bg-color-yellow">
        <div class="card" id="otherchatcontent">
            <c:forEach items="${ list1 }" var="list">
            	<c:if test="${ list1.userid == loginid }" >
            		<input class="form-control text-bg-warning" type="text" value="${list1.userid} : ${list1.conversation} // ${list1.cid}"/>
            	</c:if>
            	<c:if test="${ list1.userid != loginid }" >
            		<input class="form-control text-end text-bg-secondary" type="text" value="${list1.cid} // ${list1.conversation} : ${list1.userid}"/>
            	</c:if>
            </c:forEach>
        </div>
        
        </section>
        <div class="card" id="chatsubmit">
        	<input type="number" class="d-none" id="cid" name="cid" value="${list2.aid }" />
        	<input type="text" class="card" id="userid" name="userid" />
            <input type="text" class="card" id="chatcontent" name="chatcontent" />
            <button class="btn" id="btnsubmit">전송</button>
            <button class="btn" id="btnbat">배팅</button>
            <button class="btn" id="btnconn">연결</button>
        </div>
    </main>

<script src="../static/js/auction-chat.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>