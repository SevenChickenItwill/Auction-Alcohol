<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta charset="UTF-8">
		<title>술면조에 오신 것을 환영합니다.</title>
		<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    crossorigin="anonymous">
<style>
a{
	text-decoration: none;
	color: black;
}

.table td,
.table th{
	text-align: center;
	vertical-align: middle;
}

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
	height: 650px;
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
	margin-top: 50px;
    margin-right: 100px;
    margin-left: 340px;
    
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
        <a href="${ shopproducts }" class="nav-link link-dark list-group-item list-group-item-action text-danger">
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
		<main class="mains">
			
			<div class="card">
				<label class="mx-2 form-label" style="font-weight: bold; font-size: xx-large;" for="searchtext">검색창</label>
				<div><input type="text" value="${ sessionScope.userNickname }" class="d-none" name="userid" id="userid"></div>
				<input maxlength="45" class="form-control" type="text" placeholder="검색할 내용을 입력하세요." id="searchtext" name="searchtext" />
				<label class="mx-2 form-label">검색 종류</label>
				<select id="searchoption" name="searchoption" class="form-control">
					<option value="1">상품명</option>
					<option value="2">해시태그</option>
					<option value="3">브랜드</option>
					<option value="4">상품명,해시태그,브랜드</option>
				</select>
				<button class="btn" id="btnsearch">검색</button>
			</div>
			<div class="scrollable-table-container">
				<table class="scrollable-table table">
					<thead>
						<tr>
						<th>상품코드</th>
						<th>상품명</th>
						<th>규격</th>
						<th>단위</th>
						<th>가격</th>
						<th>브랜드</th>
						<th>판매자ID</th>
						<th>유통기한</th>
						<th>도수</th>
						<th>해시태그</th>
						<th>카테고리</th>
						<th>상품사진</th>
						</tr>
					</thead>
					<tbody id="tbodys">
					<c:forEach var="list" items="${ prolist }">
					<c:url var="detail" value="/shop/pdmodify">
						<c:param name="pid" value="${ list.pid }"></c:param>
					</c:url>
					<tr>
						<td><a href="${detail }">${ list.pid }</a></td>
						<td><a href="${detail }">${ list.productname }</a></td>
						<td><a href="${detail }">${ list.standard }</a></td>
						<td><a href="${detail }">${ list.unit }</a></td>
						<td><a href="${detail }">${ list.price }</a></td>
						<td><a href="${detail }">${ list.brand }</a></td>
						<td><a href="${detail }">${ list.userid }</a></td>
						<td><a href="${detail }">${ list.expirationdate }</a></td>
						<td><a href="${detail }">${ list.alcohol_level }</a></td>
						<td><a href="${detail }">${ list.hashtag }</a></td>
						<c:if test="${ list.category == 1 }">
								<td><a href="${detail }">탁주</a></td>
							</c:if>
							<c:if test="${ list.category == 2 }">
								<td><a href="${detail }">약주</a></td>
							</c:if>
							<c:if test="${ list.category == 3 }">
								<td><a href="${detail }">청주</a></td>
							</c:if>
							<c:if test="${ list.category == 4 }">
								<td><a href="${detail }">맥주</a></td>
							</c:if>
							<c:if test="${ list.category == 5 }">
								<td><a href="${detail }">과실주</a></td>
							</c:if>
							<c:if test="${ list.category == 6 }">
								<td><a href="${detail }">소주</a></td>
							</c:if>
							<c:if test="${ list.category == 7 }">
								<td><a href="${detail }">위스키</a></td>
							</c:if>
							<c:if test="${ list.category == 8 }">
								<td><a href="${detail }">브랜디</a></td>
							</c:if>
							<c:if test="${ list.category == 9 }">
								<td><a href="${detail }">증류주</a></td>
							</c:if>
							<c:if test="${ list.category == 10 }">
								<td><a href="${detail }">리큐르</a></td>
							</c:if>
							<c:if test="${ list.category == 11 }">
								<td><a href="${detail }">주정</a></td>
							</c:if>
							<c:if test="${ list.category == 12 }">
								<td><a href="${detail }">기타주류</a></td>
							</c:if>
						<td><img src = "data:image/jpeg;base64,${ list.photopath }" /></td>
					</tr>
					</c:forEach>
					
					</tbody>
				</table>
			</div>
		</main>
		<script src="../static/js/pdlist.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
	</body>
</html>