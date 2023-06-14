/**
 * 
 */
document.addEventListener('DOMContentLoaded', () => {
	const userAccountform = document.querySelector('#userAccountform');
	const btnAddressCancel = document.querySelector('#btnAddressCancel');
	const btnAddressUpdate = document.querySelector('#btnAddressUpdate');
	const sample6_postcode = document.querySelector('#sample6_postcode');
	const sample6_address = document.querySelector('#sample6_address');
	const sample6_detailAddress = document.querySelector('#sample6_detailAddress');
	const sample6_extraAddress = document.querySelector('#sample6_extraAddress');

	btnAddressCancel.addEventListener('click', () => {
		const check = confirm('수정을 취소할까요?');
		if (check) {
			userAccountform.action = './usermodify';
			userAccountform.method = './get';
			userAccountform.sudmit();
		}

	});
	btnAddressUpdate.addEventListener('click', () => {
		if (
			sample6_postcode.value.trim() === '' ||
			sample6_address.value.trim() === '' ||
			sample6_detailAddress.value.trim() === '' ||
			sample6_extraAddress.value.trim() === ''
		) {
			alert('항목을 반드시 작성하세요.');
			return;
		}
	const check = confirm('수정할까요?');
	if (check) {
		userAccountform.action = './usermodify';
		userAccountform.method = 'post';
		userAccountform.submit();
	}

	});


});