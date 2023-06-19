<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>상품 등록</title>
<style>
.sidebar {
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	width: 200px;
}

.mains {
	margin-left: 220px;
}

.headers {
	margin-left: 220px;
}
</style>
</head>
<body>
	<div class="flex-shrink-0 p-3 bg-light sidebar" style="width: 200px;">
		<hr>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><c:url var="auctionProduct"
					value="/auction/product" /> <a href="${ auctionProduct }"
				class="nav-link link-dark" aria-current="page"> 경매상품조회/수정 </a></li>
			<li><c:url var="productcreate" value="/auction/productcreate" />
				<a href="${ productcreate }"
				class="nav-link link-dark rounded border-0"> 경매상품등록 </a></li>
			<li><c:url var="auctionadmin" value="/auction" /> <a
				href="${ auctionadmin }" class="nav-link link-dark"> 관리자 메인 </a></li>
			<li><c:url var="auctionRegistration"
					value="/auction/registration" /> <a
				href="${ auctionRegistration }" class="nav-link link-dark"> 경매등록
			</a></li>
			      <li>
      	<c:url var="shopproducts" value="/shop/pdlist" />
        <a href="${ shopproducts }" class="nav-link link-dark">
          쇼핑몰 상품조회
        </a>
      </li>
      <li>
      	<c:url var="shopcreate" value="/shop/pdcreate" />
        <a href="${ shopcreate }" class="nav-link link-dark">
          쇼핑몰 상품등록
        </a>
      </li>
		</ul>
	</div>

	<div>
        <div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="/alcohol/auction" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <span class="fs-4">경매품 등록 페이지</span>
      </a>

      <ul class="nav nav-pills">
        <li class="nav-link px-2 link-dark">
        <a href="#" class="nav-link active" aria-current="page">Home</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Features</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
        <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
        <li class="nav-item"><a href="#" class="nav-link">About</a></li>
        <li class="nav-item">${ sessionScope.userNickname } 님</li>
        
      </ul>
      <div>
      	<c:url var="logout" value="/account/logout"></c:url>
      	<a href="${ logout }"><button>로그아웃</button></a>
      </div>
    </header>
  </div>
	<nav>
		<ul>
			<c:url var="productmain" value="/auction/product"></c:url>
			<li><a href="${ productmain }">메인메뉴</a></li>
		</ul>
	</nav>
	<main class="mains">

		<div>

			<c:url var="createsuccess" value="/auction/createsuccess" />
			<form id="subform" method="post" action="${ createsuccess }">
				<input class="d-none" name="userId" id="userId"
					value="${ sessionScope.userNickname }" />
				<div class="form-control">
					<label for="productName">상품명</label> <input class="form-control"
						type="text" name="pName" id="pName" />
				</div>
				<div class="form-control">
					<label for="brandname">브랜드명</label> <input class="form-control"
						type="text" name="brandname" id="brandName" />
				</div>
				<div class="form-control">
					<label for="constructorName">제조사(생산자)</label> <input
						class="form-control" type="text" name="constructor"
						id="constructor" />
				</div>
				<div class="form-control">
					<label for="cost">원가</label> <input class="form-control"
						type="number" name="cost" id="cost" />
				</div>
				<div class="form-control">
					<label for="category">카테고리</label>
					<%-- value 는 category 테이블의 코드랑 동일하게 설정함. --%>
					<select class="form-control" id="category" name="category">
						<option selected="selected" value="1">탁주</option>
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

				<div class="my-2">
					<input id="btnsubmit" class="form-control" type="submit" value="등록"
						class="btn" />
				</div>

			</form>
			<div></div>
		</div>
	</main>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="../static/js/productcreatejss.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
		
	</script>
</body>
</html>