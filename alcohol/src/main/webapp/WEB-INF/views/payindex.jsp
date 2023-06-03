<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled">Disabled</a>
					</li>
				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	</hr>
	<header>
		<h1>장바구니 페이지</h1>
	</header>
	<hr />
	<h4 class="mx-2 text-center">장바구니</h4>
	<div class="card">
		<div class="card-header">
			<input type="checkbox" id="myCheckbox" name="myCheckbox"
				value="checkboxValue"> <label class="py-6" for="myCheckbox">전체선택</label>
			<span class="btn">삭제</span>
		</div>
		<div class="card-boby">
			<c:forEach var="basket" items="${ list }">
				<div>
					<input type="checkbox" name="myCheckbox"
						value="${ basket.quantity * basket.price }">
					<label >${ basket.brandname }</label>
					<hr>
					<label>${ basket.pname }</label>
					<br>
					<label>주문수량</label>
					<input style="width: 50px;" id="inputQuantity" type="number"
						value="${ basket.quantity }">
					<br>
					<label>주문금액</label>
					<label class="mx-2">${ basket.quantity * basket.price }원</label>
					<hr>
				</div>
			</c:forEach>
		</div>
		<div class="card-footer">
			<label>총 주문금액</label>
			<label>원</label>
			<br>
			<a>결제하기</a>

		</div>
	</div>



</body>
</html>