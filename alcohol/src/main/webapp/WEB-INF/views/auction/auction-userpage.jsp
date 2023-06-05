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
        	
            <c:forEach items="${ list1 }" var="list1">
            <input class="d-none" name="listuserid" value="${list1.userid }" type="text" />
            	<c:if test="${ listuserid ne loginid }" >
            		<input class="form-control text-bg-secondary" type="text" value="${list1.userid} : ${list1.conversation}"/>
            		<input class="d-none" id="${ list1.cid }" name="${list1.cid }" type="number" value="${ list1.cid }" />
            	</c:if>
            	<c:if test="${ listuserid eq loginid }" >
            		<input class="form-control text-end text-bg-warning" type="text" value="${list1.conversation} : ${list1.userid}" readonly="readonly"/>
            		<input class="d-none" id="${ list1.cid }" name="${list1.cid }" type="number" value="${ list1.cid }" />
            	</c:if>
            </c:forEach>
        </div>
        <div class="batting" id="batsection" >
        	<img src="https://biz.chosun.com/resizer/6YuMZCIEekRHxZRAflffewbmPvo=/464x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosunbiz/L42AC76QP5UT65XY2XEM2JQJWI.png" />
        	<input type="number" readonly="readonly" id="nowbid" value="${ list2.nowbid }" />
        	<input type="text" readonly="readonly" id="bidder" value="${ list2.bidder }" />
        	<input type="number" readonly="readonly" id="bidcount" value="${ list2.bidcount }" />
        	<input type="number" readonly="readonly" id="passbid" value="${ list2.passbid }" />
        	<h3>${ list2.pname }</h3>
        	<h4>${ list2.brandname }</h4>
        	<h4>${ list2.constructor }</h4>
        	<h5>$$ 배팅은 Tik 방식으로 진행됩니다. 버튼을 누르면 즉시낙찰가액의 1%가 배팅액으로 책정되어 증가합니다.</h5>
        </div>
        
        </section>
        <div class="card" id="chatsubmit">
        	<input type="number" class="d-none" id="cid" name="cid" value="${list2.aid }" />
        	<input type="text" class="card" id="userid" name="userid" />
            <input type="text" class="card" id="chatcontent" name="chatcontent" />
            <button class="btn btnsle" id="btnsubmit" data-bid="0">전송</button>
            <button class="btn btnsle" id="btnbat" data-bid="1">배팅</button>
            <c:url var="mainmenu" value="/auction/auctionlist" />
            <button class="btn"><a href="${ mainmenu }">메인 메뉴로 가기</a></button>
        </div>
    </main>

<script src="../static/js/auction-chats.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>