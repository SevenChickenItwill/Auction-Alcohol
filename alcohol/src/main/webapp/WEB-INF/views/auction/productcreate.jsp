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
		<nav>
			<ul>
				<c:url var="productmain" value="/auction/product"></c:url>
				<li><a href="${ productmain }">메인메뉴</a></li>
			</ul>
		</nav>
		<main>
			
			<div>
			
				<c:url var="createsuccess" value="/auction/createsuccess" />
				<form method="post" action="${ createsuccess }">
					<input class="d-none" name="userId" id="userId" value="test"/>
					<div class="form-control">
					<label for="productName">상품명</label>
						<input class="form-control" type="text" name="pName" id="pName" />
					</div>
					<div class="form-control">
					<label for="brandname">브랜드명</label>
						<input class="form-control" type="text" name="brandname" id="brandName" />
					</div>
					<div class="form-control">
					<label for="constructorName">제조사(생산자)</label>
						<input class="form-control" type="text" name="constructor" id="constructor" />
					</div>
					<div class="form-control">
					<label for="cost">원가</label>
						<input class="form-control" type="number" name="cost" id="cost" />
					</div>
					<div>
					<label for="category">카테고리</label>
                    <%-- value 는 category 테이블의 코드랑 동일하게 설정함. --%>
					<select class="form-control" id="category" name="category">
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
					
					</div>
					<div class="my-2">
						<input class="form-control" type="submit" value="등록" class="btn" />
					</div>
				</form>
			</div>
		</main>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	</body>
</html>