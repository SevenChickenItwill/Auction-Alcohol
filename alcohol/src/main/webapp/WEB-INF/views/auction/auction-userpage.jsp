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
              <style>
              .form-label{
              justify-content: center;
        	align-items: center;
        	display: flex;
        	font-size: xx-large;
        	font-weight: bold;
              }
              input{
              text-align: center;
              }
              input.card{
              	font-size: xx-large;
              	font-weight: bold;
              }
               .scrollable-div {
    overflow-y: scroll;
    height: 300px;
    /* 또는 overflow: auto; 도 사용 가능합니다. */
    /* 필요에 따라 width, height, max-height 등의 스타일을 지정할 수 있습니다. */
  }
                .centered-span {
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    font-size: x-large;
    font-weight: bold;
  }
  .chatings{
  	font-size: x-large;
  
  }
  .navList {
	display: flex;
	flex-direction: row;
	margin-right: 10px;
	align-items: center;
}

.textNav {
	color: white;
	text-decoration: none;
	margin-left: 10px;
}

.textNav:hover {
	color: blue;
	text-decoration: underline;
}

.abc {
	text-underline-offset: var(--offset, 0.2em);
	text-decoration: underline 0.12em;
	transition: --offset 400ms, text-decoration-color 400ms;
	color: white;
}
</style>
</head>
<body>

	<header>
		<div>
			<div class="navbar navbar-dark bg-dark shadow-sm"
				style="display: flex; flex-wrap: nowrap;">
				<div>
					<c:url var="mainPage" value="/" />
					<a href="${ mainPage }"
						class="navbar-brand d-flex align-items-center"> <path
							d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
						<strong style="margin-left: 10px;">Turkey Brewery</strong>
					</a>
				</div>
				<div style="display: contents;">
						<div>
							<!-- 쇼핑몰 -->
							<c:url value="/shop/shopmain" var="shopPage">
								<c:param name="num" value="0"></c:param>
							</c:url>
							<a href="${ shopPage }" class="abc fw-bold">Shop</a>
						</div>
						<div>
							<!-- 경매 -->
							<c:url value="/auction/auctionlist" var="auctionlistPage"></c:url>
							<a href="${ auctionlistPage }" class="abc fw-bold" >Auction</a>
						</div>
						<div>
							<!-- 커뮤티니 -->
							<c:url value="/bulletinboard/board/list" var="boardPage">
								<c:param name="num" value="0" />
								<c:param name="keyword" value=""></c:param>
								<c:param name="category" value=""></c:param>
								<c:param name="boardNumber" value="0"></c:param>
							</c:url>
							<a href="${ boardPage }" class="abc fw-bold">Board</a>
						</div>
						
							<!-- 관리자 -->
							<c:if test="${ sessionScope.category == 1 }">
							<div>
								<c:url value="/auction" var="adminPage">
								</c:url>
								<a href="${ adminPage }" class="abc fw-bold">ManagerPage</a>
							</div>
							</c:if>
						
						<div>
							<!-- 마이페이지 -->
							<c:url value="/auction/auctionview" var="mypage">
							</c:url>
							<a href="${ mypage }" class="abc fw-bold">MyPage</a>
						</div>
					</div>
					<div class="navList">
						<span style="color: white;" >'${ sessionScope.userNickname }'님 &nbsp;</span>
						<c:url var="logout" value="/account/logout">
						</c:url>
						<a style="color: white; font-weight: bold;"
							class="flex-sm-fill text-sm-center nav-link" href="${ logout }">로그아웃</a>
					</div>
				</div>
			</div>
	</header>
        
    
    <main>
    	<%-- 로그인 완성되면 바꿔야할 변수, 세션값 받아오기 --%>
    	<c:set var="loginid" value="${ sessionScope.userNickname }"></c:set>
    	<input class="d-none" id="loginid" name="loginid" type="text" value="${ sessionScope.userNickname }" />
        <section class="bg-color-yellow">
        <div class="form">
        	<span class="centered-span">상품명 | 브랜드 | 제조사</span><input style="font-size: xx-large; font-weight: bold;" type="text" class="form-control" readonly="readonly" value="${list2.pname} | ${ list2.brandname } | ${ list2.constructor }" />
          	
        </div>
        
        <div class="batting form-control" id="batsection" >
        	<div class="form" style="display: flex;
    justify-content: center;
    align-items: center;">
        	<img class="card" width="500px" height="500px" src="data:image/jpeg;base64,${image}" alt="이미지 준비중" />
        	</div >
        	<div style="display: flex;
    justify-content: center;
    align-items: center;" class="form my-4">
    <div class="mx-2">
        	<label class="form-label" for="nowbid">현재 입찰가</label>
        	<input class="card" type="number" readonly="readonly" id="nowbid" value="${ list2.nowbid }" />
        	</div>
        	<div class="mx-2">
        	<label class="form-label" for="bidder">현재 입찰자</label>
        	<input class="card" type="text" readonly="readonly" id="bidder" value="${ list2.bidder }" />
        	</div>
        	<div class="mx-2">
        	<label class="form-label" for="bidcount">입찰 횟수</label>
        	<input class="card" type="number" readonly="readonly" id="bidcount" value="${ list2.bidcount }" />
        	</div>
        	<div class="mx-2">
        	<label class="form-label" for="passbid">즉시 낙찰가</label>
        	<input class="card" type="number" readonly="readonly" id="passbid" value="${ list2.passbid }" />
        	</div>
        	</div>
        	<div class="card scrollable-div" id="otherchatcontent"  style="margin: 50px 400px">
        	
            <c:forEach items="${ list1 }" var="list1">
            <input class="d-none" name="listuserid" value="${list1.userid }" type="text" />
            	
            	<c:if test="${ list1.userid ne loginid }" >
            		<input class="chatings form-control text-bg-secondary" type="text" value="${list1.userid} : ${list1.conversation}" readonly="readonly"/>
            		<input class="d-none" id="${ list1.cid }" name="${list1.cid }" type="number" value="${ list1.cid }" />
            	</c:if>
            	<c:if test="${ list1.userid eq loginid }" >
            		<input class="chatings form-control text-end text-bg-warning" type="text" value="${list1.conversation} : ${list1.userid}" readonly="readonly"/>
            		<input class="d-none" id="${ list1.cid }" name="${list1.cid }" type="number" value="${ list1.cid }" />
            	</c:if>
            </c:forEach>
        </div>
        <div style="display: flex;
    justify-content: center;
    align-items: center;">
        	<h5>$$ 배팅은 Tik 방식으로 진행됩니다. 버튼을 누르면 즉시낙찰가액의 1%,2%,5%가 배팅액으로 책정되어 증가합니다.</h5>
        	</div><div style="display: flex;
    justify-content: center;
    align-items: center;">
        	<h5>$$ 즉시낙찰 버튼을 누를 경우 현재 경매액과 무관하게 즉시 낙찰금액으로 낙찰되며 경매는 종료됩니다.</h5>
        	</div>
        </div>
        
        </section>
        <c:set var="status" value="${ list2.status }"></c:set>
        <div style="margin: 0px 400px;" class="card" id="chatsubmit">
        	<input type="number" id = "statusinput" class="d-none" name="statusinput" value="${ status }" />
        	<input type="number" class="d-none" id="cid" name="cid" value="${list2.aid }" />
        	<label style="justify-content: center;
        	align-items: center;
        	display: flex;" for="userid">닉네임</label>
        	<input type="text" class="card" id="userid" name="userid" value="${ sessionScope.userNickname }" required="required" readonly="readonly"/>
            <label style="justify-content: center;
        	align-items: center;
        	display: flex;" for="chatcontent">입력창</label>
            <input type="text" class="card" id="chatcontent" name="chatcontent" value=""/>
            
            <button class="btn btn-outline-dark btnsle" id="btnsubmit" data-bid="0">전송</button>
            <button class="btn btn-outline-warning btnsle" id="btnbat" data-bid="1" pers="1">배팅</button>
            <button class="btn btn-outline-warning btnsle" id="btnbat2" data-bid="1" pers="2">배팅(X2)</button>
            <button class="btn btn-outline-warning btnsle" id="btnbat3" data-bid="1" pers="5">배팅(X5)</button>
            <button class="btn btn-outline-danger btnsle" id="btnpassbat" data-bid="2">즉시낙찰</button>
            
            <c:url var="mainmenu" value="/auction/auctionlist" />
            <a class="btn btn-outline-dark btnsle" href="${ mainmenu }">메인 메뉴로 가기</a>
        </div>
    </main>

<script src="../static/js/auction-chats.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>