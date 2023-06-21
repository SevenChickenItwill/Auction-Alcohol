<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<style>
div#list {
	float: left;
	left: 70px;
	right: 40px;
	margin: 40px;
	padding: 30px;
}

div#page {
	text-Align: center;
}

a#title:hover {
	color: pink;
}

a#nick-name:hover {
	color: #F7BE81;
}

header {
	color: white;
}

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
	<c:url var="productstype" value="/shop/shopmain">
		<c:param name="num" value="0"></c:param>
	</c:url>
	<div
		style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
		<form method="post" action="${ productstype }" style="display: flex;">
			<select name="category">
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
			<button type="submit" class="btn btn-dark">찾기</button>
		</form>


		<!-- 상품명/브랜드명으로 검색하기 -->
		<div>
			<c:url value="/shop/shopsearch" var="search"></c:url>
			<form class="d-flex" action="${ search }" role="search">
				<input type="number" class="d-none" name="page" value="0" /> <select
					name="category">
					<option value="pname">상품명</option>
					<option value="brand">브랜드</option>
					<option value="pnamebrand">상품명 + 브랜드</option>
				</select> <input class="form-control me-2" name="keyword"
					placeholder="검색어를 입력해주세요" style="width: 400px;" required />
				<button type="submit" class="btn btn-dark">검색</button>
			</form>
		</div>
	</div>
	<hr />


	<!-- 상품 정보 -->
		<div style="display: inline-block;">
			<c:set var="len" value="${ length }"></c:set>
			<c:set var="count" value="${ pageCount }" />
			<c:set var="nums" value="${ param.num }" />
			<c:set var="maxIndex" value="${ maxIndex }" />

			<c:if test="${ maxIndex - 1 > 0 }">

				<c:forEach items="${ products }" var="list" begin="${count}"
					end="${ maxIndex -1 }">
					<c:url var="pddetails" value="/shop/pddetails">
						<c:param name="id" value="${ list.pid }"></c:param>
					</c:url>
					<div id="list" class="card" style="width: 18rem;">
						<a href="${ pddetails }">
							<li class="list-group-item">상품명: ${ list.productname }</li>
							<div class="card-body">
								<li class="list-group-item"><img width="100%"
									height="150px" src="data:image/jpeg;base64,${list.photopath}" /></li>
							</div>


							<ul class="list-group list-group-flush">
								<li class="list-group-item">브랜드: ${ list.brand }</li>
								<li class="list-group-item">상품정보: ${ list.hashtag } <br>
									용량: ${ list.standard },<br> 규격: ${ list.unit }
								</li>
								<li class="list-group-item">도수: ${ list.alcohol_level },<br>
									유통기한: ${ list.expirationdate }
								</li>
								<li class="list-group-item">가격: ${ list.price }</li>
							</ul>
						</a>
					</div>
				</c:forEach>

			</c:if>

		</div>

	<!-- 페이지네이션 -->
	<div id="page">
		<div
			style="display: flex; justify-content: space-evenly; align-items: center;">
			<c:url var="nextlist" value="/shop/shopmain">
				<c:choose>
					<c:when test="${(nums) * 10 > maxIndex - 10 }">
						<c:set var="number" value="${nums}" />
						<c:param name="num" value="${number}"></c:param>
					</c:when>
					<c:otherwise>
						<c:set var="number" value="${nums + 1}" />
						<c:param name="num" value="${number}"></c:param>
					</c:otherwise>
				</c:choose>
			</c:url>
			<c:url var="beforelist" value="/shop/shopmain">
				<c:choose>
					<c:when test="${(nums - 1) * 10 < 0 }">
						<c:set var="number" value="${nums}" />
						<c:param name="num" value="${number}"></c:param>
					</c:when>
					<c:otherwise>
						<c:set var="number" value="${nums - 1}" />
						<c:param name="num" value="${number}"></c:param>
					</c:otherwise>
				</c:choose>

			</c:url>
			<div></div>
			<div></div>
			<div></div>
			<div>
				<c:url var="indexZero" value="/shop/shopmain?num=0" />
				<a href="${ indexZero }" type="button"><button
						class="btn btn-dark">&lt;&lt;</button></a> <a href="${ beforelist }"
					type="button"><button class="btn btn-dark">&lt;</button></a>
			</div>
			<c:choose>

				<c:when test="${ listPageMax < 9 }">
					<c:forEach begin="${ 1 }" end="${ listPageMax }" var="listFor">
						<c:url var="listPageNum"
							value="/shop/shopmain?num=${ listFor - 1 }" />
						<a href="${ listPageNum }">${ listFor }</a>
					</c:forEach>
				</c:when>

				<c:when test="${ (num / 10) * 10 - 4 < 0}">
					<c:url var="listPageNum" value="/shop/shopmain?num=0" />
					<a href="${ listPageNum }">1</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=1" />
					<a href="${ listPageNum }">2</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=2" />
					<a href="${ listPageNum }">3</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=3" />
					<a href="${ listPageNum }">4</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=4" />
					<a href="${ listPageNum }">5</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=5" />
					<a href="${ listPageNum }">6</a>
					<c:url var="listPageNum" value="/shop/shopmain?num6" />
					<a href="${ listPageNum }">7</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=7" />
					<a href="${ listPageNum }">8</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=8" />
					<a href="${ listPageNum }">9</a>
				</c:when>



				<c:when test="${ (num / 10) * 10 + 5 > listPageMax  }">
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 9 }" />
					<a href="${ listPageNum }">${ listPageMax - 8 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 8 }" />
					<a href="${ listPageNum }">${ listPageMax - 7 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 7 }" />
					<a href="${ listPageNum }">${ listPageMax - 6 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 6 }" />
					<a href="${ listPageNum }">${ listPageMax - 5 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 5 }" />
					<a href="${ listPageNum }">${ listPageMax - 4 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 4 }" />
					<a href="${ listPageNum }">${ listPageMax - 3 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 3 }" />
					<a href="${ listPageNum }">${ listPageMax - 2 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 2 }" />
					<a href="${ listPageNum }">${ listPageMax - 1 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 1 }" />
					<a href="${ listPageNum }">${ listPageMax }</a>
				</c:when>

				<c:otherwise>
					<c:forEach begin="${ (num / 10) * 10 - 3 }"
						end="${ (num / 10) * 10 + 5 }" var="listFor">
						<c:url var="listPageNum"
							value="/shop/shopmain?num=${ listFor - 1 }" />
						<a href="${ listPageNum }">${ listFor }</a>
					</c:forEach>
				</c:otherwise>

			</c:choose>


			<div>
				<a href="${ nextlist }"><button class="btn btn-dark"
						type="button">&gt;</button></a>
				<c:url var="maxIndex"
					value="/shop/shopmain?num=${ listPageMax - 1 }" />
				<a href="${ maxIndex }"><button class="btn btn-dark"
						type="button">&gt;&gt;</button></a>
			</div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>

</body>
</html>