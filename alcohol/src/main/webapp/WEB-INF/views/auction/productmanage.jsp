<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>상품관리</title>
<style>
li {
	font-size: large;
	font-weight: bold;
	padding-bottom: 20px;
}

.container {
	width: 100%;
}

.navbar {
	background-color: #000;
	color: #fff;
}

.navbar .navbar-nav .nav-link {
	color: #fff;
}

.scrollable-table-container {
	height: 300px;
	overflow-y: scroll;
}

.scrollable-table {
	width: 100%;
	border-collapse: collapse;
}

.scrollable-table th, .scrollable-table td {
	padding: 8px;
	border: 1px solid #ccc;
}

#modals {
	position: fixed;
}

.sidebar {
	position: absolute;
	top: 60px;
	left: 0;
	height: 100%;
	width: 240px;
}

.mains {
	margin-top: 50px;
	margin-right: 220px;
	margin-left: 380px;
}

.headers {
	margin: 0px 270px;
}

body {
	background-color: light;
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

	<div class="flex-shrink-0 p-3 bg-white" style="width: 200px;">
		<div id="sidebar" class="flex-shrink-0 p-3 bg-light sidebar">
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li><c:url var="auctionadmin" value="/auction" /> <a
					href="${ auctionadmin }"
					class="nav-link link-dark list-group-item list-group-item-action">
						관리자 메인 </a></li>
				<li class="nav-item"><c:url var="auctionProduct"
						value="/auction/product" /> <a href="${ auctionProduct }"
					class="nav-link link-dark list-group-item list-group-item-action"
					aria-current="page"> 경매 상품조회/수정 </a></li>
				<li><c:url var="productcreate" value="/auction/productcreate" />
					<a href="${ productcreate }"
					class="nav-link link-dark rounded border-0 list-group-item list-group-item-action">
						경매 상품등록 </a></li>
				<li><c:url var="auctionm" value="/auction/auction" /> <a
					href="${ auctionm }"
					class="nav-link link-dark list-group-item list-group-item-action">
						경매 조회/수정 </a></li>
				<li><c:url var="auctionRegistration"
						value="/auction/registration" /> <a
					href="${ auctionRegistration }"
					class="nav-link link-dark list-group-item list-group-item-action">
						경매 등록 </a></li>
				<li><c:url var="shopproducts" value="/shop/pdlist" /> <a
					href="${ shopproducts }"
					class="nav-link link-dark list-group-item list-group-item-action">
						쇼핑몰 상품조회 </a></li>
				<li><c:url var="shopcreate" value="/shop/pdcreate" /> <a
					href="${ shopcreate }"
					class="nav-link link-dark list-group-item list-group-item-action">
						쇼핑몰 상품등록 </a></li>
				<li><c:url var="aproductinfo" value="/shop/aproductinfo" />
					<a href="${ aproductinfo }"
					class="nav-link link-dark list-group-item list-group-item-action">
						쇼핑몰 주문현황 </a></li>
			</ul>


		</div>
	</div>
	
	<main class="card mains">
		<div class="d-none">
			<input id="userid" value="${ sessionScope.userNickname }"
				name="userid">
		</div>
		<div>
			<label for="productname" class="mx-3 my-2 form-label">상품명</label> <input maxlength="45"
				id="productname" name="pname" type="text" class="mx-3 form-control" style="width: 890px;">
		</div>
		<div>
			<label for="constructor" class="mx-3 my-2 form-label">제조사</label> <input maxlength="45"
				id="constructor" class="mx-3 form-control" name="constructor" style="width: 890px;"
				type="text">
		</div>
		<div>
			<label for="brandname" class="mx-3 my-2 form-label">브랜드명</label> <input maxlength="45"
				id="brandname" class="mx-3 form-control" name="brandname" style="width: 890px;"
				type="text">
		</div>
		<div>
			<label class="mx-3 my-1">카테고리</label> <select
				class="form-select mx-3 my-1" aria-label="Default select example"
				id="category" name="category" style="width: 300px; height: 40px;">
				<option selected="selected" value="50">선택안함</option>
				<option value="1">탁주</option>
				<option value="2">약주</option>
				<option value="3">청주</option>
				<option value="4">맥주</option>
				<option value="5">과실주</option>
				<option value="6">소주</option>
				<option value="7">위스키</option>
				<option value="8">브랜디</option>
				<option value="9">증류주</option>
				<option value="10">리큐르</option>
				<option value="11">주정</option>
				<option value="12">기타주류</option>
			</select>
		</div>
		<div class="my-2"></div>

		<div>
			<span id="btnsearch" class="btn">상세 검색</span> <span id="btninit"
				class="btn">초기화</span>
		</div>

		<div class="card">
			<table class="table">
				<thead>
					<tr>
						<th class="d-none">상품코드</th>
						<th>상품명</th>
						<th>제조사(생산자)</th>
						<th>브랜드</th>
						<th>종류</th>
						<th>원가</th>

					</tr>
				</thead>
				<tbody id="productList">
					<c:forEach var="list" items="${ productlist }">
						<tr>
							<td class="d-none">${ list.userid }</td>
							<td class="d-none" id="productid">${ list.productid }</td>
							<td><c:url var="detailPage" value="/auction/productdetail">
									<c:param name="productid" value="${ list.productid }"></c:param>
								</c:url> <a href="${ detailPage }"> ${ list.pname } </a></td>
							<td>${ list.constructor }</td>
							<td>${ list.brandname }</td>

							<c:if test="${ list.category == 1 }">
								<td>탁주</td>
							</c:if>
							<c:if test="${ list.category == 2 }">
								<td>약주</td>
							</c:if>
							<c:if test="${ list.category == 3 }">
								<td>청주</td>
							</c:if>
							<c:if test="${ list.category == 4 }">
								<td>맥주</td>
							</c:if>
							<c:if test="${ list.category == 5 }">
								<td>과실주</td>
							</c:if>
							<c:if test="${ list.category == 6 }">
								<td>소주</td>
							</c:if>
							<c:if test="${ list.category == 7 }">
								<td>위스키</td>
							</c:if>
							<c:if test="${ list.category == 8 }">
								<td>브랜디</td>
							</c:if>
							<c:if test="${ list.category == 9 }">
								<td>증류주</td>
							</c:if>
							<c:if test="${ list.category == 10 }">
								<td>리큐르</td>
							</c:if>
							<c:if test="${ list.category == 11 }">
								<td>주정</td>
							</c:if>
							<c:if test="${ list.category == 12 }">
								<td>기타주류</td>
							</c:if>

							<td>${ list.cost }</td>

						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>


	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
		
	</script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="../static/js/product-detail-search.js"></script>
</body>
</html>