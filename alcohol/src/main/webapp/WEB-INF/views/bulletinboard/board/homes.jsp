<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>칠면조</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous" />

<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/album/" />

<link href="../../static/css/album.css" rel="stylesheet"
	crossorigin="anonymous" />
</head>
<style>
/* Overall styles */
body {
	margin: 0;
	padding: 0;
	font-family: "Goudy Bookletter 1911", sans-serif;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

/* Header styles */
.navList {
	display: flex;
	flex-direction: row;
	margin-right: 10px;
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

.abc:hover, .abc:focus { 
	-offset: 0.5em;
	text-decoration-color: white;
}

/* 경매페이지, 쇼핑몰 이동 페이지 */
.shoppingmall-font, .bidmall-font {
	display: inline-block;
	padding: 30px 60px;
	background-color: #333;
	color: #fff;
	text-decoration: none;
	font-weight: 800;
	border-radius: 6px;
	transition: background-color 0.3s;
	font-size: 20px;
}

.shoppingmall-font:hover, .bidmall-font:hover {
	background-color: #0000FF;
}

/* Footer styles */
footer {
	background-color: #333;
	color: #fff;
	padding: 10px;
	text-align: center;
	margin-top: auto;
}

/* Main section styles */
main {
	flex: 1;
	display: flex;
}

/* Left section styles */
.mainBackground {
	flex: 1;
	background-image: url('./static/images/mainBackground.jpg');
	background-repeat: no-repeat;
	background-size: 1340px 730px;
	background-position: 52% -100px;
	background-blend-mode: lighten;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 10px;
	text-decoration: none;
}

/* welcome 문구 */
.welcome {
	text-align: left;
	mx: 10px;
}

.shoppingmall-font {
	text-decoration: none;
	margin-bottom: 5px;
}

.bidmall-font {
	text-decoration: none;
	margin-top: 10px;
}

.grids {
	text-align: center;
	/* 경매몰, 쇼핑몰 이동 px수치가 커질수록 아래로*/
	margin-top: 300px;
}

#nickname {
	margin-left: 300px;
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

	<h2 class="welcome">Welcome to our Korean Traditional Alcohol
		Event Mall</h2>
	<main class="mainBackground">

		<div class="grids">
			<p>
				<a href="#" class="shoppingmall-font">주류 쇼핑몰로 이동</a>
			</p>
			<p>
				<a href="${ auctionList }" class="bidmall-font">경매몰로 이동</a>
			</p>
		</div>

	</main>

	<footer>
		<p>&copy; Alcohol Event Mall of Team Turkey(칠면조). All rights
			reserved.</p>
	</footer>
</body>
</html>
