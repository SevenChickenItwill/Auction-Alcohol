<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	
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
					<button id="btnCreate" name="btnCreate">상품 등록</button>
				
				
				
					
				
			</div>
			<div class="card">
				<table>
					<thead>
					<tr>
						<th>상품코드</th>
						<th>상품명</th>
						<th>제조사(생산자)</th>
						<th>브랜드</th>
						<th>종류</th>
						<th>원가</th>
					</tr>	
					</thead>
					<tbody>
					<tr>
						<td>테스트</td>
						<td>테스트</td>
						<td>테스트</td>
						<td>테스트</td>
						<td>테스트</td>
						<td>테스트</td>
						</tr>
					</tbody>
				</table>
			</div>
		</main>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	</body>
</html>