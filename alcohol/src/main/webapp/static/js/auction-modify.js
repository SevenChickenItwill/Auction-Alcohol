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
     	
     	const productid = document.querySelector('input#productId');
     	const auctionName = document.querySelector('input#auctionName');
     	const auctionEnd = document.querySelector('input#auctionEnd');
     	const auctionStart = document.querySelector('input#auctionStart');
     	console.log(productid);
     	const formst = document.querySelector('form#forms');
     	const btnupdates = document.querySelector('button#btnupdates');
     	const id = document.querySelector('input#userid').value;
     	
     	function eventcatch(){
			 alert('입력되지 않은 내용이 존재합니다.');
			 
		 }
     	
     	btnupdates.addEventListener('click',(e)=>{
			 
			e.preventDefault();
			console.log('정상작동');
			if(auctionEnd.value==""){
				console.log(auctionEnd.value);
				eventcatch();
				return;
			} else if(auctionStart.value==""){
				console.log(auctionStart.value);
				eventcatch();
				return;
			} else if(auctionName.value==""){
				console.log(auctionName);
				eventcatch();
				return;
			} else if(productid.value==""){
				console.log(productid.value);
				eventcatch();
				return;
			}
			
			let startdate = new Date(auctionStart.value);
			let enddate = new Date(auctionEnd.value);
			let nowdate = new Date();
			
			if(startdate.getTime()>enddate.getTime() || nowdate.getTime()>startdate.getTime() || nowdate.getTime() > enddate.getTime()){
				alert('날짜가 현재보다 이전이거나, 시작일과 종료일이 알맞지 않습니다');
				return;
			}
			
			formst.method='post';
			formst.action='/alcohol/auction/update';
			formst.submit(); 
		 });
     
     
     const btnsearch = document.querySelector('button#btnsearch');
     
     function makeProduct(data){
			
			pNameQuery.value= '';
			brandname.value = '';
			constructor.value = '';
			category.value='';
			productid.value='';
			
			pNameQuery.value= `${data.pname}`;
			brandname.value = `${data.brandname}`;
			constructor.value = `${data.constructor}`;
			category.value = categoryselect(`${data.category}`);
			productid.value = `${data.productid}`;
	 }
     
     const getProductInfo = async (selname,selproductid) => {	
		const userid = id;
		const reqUrl = `/alcohol/api/auction/info/${userid}`;
		const selectPnamevalue = selname.getAttribute("value");
		const selectpidvalue = selproductid.getAttribute("value");
		const data = {
			
			"userid" : userid,
			"pname" : selectPnamevalue,
			"productid" : selectpidvalue
			
		} 
		
		try{
			const response = await axios.post(reqUrl,data);
			console.log(data);
			makeProduct(response.data);
			
		} catch(error){
			console.log(error);
		}
		 
	 };
     
     const getProductswithId = async () => {
		 const pname = pNameQuery.value;
		 const userid = id;
		 
		 
         const reqUrl = `/alcohol/api/auction/product/${userid}`;
         
         const data = {
			 
			 "userid" : userid,
			 "pname" : pname,
			 "productid" : 0
			 
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
		
		if(number==1){ return '탁주' };
		if(number==2){ return '약주' };
		if(number==3){ return '청주' };
		if(number==4){ return '맥주' };
		if(number==5){ return '과실주' };
		if(number==6){ return '소주' };
		if(number==7){ return '위스키' };
		if(number==8){ return '브랜디' };
		if(number==9){ return '증류주' };
		if(number==10){ return '리큐르' };
		if(number==11){ return '주정' };
		if(number==12){ return '기타주류' };
		 
	 };
     
     const makeProductList = (data) => {
		 
		 pNameQuery.value= '';
			 	brandname.value = '';
			 	constructor.value = '';
			 	category.value='';
		 
		 const tbody = document.querySelector('tbody#productTboby');
		 tbody.innerHTML = '';
		 if(data.length==0){
			 alert('검색된 결과가 없습니다');
			 
			 return;
		 }
		 
		 
		 
		 let htmlstr = '';
		 
		 let index = 0;
		 
		 for(let x of data) {
			 
			 
		     
			 if(data.length==1){
			 	pNameQuery.value= `${x.pname}`;
			 	brandname.value = `${x.brandName}`;
			 	constructor.value = `${x.constructor}`;
			 	category.value = categoryselect(`${x.category}`);
			 	productid.value = `${x.productId}`;
			 	
		 	 } else{
				  
				pNameQuery.value= '';
			 	brandname.value = '';
			 	constructor.value = '';
			 	category.value='';
				productid.value='';
			  }
		 	 
			 htmlstr += 
			 `<tr>
			 	<td id="productid${index}" indexRow="${index}" value="${x.productId}" class="d-none">${x.productId}</td>
			 	<td><button id="btn${index}" class="btnSelect btn" indexRow="${index}" >선택</button></td>
			 	<td indexRow="${index}" value="${x.pname}" id="pname${index}">${x.pname}</td>
			 	<td indexRow="${index}" id="constructor${index}">${x.constructor}</td>
			 	<td indexRow="${index}" id="brandName${index}">${x.brandName}</td>
			 	<td indexRow="${index}" id="category${index}">${categoryselect(`${x.category}`)}</td>
			 	<td indexRow="${index}" id="cost${index}">${x.cost}</td>
			 </tr>`
			 index = index+1;
		 }
		 
		 tbody.innerHTML = htmlstr;
		 
		 const btnselectProdcut = document.querySelectorAll('button.btnSelect');
		 
		 for(let btnselect of btnselectProdcut){
				 
			btnselect.addEventListener('click',()=>{
				
				const ind = btnselect.getAttribute("indexRow");
				console.log(ind);
			 	const selectname = document.querySelector(`td#pname${ind}`);
			 	const selectproductid = document.querySelector(`td#productid${ind}`);
			 	console.log(selectname);
			 	console.log(selectproductid);
			 	getProductInfo(selectname,selectproductid);
			 
		 	});
			 
		 }
		 
		 
	 }
     
     btnsearch.addEventListener('click', (e) => {
		 e.preventDefault();
		
		
		 console.log('정상작동');
		 
		 getProductswithId();
		 
	 });
	 
	 
     
 });
 