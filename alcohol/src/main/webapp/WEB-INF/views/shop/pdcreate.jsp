<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta charset="UTF-8">
		<title>칠면주조에 오신 걸 환영합니다.</title>
		<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    crossorigin="anonymous">
	</head>
	<body>
		<header>
			<h1>상품 등록 페이지</h1>
		</header>
	<main>
		<div>
			<form id="createform">
				<label for="productname">상품명</label>
				<input type="text" required="required" name="productname" id="productname" />
				<label for="standard">규격</label>
				<input type="text" required="required" name="standard" id="standard" />
				<label for="unit">단위</label>
				<input type="text" required="required" name="unit" id="unit" />
				<label for="price">가격</label>
				<input type="number" required="required" name="price" id="price" />
				<label for="brand">브랜드</label>
				<input type="text" required="required" name="brand" id="brand" />
				<input value="${ sessionScope.userNickname }" class="d-none" type="text" required="required" name="userid" id="userid" />
				<label for="expirationdate">유통기한</label>
				<input type="text" required="required" name="expirationdate" id="expirationdate" />
				<label for="alcohol_level">도수</label>
				<input type="number" required="required" name="alcohol_level" id="alcohol_level" />
				<label for="hashtag">해시태그</label>
				<input type="text" required="required" name="hashtag" id="hashtag" />
				<input class="d-none" type="text" required="required" name="photopath" id="photopath" />
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
					<button class="btn" id="btncreate">상품 등록</button>
			</form>
		</div>
		<div>
				<form id="imginsert" enctype="multipart/form-data">
					<div class="form-control">
						<input class="form-control" type="file" id="image" name="image" />
						<button class="btn" id="imgupload">이미지 확정</button>
					</div>
				</form>
		</div>
		<div id="imgpreview">
			
		</div>
	</main>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script src="../static/js/pdcreate.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
	</body>
</html>