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
								<td>${ list.pname }</td>
								<td>${ list.constructor }</td>
								<td>${ list.brandname }</td>
								<td>${ list.category }</td>
								<td>${ list.cost }</td>
								<td>
									<button id="btnProductUpdate" class="btn">수정</button>
								</td>
								<td>
									<button id="btnProductDelete" class="btn">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</div>
				</tbody>
			</table>
		</div>

		<!-- 모달 시작 -->
		<div id="replyUpdateModal" class="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">제품 정보 수정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- 수정할 productid - 화면에 보이지 않도록 -->
						<input id="productId" class="d-none" />
						<!-- 수정할 내용 -->
						<input id="pname" type="text" /> 
						<input id="constructor" type="text" /> 
						<input id="brandname" type="text" /> 
						<select
							class="form-control" id="category" name="category">
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
						<input id="cost" type="number" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" id="modalBtnUpdate" class="btn btn-primary">
							변경 내용 저장
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- end modal -->

	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="../static/js/product-management.js"></script>
</body>
</html>