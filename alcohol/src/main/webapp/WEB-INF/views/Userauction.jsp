<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>사용자 관리 페이지 - 경매</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
    crossorigin="anonymous">
<style>
li{
	color: white;
	margin-right: 50px;
}

a:link {`1
	color:secondary;
}

a:visited {
	color : secondary;
}

a:hover {
	color : secondary;
}

a:active {
	color : secondary;
}
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
.auctionform{
	
	display:flex;	
	width: 100%;
	align-content: center;
	justify-content: center;
}
h2{
	
	font-weight: bold;
	
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
	<main class="mains">
	<div style="
    display: flex;
    justify-content: center;
	">
	<div style="width: 1100px; margin-top: 100px;">
	<div class="form-control">
	<div class="auctionform">
	
		<h2>관심 경매</h2>
		
		</div>
		<div>
		<table class="table">
			<thead>
				<tr>
					<th>경매명</th>
					<th>주최자</th>
					<th>현재 입찰자</th>
					<th>상품명</th>
					<th>상품브랜드</th>
					<th>상품제조사</th>
					<th>입찰금액</th>
					<th>입찰수</th>
				</tr>
			</thead>
			<tbody class="table table-hover" id="tablebody1">
				<c:forEach items="${myauction}" var="myauction">
					<c:if test="${myauction.status == 1 }">
					<c:url var="quickgoing" value="/auction/mainsite">
						<c:param name="auctionname" value="${myauction.auctionName}"></c:param>
						<c:param name="aid" value="${myauction.aid }"></c:param>
					</c:url>
					<tr>
						<td><a href="${ quickgoing }">${myauction.auctionName}</a></td>
						<td>${myauction.auctioneer}</td>
						<td>${myauction.bidder }</td>
						<td>${myauction.pname}</td>
						<td>${myauction.brandname}</td>
						<td>${myauction.constructor}</td>
						<td>${myauction.nowbid}</td>
						<td>${myauction.bidcount}</td>
					</tr>
					</c:if>
				</c:forEach>
				
				
			</tbody>
		</table>
		</div>
		</div>
		<br />
		
		<div class="form-control">
		<div class="auctionform">
			<h2>종료된 경매</h2>
			</div>
			<div>
		<table class="table">
			<thead>
				<tr>
					<th>경매명</th>
					<th>주최자</th>
					<th>낙찰자</th>
					<th>낙찰상품명</th>
					<th>상품브랜드</th>
					<th>상품제조사</th>
					<th>낙찰금액</th>
					<th>입찰수</th>
					<th>결제 여부</th>
				</tr>
			</thead>
			<tbody class="table table-hover" id="tablebody2">
				<c:forEach items="${myauction2}" var="mine">
					<c:if test="${mine.status == 2 }">
					<tr>
					<c:url var="quickgo" value="/auction/mainsite">
						<c:param name="auctionname" value="${mine.auctionName}"></c:param>
						<c:param name="aid" value="${mine.aid }"></c:param>
					</c:url>
						<td><a href="${ quickgo }">${mine.auctionName}</a></td>
						<td>${mine.auctioneer}</td>
						<td>${mine.bidder }</td>
						<td>${mine.pname}</td>
						<td>${mine.brandname}</td>
						<td>${mine.constructor}</td>
						<td>${mine.nowbid}</td>
						<td>${mine.bidcount}</td>
						<!-- 경매품 결제 여부 확인 -->
						<td>결제 준비중</td>
					</tr>
					</c:if>
				</c:forEach>
				
				
			</tbody>
		</table>
		</div>
		</div>
		<br />
		<div class="form-control">
	<div class="auctionform">
	<h2>게시글 이력</h2>
	</div>
		<table class="table">
			<thead>
				<tr>
					<th>게시글 번호</th>
					<th>제목</th>
					<th>작성자</th><!-- boardId, nickname -->
					<th>내용</th>
					<th>작성시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ histories }" var="history">
				<tr>
					<td>${ history.board_id }</td>
					<td>
						<c:url var="postDetailPage" value="/bulletinbaord/board/historydetail">
							<c:param name="id" value= "${ history.board_id }" />	
						</c:url>
						<a href="${ postDetailPage }">${ history.title }</a>
					</td>	
					<td>${ history.user_id }(${ history.nickname })</td>
					<td>${ history.content }</td>
					<td>${ history.time }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<br />
		<div class="form-control">
		<div class="auctionform">
			<h2>주문 목록</h2>
			</div>
			<div>
		<table class="table">
			<thead>
				<tr>
					<th>상품명(규격 / 단위)</th>
					<th>판매자</th>
					<th>수량</th>
					<th>단가</th>
					<th>합계금액</th>
					<th>도수</th>
					<th>주종</th>
					<th>배송지</th>
					<th>전화번호</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody class="table table-hover" id="tablebody3">
				<c:forEach var="list3" items="${ mypayment }">
					<tr>
						<td>${ list3.productname } ( ${ list3.standard } / ${ list3.unit })</td>
						<td>${ list3.userid }</td>
						<td>${ list3.quantity }</td>
						<td>${ list3.price }</td>
						<td>${ list3.totalamount }</td>
						<td>${ list3.alcohol_level }</td>
						<td>${ list3.category }</td>
						<td>${ list3.userAddress }</td>
						<td>${ list3.userPhone }</td>
						<c:if test="${ list3.status==0 }">
							<td>배송 준비중</td>
						</c:if>
						<c:if test="${ list3.status==1 }">
						<td>배송 중</td>
						</c:if>
					</tr>
				</c:forEach>
				
				
			</tbody>
		</table>
		</div>
		</div>
		
		</div>	
		</div>
	</main>

 <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
</body>
</html>