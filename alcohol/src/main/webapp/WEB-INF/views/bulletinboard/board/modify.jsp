<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>칠면주조에 오신걸 환영합니다 - 커뮤니티</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous" />
<style>
.textNav {
	color: white;
	text-decoration: none;
	margin-left: 10px;
}

.textNav:hover {
	color: blue;
	text-decoration: underline;
}

.navList {
	display: flex;
	flex-direction: row;
	margin-right: 10px;
}

.abc {
	text-underline-offset: var(--offset, 0.2em);
	text-decoration: underline 0.12em;
	transition: --offset 400ms, text-decoration-color 400ms;
	color: white;
}

.mainDiv {
	display: flex;
	justify-content: space-around;
}

.main {
	width: 700px;
	height: 100%;
	height: 100%;
	display: flex;
}

.selectDiv {
	margin-top: 20px;
	width: 700px;
}

.authorDiv {
	font-size: 4px;
	margin-top: 10px;
	margin-bottom: 20px;
	width: 700px;
}

.imageDiv {
	display: flex;
    justify-content: center;
}

.btnContent {
	margin-top: 15px;
	margin-bottom: 30px;
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
	<div class="mainDiv">
		<div style="outline: none" class="main">
			<div>
				<div>
					<section>
						<input type="text" class="d-none"
							value="${ sessionScope.userNickname }" id="loginId"
							name="loginId" /> <input type="number" class="d-none"
							value="${ board.board_id }" id="boardId" name="boardId" />

						<div class="input-group mb-3" style="margin-top: 20px;">
							<span class="input-group-text" id="inputGroup-sizing-default">제목</span>
							<input type="text" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default"
								value="${ board.title }" id="title" name="title" />
						</div>

						<div class="authorDiv fw-semibold">
							<label for="nickname">작성자 : </label>
							<span name="nickname">${ board.nickname }</span> 
							<span name="user_id">(${ board.user_id })</span>
							<div class="vr"></div>
							<span name="time">${ board.time }</span>
						</div>

						<div class="imageDiv">
							<img src="data:image/jpeg;base64,${ board.image }"
								class="img-fluid rounded-start" alt="이미지" id="DefaultImage">
						</div>

						<div class="form-floating mb-3">
							<textarea class="form-control" style="height: 100px; height: 350px; margin-top: 30px;" id="content" 
								name="content">${ board.content }</textarea>
						</div>

						<form id="modifyForm">
							<div>
								<input type="file" id="file" name="file" class="form-control"/>
							</div>
						</form>

						<div class="btnWrapper d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btnContent btn btn-light me-md-2" id="updateBtn" >수정완료</button>
						</div>

					</section>
				</div>
			</div>
		</div>
	</div>

	<div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script src="../../static/js/board-modifys.js"></script>
	</div>
</body>
</html>
