/**
 * 
 */
document.addEventListener('DOMContentLoaded', () => {
	const activationPassword = document.querySelector('input#activationPassword');
	const activationForm = document.querySelector('#activationForm');
	const btnActivationAccount = document.querySelector('button#btnActivationAccount');
	const userEmail = document.querySelector('#userEmail').value;
	
	// userEmail 값을 입력 필드에 설정합니다.
  		document.querySelector('input#userEmail').value = userEmail;
		
	btnActivationAccount.addEventListener('click', async () => {
		const password = activationPassword.value;
		
		if (password === '') {
			alert('비밀번호를 입력하세요.')
			return;
		}
		
		const url = `/alcohol/api/signup/activationAccount`;
		const data = {
			userEmail,
			userPassword: password
		};
		try{
			let response = await axios.post(url, data);
			console.log(response);
			
			if (response.data === "invalid") {
				// 기존 비밀번호가 일치하지 않는 경우
				alert('비밀번호가 일치하지 않습니다.');
				document.querySelector('input#activationPassword').value = '';		
				return;
			}
		} catch (error) {
			console.log(error);
			return;
		}
		
		const check = confirm('계정을 활성화 할까요?')
		if (check) {
			activationForm.action = '/alcohol/signup/activationAccount';
			activationForm.method = 'post';
			activationForm.submit();
		}
		
	});
	
});