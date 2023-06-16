/**
 * 
 */
document.addEventListener('DOMContentLoaded', () => {
	const password = document.querySelector('input#password');
	const activationForm = document.querySelector('#activationForm');
	const btnActivationAccount = document.querySelector('button#btnActivationAccount');
	const userEmail = document.querySelector('#userEmail').value;
	btnActivationAccount.addEventListener('click', async () => {
		
		if (password === '') {
			alert('비밀번호를 입력하세요.')
			return;
		}
		
		const url = `/alcohol/api/signup/deactivationAccount`;
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
				document.querySelector('input#activationForm').value = '';		
				return;
			}
		} catch (errer) {
			console.log(errer);
			return;
		}
		
		const check = confirm('계정을 활성화 할까요?')
		if (check) {
			activationForm.action = './activationAccount';
			activationForm.method = 'post';
			activationForm.submit();
		}
		
	});
	
});