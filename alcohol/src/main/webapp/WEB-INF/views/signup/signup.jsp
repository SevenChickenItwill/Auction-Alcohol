<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>칠면주조에 오신걸 환영합니다 - 회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<style>
.wrapper {
	height: 10px;
	width: 700px;
	display: grid;
	place-items: center;
	justify-items: start;
	align-items: end;
	min-height: 20vh;
}

.content {
	font-family: system-ui, serif;
	font-size: 42px;
	border-radius: 1rem;
	padding-top: 1rem;
	padding-bottom: 1rem;
	padding-right: 1rem;
}

.main {
	height: 100%;
	display: flex;
	justify-content: center;
}

.h5 {
	margin-bottom: 20px;
}

.nameDiv {
	font-family: system-ui, serif;
	font-size: 2rem;
	padding-top: 24px;
	display: flex;
	border-radius: 1rem;
}

.nameInput {
	padding-top: 16px;
	padding-right: 16px;
	padding-left: 12px;
	padding-bottom: 16px;
}

.passwordDiv {
	font-family: system-ui, serif;
	font-size: 2rem;
	padding-top: 24px;
	display: flex;
	border-radius: 1rem;
}

.passwordInput {
	padding-top: 16px;
	padding-right: 16px;
	padding-left: 12px;
	padding-bottom: 16px;
}

.passwordCheckDiv {
	font-family: system-ui, serif;
	font-size: 2rem;
	padding-top: 24px;
	padding-bottom: 6px;
	display: flex;
	border-radius: 1rem;
	display: flex;
}

.passwordCheckInput {
	padding-top: 16px;
	padding-right: 16px;
	padding-left: 12px;
	padding-bottom: 16px;
}

.addressDiv {
	padding-top: 16px;
}

.phoneDiv {
	font-family: system-ui, serif;
	font-size: 2rem;
	padding-top: 24px;
	padding-bottom: 6px;
	display: flex;
	border-radius: 1rem;
	display: flex;
}

.phoneInput {
	padding-top: 16px;
	padding-right: 16px;
	padding-left: 12px;
	padding-bottom: 16px;
}

.nicknameDiv {
	padding-top: 16px;
}

.genderDiv {
	padding-top: 16px;
}

.birDiv {
	display: flex;
    justify-content: space-around;
    align-items: center;
    font-size: 28px;
}

.btnSignCan {
	padding-bottom: 16px;
}

