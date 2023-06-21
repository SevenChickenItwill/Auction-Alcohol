<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>칠면주조에 오신것을 환영합니다.</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/album/" />
<style>
#toBasket {
	text-decoration: none;
}

.navbar {
	margin-bottom: 20px;
}

.navList {
	display: flex;
	flex-direction: row-reverse;
	margin-right: 10px;
}

.separator {
	width: 1px;
	height: 12px;
	color: white;
	margin: 0 20px;
}

.separator2 {
	width: 100%;
	height: 1px;
	background-color: #000000;
	margin: 10px 0;
}

.separator3 {
	width: 100%;
	height: 1px;
	background-color: #000000;
	margin: 10px 0;
}

.list {
	margin: 20px;
}

.separator4 {
	width: 100%;
	height: 1px;
	background-color: #000000;
	margin: 10px 0;
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
	text-underline-offset: var(- -offset, 0.2em);
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
						<a href="${ auctionlistPage }" class="abc fw-bold">Auction</a>
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
					<span style="color: white;">'${ sessionScope.userNickname }'님
						&nbsp;</span>
					<c:url var="logout" value="/account/logout">
					</c:url>
					<a style="color: white; font-weight: bold;"
						class="flex-sm-fill text-sm-center nav-link" href="${ logout }">로그아웃</a>
				</div>
			</div>
		</div>
	</header>

	<div>
		<div style="display: flex; flex-direction: column;">
			<div style="justify-content: center; padding: 100 20px;">

				<form id="detailForm">
					<div>
						<div>
							<input type="hidden" type="text"
								value="${ sessionScope.userNickname }" name="nickname"
								id="nickname" readonly="readonly" />
						</div>
						<div class="separator2"></div>
						<div style="display: flex; justify-content: center;">
							<div class="input-group" style="display: flex; width: 700px;">
								<div style="width: 700px; display: flex; margin: 20px">
									<span class="input-group-text">상품명</span><input
										class="form-control" aria-label="With textarea" type="text"
										value="${ product.productname }" name="productname"
										id="productname" readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="separator3"></div>

						<div style="display: flex; justify-content: center;">
							<div>
								<img width="100%" height="150px"
									src="data:image/jpeg;base64,${ product.photopath }" />
							</div>
						</div>
						<div>
							<input type="hidden" value="${ product.pid }" name="productid"
								id="productid" readonly="readonly" />
						</div>

						<div class="separator3"></div>

						<!-- name은 아규먼트로 넘겨주기 위함 -->
						<!-- 장바구니에 담기 클릭 시 수량 = 0일 경우 수량 선택 필수 alert 작업 js에서 TODO -->
						<div style="display: flex; justify-content: center;">
							<div class="input-group" style="display: flex; width: 700px;">
								<div style="width: 700px; display: flex; margin: 20px"
									class="list">
									<span class="input-group-text">수량</span><input type="number"
										class="form-control" aria-label="With textarea"
										name="quantity" id="quantity" placeholder="수량을 선택하세요" />
								</div>
							</div>
						</div>
						<div style="display: flex; justify-content: center;">
							<div class="input-group" style="display: flex; width: 700px;">
								<div style="width: 700px; display: flex; margin: 20px"
									class="list">
									<span class="input-group-text">판매가 (per unit)</span><input
										class="form-control" aria-label="With textarea" type="number"
										value="${ product.price }" name="price" id="price"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div style="display: flex; justify-content: center;">
							<div style="display: flex; width: 110px; flex-direction: column;">

								<div style="display: flex; justify-content: center;">
									<button id="toBasket" name="toBasket" class="btn btn-success">장바구니에
										담기</button>
								</div>
							</div>
						</div>
					</div>
				</form>
				<div class="separator4" style="margin-top: 20px"></div>
				
				<!-- 댓글 영역 -->
				
				
				
				<div style="display: flex; flex-direction: column;">
					<div style="display: flex; flex-direction: column;">
						<div style="align-self: center;margin-top: 20px;">
						<div id="repl" style="margin-top: 20px ">
						<span id="CommentCount" style="color: red; font-weight: bold;"></span>
						<span style="color: red;">개</span>의 상품 리뷰
					</div>
							사용자 닉네임 <input value="${ sessionScope.userNickname }"
								id="userNickname" readonly
								style="border: none; font-weight: bold; color: #0000ff;" />
								<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here" style="height: 100px; width: 600px;" id="content"></textarea>
							<label for="content">댓글 작성</label>
							</div>
						</div>
						
						<div style="display: flex; justify-content: center; margin-top: 20px; justify-content: flex-center;">
							<button id="commentReg" class="btn btn-secondary">댓글 등록</button>
						</div>
					</div>
					<div style="display: flex; justify-content: center;">
						<div id="replies" style="display: flex;margin-top: 20px;justify-content: center; flex-direction: column;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="../static/js/productComment-details.js"></script>
	<script src="../static/js/product-detail.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>

</body>
<footer>
	<p style="text-align: center;">&copy; Alcohol Event Mall of Team
		Turkey(칠면조). All rights reserved.</p>
</footer>
</html>