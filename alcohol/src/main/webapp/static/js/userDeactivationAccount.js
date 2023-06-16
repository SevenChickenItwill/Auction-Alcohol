/**
 * 
 */
document.addEventListener('DOMContentLoaded', () => {
	const accountDeleteForm = document.querySelector('#accountDeleteForm');
	const btnAccountDelete = document.querySelector('button#btnAccountDelete');
	const accountPassword = document.querySelector('input#accountPassword');
	const userEmail = document.querySelector('input#userEmail').value;
	
	btnAccountDelete.addEventListener('click', async () => {
		const password = accountPassword.value;	
			
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
				document.querySelector('input#accountPassword').value = '';		
				return;
			}
		} catch (errer) {
			console.log(errer);
			return;
		}
		
		const check = confirm('정말 계정을 비활성화 할까요?')
		if (check) {
			accountDeleteForm.action = './deactivationAccount';
			accountDeleteForm.method = 'post';
			accountDeleteForm.submit();
		}
		
	});
});