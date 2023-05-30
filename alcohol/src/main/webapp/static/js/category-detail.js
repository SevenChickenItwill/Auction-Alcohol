/**
 * AuctionDetail
 * 
 * 상세내용 불러올 때 숫자값으로 등록된 값 문자값으로 치환
 */

 
 document.addEventListener('DOMContentLoaded',()=>{
	 
	 const category = document.querySelector('input#category');
	 const number = category.value;
	 const status = document.querySelector('input#status');
	 
	 console.log(number);
	 
	 if(number=='1'){ category.value= '탁주' };
		if(number=='2'){ category.value= '약주' };
		if(number=='3'){ category.value= '청주' };
		if(number=='4'){ category.value= '맥주' };
		if(number=='5'){ category.value= '과실주' };
		if(number=='6'){ category.value= '소주' };
		if(number=='7'){ category.value= '위스키' };
		if(number=='8'){ category.value= '브랜디' };
		if(number=='9'){ category.value= '증류주' };
		if(number=='10'){ category.value= '리큐르' };
		if(number=='11'){ category.value= '주정' };
		if(number=='12'){ category.value= '기타주류' };
	 
	
 })/**
 * 
 */