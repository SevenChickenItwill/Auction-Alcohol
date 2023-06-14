document.addEventListener('DOMContentLoaded', () => {
	const signupForm = document.querySelector('#signupForm');
	const btnCancel = document.querySelector('#btnCancel');
	const btnNicknameCheck = document.querySelector('#btnNicknameCheck');
	let signupOk = 0;
	btnCancel.addEventListener('click', () => {
		const check = confirm('회원가입을 취소할까요?');
		if (check) {
			signupForm.action = './main';
			signupForm.method = 'get';
			signupForm.submit();
		}
	});


	btnNicknameCheck.addEventListener('click', async (e) => {
		e.preventDefault(); // 이벤트의 기본 동작(폼 제출)을 중지합니다.

		const userNickname = document.querySelector('input#userNickname').value;
		console.log(userNickname);
		const url = `/alcohol/api/signup/signup/${userNickname}`;
		try {
			let response = await axios.get(url);
			console.log(response);

			if (response.data) {
				// 중복된 경우
				alert('이미 사용중인 별명입니다.');
				document.querySelector('input#userNickname').value = ''; // 입력된 별명을 지웁니다.
			} else {
				// 사용 가능한 경우
				alert('사용 가능한 별명입니다.');
				signupOk = 1;
			}
		} catch (error) {
			console.log(error);
		}
	});


	const btnSignup = document.querySelector('#btnSignup');
	btnSignup.addEventListener('click', () => {

		if (signupOk == 0) {
			alert('중복검사를 진행하세요');
			return;
		}

		const userName = document.querySelector('#userName').value;
		const userPassword = document.querySelector('#userPassword').value;
		const userPasswordCheck = document.querySelector('#userPasswordCheck').value;
		const sample6_address = document.querySelector('#sample6_address').value;
		const sample6_postcode= document.querySelector('#sample6_postcode').value;
		const sample6_detailAddress = document.querySelector('#sample6_detailAddress').value;
		const sample6_extraAddress = document.querySelector('#sample6_extraAddress').value;
		const userPhone = document.querySelector('#userPhone').value;
		const userNickname = document.querySelector('#userNickname').value;
		const userGender = document.querySelector('#userGender').value;
		const userBirthday = document.querySelector('#userBirthday').value;



		if (userName.length >= 8) {
			alert('사용자 이름은 8글자 미만이어야 합니다.');
			return;
		}

		if (
			userName === '' ||
			userPassword === '' ||
			userPasswordCheck === '' ||
			sample6_address === '' ||
			sample6_postcode === '' ||
			sample6_detailAddress === '' ||
			sample6_extraAddress === '' ||
			userPhone === '' ||
			userNickname === '' ||
			userGender === '' ||
			userBirthday === ''
		) {
			alert('항목을 반드시 작성, 선택해주세요');
			return;
		}

		if (userPassword !== userPasswordCheck) {
			alert('비밀번호가 일치하지 않습니다.');
			return;
		}

		if (userNickname.length >= 8) {
			alert('사용자의 별명은 8글자 미만이어야 합니다.');
			return;
		}

		if (!isValidPassword(userPassword)) {
			alert('비밀번호는 8자 이상 20자 미만이며, 숫자, 특수 기호, 알파벳으로만 구성되어야 합니다.');
			return;
		}

		if (!isValidPhoneNumber(userPhone)) {
			alert('올바른 전화번호 형식을 입력해주세요. (예: 010-0000-0000)');
			return;
		}


		const currentDate = new Date();
		const userBirthdate = new Date(userBirthday);
		const age = currentDate.getFullYear() - userBirthdate.getFullYear();

		if (age < 20) {
			alert('회원가입은 20세 이상만 가능합니다.');
			return;
		}

		const check = confirm('회원가입 할까요?');
		if (check) {
			signupForm.action = './signup';
			signupForm.method = 'post';
			signupForm.submit();
		}
	});

	// 비밀번호 무결성 체크
	function isValidPassword(password) {
		const regex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
		return regex.test(password);
	}

	// 전화번호 유효성 체크
	function isValidPhoneNumber(phoneNumber) {
		const regex = /^\d{3}-\d{4}-\d{4}$/;
		return regex.test(phoneNumber);
	}
});
