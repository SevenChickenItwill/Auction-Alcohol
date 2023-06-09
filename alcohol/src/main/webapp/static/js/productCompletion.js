/**
 * 
 */

document.addEventListener('DOMContentLoaded', () => {
	
	const btnPaymentDetail = document.querySelector('button#btnPaymentDetail');
	const btnMainPage = document.querySelector('button#btnMainPage');
	const paymentForm = document.querySelector('#paymentForm');
	
	btnPaymentDetail.addEventListener('click', () => {
	window.location.href = 'http://localhost:8081/alcohol/payment/detail';
	
	});
	
	btnMainPage.addEventListener('click', () => {
		
	//  TODO: 메인페이지가 생성된 후 작성	window.location.href ="";
	}); 
});