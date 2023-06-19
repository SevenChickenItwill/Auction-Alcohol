<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
		<div class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container">
				<a href="#" class="navbar-brand d-flex align-items-center"> <path
						d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
					<circle cx="12" cy="13" r="4"></circle> </svg> <strong>Album</strong>
				</a>


				<c:url var="paymain" value="/payment/payindex">
				</c:url>
				<a href="${paymain}">결제하기</a>

				<c:url value="/bulletinboard/board/list" var="boardList">
					<c:param name="num" value="0" />
				</c:url>
				<a href="${ boardList }" class="text-danger">커뮤니티</a>

				<c:url var="homePage" value="/bulletinboard/board/home" />
				<a href="${ homePage }">임시홈페이지</a> <input class="d-none" type="text"
					id="userid" name="userid" value="${ sessionScope.userNickname }"
					readonly="readonly" /> <span>${ sessionScope.userNickname }</span>
				<span style="corlor: white">로그아웃</span> <span>마이페이지</span>
			</div>
		</div>
	</header>
	<span class="text-align: center;"> <svg
					xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16">
			  <path
						d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"></path>
			  <path
						d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"></path>
			</svg> 결제하기
			</span>
</body>
</html>