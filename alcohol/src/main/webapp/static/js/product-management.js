/**
 * product-management.js
 * 상품 수정 삭제 자바스크립트
 */

 document.addEventListener('DOMContentLoaded', () => {
	 const detailform = document.querySelector('form#detailform');
	 const btndelete = document.querySelector('button#btndelete');
	 
	 btndelete.addEventListener('click', () => {
		 const check = confirm('정말 삭제할까요?');
		 console.log(check);
		 if (check) {
			 detailform.action = './productdelete';
			 detailform.method = 'post';
			 detailform.submit();
		 }
	 });
 });