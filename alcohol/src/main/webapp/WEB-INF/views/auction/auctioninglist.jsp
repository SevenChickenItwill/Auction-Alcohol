<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>Album example · Bootstrap v5.2</title>

<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/album/" />

<link href="../static/css/album.css" rel="stylesheet"
	crossorigin="anonymous" />




<style>
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
</style>


</head>
<body>

	<header>
		<div class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container">
				<a href="#" class="navbar-brand d-flex align-items-center"> <svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="none" stroke="currentColor" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2" aria-hidden="true"
						class="me-2" viewBox="0 0 24 24">
						<path
							d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
						<circle cx="12" cy="13" r="4"></circle></svg> <strong>Album</strong>
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarHeader"
					aria-controls="navbarHeader" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</div>
	</header>

	<main>
		<div class="row">
		</div>
		<div class="row">
		<div class="my-4 text-center">
		<div class="btn-group center" role="group" aria-label="Basic radio toggle button group">
			<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" /> 
				<label class="btn btn-outline-secondary" for="btnradio1">
					<c:url var="totallist" value="/auction/auctionlist"/>
					<a href="${ totallist }" style=" padding: 4px; text-decoration: none;">전체</a>
				</label> 
			<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" checked> 
				<label class="btn btn-outline-secondary" for="btnradio2">
					<c:url var="inglist" value="/auction/auctioninglist"/>
					<a href="${ inglist }" style="text-decoration: none;">진행중</a>
				</label> 
			<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
				<label class="btn btn-outline-secondary" for="btnradio3">
					<c:url var="endlist" value="/auction/auctionendlist"/>
					<a href="${ endlist }" style=" padding: 4px; text-decoration: none;">종료</a>
				</label>
		</div>
		</div>
		</div>
		<input class="d-none" value=${ status } id="status" type="number" />
		
		<section class="text-center container">
			<div class="row py-lg-3">
				<div class="col-lg-6 col-md-8 mx-auto">
					<h1 class="fw-light">맛과 역사가 어우러진 경매의 향연, 희귀한 한국 전통주</h1>
					<p class="lead text-muted">한국의 전통주를 소장하고자 하는 컬렉터들을 위한 최상의 장소로                 
					여러분을 초대합니다. 그리고 고유한 맛과 가치를 발견하는 여정에 함께 하길 기대합니다!</p>
				</div>
			</div>
		</section>

		<div class="album py-5 bg-light">
			<div class="container">

				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="listmain">
					<c:forEach var="list" items="${ auctioninfo }">
						<c:url var="viewauction" value="/auction/mainsite">
							<c:param name="aid" value="${ list.aid }" />
							<c:param name="auctionName" value="${ list.auctionName }" />
							<c:param name="aid" value="${ list.aid }" />
						</c:url>
						<a href="${ viewauction }" style=" color:black; text-decoration: none;">
						<div class="col">
							<div class="card shadow-sm">
								<p class="my-1 mx-2">${ list.auctionName }</p>
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

								<div class="card-body">
									<p class="d-none"></p>
									<p>상품명: </p>
									<p>브랜드: </p>
									<p>즉시낙찰가: </p>
									<p>현재입찰가: </p>
									<p>입찰자: </p>
									<p>입찰횟수: </p>
									<p>경매시작일: </p>
									<p>경매종료일: </p>
								</div>
							</div>
						</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>

	</main>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="../static/js/auction-list.js"></script>
</body>
</html>