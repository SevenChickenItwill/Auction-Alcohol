/**
 * 
 */

document.addEventListener('DOMContentLoaded', () => {
	const signupEmailForm = document.querySelector('#signupEmailForm');
	const btnNext = document.querySelector('#btnNext');
	const userEmail = document.querySelector('#userEmail');

	btnNext.addEventListener('click', () => {
		// userEmail.value로 입력된 값을 가져와서 확인해야 합니다.
		const emailValue = userEmail.value;

		if (emailValue === '') {
			alert('이메일을 반드시 작성하세요.');
			return;
		}

		const check = confirm('작성한 내용을 확인하세요.');

		if (check) {
			signupEmailForm.action = './signupEmail';
			signupEmailForm.method = 'post';
			signupEmailForm.submit();
		}
	});
 	
	});
	
	