<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>칠면주조에 오신것을 환영합니다.</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
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
</style>

</head>
<body>
	<header>
		<div class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container">
				<c:url var="mainPage" value="/" />
				<a href="${ mainPage }"
					class="navbar-brand d-flex align-items-center"> <path
						d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
					<strong>Turkey Brewery</strong>
				</a>
			</div>
			<div class="navList">

				<div>
					<c:url value="/shop/shopmain" var="shopList">
					</c:url>
					<a href="${ shopList }"
						style="color: white; text-decoration: none;">상품 목록으로 돌아가기</a> <span
						class="separator"></span> <a href="#"
						style="color: white; text-decoration: none;">마이페이지</a> <span
						class="separator"></span>
					<c:url value="/" var="mainPage" />
					<a href="${ mainPage }"
						style="color: white; text-decoration: none;">메인페이지</a>
				</div>
			</div>
		</div>
	</header>


	<div style="justify-content: center; padding: 100 20px;">

		<form id="detailForm"">
			<div>
				<input type="hidden" type="text"
					value="${ sessionScope.userNickname }" name="nickname"
					id="nickname" readonly="readonly" />
			</div>
			<div class="separator2"></div>
			<div style="margin: 20px">
				상품명 <span style="margin-right: 72px"></span> <input type="text" value="${ product.productname }"
					name="productname" id="productname" readonly="readonly" />
			</div>
			<div>
				<input type="hidden" value="${ product.pid }" name="productid"
					id="productid" readonly="readonly" />
			</div>
			<div class="separator3"></div>
			<!-- name은 아규먼트로 넘겨주기 위함 -->
			<!-- 장바구니에 담기 클릭 시 수량 = 0일 경우 수량 선택 필수 alert 작업 js에서 TODO -->
		
			<div class="list" >
				수량 <span style="margin-right: 88px"></span><input type="number" name="quantity" id="quantity" placeholder="수량을 선택하세요"/>
			</div>
			<div style="margin: 20px">
				판매가 (per unit) <input type="number" value="${ product.price }" name="price"
					id="price" readonly="readonly" />
			</div>
			<div style="display: flex; justify-content: center; margin-right: 1400px;">
				<button id="toBasket" name="toBasket" class="btn btn-success">장바구니에 담기</button>
			</div>
		</form>	
		<div class="separator4" style="margin-top: 20px"></div>
		<!-- 댓글 영역 -->
		
		
		<div style="margin-top: 40px">
			사용자 닉네임 <input value="${ sessionScope.userNickname }"
				id="userNickname" readonly style="border: none; font-weight:bold; color:#0000ff;" />
		</div>
		<div>
			<textarea class="col-5" placeholder="댓글 쓰기" id="content"></textarea>
		</div>
		<div style="display: flex; justify-content: center; margin-right: 415px;">
			<button id="commentReg" class="btn btn-secondary">댓글 등록</button>
		</div>
	</div>
	
	<div id="repl" style="margin-top: 20px" >
			<span id="CommentCount" style="color: red; font-weight:bold;"></span>
			<span style="color: red;">개</span>의 상품 리뷰
	</div>
		
	<div id="replies" style="margin-top: 20px"></div>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="../static/js/productComment-details.js"></script>
	<script src="../static/js/product-detail.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>

</body>
<footer>
	<p style="text-align: center;">&copy; Alcohol Event Mall of Team Turkey(칠면조). All rights
		reserved.</p>
</footer>
</html>