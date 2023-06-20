<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기 페이지</title>
</head>
<body>
<h1>상품 상세보기 페이지</h1>

<div>
		<main class="my-2">
			<div class="card">
				<form class="card-body" id="modifyForm">
					<div class="my-2">
						<label class="form-label" for="userNickname">상품명</label>
						 <textarea class="form-control" id="userNickname" name="userNickname">${ user.userNickname }</textarea>
					</div>
					<div class="my-2">
						<label class="form-label" for="userAddress">가격</label>
						<textarea class="form-control" id="userAddress" name="userAddress">${ user.userAddress }</textarea>
					</div>
					<div class="my-2">
						<label class="form-label" for="userPhone">상품정보</label>
						 <textarea class="form-control" name="userPhone" id="userPhone">${ user.userPhone }</textarea>
					</div>
					<div class="my-2">
						<label class="form-label" for="userEmail">브랜드</label>
						 <textarea class="form-control" name="userEmail" id="userEmail">${ user.userEmail }</textarea>
					</div>
				</form>
				
				
			</div>
		</main>
	</div>

</body>
</html>