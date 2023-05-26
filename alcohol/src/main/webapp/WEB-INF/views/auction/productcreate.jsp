<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	
		<meta charset="UTF-8">
		<title>상품 등록</title>
	</head>
	<body>
		<header>
		<h1>상품 등록</h1>
		</header>
		<main>
			<div>
				<form method="get">
					<div class="form-control">
					<label for="productName">상품명</label>
						<input type="text" name="productName" id="productName" />
					</div>
					<div class="form-control">
					<label for="brandname">브랜드명</label>
						<input type="text" name="brandname" id="brandName" />
					</div>
					<div class="form-control">
					<label for="constructorName">제조사(생산자)</label>
						<input type="text" name="constructorName" id="constructorName" />
					</div>
					<div class="form-control">
					<label for="cost">원가</label>
						<input type="number" name="cost" id="cost" />
					</div>
					<div>
					<label for="category">카테고리</label>
					<select id="category" name="category">
						<option>탁주</option>
						<option>청주</option>
						<option>약주</option>
						<option>맥주</option>
						<option>과실주</option>
						<option>소주</option>
						<option>위스키</option>
						<option>브랜디</option>
						<option>증류주</option>
						<option>리큐르</option>
						<option>주정</option>
						<option>기타주류</option>
					</select>
					</div>
				</form>
			</div>
		</main>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	</body>
</html>