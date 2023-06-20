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
<style>
#payment-button {
	width: 100%;
	padding: 15px;
	background-color: #3065AC;
	color: white;
	border-radius: 3px;
	font-size: 16px;
	border: none;
	margin-top: 10px
}

#container {
	display: flex;
	justify-content: space-between;
}

.centered-span {
	text-align: center;
}

.right-span {
	margin-left: auto;
}

.title {
	margin: 0 0 4px;
	font-size: 24px;
	font-weight: 600;
	color: #4e5968;
}

.container {
	overflow: auto; /* 부모 컨테이너의 오버플로우 처리를 위해 추가할 수 있습니다. */
}

.left-div, .right-div {
	display: inline-block;
	width: 50%; /* 원하는 너비를 지정할 수 있습니다. */
	vertical-align: top; /* 두 div를 수직 정렬합니다. */
}

.my-3 {
	display: flex;
	align-items: center;
	justify-content: space-between;
}
</style>
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
		<div>
			<span class="text-align: center;"> <svg
					xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16">
			  <path
						d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"></path>
			  <path
						d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"></path>
			</svg> 결제하기
			</span>
		</div>
		<div>
			<span class="text-align: right;" style=""> </span>
		</div>
	</div>

	<hr>
	<div class="container">
		<div class="card mx-3 my-2 left-div" style="width: 550px;">
			<div class="title mx-3 my-2">배송지 정보</div>
			<input class="card mx-3" type="text" id="userid" name="userid"
				value="${ sessionScope.userNickname }" readonly="readonly" />
			<li class="mx-3 my-1"><c:url value="/payment/modify"
					var="adressModify">
					<c:param name="userNickname" value="대한" />
				</c:url><a href="${adressModify}">배송지 수정</a></li>
			<div class="my-2">

				<label class="form-labeln mx-3" for="order_name">이름</label> <input
					class="form-control mx-3" style="width: 465px;" id="order_name"
					value="${ userinfo.userNickname }" readonly />
			</div>
			<div class="my-2 mx-3">
				<label class="form-label" for="order_adress">주소</label>
				<textarea class="form-control" id="order_adress" readonly>${ userinfo.userAddress }</textarea>
			</div>
			<div class="my-2">
				<label class="form-label mx-3" for="order_phone">핸드폰 번호</label> <input
					class="form-control mx-3" style="width: 465px;" id="order_phone"
					value="${ userinfo.userPhone }" readonly />
			</div>
			<div class="my-2 mx-3">
				<label class="form-label" for="order_email">이메일</label> <input
					class="form-control" id="order_email"
					value="${ userinfo.userEmail }" readonly />

			</div>
		</div>


		<div class="right-div card my-2">
			<div class="title mx-3 my-2">결제 상품</div>

			<div class="card-boby">
				<c:forEach var="basket" items="${list}">
					<div id="div-${ basket.basketid }" class="btn">
						<input id="productid-${ basket.basketid }"
							value="${ basket.productid }" class="d-none"> <input
							id="basketid-${ basket.basketid }" value="${ basket.basketid }"
							class="d-none"> <input id="price-${ basket.basketid }"
							value="${ basket.price }" class="d-none"> <label>${basket.brandname}</label>
						<hr>
						<label>${basket.pname}</label> <br> <br> <label
							style="text-align: left;">상품금액 ${ basket.price }원</label> <br>
						<label>주문수량</label> <label>${ basket.quantity }개</label> <br>
						<label>주문금액</label> <span id="orderAmount-${basket.basketid}"
							class="mx-2" data-value="${(basket.quantity * basket.price)}">
							${(basket.quantity * basket.price)}원 </span>
						<hr>
					</div>
				</c:forEach>
			</div>
		</div>
		<br />
		<br />
		<!-- 결제 방법 영역 -->
		<div style="display: flex; justify-content: space-around;" ">
			<div>
				<span class="btn" id="btnkakaopay"><img
					src="../static/img/small.png"> 결제하기</span>
			</div>

			<div>
				<c:url var="cancelpayment" value="/payment/paymentcancel" />
				<form action="${ cancelpayment }" method="post">
					<input type="submit" value="결제취소" class="btn">
				</form>
			</div>
		</div>

	</div>
	<script type="text/javascript" src="../static/js/jquery-3.7.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="./../static/js/jq.js"></script>
	<script src="../static/js/paymentt.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous">
	</script>
</body>
</html>