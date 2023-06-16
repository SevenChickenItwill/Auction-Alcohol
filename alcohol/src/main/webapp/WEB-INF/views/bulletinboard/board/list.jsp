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

<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/album/" />

<link href="../../static/css/album.css" rel="stylesheet"
	crossorigin="anonymous" />
</head>
<style>
.main {
	height: 100%;
	display: flex;
	justify-content: center;
	flex-direction: column-reverse;
}

.aDiv {
	justify-content: space-evenly;
	margin-top: 10px;
}

.row {
	justify-content: center;
	width: 598px;
}

.col-md-4 {
	display: flex;
	align-items: center;
}

.smallNickId {
	font-size: small;
}

.card-body {
	padding: 5px 5px;
}

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

.pageNum {
	display: flex;
	justify-content: space-around;
}

.searchDiv {
	display: flex;
	justify-content: space-around;
	margin-top: 10px;
	margin-bottom: 20px;
}

.keywordSubmit {
	display: flex;
	justify-content: space-evenly;
}

.mainDiv {
	display: flex;
	height: 100%;
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

	<div style="outline: none" class="main">
		<div
			style="display: flex; align-content: center; flex-wrap: wrap; align-items: stretch; flex-direction: column;">
			<div>
				<!-- 전체글 ㅣ 공지글 ㅣ 추천순  정렬 -->
				<div class="aDiv d-grid gap-2 d-md-flex">
					<c:url value="/bulletinboard/board/list" var="boardList">
						<c:param name="num" value="0" />
						<c:param name="keyword" value=""></c:param>
						<c:param name="category" value=""></c:param>
						<c:param name="boardNumber" value="0"></c:param>
					</c:url>
					<a href="${ boardList }">
						<button type="button" class="btn btn-dark btn-lg">전체글</button>
					</a>
					<c:url var="announcement" value="/bulletinboard/board/list">
						<c:param name="num" value="0"></c:param>
						<c:param name="keyword" value=""></c:param>
						<c:param name="category" value=""></c:param>
						<c:param name="boardNumber" value="2"></c:param>
					</c:url>
					<a href="${ announcement }"><button type="button"
							class="btn btn-dark btn-lg">공지 사항</button></a>
					<c:url var="recommend" value="/bulletinboard/board/list">
						<c:param name="num" value="0"></c:param>
						<c:param name="keyword" value=""></c:param>
						<c:param name="category" value=""></c:param>
						<c:param name="boardNumber" value="3"></c:param>
					</c:url>
					<a href="${ recommend }"><button type="button"
							class="btn btn-dark btn-lg">추천순</button></a>
					<c:url value="/bulletinboard/board/create" var="dealCreated" />
					<c:if test="${ sessionScope.userNickname ne null }">
						<a href="${ dealCreated }" class="textNav"><button
								type="button" class="btn btn-dark btn-lg">새글작성</button></a>
					</c:if>
				</div>
				<!-- 포스트 테이블 -->
				<div class="container">
					<div class="row">
						<div class="col-lg-8 offset mt-5" style="width: 600px;">
							<div>
								<c:set var="len" value="${ length }"></c:set>
								<c:set var="count" value="${ pageCount }" />
								<c:set var="nums" value="${ param.num }" />
								<c:set var="maxIndex" value="${ maxIndex }" />

								<c:if test="${ listSize != 0 }">
									<div class="listTable">
										<c:forEach items="${ boards }" var="board" begin="${ count }"
											end="${ maxIndex - 1 }">
											<input type="hidden" value="${ board.board_id }" id="boardId" />
											<div class="itemBoard">
												<div class="card mb-3"
													style="max-width: 860px; width: 600px;">
													<c:url var="detailPage" value="/bulletinboard/board/detail">
														<c:param name="id" value="${ board.board_id }"></c:param>
													</c:url>
													<a href="${ detailPage }">
														<div class="row g-0">
															<div class="col-md-2" style="display: flex; align-items: center;">
																<!-- 이미지 -->
																<img src="data:image/jpeg;base64,${ board.image }"
																	class="img-fluid rounded-start" alt="이미지">
															</div>
															<div class="col-md-10">
																<div class="card-body">
																	<!-- 게시글 제목, 게시글 댓글수 -->
																	<h5 class="card-title">${ board.title }[${ board.rcnt }]</h5>

																	<!-- 닉네임(아이디) ㅣ 시간 ㅣ 조회수 ㅣ 추천수   대로 나타냄 -->
																	<p class="smallNickId  card-text">
																		<small class="text-body-secondary">${ board.nickname }<br />
																			<fmt:formatDate value="${ board.time }"
																				pattern="yyyy-MM-dd HH:mm" /> ,추천수 : [${ board.recommend }],
																			조회수 : [${ board.views }]
																		</small>
																	</p>
																	
																	<p class="card-text d-inline-block text-truncate" style="max-width: 150px;">${ board.content }</p>
																</div>
															</div>
														</div>
													</a>
												</div>
											</div>
										</c:forEach>
									</div>
								</c:if>
							</div>

							<!-- 페이지네이션 -->
							<div class="pageNum">
								<c:url var="nextlist" value="/bulletinboard/board/list">
									<c:choose>
										<c:when test="${(nums) * 10 > maxIndex - 10 }">
											<c:set var="number" value="${nums}" />
											<c:param name="num" value="${number}"></c:param>
											<c:param name="keyword" value="${ keyword }"></c:param>
											<c:param name="category" value="${ category }"></c:param>
											<c:param name="boardNumber" value="${ boardNumber }"></c:param>
										</c:when>
										<c:otherwise>
											<c:set var="number" value="${nums + 1}" />
											<c:param name="num" value="${number}"></c:param>
											<c:param name="keyword" value="${ keyword }"></c:param>
											<c:param name="category" value="${ category }"></c:param>
											<c:param name="boardNumber" value="${ boardNumber }"></c:param>
										</c:otherwise>
									</c:choose>
								</c:url>
								<c:url var="beforelist" value="/bulletinboard/board/list">
									<c:choose>
										<c:when test="${(nums - 1) * 10 < 0 }">
											<c:set var="number" value="${nums}" />
											<c:param name="num" value="${number}"></c:param>
											<c:param name="keyword" value="${ keyword }"></c:param>
											<c:param name="category" value="${ category }"></c:param>
											<c:param name="boardNumber" value="${ boardNumber }"></c:param>
										</c:when>
										<c:otherwise>
											<c:set var="number" value="${nums - 1}" />
											<c:param name="num" value="${number}"></c:param>
											<c:param name="keyword" value="${ keyword }"></c:param>
											<c:param name="category" value="${ category }"></c:param>
											<c:param name="boardNumber" value="${ boardNumber }"></c:param>
										</c:otherwise>
									</c:choose>

								</c:url>
								<div>
									<c:url var="indexZero" value="/bulletinboard/board/list?num=0">
										<c:param name="keyword" value="${ keyword }"></c:param>
										<c:param name="category" value="${ category }"></c:param>
										<c:param name="boardNumber" value="1"></c:param>
									</c:url>
									<a href="${ indexZero }"><button>&lt;&lt;</button></a> <a
										href="${ beforelist }"><button>&lt;</button></a>
								</div>
								<c:choose>

									<c:when test="${ listPageMax < 9 }">
										<c:forEach begin="${ 1 }" end="${ listPageMax }" var="listFor">
											<c:url var="listPageNum"
												value="/bulletinboard/board/list?num=${ listFor - 1 }" />
											<a href="${ listPageNum }">${ listFor }</a>
										</c:forEach>
									</c:when>

									<c:when test="${ (num / 10) * 10 - 4 < 0}">

										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=0" />
										<a href="${ listPageNum }">1</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=1" />
										<a href="${ listPageNum }">2</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=2" />
										<a href="${ listPageNum }">3</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=3" />
										<a href="${ listPageNum }">4</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=4" />
										<a href="${ listPageNum }">5</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=5" />
										<a href="${ listPageNum }">6</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=6" />
										<a href="${ listPageNum }">7</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=7" />
										<a href="${ listPageNum }">8</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=8" />
										<a href="${ listPageNum }">9</a>
									</c:when>



									<c:when test="${ (num / 10) * 10 + 5 > listPageMax  }">

										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=${ listPageMax - 9 }" />
										<a href="${ listPageNum }">${ listPageMax - 8 }</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=${ listPageMax - 8 }" />
										<a href="${ listPageNum }">${ listPageMax - 7 }</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=${ listPageMax - 7 }" />
										<a href="${ listPageNum }">${ listPageMax - 6 }</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=${ listPageMax - 6 }" />
										<a href="${ listPageNum }">${ listPageMax - 5 }</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=${ listPageMax - 5 }" />
										<a href="${ listPageNum }">${ listPageMax - 4 }</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=${ listPageMax - 4 }" />
										<a href="${ listPageNum }">${ listPageMax - 3 }</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=${ listPageMax - 3 }" />
										<a href="${ listPageNum }">${ listPageMax - 2 }</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=${ listPageMax - 2 }" />
										<a href="${ listPageNum }">${ listPageMax - 1 }</a>
										<c:url var="listPageNum"
											value="/bulletinboard/board/list?num=${ listPageMax - 1 }" />
										<a href="${ listPageNum }">${ listPageMax }</a>

									</c:when>

									<c:otherwise>
										<c:forEach begin="${ (num / 10) * 10 - 3 }"
											end="${ (num / 10) * 10 + 5 }" var="listFor">
											<c:url var="listPageNum"
												value="/bulletinboard/board/list?num=${ listFor - 1 }" />
											<a href="${ listPageNum }">${ listFor }</a>
										</c:forEach>
									</c:otherwise>

								</c:choose>
								<div>
									<a href="${ nextlist }"><button>&gt;</button></a>
									<c:url var="maxIndex"
										value="/bulletinboard/board/list?num=${ listPageMax - 1 }">
										<c:param name="keyword" value="${ keyword }"></c:param>
										<c:param name="category" value="${ category }"></c:param>
										<c:param name="boardNumber" value="1"></c:param>
									</c:url>
									<a href="${ maxIndex }"><button>&gt;&gt;</button></a>
								</div>
							</div>



							<!-- 검색 -->

							<c:url value="/bulletinboard/board/list" var="searchPage">
								<c:param name="pagenum2" value="${ num }"></c:param>
								<c:param name="boardNumber2" value="${ boardNumber }"></c:param>
							</c:url>
							<form action="${ searchPage }">

								<input type="number" class="d-none" name="boardNumber" value="1" />
								<input type="number" class="d-none" name="num" value="0" />
								<div class="searchDiv row g-3">

									<div class="col-sm-3">
										<select name="category" class="form-select form-select-sm "
											aria-label=".form-select-sm example">
											<option value="t">제목</option>
											<option value="c">내용</option>
											<option value="tc">제목 + 내용</option>
											<option value="n">닉네임</option>
											<option value="i">아이디</option>
										</select>
									</div>
									<div class="keywordSubmit col-sm-9">
										<input
											class="d-grid form-control gap-2 d-md-flex justify-content-md-end"
											type="text" name="keyword" placeholder="검색어" required /> <input
											type="submit" class="col-sm-3 btnContent btn btn-dark"
											value="검색" />
									</div>

								</div>
							</form>
						</div>
					</div>
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
	</div>
</body>
</html>