/**
 * 
 */
document.addEventListener('DOMContentLoaded', () => {
	const accountForm = document.querySelector('#accountForm');

	const btnAccountPassword = document.querySelector('button#btnAccountPassword');
	btnAccountPassword.addEventListener('click', () => {
		accountForm.action = './userPasswordModify';
		accountForm.method = 'post';
		accountForm.submit();
	});

	const btnAccountPhone = document.querySelector('button#btnAccountPhone');
	btnAccountPhone.addEventListener('click', () => {
		accountForm.action = './userPhoneModify';
		accountForm.method = 'post';
		accountForm.submit();
	});

	const btnAccountAddress = document.querySelector('button#btnAccountAddress');
	btnAccountAddress.addEventListener('click', () => {
		accountForm.action = './userAddressModify';
		accountForm.method = 'post';
		accountForm.submit();
	});
});

