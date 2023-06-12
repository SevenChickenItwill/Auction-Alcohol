
document.addEventListener('DOMContentLoaded', () => {
	const signupEmailForm = document.querySelector('#signupEmailForm');
	const btnNext = document.querySelector('input#btnNext');
	const userEmail = document.querySelector('#userEmail');


	btnNext.addEventListener('click', async (event) => {
		const userEmail = document.querySelector('input#userEmail').value;
		console.log(userEmail);
		// userEmail.value로 입력된 값을 가져와서 확인해야 합니다.
		if (userEmail === '') {
			alert('이메일을 반드시 작성하세요.');
			event.preventDefault(); // 이벤트의 기본 동작(폼 제출)을 중지합니다.
			return;
		}

		// 이메일 유효성 검사
		if (!isValidEmail(userEmail)) {
			alert('유효한 이메일 주소를 입력하세요.');
			event.preventDefault(); // 이벤트의 기본 동작(폼 제출)을 중지합니다.
			return;
		}



		const url = `/alcohol/api/signup/signupEmail/${userEmail}`;
		try {
			let response = await axios.get(url);
			console.log(response);

			if (response.data != null) {
				// 이메일이 있는 경우
				signupEmailForm.action = '/alcohol/account/loginNew';
				signupEmailForm.method = 'post';
				signupEmailForm.submit();
			} else {
				// 이메일이 없는 경우
				signupEmailForm.action = './signupEmail	';
				signupEmailForm.method = 'post';
				signupEmailForm.submit();
			}
		} catch (error) {
			console.log(error);
		}

	});

	// 이메일 유효성 검사 함수
	function isValidEmail(email) {
		// 간단한 이메일 유효성 검사를 위한 정규식
		const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		return emailRegex.test(email);
	}
});