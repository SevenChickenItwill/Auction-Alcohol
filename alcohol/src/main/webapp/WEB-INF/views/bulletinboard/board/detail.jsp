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
</style>
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
					<a href="#" class="textNav">마이페이지</a>
					<c:url value="/" var="mainPage" />
					<a href="${ mainPage }" class="textNav">메인페이지</a>
				</div>
			</div>
		</div>
	</header>
	<div class="main">
		<div>
			<div class="mainInner">
				<div class="innerView">
					<input type="text" class="d-none"
						value="${ sessionScope.userNickname }" id="loginId" name="loginId" />

					<section>
						<form id="boardForm">
							<input type="number" class="d-none" value="${ board.board_id }"
								id="boardId" name="board_id" />
							<div>
								<div>
									<div>
										<div style="width: 500px;">
											<div style="word-break: break-all;">
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
											<div style="word-break: break-all;">
												<p>${ board.content }</p>
											</div>
											<div class="recommendBtn">
												<div style="margin-right: 10px;">
													<input type="button" class="btn btn-info" value="추천"
														id="recommendUp" />
												</div>
												<div style="margin-left: 10px;">
													<input class="btn btn-info" type="button" value="비추천"
														id="recommendDo" />
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</form>
						

						<c:set var="writerid" value="${ board.nickname }"></c:set>
						<c:set var="checkid" value="${ sessionScope.userNickname }"></c:set>

						<div class="d-grid gap-2">
							<c:url
								value="/bulletinboard/board/list?num=0&keyword=&category=&boardNumber=0"
								var="boardList" />
							<a href="${ boardList }" class="btn btn-dark"
								type="button">목록페이지</a>
						</div>
						<c:if test="${ checkid eq writerid }">
							<div class="d-grid gap-2 d-md-flex justify-content-md-end"
								style="margin-top: 10px;">
								<c:url var="boardModify" value="/bulletinboard/board/modify">
									<c:param name="id" value="${ board.board_id }"></c:param>
								</c:url>
								<a href="${ boardModify }" class="btn btn-dark "
									type="button">수정하기</a>
								<button class="btn btn-dark" type="button"
									id="deleteBoardBtn">삭제하기</button>
							</div>
						</c:if>
						<c:if test="${ checkid ne writerid }">
							<div class="d-grid gap-2 d-md-flex justify-content-md-end"
								style="margin-top: 10px;">
								<c:url var="boardModify" value="/bulletinboard/board/modify">
									<c:param name="id" value="${ board.board_id }"></c:param>
								</c:url>
								<a href="${ boardModify }" class="btn btn-dark d-none"
									type="button">수정하기</a>
								<button class="btn btn-dark d-none" type="button"
									id="deleteBoardBtn">삭제하기</button>
							</div>
						</c:if>

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
								<span name="viewUserNickname">${ sessionScope.userNickname }</span>
							</div>
						</div>

						<input value="${ sessionScope.userNickname }" class="d-none"
							id="userNickname" readonly />

						<div class="form-floating mb-3">
							<textarea class="col-5 form-control"
								style="height: 100px; height: 150px;" placeholder="댓글 쓰기"
								id="content"></textarea>
						</div>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button type="button" class="btn btn-dark" id="commentReg"
								style="margin-bottom: 30px;">등록</button>
						</div>

						<hr style="margin-top: 5px; margin-bottom: 15px;" />

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
		<script src="../../static/js/board-detailss.js"></script>
	</div>

</body>

</html>