/**
 * views-payment-ymodify
 */

document.addEventListener('DOMContentLoaded', () => {
	const modifyForm = document.querySelector('form#modifyForm');
	
	const btnCencle = document.querySelector('button#btnCencle');
	btnCencle.addEventListener('click', (e) => {
		const check = confirm('수정을 취소하시겠습니까?');
		if(check) {
			modifyForm.action = './paymentmain';
			modifyForm.method = 'post';
			modifyForm.submit ();
		}
	});
	
	// 배송지 수정페이지의 배송지 수정완료 버튼
	const btnUpdate = document.querySelector('button#btnUpdate');
	btnUpdate.addEventListener('click', () => {
		const userNickname = document.querySelector('textarea#userNickname').value;
		const uesrAddress = document.querySelector('textarea#userAddress').value;
		const userPhone = document.querySelector('textarea#userPhone').value;
		const userEmail = document.querySelector('textarea#userEmail').value;
		
		if (userNickname === '' || uesrAddress === '' || userPhone === '' || userEmail === '') {
			alert('배송지 정보를 모두 입력하세요');
			return;
		}
		console.log(userPhone);
		const check = confirm('변경하신 배송지로 배송받으시겠습니까?');
		if(check) {
			modifyForm.action = './updateDeliveryInfo';
			modifyForm.method = 'post';
			modifyForm.submit();
		}
	});
});