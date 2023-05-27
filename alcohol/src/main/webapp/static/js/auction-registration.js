/**
 * auction-registration.js
 * registration.jsp의 기능들을 담당하는 js
 * 내 상품 찾기 버튼을 누르면 상품정보를 찾아와 상품테이블에 그려준다.
 * 
 */

 document.addEventListener('DOMContentLoaded', function() {
     	const pNameQuery = document.querySelector('input#pname');
     	const brandname = document.querySelector('input#brandname');
     	const constructor = document.querySelector('input#constructor');
     	const category = document.querySelector('input#category');
     // const idValue = document.querySelector('input#id').value;
     // 실제로는 아이디값 받기 현재는 로그인 기능 없으니
     	const id = 'test';
     
     const btnProductSearch = document.querySelector('button#btnProductSearch');
     
     
     const getProductswithId = async () => {
		 const pname = pNameQuery.value;
		 const userid = id;
		 
		 
         const reqUrl = `/alcohol/api/auction/product/${userid}`;
         
         const data = {
			 
			 "userid" : userid,
			 "pname" : pname
			 
		 };
		 console.log(reqUrl);
		 console.log(data);
		 
		 try{
			 
			 const response = await axios.post(reqUrl, data);
			 console.log(response);
			 makeProductList(response.data);
			 
		 } catch(error){
			 console.log(error);
		 }
         
     };
     
     const categoryselect = (number) => {
		
		if(number==1){ category.value='탁주' };
		if(number==2){ category.value='약주' };
		if(number==3){ category.value='청주' };
		if(number==4){ category.value='맥주' };
		if(number==5){ category.value='과실주' };
		if(number==6){ category.value='소주' };
		if(number==7){ category.value='위스키' };
		if(number==8){ category.value='브랜디' };
		if(number==9){ category.value='증류주' };
		if(number==10){ category.value='리큐르' };
		if(number==11){ category.value='주정' };
		if(number==12){ category.value='기타주류' };
		 
	 };
     
     const makeProductList = (data) => {
		 
		 const tbody = document.querySelector('tbody#productTboby');
		 tbody.innerHTML = '';
		 if(data.length==0){
			 alert('검색된 결과가 없습니다');
			 return;
		 }
		 
		 
		 
		 let htmlstr = '';
		 
		 
		 
		 for(let x of data) {
			 
			 
			 
			 if(data.length==1){
			 	pNameQuery.value= `${x.pname}`;
			 	brandname.value = `${x.brandName}`;
			 	constructor.value = `${x.constructor}`;
			 	categoryselect(`${x.category}`);
			 	
		 	 }
		 	 categoryselect(`${x.category}`);
			 htmlstr += 
			 `<tr>
			 	<td class="d-none">${x.productid}</td>
			 	<td>${x.pname}</td>
			 	<td>${x.constructor}</td>
			 	<td>${x.brandName}</td>
			 	<td>${category.value}</td>
			 	<td>${x.cost}</td>
			 </tr>`
			 
		 }
		 
		 tbody.innerHTML = htmlstr;
		 
	 }
     
     btnProductSearch.addEventListener('click', (e) => {
		 e.preventDefault();
	
		 
		 
		 getProductswithId();
		 
	 });
     
 });
 