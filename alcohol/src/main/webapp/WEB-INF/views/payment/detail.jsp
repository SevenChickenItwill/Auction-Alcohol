<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Payment</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" 
            rel="stylesheet" 
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" 
            crossorigin="anonymous">
</head>
<style>
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
						
						<div>
							<!-- 장바구니 -->
							<c:url value="/paymain" var="paymain"></c:url>
							<a href="${ paymain }" class="abc fw-bold">Basket</a>
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
	
	<div class="my-2 p-5 text-center text-bg-dark">
    	<h1>주문/결제 정보 상세보기 페이지</h1>
	</div>	

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
            <ul class="navbar-nav bg-light">
                <li class="nav-item">
                    <c:url var="paymentsuccess" value="/payment/paymentsuccess" />
                    <a class="nav-link" href="${ paymentsuccess }">결제 확인 페이지</a>
                </li>
            </ul>
        </nav>
        
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" 
            crossorigin="anonymous">
        </script>
</body>
</html>