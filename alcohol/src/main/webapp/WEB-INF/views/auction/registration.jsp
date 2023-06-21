<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Auction</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
    crossorigin="anonymous">
<style>
.p-3 {
    padding: 2rem!important;
}
li{
	font-size:large;
	font-weight:bold;
	padding-bottom: 35px;
}
.container {
    
    width: 100%;
  }
  .navbar {
    background-color: #000;
    color: #fff;
  }

  .navbar .navbar-nav .nav-link {
    color: #fff;
  }


.scrollable-table-container {
	height: 300px;
	overflow-y: scroll;
}

.scrollable-table {
	width: 100%;
	border-collapse: collapse;
}

.scrollable-table th, .scrollable-table td {
	padding: 8px;
	border: 1px solid #ccc;
	

}
#modals{
	position: fixed;
    

}
.sidebar{
    position: absolute;
    top: 60px;
    left: 0;
    height: 100%;
    width: 240px;
    

}
.mains{
	margin-top: 100px;
    margin-right: 220px;
    margin-left: 380px;
    
}

.headers{
    margin: 0px 270px;
    
}
body{

	background-color: light;
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

<div id="sidebar" class="flex-shrink-0 p-3 bg-light sidebar">
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
    <li>
        <c:url var="auctionadmin" value="/auction" />
        <a href="${ auctionadmin }" class="nav-link link-dark list-group-item list-group-item-action">
          관리자 메인
        </a>
      </li>
      <li class="nav-item">
        <c:url var="auctionProduct" value="/auction/product" />
        <a href="${ auctionProduct }" class="nav-link link-dark list-group-item list-group-item-action" aria-current="page">
          경매 상품조회/수정
        </a>
      </li>
      <li>
        <c:url var="productcreate" value="/auction/productcreate" />
        <a href="${ productcreate }" class="nav-link link-dark rounded border-0 list-group-item list-group-item-action">
          경매 상품등록
        </a>
      </li>
      <li>
        <c:url var="auctionm" value="/auction/auction" />
        <a href="${ auctionm }" class="nav-link link-dark list-group-item list-group-item-action">
          경매 조회/수정
        </a>
      </li>
      <li>
        <c:url var="auctionRegistration" value="/auction/registration" />
        <a href="${ auctionRegistration }" class="nav-link link-dark list-group-item list-group-item-action">
          경매 등록
        </a>
      </li>
            <li>
      	<c:url var="shopproducts" value="/shop/pdlist" />
        <a href="${ shopproducts }" class="nav-link link-dark list-group-item list-group-item-action">
          쇼핑몰 상품조회
        </a>
      </li>
      <li>
      	<c:url var="shopcreate" value="/shop/pdcreate" />
        <a href="${ shopcreate }" class="nav-link link-dark list-group-item list-group-item-action">
          쇼핑몰 상품등록
        </a>
      </li>
      <li>
      	<c:url var="aproductinfo" value="/shop/aproductinfo" />
        <a href="${ aproductinfo }" class="nav-link link-dark list-group-item list-group-item-action">
          쇼핑몰 주문현황
        </a>
      </li>
    </ul>
    
    
  </div>
  <!-- ----------------------------------------------------------------------------------------------------------------------------------------------------- -->


        <br />
  <main class="mains">
        <div class="mainsite form">
            <c:url var="postRegistration" value="/auction/registration" />
            <form class="card" name="createform" id="createform">

                <div class="form-control">
                    <!-- TODO: value test -> ${id}로 바꾸기 -->
                    <input id="id" value="${ sessionScope.userNickname }" name="auctioneer"
                        class="d-none" />
                </div>
                <div class="form-control">
                    <label for="auctionName">경매명</label> <input
                       maxlength="45" id="auctionName" name="auctionName" type="text" class="form-control my-2">
                </div>

                <div class="form-control">
                    <label for="pname">상품명</label> <input id="pname"
                      maxlength="45"  name="pname" type="text" class="form-control my-2">
                    <button class="btn btn-outline-dark"
                        id="btnProductSearch">내 상품 찾기</button>
                </div>
                <div class="form-control">
                    <label for="constructor">제조사(생산자)</label> <input
                        id="constructor" name="constructor" type="text"
                        readonly="readonly" class="form-control my-2">
                </div>
                <div class="form-control">
                    <label for="brandname">브랜드</label> <input
                        id="brandname" name="brandname" type="text"
                        readonly="readonly" class="form-control my-2">
                </div>
                <div class="form-control">
                    <label for="category">종류</label> <input
                        id="category" name="category" type="text"
                        readonly="readonly" class="form-control my-2">
                </div>
                <div class="form-control">
                    <label for="passBid">즉시 낙찰가</label> <input
                       pattern="\d{1,15}" id="passbid" name="passbid" type="number"
                        value="100000" class="form-control my-2">
                </div>
                <div class="form-control">
                    <label for="auctionStart">경매 시작일</label> <input
                        id="auctionStart" name="auctionStart"
                        type="datetime-local" class="form-control my-2">
                </div>
                <div class="form-control">
                    <label for="auctionEnd">경매 종료일</label> <input
                        id="auctionEnd" name="auctionEnd"
                        type="datetime-local" class="form-control my-2">
                </div>
                <div class="d-none">
                    <!-- 현재 입찰가(시작가) -->
                    <input id="nowBid" name="nowBid" type="number">
                </div>
                <div class="form-control">
                    <!-- 상품코드 -->
                    <input class="d-none" id="productId"
                        name="productId" type="number">
                </div>
                <div class="form-control">
                    <button id="btncreateAuction"
                        class="btn btn-outline-dark">경매 등록</button>
                </div>
            </form>
        </div>

        <div class="table-responsive">
            <table class="table align-middle">
                <thead>
                    <tr>
                        <th class="d-none">상품코드</th>
                        <th>선택</th>
                        <th>상품명</th>
                        <th>제조사(생산자)</th>
                        <th>브랜드</th>
                        <th>종류</th>
                        <th>원가</th>
                    </tr>
                </thead>
                <tbody id="productTboby">

                </tbody>
            </table>
        </div>

    
    </main>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous">
					
				</script>
    <script src="../static/js/auction-registration2.js"></script>
</body>
</html>