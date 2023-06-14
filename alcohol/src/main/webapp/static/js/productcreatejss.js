/**
 * img 업로드 및 무결성 검사 위한 js
 */

 document.addEventListener('DOMContentLoaded',()=>{
	 
	 const btnsubmit = document.querySelector('input#btnsubmit');
	 const pNameTag = document.querySelector('input#pName');
	 const brandNameTag = document.querySelector('input#brandName');
	 const constructorTag = document.querySelector('input#constructor');
	 const costTag = document.querySelector('input#cost');
	 
	 const categoryTag = document.querySelector('select#category')
	 const form = document.querySelector('form#subform');
	 
	
	 
	 
	 let imguploadok = 0;
	 btnsubmit.addEventListener('click',(e)=>{
		 
		 e.preventDefault();
		 
		 let constructor = constructorTag.value;
		 let brandname = brandNameTag.value;
		 
		 console.log(brandname);
		 let cost = costTag.value;
		 let pName = pNameTag.value;
		 let category = categoryTag.value;
		 if(pName=='' || brandname=='' || constructor=='' ||
		 cost == '' || imguploadok==1){
			 alert('모든 항목은 필수 항목입니다. 반드시 모두 입력해주세요.');
			 return;
		 }
		 
		 
		 let reqUrl = '/alcohol/auction/createsuccess';
		 
		 
		 
		 form.action = reqUrl;
		 form.method = 'post';
		 form.submit();
		 
	 })
	 
	 
	 
	 
 })