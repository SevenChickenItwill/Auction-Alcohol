/**
 * auction-registration.js
 * registration.jsp의 기능들을 담당하는 js
 * 내 상품 찾기 버튼을 누르면 상품정보를 찾아와 상품테이블에 그려준다.
 * 
 */

 document.addEventListener('DOMContentLoaded', function() {
     	const pNameQuery = document.querySelector('input#pname');
     	
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
			 	
		 	 }
			 htmlstr += 
			 `<tr>
			 	<td class="d-none">${x.productid}</td>
			 	<td>${x.pname}</td>
			 	<td>${x.constructor}</td>
			 	<td>${x.brandname}</td>
			 	<td>${x.category}</td>
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
 