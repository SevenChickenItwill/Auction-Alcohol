<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Alcohol</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<style>
/* Custom styles for your page */
body {
	font-family: Arial, sans-serif;
	background-color: #fff;
}

header {
	text-align: center;
	padding: 2rem;
	background-color: #000;
	color: #fff;
}

form {
	max-width: 600px;
	margin: 0 auto;
	padding: 2rem;
	background-color: #fff;
}

form label {
	display: block;
	font-weight: bold;
	margin-bottom: 0.5rem;
	color: #000;
}

form input[type="text"] {
	width: 100%;
	padding: 0.5rem;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin-bottom: 1rem;
	color: #000;
	background-color: #fff;
}

div {
	text-align: center;
	margin-top: 1rem;
}

button {
	display: inline-block;
	padding: 0.5rem 1rem;
	background-color: #000;
	color: #fff;
	border: none;
	border-radius: 4px;
	font-weight: bold;
	text-transform: uppercase;
	letter-spacing: 2px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #333;
}

button#btnAddressCancel {
	margin-right: 1rem;
	background-color: #777;
}

body {
	background-color: #fff;
}

header {
	background-color: #fff;
	color: #000;
}

form {
	max-width: 600px;
	margin: 0 auto;
	padding: 2rem;
	background-color: #fff;
	form
	label
	{
	color
	:
	#000;
}

form input[type="text"] {
	border-color: #000;
	color: #000;
	background-color: #fff;
}

button {
	background-color: #000;
}

button:hover {
	background-color: #333;
}
</style>
</head>
<body>
	<header>
		<h1>주소 변경</h1>
	</header>
	<c:url var="userAddressModify" value="/signup/userAddressModify"></c:url>
	<form id="userAccountform" name="userAccountform" method="post"
		action="${userAddressModify}">
		<input type="text" class="d-none" id="userEmail" name="userEmail"
			value="${ sessionScope.userEmail }" />
		<div>
			<div class="row g-3">
				<div class="col-sm-8">
					<input type="text" id="sample6_postcode" name="userPostalCode"
						placeholder="우편번호" class="form-control" readonly />
				</div>
				<div
					class="col-sm-4 btnWrapper d-grid gap-2 d-md-flex justify-content-md-end">
					<input type="button" onclick="sample6_execDaumPostcode()"
						style="font-size: 14px; height: 42px;" value="우편번호 찾기"
						class="btnContent btn btn-dark me-md-2" />
				</div>
			</div>
			<div>
				<input type="text" id="sample6_address" name="userAddress"
					placeholder="주소" readonly /> <br> <input type="text"
					id="sample6_detailAddress" name="userDetailAddress"
					placeholder="상세주소" /> <input type="text"
					id="sample6_extraAddress" name="userAddressNotes"
					placeholder="참고사항" />
			</div>
		</div>
	</form>

	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>
	<div>
		<button id="btnAddressCancel">취소</button>
		<button id="btnAddressUpdate">수정하기</button>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script src="../static/js/userAccountAddressUpdate.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
</html>
