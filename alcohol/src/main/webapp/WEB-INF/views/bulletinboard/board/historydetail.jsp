<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<style>
.navList {
	display: flex;
	flex-direction: row-reverse;
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

.navbar {
	margin-bottom: 20px;
}

.main {
	display: flex;
	justify-content: center;
}

.mainInner {
	width: 800px;
}

.innerView {
	display: grid;
	justify-content: center;
}

.userFont {
	font-size: 4px;
}

.imgDiv {
	display: flex;
	justify-content: center;
	margin-bottom: 30px;
}

.recommendBtn {
	display: flex;
	justify-content: center;
	margin-bottom: 40px;
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


	<div class="main">
		<div>
			<div class="mainInner">
				<div class="innerView">
					<input type="text" class="d-none"
						value="${ sessionScope.userEmail }" id="loginId" />

					<section>
						<form id="boardForm">
							<input type="number" class="d-none" value="${ board.board_id }"
								id="boardId" name="board_id" />
							<div>
								<div>
									<div>
										<div style="width: 500px;">
											<div>
												<h5 class="fs-2 fw-bold" style="margin-bottom: 17px;">${ board.title }</h5>
											</div>
											<p class="userFont">${ board.nickname }(${ board.user_id })
												<span class="vr"></span> ${ board.time }
											</p>
											<hr style="margin: 0;" />
											<p>
												<span>조회수[${ board.views }]</span> <span class="vr"
													style="margin-left: 8px; margin-right: 8px;"> </span> <span
													id="recommendCnt"> 추천수 ${ board.recommend } <span
													class="vr" style="margin-left: 8px; margin-right: 8px;">
												</span>
												</span> <span class="badge rounded-pill text-bg-warning"> 댓글<span
													id="boardCommendCount"></span>
												</span>
											</p>
											<div class="imgDiv">
												<img src="data:image/jpeg;base64,${ image }" alt="이미지" />
											</div>
											<p>${ board.content }</p>
											<div>
												<div class="recommendBtn">
													<div style="margin-right: 10px;">
														<input type="button" class="btn btn-success" value="추천"
															id="recommendUp" />
													</div>
													<div style="margin-left: 10px;">
														<input class="btn btn-success" type="button" value="비추천"
															id="recommendDo" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>

						<div class="d-grid gap-2">
							<c:url var="historylist" value="/action/actionview">
								<c:param value="${board.nickname}" name="nickname" />
							</c:url>
							<a class="btn btn-outline-secondary" type="button" href="${historylist}">뒤로가기</a>
						</div>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-top: 10px;">
							<c:if test="${ checkid eq writerid }">
								<c:url var="boardModify" value="/bulletinboard/board/modify">
									<c:param name="id" value="${ board.board_id }"></c:param>
								</c:url>
								<a href="${ boardModify }" class="btn btn-outline-secondary " type="button">수정하기</a>
								<button class="btn btn-outline-secondary" type="button"
									id="deleteBtn">삭제하기</button>
							</c:if>
						</div>
						
						<hr style="margin-top: 30px; margin-bottom: 5px;" />
						
						<div>
							<input id="updateCommentId" type="hidden" />
						</div>
						
						<div>
							<span>전체 댓글</span> <span id="commentCount"></span>
						</div>
						
						<hr style="margin-top: 5px; margin-bottom: 15px;" />
						
						<div class="form-floating" style="height: 100px; height: 30px;">
							<div class="form-control" style="padding: 5px;">
								<label for="viewUserNickname">닉네임</label>
								<div class="vr"></div>
								<span name="viewUserNickname" id="userNickname">${ sessionScope.userNickname }</span>
							</div>
						</div>
						
						<input value="${ sessionScope.userNickname }" class="d-none" id="userNickname" readonly />
						
						<div class="form-floating mb-3">
							<textarea class="col-5 form-control" style="height: 100px; height: 150px;"
								 placeholder="댓글 쓰기" id="content"></textarea>
						</div>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button type="button" class="btn btn-secondary" id="commentReg" style="margin-bottom: 30px;">등록</button>
						</div>

						<div id="replies"></div>

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
		<script src="../../static/js/board-history.js"></script>
	</div>
</body>
</html>