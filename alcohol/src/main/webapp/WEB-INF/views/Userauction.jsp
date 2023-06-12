<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>사용자 관리 페이지 - 경매</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
    crossorigin="anonymous">
</head>
<body>
	<header>
		<!-- 나중에 회원 정보 관련 데이터가 들어갈 부분 -->
	</header>
	<main>
	<div>
		<h2>관심 경매</h2>
		<table class="table">
			<thead>
				<tr>
					<th>경매명</th>
					<th>주최자</th>
					<th>현재 입찰자</th>
					<th>낙찰상품명</th>
					<th>상품브랜드</th>
					<th>상품제조사</th>
					<th>낙찰금액</th>
					<th>입찰수</th>
				</tr>
			</thead>
			<tbody id="tablebody">
				<c:forEach items="${myauction}" var="myauction">
					<c:if test="${myauction.status == 1 }">
					<tr>
						<td>${myauction.auctionName}</td>
						<td>${myauction.auctioneer}</td>
						<td>${myauction.bidder }</td>
						<td>${myauction.pname}</td>
						<td>${myauction.brandname}</td>
						<td>${myauction.constructor}</td>
						<td>${myauction.nowbid}</td>
						<td>${myauction.bidcount}</td>
					</tr>
					</c:if>
				</c:forEach>
				
				
			</tbody>
		</table>
		</div>
		
		<hr />
		
		<div>
			<h2>종료된 경매</h2>
		<table class="table">
			<thead>
				<tr>
					<th>경매명</th>
					<th>주최자</th>
					<th>낙찰자</th>
					<th>낙찰상품명</th>
					<th>상품브랜드</th>
					<th>상품제조사</th>
					<th>낙찰금액</th>
					<th>입찰수</th>
				</tr>
			</thead>
			<tbody id="tablebody">
				<c:forEach items="${myauction2}" var="mine">
					<c:if test="${mine.status == 2 }">
					<tr>
						<td>${mine.auctionName}</td>
						<td>${mine.auctioneer}</td>
						<td>${mine.bidder }</td>
						<td>${mine.pname}</td>
						<td>${mine.brandname}</td>
						<td>${mine.constructor}</td>
						<td>${mine.nowbid}</td>
						<td>${mine.bidcount}</td>
					</tr>
					</c:if>
				</c:forEach>
				
				
			</tbody>
		</table>
		</div>
	</main>

 <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
</body>
</html>