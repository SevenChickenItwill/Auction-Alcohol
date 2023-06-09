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
		const order_name = document.querySelector('textarea#order_name').value;
		const order_adress = document.querySelector('textarea#order_adress').value;
		const order_phone = document.querySelector('textarea#order_phone').value;
		const order_email = document.querySelector('textarea#order_email').value;
		
		if (order_name === '' || order_adress === '' || order_phone === '' || order_email === '') {
			alert('배송지 정보를 모두 입력하세요');
			return;
		}
		console.log(order_phone);
		const check = confirm('변경하신 배송지로 배송받으시겠습니까?');
		if(check) {
			modifyForm.action = './paymentmain';
			modifyForm.method = 'post';
			modifyForm.submit();
		}
	});
});