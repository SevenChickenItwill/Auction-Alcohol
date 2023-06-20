<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<title>Payment</title>
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
	<div class="my-3 ">
		<div></div>
		<div style="display: flex;justify-content: center;align-items: center;">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
					d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5H2zM3 3H2v1h1V3z" />
  <path
					d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9z" />
  <path fill-rule="evenodd"
					d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5V7zM2 7h1v1H2V7zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5H2zm1 .5H2v1h1v-1z" />
</svg>
			주문목록</span>
		</div>

	</div>

	<hr>
	<div style="display: flex; justify-content: center;">
		<div class="form-control" style="width: 700px;">
			<div style="display: flex; justify-content: center;">
				<div class="card-boby py-3">
					<table class="table">
						<thead>
							<tr>
								<th>상품명</th>
								<th>규격</th>
								<th>브랜드</th>
								<th>가격</th>
								<th>수량</th>
								<th>구매자정보</th>
								<th>상태</th>
							</tr>
							
							<tr>
								<th>구매자</th>	
								<th>주소</th>
								<th>핸드폰번호</th>
								<th>이메일</th>
							</tr>
						</thead>
						<tbody>
					<c:forEach var="info" items="${list}">
							<tr>
								<td>${ info.productname}</td>
								<td>${ info.standard }</td>
								<td>${ info.brand }</td>
								<td>${ info.price }</td>
								<td>${ info.quantity }</td>
								<td id="status" data-id="${ info.pid }">
									<c:if test="${ info.status == 0}">
										상품준비중
									</c:if>
									<c:if test="${ info.status == 1}">
										배송중
									</c:if>
								</td>
								<td id="btnView" class="btn" data-id="${ info.pid }">View Info</td>
							</tr>
							
							<tr id="userinfo" data-id="${ info.pid }" class="d-none">
								<td>${ info.username }</td>
								<td>${ info.useraddress }</td>
								<td>${ info.userphone }</td>
								<td>${ info.useremail }</td>
								<td id="delivery" class="btn" data-id="${ info.pid }" data-bid="${ info.basketid }">배송중</td>
							</tr>
					</c:forEach>
						</tbody>	
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="my-3" style="display: flex; justify-content: center;">
		<c:url var="view" value="/auction/auctionview" />
		<form action="${ view }">
			<input type="submit" value="주문목록">
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="../static/js/aproductinfo.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous">
		
	</script>
</body>
</html>