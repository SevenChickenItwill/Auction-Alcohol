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
<title>상품관리</title>
</head>
<body>
	<header>
		<h1>경매 상품 관리</h1>
		<h4>***님 반갑습니다</h4>
	</header>
	<main>
		<div>
			<input type="text" name="searchtext" id="searchtext" />
			<button id="btnSearch" name="btnSearch">상품 검색</button>
			<c:url var="productcreate" value="/auction/productcreate" />
			<a href="${ productcreate }"><button id="btnCreate"
					name="btnCreate">상품 등록</button></a>
		</div>
		
		<div class="card">
			<table>
				<thead>
					<tr>
						<th class="d-none">상품코드</th>
						<th>상품명</th>
						<th>제조사(생산자)</th>
						<th>브랜드</th>
						<th>종류</th>
						<th>원가</th>

					</tr>
				</thead>
				<tbody>
					<div id="productList">
						<c:forEach var="list" items="${ productlist }">
							<tr>
								<td class="d-none">${ list.userid }</td>
								<td class="d-none" id="productid">${ list.productid }</td>
								<td>
								<c:url var="detailPage" value="/auction/productdetail">
									<c:param name="productid" value="${ list.productid }"></c:param>
								</c:url>
									<a href="${ detailPage }">
										${ list.pname }
									</a>
								</td>
								<td>${ list.constructor }</td>
								<td>${ list.brandname }</td>
								
								<c:if test="${ list.category == 1 }">
									<td>탁주</td>
								</c:if>
								<c:if test="${ list.category == 2 }">
									<td>약주</td>
								</c:if>
								<c:if test="${ list.category == 3 }">
									<td>청주</td>
								</c:if>
								<c:if test="${ list.category == 4 }">
									<td>맥주</td>
								</c:if>
								<c:if test="${ list.category == 5 }">
									<td>과실주</td>
								</c:if>
								<c:if test="${ list.category == 6 }">
									<td>소주</td>
								</c:if>
								<c:if test="${ list.category == 7 }">
									<td>위스키</td>
								</c:if>
								<c:if test="${ list.category == 8 }">
									<td>브랜디</td>
								</c:if>
								<c:if test="${ list.category == 9 }">
									<td>증류주</td>
								</c:if>
								<c:if test="${ list.category == 10 }">
									<td>리큐르</td>
								</c:if>
								<c:if test="${ list.category == 11 }">
									<td>주정</td>
								</c:if>
								<c:if test="${ list.category == 12 }">
									<td>기타주류</td>
								</c:if>
								
								<td>${ list.cost }</td>
								
							</tr>

						</c:forEach>
					</div>
				</tbody>
			</table>
		</div>


	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</body>
</html>