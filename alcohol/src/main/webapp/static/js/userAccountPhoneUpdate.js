document.addEventListener('DOMContentLoaded', () => {

	const accountForm = document.querySelector('#accountForm');
	const btnPhoneCancel = document.querySelector('button#btnPhoneCancel');
	const btnPhoneUpdate = document.querySelector('button#btnPhoneUpdate');
	const userAccountPhoneModify = document.querySelector('#userAccountPhoneModify');

	btnPhoneCancel.addEventListener('click', () => {
		const check = confirm('수정을 취소할까요?');
		if (check) {
			accountForm.action = './userModify';
			accountForm.method = 'get';
			accountForm.submit();
		}
	});

	btnPhoneUpdate.addEventListener('click', (e) => {
		e.preventDefault();

		const userAccountPhone = userAccountPhoneModify.value;
		const userEmail = document.querySelector('#userEmail').value;

		if (userAccountPhone.trim() === '') {
			alert('항목을 반드시 작성하세요.');
			return;
		}

		if (!isValidPhoneNumber(userAccountPhone)) {
			alert('올바른 전화번호 형식을 입력해주세요. (예: 010-0000-0000)');
			return;
		}

		const check = confirm('수정할까요?');

		if (check) {
			accountForm.action = `./userPhoneModify`;
			accountForm.method = 'post';
			accountForm.submit();
		}
	});

	// 전화번호 유효성 체크
	function isValidPhoneNumber(phoneNumber) {
		const regex = /^\d{3}-\d{4}-\d{4}$/;
		return regex.test(phoneNumber);
	}

});
