<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta charset="UTF-8">
		<title>술면조에 오신 것을 환영합니다.</title>
		<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    crossorigin="anonymous">
	</head>
	<body>
		<nav class="testnav"> <!-- 나중에 지워도 됩니다. -->
			<ul>
				<li><a href="/alcohol/shop/pdlist">목록가기</a></li>
				<li><a href="/alcohol/shop/pdcreate">상품등록</a></li>
				<li>마이페이지</li>
			</ul>
		</nav>
		<header><h1>상품 리스트</h1></header>
		<main>
			<div>
				<c:url var="pdcreate" value="/shop/pdcreate"></c:url>
				<a href="${pdcreate }"><button>상품 등록</button></a>
			</div>
			<div>
				<label for="searchtext">검색창</label>
				<div><input type="text" value="${ sessionScope.userNickname }" class="d-none" name="userid" id="userid"></div>
				<input type="text" placeholder="검색할 내용을 입력하세요." id="searchtext" name="searchtext" />
				<select id="searchoption" name="searchoption" class="card">
					<option value="1">상품명</option>
					<option value="2">해시태그</option>
					<option value="3">브랜드</option>
					<option value="4">상품명,해시태그,브랜드</option>
				</select>
				<button class="btn" id="btnsearch">검색</button>
			</div>
			<div>
				<table class="table">
					<thead>
						<tr>
						<th>상품코드</th>
						<th>상품명</th>
						<th>규격</th>
						<th>단위</th>
						<th>가격</th>
						<th>브랜드</th>
						<th>판매자ID</th>
						<th>유통기한</th>
						<th>도수</th>
						<th>해시태그</th>
						<th>카테고리</th>
						<th>상품사진</th>
						</tr>
					</thead>
					<tbody id="tbodys">
					<c:forEach var="list" items="${ prolist }">
					<c:url var="detail" value="/shop/pdmodify">
						<c:param name="pid" value="${ list.pid }"></c:param>
					</c:url>
					<tr>
						<td><a href="${detail }">${ list.pid }</a></td>
						<td><a href="${detail }">${ list.productname }</a></td>
						<td><a href="${detail }">${ list.standard }</a></td>
						<td><a href="${detail }">${ list.unit }</a></td>
						<td><a href="${detail }">${ list.price }</a></td>
						<td><a href="${detail }">${ list.brand }</a></td>
						<td><a href="${detail }">${ list.userid }</a></td>
						<td><a href="${detail }">${ list.expirationdate }</a></td>
						<td><a href="${detail }">${ list.alcohol_level }</a></td>
						<td><a href="${detail }">${ list.hashtag }</a></td>
						<c:if test="${ list.category == 1 }">
								<td><a href="${detail }">탁주</a></td>
							</c:if>
							<c:if test="${ list.category == 2 }">
								<td><a href="${detail }">약주</a></td>
							</c:if>
							<c:if test="${ list.category == 3 }">
								<td><a href="${detail }">청주</a></td>
							</c:if>
							<c:if test="${ list.category == 4 }">
								<td><a href="${detail }">맥주</a></td>
							</c:if>
							<c:if test="${ list.category == 5 }">
								<td><a href="${detail }">과실주</a></td>
							</c:if>
							<c:if test="${ list.category == 6 }">
								<td><a href="${detail }">소주</a></td>
							</c:if>
							<c:if test="${ list.category == 7 }">
								<td><a href="${detail }">위스키</a></td>
							</c:if>
							<c:if test="${ list.category == 8 }">
								<td><a href="${detail }">브랜디</a></td>
							</c:if>
							<c:if test="${ list.category == 9 }">
								<td><a href="${detail }">증류주</a></td>
							</c:if>
							<c:if test="${ list.category == 10 }">
								<td><a href="${detail }">리큐르</a></td>
							</c:if>
							<c:if test="${ list.category == 11 }">
								<td><a href="${detail }">주정</a></td>
							</c:if>
							<c:if test="${ list.category == 12 }">
								<td><a href="${detail }">기타주류</a></td>
							</c:if>
						<td><img src = "data:image/jpeg;base64,${ list.photopath }" /></td>
					</tr></a>
					</c:forEach>
					
					</tbody>
				</table>
			</div>
		</main>
		<script src="../static/js/pdlists.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
	</body>
</html>