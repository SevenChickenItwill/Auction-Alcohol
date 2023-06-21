<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>칠면주조에 오신걸 환영합니다 - 커뮤니티 - 게시글작성</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous" />
</head>
<style>
.main {
	width: 700px; 
	height : 100%;
	height: 100%; display : flex;
}

.mainDiv {
	display: flex;
	justify-content: space-around;
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

.selectDiv {
	margin-top: 20px;
	width: 700px;
}

.authorDiv {
	font-size: 4px;
	margin-top: 10px;
	margin-bottom: 10px;
	width: 700px;
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
	<div class="mainDiv">
	<div style="outline: none" class="main">
		<div>
			<div>
				<div>
					<select name="category" id="category" class="selectDiv form-select"
						aria-label="Default select example">
						<c:if test="${ sessionScope.category == 2 }">
							<option value="1">공지사항</option>
						</c:if>
						<option value="0">글작성</option>
					</select>
				</div>
				<div class="authorDiv fw-semibold">
					<label for="nickname">작성자 : </label> <span type="text"
						name="nickname" id="nickname"
						readonly >${ sessionScope.userNickname }</span> 
						<span
						type="text" name="user_id" id="userId"
						readonly >(${ sessionScope.userEmail })</span>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">제목</span> 
					<input type="text" name="title" class="form-control" aria-label="Sizing example input" 
						aria-describedby="inputGroup-sizing-default" id="title" autofocus required />
				</div>
				<div class="form-floating mb-3">
					<label for="content"></label>
					<textarea name="content" id="content" class="form-control" placeholder="Content" 
						 style="height: 100px; height: 320px;" required></textarea>
				</div>
			</div>	
			<form id="createForm" class="mb-3">
				<input type="file" name="file" id="file" class="form-control"/>
			</form>
			<div class="btnWrapper d-grid gap-2 d-md-flex justify-content-md-end">
				<input class="btnContent btn btn-light me-md-2" type="submit" id="createBtn" value="작성완료" />
			</div>

		</div>
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="../../static/js/board-creates.js"></script>

</body>
</html>