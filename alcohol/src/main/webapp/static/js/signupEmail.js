	document.addEventListener('DOMContentLoaded', () => {
	const signupEmailForm = document.querySelector('#signupEmailForm');
	const btnNext = document.querySelector('input#btnNext');
	const userEmail = document.querySelector('#userEmail');
	const btnEmailCheck =document.querySelector('#btnEmailCheck');
	let signupOk = 0;
	
	btnEmailCheck.addEventListener('click', async (e) => {
		e.preventDefault(); // 이벤트의 기본 동작(폼 제출)을 중지합니다.

		const userEmail = document.querySelector('input#userEmail').value;
		console.log(userEmail);
		const url = `/alcohol/api/signup/signupEmail/${userEmail}`;
		try {
			let response = await axios.get(url);
			console.log(response);

			if (response.data) {
				// 중복된 경우
				alert('이미 사용중인 이메일 입니다.');
				document.querySelector('input#userEmail').value = ''; // 입력된 별명을 지웁니다.
			} else {
				// 사용 가능한 경우
				alert('사용 가능한 이메일입니다.');
				signupOk = 1;
			}
		} catch (error) {
			console.log(error);
		}
	});

	btnNext.addEventListener('click', (event) => {
		// userEmail.value로 입력된 값을 가져와서 확인해야 합니다.
		const emailValue = userEmail.value;
		
		if(signupOk == 0){
			alert('중복검사를 진행하세요');
			event.preventDefault();
			return;
		}
		
		if (emailValue === '') {
			alert('이메일을 반드시 작성하세요.');
			event.preventDefault(); // 이벤트의 기본 동작(폼 제출)을 중지합니다.
			return;
		}

		// 이메일 유효성 검사
		if (!isValidEmail(emailValue)) {
			alert('유효한 이메일 주소를 입력하세요.');
			event.preventDefault(); // 이벤트의 기본 동작(폼 제출)을 중지합니다.
			return;
		}

		signupEmailForm.action = './signupEmail';
		signupEmailForm.method = 'post';
		signupEmailForm.submit();
		// 폼 제출
	});

	// 이메일 유효성 검사 함수
	function isValidEmail(email) {
		// 간단한 이메일 유효성 검사를 위한 정규식
		const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		return emailRegex.test(email);
	}
});
