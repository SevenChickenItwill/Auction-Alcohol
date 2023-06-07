/**
 * 
 */
document.addEventListener('DOMContentLoaded', () => {
 
 const userAccountForm = document.querySelector('#userAccountForm');
 const btnAccountPassword = document.querySelector('button#btnAccountPassword');
 btnAccountPassword.addEventListener('click', () => {
	 
	 userAccountForm.action = './userPasswordModify';
	 userAccountForm.method = 'post';
	 userAccountForm.submit();
	 
	 
 });
 
 const btnAccountPhone = document.querySelector('button#btnAccountPhone');
  btnAccountPhone.addEventListener('click', () => {
	  
	  
  });
	
	
	

});