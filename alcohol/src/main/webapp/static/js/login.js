/**
 * loginNew.jsp
 */

 document.addEventListener('DOMContentLoaded',()=>{
	 
	 const btnsubmit = document.querySelector('button#btnSubmit');
	 const btnsignUp = document.querySelector('button#btnSignUp');
	 const form = document.querySelector('form#loginform');
	 const userEmail = document.querySelector('input#userEmail');
	 const userPassword = document.querySelector('input#userPassword');
	 
	 btnsubmit.addEventListener('click', async ()=>{
		
		let reqUrl = `/alcohol/api/login/check`;
		let data = {
			
			userEmail : userEmail.value,
			userPassword : userPassword.value
			
		}
		
		try{
			const response = await axios.post(reqUrl,data);
			console.log(response.data);
			
			let result = response.data;
			console.log("여기");
			if(result == 1){
				
				form.action = '/alcohol/account/login';
				form.method = 'post';
				form.submit();
				
			} else{
				
				alert('일치하는 계정이 없습니다. 비밀번호, 아이디를 확인해주세요.');
				return;
				
			}
			
		}catch(error){
			console.log(error);
		}
		
		 
	 });
	 
	 /*
	 btnsignUp.addEventListener('click',()=>{
		 
		 // 회원가입 연결.
		 
	 });
	 */
	 
	 
 })