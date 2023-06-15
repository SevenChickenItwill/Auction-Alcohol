/**
 * 
 */

 document.addEventListener('DOMContentLoaded',()=>{
	 
	 const btnsearch = document.querySelector('input#btnsearch');
	 const userid = document.querySelector('input#userid');
	 const tbodys = document.querySelector('tbody#tbodys');
	 const searchtext = document.querySelector('input#searchtext');
	 const searchoption = document.querySelector('select#searchoption');
	 
	 btnsearch.addEventListener('click', async ()=>{
		 
		 const option = searchoption.value;
		 
		 console.log("search : " + searchtext.value);
		 
		 
		 
		 const reqUrl = '/alcohol/api/shop/serach';
		 const data = {
			 
			 userid : userid,
			 search : searchtext.value,
			 option : option
		 }
		 
		 try{
			let response = axios.post(reqUrl,data);
			let list = response.data;
			makeNewList(list);
			console.log("검색완료");
			
				 
		 } catch(error){
			 console.log(error);
		 }
		 
		 
		 
	 })
	 
	 function categoryname(number){
		 
		 if(number=='1'){ return '탁주' };
		if(number=='2'){ return '약주' };
		if(number=='3'){ return '청주' };
		if(number=='4'){ return '맥주' };
		if(number=='5'){ return '과실주' };
		if(number=='6'){ return '소주' };
		if(number=='7'){ return '위스키' };
		if(number=='8'){ return '브랜디' };
		if(number=='9'){ return '증류주' };
		if(number=='10'){ return '리큐르' };
		if(number=='11'){ return '주정' };
		if(number=='12'){ return '기타주류' };
		 
	 }
	 
	 function makeNewList(data){
		 tbodys.innerHTML='';
		 let html = '';
		 for(list of data){
			 html = '';
			 categorys = categoryname(list.category);
			 html = `
			 <tr>
			 	<td>${ list.pid }</td>
						<td>${ list.productname }</td>
						<td>${ list.standard }</td>
						<td>${ list.unit }</td>
						<td>${ list.price }</td>
						<td>${ list.brand }</td>
						<td>${ list.userid }</td>
						<td>${ list.expirationdate }</td>
						<td>${ list.alcohol_level }</td>
						<td>${ list.hashtag }</td>
						<td>${ categorys }</td>
						<td><img src = "data:image/jpeg;base64,${ list.photopath }" /></td>
			 </tr>
			 
			 `;
			 tbodys.innerHTML +=html;
		 }
		 
	 }
	 
 })