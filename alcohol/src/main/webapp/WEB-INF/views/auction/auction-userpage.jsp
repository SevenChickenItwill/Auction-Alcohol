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
    	<c:set var="loginid" value="${ sessionScope.userNickname }"></c:set>
    	<input class="d-none" id="loginid" name="loginid" type="text" value="${ sessionScope.userNickname }" />
        <section class="bg-color-yellow">
        <div class="card" id="otherchatcontent"  style="width: 500px;">
        	
            <c:forEach items="${ list1 }" var="list1">
            <input class="d-none" name="listuserid" value="${list1.userid }" type="text" />
            	
            	<c:if test="${ list1.userid ne loginid }" >
            		<input class="form-control text-bg-secondary" type="text" value="${list1.userid} : ${list1.conversation}" readonly="readonly"/>
            		<input class="d-none" id="${ list1.cid }" name="${list1.cid }" type="number" value="${ list1.cid }" />
            	</c:if>
            	<c:if test="${ list1.userid eq loginid }" >
            		<input class="form-control text-end text-bg-warning" type="text" value="${list1.conversation} : ${list1.userid}" readonly="readonly"/>
            		<input class="d-none" id="${ list1.cid }" name="${list1.cid }" type="number" value="${ list1.cid }" />
            	</c:if>
            </c:forEach>
        </div>
        <div class="batting" id="batsection" >
        	<img src="https://biz.chosun.com/resizer/6YuMZCIEekRHxZRAflffewbmPvo=/464x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosunbiz/L42AC76QP5UT65XY2XEM2JQJWI.png" />
        	<label for="nowbid">현재 입찰가</label>
        	<input type="number" readonly="readonly" id="nowbid" value="${ list2.nowbid }" />
        	<label for="bidder">현재 입찰자</label>
        	<input type="text" readonly="readonly" id="bidder" value="${ list2.bidder }" />
        	<label for="bidcount">입찰 횟수</label>
        	<input type="number" readonly="readonly" id="bidcount" value="${ list2.bidcount }" />
        	<label for="passbid">즉시 낙찰가</label>
        	<input type="number" readonly="readonly" id="passbid" value="${ list2.passbid }" />
        	<h3>${ list2.pname }</h3>
        	<h4>${ list2.brandname }</h4>
        	<h4>${ list2.constructor }</h4>
        	<h5>$$ 배팅은 Tik 방식으로 진행됩니다. 버튼을 누르면 즉시낙찰가액의 1%,2%,5%가 배팅액으로 책정되어 증가합니다.</h5>
        	<h5>$$ 즉시낙찰 버튼을 누를 경우 현재 경매액과 무관하게 즉시 낙찰금액으로 낙찰되며 경매는 종료됩니다.</h5>
        </div>
        
        </section>
        <c:set var="status" value="${ list2.status }"></c:set>
        <div class="card" id="chatsubmit">
        	<input type="number" id = "statusinput" class="d-none" name="statusinput" value="${ status }" />
        	<input type="number" class="d-none" id="cid" name="cid" value="${list2.aid }" />
        	<input type="text" class="card" id="userid" name="userid" value="${ sessionScope.userNickname }" required="required" />
            <input type="text" class="card" id="chatcontent" name="chatcontent" value=" "/>
            
            <button class="btn btnsle" id="btnsubmit" data-bid="0">전송</button>
            <button class="btn btnsle" id="btnbat" data-bid="1" pers="1">배팅</button>
            <button class="btn btnsle" id="btnbat2" data-bid="1" pers="2">배팅(X2)</button>
            <button class="btn btnsle" id="btnbat3" data-bid="1" pers="5">배팅(X5)</button>
            <button class="btn btnsle" id="btnpassbat" data-bid="2">즉시낙찰</button>
            
            <c:url var="mainmenu" value="/auction/auctionlist" />
            <button class="btn"><a href="${ mainmenu }">메인 메뉴로 가기</a></button>
        </div>
    </main>

<script src="../static/js/auction-chat.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>