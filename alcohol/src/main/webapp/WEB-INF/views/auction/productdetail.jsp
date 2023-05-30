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
<title>상품 상세 페이지</title>
</head>
<body>
	<div>
		<header>
			<h1>상품 상세보기</h1>
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
		
		<main>
			<section>
				<c:url var="productmodify" value="/auction/productmodify" />
				<form id="detailform" action="${ productmodify }" method="post">
					<input type="text" value="${ product.productid }" name="productid" class="d-none">
					<div>
						<label>상품명</label>
						<input type="text" name="pname" value="${ product.pname }" readonly>
					</div>
					<div>
						<label>제조사(생산자)</label>
						<input type="text" name="constructor" value="${ product.constructor }" readonly>
					</div>
					<div>
						<label>브랜드</label>
						<input type="text" name="brandname" value="${ product.brandname }" readonly>
					</div>
					<div>
						<label>종류</label>
						<input id="category" type="text" value="${ product.category }" readonly>
						<input class="d-none" name="category" value="${ product.category }">
					</div>
					<div>
						<label>원가</label>
						<input type="number" name="cost" value="${ product.cost }" readonly>
					</div>
				<div>
					<input type="submit" value="수정" />
					
					<button id="btndelete">삭제</button>
				</div>
				</form>
			</section>
		</main>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
		
	</script>
	<script src="../static/js/auction-detail.js"></script>
	<script src="../static/js/product-management.js"></script>
</body>
</html>