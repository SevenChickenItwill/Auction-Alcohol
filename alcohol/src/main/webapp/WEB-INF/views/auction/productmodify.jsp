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
<title>상품 수정 페이지</title>
<style>
.sidebar{
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 200px;
    

}
.mains{
    margin-left: 220px;
}

.headers{
    margin-left:220px;
}
</style>
</head>
<body>
<div class="flex-shrink-0 p-3 bg-light sidebar" style="width: 200px;">
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <c:url var="auctionProduct" value="/auction/product" />
        <a href="${ auctionProduct }" class="nav-link link-dark" aria-current="page">
          경매상품조회/수정
        </a>
      </li>
      <li>
        <c:url var="productcreate" value="/auction/productcreate" />
        <a href="${ productcreate }" class="nav-link link-dark rounded border-0">
          경매상품등록
        </a>
      </li>
      <li>
        <c:url var="auctionadmin" value="/auction" />
        <a href="${ auctionadmin }" class="nav-link link-dark">
          관리자 메인
        </a>
      </li>
      <li>
        <c:url var="auctionRegistration" value="/auction/registration" />
        <a href="${ auctionRegistration }" class="nav-link link-dark">
          경매등록
        </a>
      </li>
    </ul>
  </div>

	<div>
		<header class="headers">
			<h1>상품 수정하기</h1>
		</header>
		
		<nav>
			<ul>
				<li>
					<c:url var="auction" value="/auction"/>
					<a href="${ auction }">메인 페이지</a>
				</li>
				<li>
					<c:url var="productPage" value="/auction/product"/>
					<a href="${ productPage }">상품 목록 페이지</a>
				</li>
			</ul>
		</nav>
		
		<main class="mains">
			<section>
				<c:url var="productupdate" value="/auction/productupdate" />
				<form class="form" id="modifyform" action="${ productupdate }" method="post">
					<input name="userid" value="${ sessionScope.userNickname }" class="d-done">
					<input id="productid" type="text" value="${ product.productid }" name="productid" class="d-none">
					<div>
						<label>상품명</label>
						<input class="form-control" type="text" name="pname" value="${ product.pname }" >
					</div>
					<div>
						<label>제조사(생산자)</label>
						<input class="form-control" type="text" name="constructor" value="${ product.constructor }" >
					</div>
					<div>
						<label>브랜드</label>
						<input class="form-control" type="text" name="brandname" value="${ product.brandname }" >
					</div>
					<div>
						<label>종류</label>
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
					<div>
						<label>원가</label>
						<input class="form-control" type="number" name="cost" value="${ product.cost }" >
					</div>
					<div>
						<input class="form-control" type="submit" value="수정완료"> 
					</div>
				</form>
				<form id="imginsert" enctype="multipart/form-data">
					<div class="form-control">
						<input class="form-control" type="file" id="image" name="image" />
						<button class="btn" id="imgupload">이미지 확정</button>
					</div>
				</form>
					<!-- 이미지 업로드하면 표시해주는 컬럼 -->
					<div id="imgshow">
						
					</div>
			</section>
		</main>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="../static/js/product-uploadimgs.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
</body>
</html>