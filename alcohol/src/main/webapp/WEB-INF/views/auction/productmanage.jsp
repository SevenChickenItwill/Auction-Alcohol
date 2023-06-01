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
<body class="mx-3">
	<header>
		<h1>경매 상품 관리</h1>
		<h4>***님 반갑습니다</h4>
	</header>
	<main class="card">
			<div class="d-none">
				<input id="userid" value="test" name="userid">
			</div>
			<div>
				<label for="productname" class="mx-3 my-2">상품명</label>
				<input id="productname" name="pname" type="text" class="mx-3" >
			</div>
			<div>
				<label for="constructor" class="mx-3 my-2">제조사</label>
				<input id="constructor" class="mx-3" name="constructor" type="text">
			</div>
			<div>
				<label for="brandname" class="mx-3 my-2">브랜드명</label>
				<input id="brandname" class="mx-3" name="brandname" type="text" >
			</div>
			<div>
				<label class="mx-3 my-1">카테고리</label>
				<select class="form-select mx-3 my-1" aria-label="Default select example" id="category" name="category" style="width:300px;height:40px;">
					<option selected="selected" value="50">선택안함</option>
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
			<div class="my-2"></div>
			
			<div>
				<span id="btnsearch" class="btn">상세 검색</span>
				<span id="btninit" class="btn">초기화</span>
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
				<tbody id="productList">
					<c:forEach var="list" items="${ productlist }">
						<tr>
							<td class="d-none">${ list.userid }</td>
							<td class="d-none" id="productid">${ list.productid }</td>
							<td><c:url var="detailPage" value="/auction/productdetail">
									<c:param name="productid" value="${ list.productid }"></c:param>
								</c:url> <a href="${ detailPage }"> ${ list.pname } </a></td>
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
	<script src="../static/js/product-detail-search.js"></script>
</body>
</html>