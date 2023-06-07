/**
 * 
 */
document.addEventListener('DOMContentLoaded', () => {
	const btnCancel = document.querySelector('button#btnCancel');
	const userAccountModifyForm =document.querySelector('#userAccountModifyForm');
	btnCancel.addEventListener('click', () => {
		const check = confirm('수정을 취소할까요?');
		if (check) {
			userAccountModifyForm.action = './userModify';
			userAccountModifyForm.metbod = 'get';
			userAccountModifyForm.submit();
		}
		
	});
	
	const btnPasswordUpdate = document.querySelector('button#btnPasswordUpdate');
	btnPasswordUpdate.addEventListener('click', () => {
		
		const check = confirm('수정할까요?');
		if (check) {
			userAccountModifyForm.action = './userModify';
			userAccountModifyForm.method = 'post';
			userAccountModifyForm.sudmit();
		}
	});
	
});