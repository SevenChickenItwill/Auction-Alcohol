/**
 * auction delete 관련
 */

 
document.addEventListener('DOMContentLoaded',()=>{
	
	const btndelete = document.querySelector('button#btndelete');
	const form = document.querySelector('form#forms');
	console.log(aid);
	
	btndelete.addEventListener('click',(e)=>{
		e.preventDefault();
		console.log('인식체크');
		const aid = btndelete.getAttribute('data-v')
		const reqUrl = '/alcohol/auction/delete';
		const result = confirm('정말 삭제하시겠습니까?');
		if(result){
			
			alert('삭제가 완료되었습니다');
			form.action = 'delete';
			form.method = 'get';
			
			form.submit();
			
		}
		
	});
	
})