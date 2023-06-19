<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

	<style>
	div#list {
		float: left;
		left: 70px;
		right: 40px;
		margin: 40px;
		padding: 30px;
	}
	
	div#page {
		text-Align: center;
	}
	</style>
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-lg bg-light" style="background-color: transparent">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">칠면주</a>
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
								<li><a class="dropdown-item" href="#">Something
										elsehere</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link disabled">Disabled</a></li>
					</ul>
					<!---------------------------------------------------------------------------->
					<li class="nav-item">${ sessionScope.userNickname }님</li>
					<div>
						<c:url var="logout" value="/account/logout"></c:url>
						<a href="${ logout }"><button>로그아웃</button></a>
					</div>
				</div>
			</div>
		</nav>
		<hr />
	</header>


	<h1>상품 찾기</h1>
	<c:url var="productstype" value="/shop/shopmain" >
		<c:param name="num" value="0"></c:param>
	</c:url>
	
	<form method="post" action="${ productstype }">
		<select name="category">
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
		<input type="submit" value="찾기">
	</form>


	<!-- 상품명/브랜드명으로 검색하기 -->	
	<c:url value="/shop/shopsearch" var="search"></c:url>
	<form class="d-flex" action="${ search }" role="search">
		<input type="number" class="d-none" name="page" value="0" />
		 <select name="category">
			<option value="pname">상품명</option>
			<option value="brand">브랜드</option>
			<option value="pnamebrand">상품명 + 브랜드</option>
		</select>
		<input class="form-control me-2" name="keyword" placeholder="Search" required />
		<input type="submit" value="검색" />
	</form>
	<hr />


	<!-- 상품 정보 -->
	<div>
		<div style="display: inline-block;">
		<c:set var="len" value="${ length }"></c:set>
		<c:set var="count" value="${ pageCount }" />
		<c:set var="nums" value="${ param.num }" />
		<c:set var="maxIndex" value="${ maxIndex }" />
			<c:forEach items="${ products }" var="list" begin="${count}" end="${ maxIndex -1 }">
				<c:url var="shopmain" value="/shop/shopmain">
					<c:param name="id" value="${shop.detail}"></c:param>
				</c:url>
				<div id="list" class="card" style="width: 18rem;">
					<a href="">
						<div class="card-body">
							<li class="list-group-item"><img width="100%" height="150px" src="data:image/jpeg;base64,${list.photopath}" /></li>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item"></li>
							<li class="list-group-item">브랜드: ${ list.brand }</li>
							<li class="list-group-item">상품정보: ${ list.productname }, 용량: ${ list.standard }, 규격: ${ list.unit }</li>
							<li class="list-group-item">도수: ${ list.alcohol_level }, 유통기한: ${ list.expirationdate }</li>
							<li class="list-group-item">가격: ${ list.price }</li>
						</ul>
					</a>
					<div class="card-body">
						<a href="" class="card-link">구매하기</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- 페이지네이션 -->
	<div  id="page">
		<div>
			<c:url var="nextlist" value="/shop/shopmain">
				<c:choose>
					<c:when test="${(nums) * 10 > maxIndex - 10 }">
						<c:set var="number" value="${nums}" />
						<c:param name="num" value="${number}"></c:param>
					</c:when>
					<c:otherwise>
						<c:set var="number" value="${nums + 1}" />
						<c:param name="num" value="${number}"></c:param>
					</c:otherwise>
				</c:choose>
			</c:url>
			<c:url var="beforelist" value="/shop/shopmain">
				<c:choose>
					<c:when test="${(nums - 1) * 10 < 0 }">
						<c:set var="number" value="${nums}" />
						<c:param name="num" value="${number}"></c:param>
					</c:when>
					<c:otherwise>
						<c:set var="number" value="${nums - 1}" />
						<c:param name="num" value="${number}"></c:param>
					</c:otherwise>
				</c:choose>

			</c:url>
			<c:url var="indexZero" value="/shop/shopmain?num=0" />
			<a href="${ indexZero }"><button>&lt;&lt;</button></a> <a
				href="${ beforelist }"><button>&lt;</button></a>

			<c:choose>

				<c:when test="${ listPageMax < 9 }">
					<c:forEach begin="${ 1 }" end="${ listPageMax }" var="listFor">
						<c:url var="listPageNum" value="/shop/shopmain?num=${ listFor - 1 }" />
						<a href="${ listPageNum }">${ listFor }</a>
					</c:forEach>
				</c:when>

				<c:when test="${ (num / 10) * 10 - 4 < 0}">
					<c:url var="listPageNum" value="/shop/shopmain?num=0" />
					<a href="${ listPageNum }">1</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=1" />
					<a href="${ listPageNum }">2</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=2" />
					<a href="${ listPageNum }">3</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=3" />
					<a href="${ listPageNum }">4</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=4" />
					<a href="${ listPageNum }">5</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=5" />
					<a href="${ listPageNum }">6</a>
					<c:url var="listPageNum" value="/shop/shopmain?num6" />
					<a href="${ listPageNum }">7</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=7" />
					<a href="${ listPageNum }">8</a>
					<c:url var="listPageNum" value="/shop/shopmain?num=8" />
					<a href="${ listPageNum }">9</a>
				</c:when>



				<c:when test="${ (num / 10) * 10 + 5 > listPageMax  }">
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 9 }" />
					<a href="${ listPageNum }">${ listPageMax - 8 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 8 }" />
					<a href="${ listPageNum }">${ listPageMax - 7 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 7 }" />
					<a href="${ listPageNum }">${ listPageMax - 6 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 6 }" />
					<a href="${ listPageNum }">${ listPageMax - 5 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 5 }" />
					<a href="${ listPageNum }">${ listPageMax - 4 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 4 }" />
					<a href="${ listPageNum }">${ listPageMax - 3 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 3 }" />
					<a href="${ listPageNum }">${ listPageMax - 2 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 2 }" />
					<a href="${ listPageNum }">${ listPageMax - 1 }</a>
					<c:url var="listPageNum"
						value="/shop/shopmain?num=${ listPageMax - 1 }" />
					<a href="${ listPageNum }">${ listPageMax }</a>
				</c:when>

				<c:otherwise>
					<c:forEach begin="${ (num / 10) * 10 - 3 }"
						end="${ (num / 10) * 10 + 5 }" var="listFor">
						<c:url var="listPageNum" value="/shop/shopmain?num=${ listFor - 1 }" />
						<a href="${ listPageNum }">${ listFor }</a>
					</c:forEach>
				</c:otherwise>

			</c:choose>



			<a href="${ nextlist }"><button>&gt;</button></a>
			<c:url var="maxIndex" value="/shop/shopmain?num=${ listPageMax - 1 }" />
			<a href="${ maxIndex }"><button>&gt;&gt;</button></a>
		</div>
	</div>




	<!-- 
	<c:forEach items="${ products }" var="list">
		<div class="my-2">
			<label class="form-label" for="productname">상품이름</label>
			<input class="form-control" id="productname" value="${ list.productname }" readonly />
		</div>
		<div class="my-2">
			<label class="form-label" for="brand">브랜드</label>
			<input class="form-control" id="brand" value="${ list.brand }" readonly />
		</div>
		<div class="my-2">
			<label class="form-label" for="photopath">상품이미지</label>
			<input class="form-control" id="photopath" value="${ list.photopath }" readonly />
		</div>
		<div class="my-2">
			<label class="form-label" for="hashtag">상품정보/설명</label>
			<textarea class="form-control" id="hashtag" readonly>${ list.hashtag }</textarea>
		</div>
		<div class="my-2">
			<label class="form-label" for="alchol_level">상품도수</label>
			<input class="form-control" id="alchol_level" value="${ list.alcohol_level }" readonly />
		</div>
		<div class="my-2">
			<label class="form-label" for="expirationdate">유통기한</label>
			<input class="form-control" id="expirationdate" value="${ list.expirationdate }" readonly>
		</div>
		<div class="my-2">	
			<label class="form-label" for="price">상품가격</label>
			<input class="form-control" id="price" value="${ list.price }" readonly />
		</div>
	</c:forEach>
	 -->


</body>
</html>