<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Payment</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<style>
#payment-button {
	width: 100%;
	padding: 15px;
	background-color: #3065AC;
	color: white;
	border-radius: 3px;
	font-size: 16px;
	border: none;
	margin-top: 10px
}

#container {
	display: flex;
	justify-content: space-between;
}

.centered-span {
	text-align: center;
}

.right-span {
	margin-left: auto;
}

.title {
	margin: 0 0 4px;
	font-size: 24px;
	font-weight: 600;
	color: #4e5968;
}

.container {
	overflow: auto; /* 부모 컨테이너의 오버플로우 처리를 위해 추가할 수 있습니다. */
}

.left-div, .right-div {
	display: inline-block;
	width: 50%; /* 원하는 너비를 지정할 수 있습니다. */
	vertical-align: top; /* 두 div를 수직 정렬합니다. */
}

.my-3 {
	display: flex;
	align-items: center;
	justify-content: space-between;
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
	
	<div class="container-fluid">
		<div class="my-2 p-5 text-center text-bg-dark">
			<h1>주문이 완료 되었습니다.</h1>
		</div>
	</div>


	<c:url var="payment" value="/payment/information" />
	<form id="paymentForm" method="get" action="${ payment }">

		<nav>
			<div>
				<label for="name">주문자 이름</label> <input type="text" id="name"
					name="name" value="${ name }" readonly />
			</div>
			<div>
				<label for="productCount">상품 수량</label> <input type="text"
					id="productCount" name="productCount" value="${ productCount }"
					readonly />
			</div>
			<div>
				<label for="productPrice">상품 가격</label> <input type="text"
					id="productPrice" name="productPrice" value="${ productPrice }"
					readonly />
			</div>
			<div>
				<label for="totalPrice">총 결제금액</label> <input type="text"
					id="totalPrice" name="totalPrice" value="${ totalPrice }" readonly />
			</div>
		</nav>
	</form>
	<div>
		<button id="btnPaymentDetail">주문 상세목록</button>
		<button id="btnMainPage">쇼핑 계속하기</button>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous">
		
	</script>
	<script src="../static/js/productCompletion.js"></script>
</body>
</html>