.btn {
	margin-left: auto;
}
</style>
</head>
<body>
	<div style="outline: none" class="main">
		<div>
			<div>
				<header aria-label="칠면주조 회원가입" tabindex="0">
					<div>
						<i aria-label="turkey brewery"> </i>
					</div>
					<h1 aria-label="칠면주조 회원가입" class="wrapper">
						<span class="content">칠면주조 회원가입</span>
					</h1>
					<!-- 메인 회원가입 페이지 -->
				</header>

				<main>
					<div>
						<h5 class="h5">회원정보를 입력해주세요</h5>
					</div>
					<div>
						<c:url var="signup" value="/signup/signup" />
						<form id="signupForm" method="post" action="${ signup }">
							<div>
								<div>
									<select name="category" class="form-select"
										aria-label="Default select example">
										<option value="0">구매자</option>
										<option value="1">판매자</option>
									</select>
								</div>
								<div class="nameDiv col-md-12">
									<label for="userName"></label> 
									<input type="text" id="userName"
										name="userName" placeholder="이름"
										class="nameInput form-control rounded" autofocus />
								</div>
								<div class="passwordDiv col-md-12">
									<label for="userPassword"></label> 
									<input type="password"
										id="userPassword" name="userPassword" placeholder="비밀번호"
										class="passwordInput form-control rounded" required />
								</div>
								<div class="passwordCheckDiv col-md-12">
									<label for="userPasswordCheck"></label> <input type="password"
										id="userPasswordCheck"
										class="passwordCheckInput form-control rounded"
										name="userPasswordCheck" placeholder="비밀번호 확인" required />
								</div>

								<ul>
									<li><label>비밀번호 설정 요건:</label></li>
									<li><label>8자 이상 20자 미만</label></li>
									<li><label>숫자, 특수 기호, 알파벳으로만 구성되어야 합니다.</label></li>
								</ul>

								<div class="row g-3">
									<div class="col-sm-8">
										<input type="text" id="sample6_postcode" name="userPostalCode"
											placeholder="우편번호" class="form-control" readonly />
									</div>
									<div
										class="col-sm-4 btnWrapper d-grid gap-2 d-md-flex justify-content-md-end">
										<input type="button" onclick="sample6_execDaumPostcode()"
											value="우편번호 찾기" class="btnContent btn btn-dark me-md-2">
									</div>
								</div>
								<div class="addressDiv row g-3">
									<div class="col-sm-8">
										<input type="text" id="sample6_address" name="userAddress"
											placeholder="주소" class="form-control" readonly />
									</div>
								</div>
								<div class="addressDiv row g-3">
									<div class="col-sm-6">
										<input type="text" id="sample6_detailAddress"
											name="userDetailAddress" placeholder="상세주소"
											class="form-control">
									</div>
									<div class="col-sm-6">
										<input type="text" id="sample6_extraAddress"
											name="userAddressNotes" placeholder="참고사항"
											class="form-control">
									</div>
								</div>

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
																	&& /[동|로|가]$/g
																			.test(data.bname)) {
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
																extraAddr = ' ('
																		+ extraAddr
																		+ ')';
															}
															// 조합된 참고항목을 해당 필드에 넣는다.
															document
																	.getElementById("sample6_extraAddress").value = extraAddr;

														} else {
															document
																	.getElementById("sample6_extraAddress").value = '';
														}

														// 우편번호와 주소 정보를 해당 필드에 넣는다.
														document
																.getElementById('sample6_postcode').value = data.zonecode;
														document
																.getElementById("sample6_address").value = addr;
														// 커서를 상세주소 필드로 이동한다.
														document
																.getElementById(
																		"sample6_detailAddress")
																.focus();
													}
												}).open();
									}
								</script>

								<div class="phoneDiv col-md-12">
									<label for="userPhone"></label> <input type="text"
										id="userPhone" name="userPhone" placeholder="전화번호" required
										class="phoneInput form-control rounded">
									<!--  <small id="phoneErrorMessage" style="color: red;"></small> -->
								</div>
								<div class="nicknameDiv row g-3">
									<div class="col-sm-8">
										<label for="userNickname"></label> <input type="text"
											id="userNickname" name="userNickname" placeholder="닉네임"
											required class="form-control" />
									</div>
									<div
										class="col-sm-4 btnWrapper d-grid gap-2 d-md-flex justify-content-md-end">
										<button id="btnNicknameCheck"
											class="btnContent btn btn-dark me-md-2">중복체크</button>
									</div>
								</div>
							</div>
							<div class="genderDiv">
								<div class="form-check form-check-inline">
									<!-- 체크박스 -->
									<input class="form-check-input" type="radio" name="userGender"
										value="남성" id="userGender" required /> <label
										class="form-check-label" for="cb1">남성</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="userGender"
										value="여성" id="userGender" required /> <label
										class="form-check-label" for="cb2">여성</label>
								</div>
							</div>
							<div class="row g-3">
								<div class="birDiv col-sm-3">
									<label>생년월일</label>
								</div>
								<div class="col-sm-9 d-grid gap-2 d-md-flex justify-content-md-end">
									<input class="phoneInput form-control rounded" type="date" id="userBirthday" name="userBirthday" 
										required />
								</div>
							</div>
							<div>
								<input type="text" class="d-none" id="userEmail"
									name="userEmail" placeholder="email@abc.com"
									value="${ userEmail }" required />
							</div>

							<br />
						</form>
						<div>
							<div class="btnSignCan d-grid gap-2 d-md-flex justify-content-md-end">
								<input class="btn btn-dark me-md-2" type="submit" id="btnCancel" value="취소"> 
								<input class="btn btn-dark" type="submit" id="btnSignup" value="회원가입" />
							</div>
						</div>
					</div>

				</main>

			</div>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script src="../static/js/signup.js"></script>
		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	</div>

</body>
</html>