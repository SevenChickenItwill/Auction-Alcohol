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

a#title:hover {
	color: pink;
}

a#nick-name:hover{
	color: #F7BE81;
}

header {
	color: white;
}
</style>
</head>

<body>
	<header background-color:dark;>
		<nav class="navbar navbar-dark bg-dark fixed-top">
			<div class="container-fluid">
				<a id="title" class="navbar-brand" href="#">칠면주 주류 쇼핑몰</a>
				<!---------------------------------------------------------------------------->
				<div>
				<a id="nick-name">${ sessionScope.userNickname }님</a>
					<c:url var="logout" value="/account/logout"></c:url>
					<a href="${ logout }"><button type="button" class="btn btn-dark">로그아웃</button></a>
				</div>
			</div>
		</nav>

	</header>
	
	
	<h1>dd</h1>
	<br>
	<h2>    </h2>
	<c:url var="productstype" value="/shop/shopmain">
		<c:param name="num" value="0"></c:param>
	</c:url>
	<div style=" display: flex; justify-content: space-between; align-items: center;">
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
		<button type="submit" class="btn btn-dark">찾기</button>
	</form>
	
	
	<!-- 상품명/브랜드명으로 검색하기 -->
	<div>
	<c:url value="/shop/shopsearch" var="searchPage">
		<c:param name="pagenum" value="${ page }"></c:param>
	</c:url>
	<form class="d-flex" action="${ searchPage }" role="search">
		<input type="number" class="d-none" name="page" value="0" />
		 <select name="category">
			<option value="pname">상품명</option>
			<option value="brand">브랜드</option>
			<option value="pnamebrand">상품명 + 브랜드</option>
		</select>
		<input class="form-control me-2" name="keyword" placeholder="검색어를 입력해주세요" style="width: 400px;" required />
		<button type="submit" class="btn btn-dark">검색</button>
	</form>
	</div>
	</div>
	<hr />


	<!-- 상품 정보 -->
	<div>
		<div style="display: inline-block;">
			<c:set var="len" value="${ length }"></c:set>
			<c:set var="count" value="${ pageCount }" />
			<c:set var="nums" value="${ param.num }" />
			<c:set var="maxIndex" value="${ maxIndex }" />
			<c:if test="${ listSize != 0 }">
				<c:forEach items="${ search }" var="list" begin="${count}" end="${ maxIndex -1 }">
					<c:url var="shopmain" value="/shop/shopsearch">
						<c:param name="id" value="${shop.detail}"></c:param>
					</c:url>
					<div id="list" class="card" style="width: 18rem;">
					<a href="">
							<li class="list-group-item">상품명: ${ list.productname }</li>
						<div class="card-body">
							<li class="list-group-item"><img width="100%" height="150px" src="data:image/jpeg;base64,${list.photopath}" /></li>
						</div>
							
							
							<ul class="list-group list-group-flush">
							<li class="list-group-item">브랜드: ${ list.brand }</li>
							<li class="list-group-item">상품정보: ${ list.hashtag } <br> 용량: ${ list.standard },<br> 규격: ${ list.unit }</li>
							<li class="list-group-item">도수: ${ list.alcohol_level },<br> 유통기한: ${ list.expirationdate }</li>
							<li class="list-group-item">가격: ${ list.price }</li>
						</ul>
					</a>
					<div class="card-body">
						<button type="button" class="btn btn-dark">구매하기</button>
					</div>
		</div>
		</c:forEach>
		</c:if>
	</div>
	</div>



	<!-- 페이지네이션 -->
	<div id="page">
            <c:url var="nextlist" value="/shop/shopsearch?page=${ num }&category=${ category }&keyword=${ keyword }">
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
            <c:url var="beforelist" value="/shop/shopsearch?page=${ num }&category=${ category }&keyword=${ keyword }">
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
            <c:url var="indexZero"
                value="/shop/shopsearch?page=0&category=${ category }&keyword=${ keyword }" />
            <a href="${ indexZero }"><button>&lt;&lt;</button></a> <a
                href="${ beforelist }"><button>&lt;</button></a>

            <c:choose>
            	
            	<c:when test="${ listPageMax < 9 }">
            		<c:forEach begin="${ 1 }"
                        end="${ listPageMax }" var="listFor">
                        <c:url var="listPageNum"
                            value="/shop/shopsearch?page=${ listFor - 1 }&category=${ category }&keyword=${ keyword }" />
                        <a href="${ listPageNum }">${ listFor }</a>
                    </c:forEach>
            	</c:when>
            	
                <c:when test="${ (num / 10) * 10 - 4 < 0}">

                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=0&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">1</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=1&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">2</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=2&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">3</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=3&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">4</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=4&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">5</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=5&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">6</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=6&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">7</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=7&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">8</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=8&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">9</a>
                </c:when>



                <c:when test="${ (num / 10) * 10 + 5 > listPageMax  }">

                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=${ listPageMax - 9 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 8 }</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=${ listPageMax - 8 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 7 }</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=${ listPageMax - 7 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 6 }</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=${ listPageMax - 6 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 5 }</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=${ listPageMax - 5 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 4 }</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=${ listPageMax - 4 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 3 }</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=${ listPageMax - 3 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 2 }</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=${ listPageMax - 2 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 1 }</a>
                    <c:url var="listPageNum"
                        value="/shop/shopsearch?page=${ listPageMax - 1 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax }</a>

                </c:when>

                <c:otherwise>
                    <c:forEach begin="${ (num / 10) * 10 - 3 }"
                        end="${ (num / 10) * 10 + 5 }" var="listFor">
                        <c:url var="listPageNum"
                            value="/shop/shopsearch?page=${ listFor - 1 }&category=${ category }&keyword=${ keyword }" />
                        <a href="${ listPageNum }">${ listFor }</a>
                    </c:forEach>
                </c:otherwise>

            </c:choose>



            <a href="${ nextlist }"><button>&gt;</button></a>
            <c:url var="maxIndex"
                value="/shop/shopsearch?page=${ listPageMax - 1 }&category=${ category }&keyword=${ keyword }" />
            <a href="${ maxIndex }"><button>&gt;&gt;</button></a>
        </div>





</body>
</html>