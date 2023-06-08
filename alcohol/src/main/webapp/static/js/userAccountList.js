/**
 * 
 */
document.addEventListener('DOMContentLoaded', () => {
 
 const accountPasswordForm = document.querySelector('#accountPasswordForm');
 const btnAccountPassword = document.querySelector('button#btnAccountPassword');
 btnAccountPassword.addEventListener('click', () => {
	 
	 accountPasswordForm.action = './userPasswordModify';
	 accountPasswordForm.method = 'post';
	 accountPasswordForm.submit();
	 
	 
 });
 
 const btnAccountPhone = document.querySelector('button#btnAccountPhone');
  btnAccountPhone.addEventListener('click', () => {
	  
	  
	  accountPasswordForm.action = './userPhoneModify';
	  accountPasswordForm.mothod = 'post';
	  accountPasswordForm.submit();
	  
  });
	
	
	

});