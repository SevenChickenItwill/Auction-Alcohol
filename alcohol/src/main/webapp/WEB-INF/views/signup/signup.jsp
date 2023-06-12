.<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Alcohol</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body>
	<div>
		<header>
			<h1>술면조 회원가입</h1>
			<!-- 메인 회원가입 페이지 -->
		</header>

		<main>
			<div>
				<h5>회원정보를 입력해주세요</h5>
			</div>
			<div>
				<c:url var="signup" value="/signup/signup" />
				<form id="signupForm" method="post" action="${ signup }">
					<div>
						<div>
							<select name="category">
								<option value="0">구매자</option>
								<option value="1">판매자</option>
							</select>
						</div>
						<div>
							<label for="userName">이름</label> <br /> <input type="text"
								id="userName" name="userName" placeholder="NAME" required
								autofocus />
						</div>
						<div>
							<label for="userPassword">비밀번호</label> <br /> <input
								type="password" id="userPassword" name="userPassword"
								placeholder="PASSWORD" required />
						</div>
						<div>
							<label for="userPasswordCheck">비밀번호 확인</label> <br /> <input
								type="password" id="userPasswordCheck" name="userPasswordCheck"
								placeholder="PASSWORD CHECK" required />
						</div>

						<ul>
							<li><label>비밀번호 설정 요건:</label></li>
							<li><label>8자 이상 20자 미만</label></li>
							<li><label>숫자, 특수 기호, 알파벳으로만 구성되어야 합니다.</label></li>
						</ul>
						
						<div>
						<label>주소</label>
						<br />
						<input type="text" id="sample6_postcode" name="userPostalCode" placeholder="POSTALCODE">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							<br> 
							<input type="text" id="sample6_address" name="userAddress" placeholder="ADDRESS">
							<br> 
							<input type="text" id="sample6_detailAddress" name="userDetailAddress" placeholder="DETAILADDRESS">
							<input type="text" id="sample6_extraAddress" name="userAddressNotes" placeholder="NOTES">

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
						</div>
						<div>
							<label for="userPhone">전화번호</label> 
							<br /> 
							<input type="text"
								id="userPhone" name="userPhone" placeholder="PHONE" required>
							<!--  <small id="phoneErrorMessage" style="color: red;"></small> -->
						</div>
						<div>
							<label for="userNickname">별명</label> 
							<br /> 
							<input type="text"
								id="userNickname" name="userNickname" placeholder="NICKNAME"
								required />
							<button id="btnNicknameCheck">중복체크</button>
						</div>
					</div>
					<div>
						<div>
							<!-- 체크박스 -->
							<input type="radio" name="userGender" value="남성" id="userGender" required /> 
							<label for="cb1">남성</label> 
							<input type="radio"	name="userGender" value="여성" id="userGender" required /> 
							<label for="cb2">여성</label>
						</div>
					</div>
					<div>
						<div>
							<label>생년월일</label> 
							<br /> 
							<input type="date" id="userBirthday"
								name="userBirthday" required />
						</div>
						<div>
							<input type="text" class="d-none" id="userEmail" name="userEmail"
								placeholder="email@abc.com" value="${ userEmail }" required />
						</div>
					</div>

					<br />
				</form>
				<div>
					<div>
						<input type="submit" id="btnCancel" value="취소"> <input
							type="submit" id="btnSignup" value="회원가입" />
					</div>
				</div>
			</div>

		</main>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script src="../static/js/signup.js"></script>
		<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
	</div>
</body>
</html>