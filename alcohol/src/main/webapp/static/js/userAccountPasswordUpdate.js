


document.addEventListener('DOMContentLoaded', () => {
	const btnPasswordCancel = document.querySelector('button#btnPasswordCancel');
	const userAccountModifyForm = document.querySelector('#userAccountModifyForm');
	const btnPasswordUpdate = document.querySelector('button#btnPasswordUpdate');
	const userAccountPasswordModify = document.querySelector('input#userPassword');
	const userAccountNewPasswordModify = document.querySelector('input#userAccountNewPasswordModify');
	const userAccountNewPasswordCheckModify = document.querySelector('input#userAccountNewPasswordCheckModify');
	const userEmail = document.querySelector('#userEmail').value;


	btnPasswordCancel.addEventListener('click', () => {
		const check = confirm('수정을 취소할까요?');
		if (check) {
			userAccountModifyForm.action = './userModify';
			userAccountModifyForm.method = 'get';
			userAccountModifyForm.submit();
		}
	});

	btnPasswordUpdate.addEventListener('click', async (e) => {
		e.preventDefault();
		
		const passwordValue = userAccountPasswordModify.value;
		const newPasswordValue = userAccountNewPasswordModify.value;
		const newPasswordCheckValue = userAccountNewPasswordCheckModify.value;
		let newPassword = newPasswordValue;
		let userPassword = passwordValue;
		
		console.log(newPassword);
		
		if (passwordValue === '' ||
			newPasswordValue === '' ||
			newPasswordCheckValue === '') {
			alert('항목을 반드시 작성해 주세요.');
			return;
		}

		if (newPasswordValue !== newPasswordCheckValue) {
			alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
			return;
		}

		// TODO: 기존 비밀번호 확인

		if (!isValidPassword(newPasswordValue) || newPasswordValue.length>20 || newPasswordValue.length<8) {
			alert('비밀번호는 8자 이상 20자 미만이며, 숫자, 특수 기호, 알파벳으로만 구성되어야 합니다.');
			return;
		}



		const url = `/alcohol/api/signup/passwordModify`;
		const data = {
			userEmail: userEmail,
			userPassword: userPassword
		};
		try {
			let response = await axios.post(url, data);
			console.log(response);

			if (response.data === "invalid") {
				// 기존 비밀번호가 일치하지 않는 경우
				alert('기존 비밀번호가 일치하지 않습니다.');
				document.querySelector('input#userAccountPasswordModify').value = ''; // 입력된 비밀번호를 지웁니다.
				return;
			}
		} catch (error) {
			console.log(error);
			return;
		}
		
		const check = confirm('수정할까요?')
		if (check) {
			userAccountModifyForm.action = './userPasswordModify';
			userAccountModifyForm.method = 'post';
			userAccountModifyForm.submit();
		}
	});

	// 비밀번호 무결성 체크
	function isValidPassword(password) {
		const regex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
		return regex.test(password);
	}
});
