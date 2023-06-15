<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta charset="UTF-8">
		<title>칠면주조에 오신 걸 환영합니다.</title>
		<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    crossorigin="anonymous">
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
	
	<div class="flex-shrink-0 p-3 bg-white sidebars" style="width: 200px;">
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
        <c:url var="auctionManagement" value="/auction/auction" />
        <a href="${ auctionManagement }" class="nav-link link-dark">
          경매조회/수정
        </a>
      </li>
      <li>
        <c:url var="auctionadmin" value="/auction" />
        <a href="${ auctionadmin }" class="nav-link link-dark">
          관리자 메뉴
        </a>
      </li>
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
        <span class="fs-4">상품 수정 페이지</span>
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
	<main class="mains">
		<div class="form-control">
			<form id="modifyform" class="form">
				<input type="number" name="pid" id="pid" class="d-none" value="${detail.pid }"/>
				<label for="productname">상품명</label>
				<input type="text" required="required" name="productname" id="productname" value="${detail.productname }"/>
				<label for="standard">규격</label>
				<input type="text" required="required" name="standard" id="standard" value="${ detail.standard }"/>
				<label for="unit">단위</label>
				<input type="text" required="required" name="unit" id="unit" value="${ detail.unit }"/>
				<label for="price">가격</label>
				<input type="number" required="required" name="price" id="price" value="${ detail.price }"/>
				<label for="brand">브랜드</label>
				<input type="text" required="required" name="brand" id="brand" value="${ detail.brand }"/>
				<input value="${ sessionScope.userNickname }" class="d-none" type="text" required="required" name="userid" id="userid" />
				<label for="expirationdate">유통기한</label>
				<input type="text" required="required" name="expirationdate" id="expirationdate" value="${ detail.expirationdate }"/>
				<label for="alcohol_level">도수</label>
				<input type="number" required="required" name="alcohol_level" id="alcohol_level" value="${ detail.alcohol_level }"/>
				<label for="hashtag">해시태그</label>
				<input type="text" required="required" name="hashtag" id="hashtag" value="${ detail.hashtag }"/>
				<input class="d-none" type="text" required="required" name="photopath" id="photopath" value="${ detail.photopath }" />
				<label for="category">카테고리</label>
					<%-- value 는 category 테이블의 코드랑 동일하게 설정함. --%>
					
					<select class="form-control" id="category" name="category" >
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
					<button class="btn" id="btnmodify">상품 수정</button>
					<button class="btn" id="btndelete">상품 삭제</button>
					
			</form>
			<c:url var="listmain" value="/shop/pdlist"></c:url>
					<a href="${ listmain }"><button class="btn" id="btnBack">뒤로가기</button></a>
		</div>
		<div>
				<form id="imginsert" enctype="multipart/form-data">
					<div class="form-control">
						<input class="form-control" type="file" id="image" name="image" />
						<button class="btn" id="imgupload">이미지 확정</button>
					</div>
				</form>
		</div>
		<div id="imgpreview">
			
		</div>
		<input class="d-none" type="number" id="categorynum" name="categorynum" value="${ detail.category }" />
	</main>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script src="../static/js/pdmodify.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
	</body>
</html>