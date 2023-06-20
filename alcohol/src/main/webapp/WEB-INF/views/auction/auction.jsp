<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>경매 관리</title>
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
<div id="modals" class="modal fade" tabindex="-1">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">상세 검색 결과</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="scrollable-table-container">
						<%-- 여기가 Modal의 바디 --%>
						<table class="scrollable-table">
							<thead>
						<tr>
							<th>상태</th>
							<th>경매명</th>
							<th>상품</th>
							<th>즉시낙찰가</th>
							<th>현재입찰가</th>
							<th>입찰횟수</th>
							<th>실낙찰가</th>
							<th>경매시작일</th>
							<th>경매종료일</th>
						</tr>
					</thead>
					<tbody id="responsetable">
						
					</tbody>
						</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	
	<div>
		<main class="mains my-4">
			<div class="form-control">
				<c:url var="search" value="/auction/auction">
				</c:url>
				<form method="post" action="${ search }" id="searchForm" class="form">
					<label class="form-label" for="searchtext" >검색 내용</label> 
					<input class="form-control my-3" name="searchtext" id="searchtext" type="text" /> 
					
					<input class="d-none" type="text" name="userid" id="userid"	value="${ sessionScope.userNickname }" /> 
					<input class="form-control" type="submit" id="btnAuctionSearch" value="검색" />
				</form>
			</div>
			
			<br />
			
			<div class="card">
				<div class="form-control">
				
					<span><h2>상세 검색</h2></span>
						<label class="form-label">경매 시작일</label>
					 <input class="form-control"
						type="date" id="auctionstart" name="auctionstart" />
				</div>
				<div class="form-control">
				<label class="form-label">경매 종료일</label>
					<input class="form-control" type="date" id="auctionend"
						name="auctionend" />
				</div>
				<div class="form-control">
				<label class="form-label">경매 상태</label>
					<select class="form-control" name="status" id="status">
						<option selected="selected" value="3">선택안함</option>
						<option value="0">경매 준비중</option>
						<option value="1">경매 진행중</option>
						<option value="2">경매 완료</option>
					</select>
				</div>
				<div class="form-control">
				<label class="form-label">주류 종류</label>
					<select class="form-control" id="category" name="category">
						<option selected="selected" value="0">선택안함</option>
						<option value="1">탁주</option>
						<option value="2">약주</option>
						<option value="3">청주</option>
						<option value="4">맥주</option>
						<option value="5">과실주</option>
						<option value="6">소주</option>
						<option value="7">위스키</option>
						<option value="8">브랜디</option>
						<option value="9">증류주</option>
						<option value="10">리큐르</option>
						<option value="11">주정</option>
						<option value="12">기타주류</option>
					</select>
				</div>
				<div class="form-control">
					<div class="form-control">
						<label for="minimum">현재 입찰가</label> 
						<input type="number"
							id="minimum" name="minimum" value="10000" style="border-radius: 5px;" /> ~ <input
							type="number" id="maximum" name="maximum" value="1000000" style="border-radius: 5px;" />
					</div>
				</div>
				<div class="form-control">
					<label for="searchtext">검색 종류</label> <select id="textoption"
						name="textoption">
						<option value="1">상품명</option>
						<option value="2">경매명</option>
						<option value="3">상품,경매명</option>
					</select>
				</div>
				<div class="form-control">
					<label for="searchtext2">검색 내용</label> <input  type="text"
						id="searchtext2" name="searchtext2" class="card form-control" />
				</div>

				<div class="form-control">
					<button class="btn" id="btnDetailSearch">상세검색</button>
				</div>
			</div>

			<div>

			<br />
				
			</div>

			<div class="scrollable-table-container">
				<table class="scrollable-table">
					<thead>
						<tr>
							<th>상태</th>
							<th>경매명</th>
							<th>상품</th>
							<th>즉시낙찰가</th>
							<th>현재입찰가</th>
							<th>입찰횟수</th>
							<th>실낙찰가</th>
							<th>경매시작일</th>
							<th>경매종료일</th>
						</tr>
					</thead>

					<tbody id="auctionlist">
						<c:forEach var="list" items="${ auctionlist }">
							<tr>
								<c:if test="${ list.status == 0 }">
									<td>경매 준비중</td>
								</c:if>
								<c:if test="${ list.status == 1 }">
									<td>경매 진행중</td>
								</c:if>
								<c:if test="${ list.status == 2 }">
									<td>경매 종료</td>
								</c:if>
								<td class="d-none">${ list.aid }</td>
								<td><c:url var="detail" value="/auction/detail">
										<c:param name="aid" value="${ list.aid }"></c:param>
									</c:url> <a href="${ detail }">${ list.auctionName }</a></td>
								<td>${ list.pname }</td>
								<td>${ list.passbid }</td>
								<td>${ list.nowbid }</td>
								<td>${ list.bidcount }</td>
								<td>${ list.successbid }</td>
								<td>${ list.auctionStart }</td>
								<td>${ list.auctionEnd }</td>
							</tr>
						</c:forEach>
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
		<script src="../static/js/auction-managements.js"></script>
	</div>
</body>
</html>