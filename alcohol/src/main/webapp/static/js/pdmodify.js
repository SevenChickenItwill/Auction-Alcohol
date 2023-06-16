/**
 * 
 */

 document.addEventListener('DOMContentLoaded',()=>{
	 
	 const pidinput = document.querySelector('input#pid');
	 const productnameinput = document.querySelector('input#productname');
	 const standardinput = document.querySelector('input#standard');
	 const unitinput = document.querySelector('input#unit');
	 const priceinput = document.querySelector('input#price');
	 const brandinput = document.querySelector('input#brand');
	 const expirationdateinput = document.querySelector('input#expirationdate');
	 const alcohollevelinput = document.querySelector('input#alcohol_level');
	 const hashtaginput = document.querySelector('input#hashtag');
	 const categoryselect = document.querySelector('select#category');
	 const photopathinput = document.querySelector('input#photopath');
	 const btnmodify = document.querySelector('button#btnmodify');
	 const userid = document.querySelector('input#userid').value;
	 const modifyform = document.querySelector('form#modifyform');
	 const imgpreview = document.querySelector('div#imgpreview');
	 const btndelete = document.querySelector('button#btndelete');
	 const categorynum = document.querySelector('input#categorynum');
	 let catesel = parseInt(categorynum.value); 
	 categoryselect.selectedIndex = catesel - 1;
	 
	 // 이미지 업로드 관련
	 const btnimg = document.querySelector('button#imgupload');
	 const imgform = document.querySelector('form#imginsert');
	 
	 // 화면 열리면 이미지 자동갱신
	
	 refreshimg = async () => {
	 let reqUrl2= `/alcohol/api/shop/loadimg`;
			 data = {
				 
				 name : photopathinput.value
				 
			 } 
			 
		try {		 
	 		let response2 = await axios.post(reqUrl2,data);
	 		let imgname = response2.data;
	 		imgpreview.innerHTML = `<img src="data:image/jpeg;base64,${imgname}" />`;
	 	} catch(error){
		 console.log(error);
		 
	 	}
	 }
	 
	 refreshimg();
	 
	 btnimg.addEventListener('click',async (e)=>{
		 
		 e.preventDefault();
		 
		 let formData = new FormData();
		 const image = document.querySelector('input#image');
		 // Form 데이터에 객체 추가
		 
		 
		 let photopath = image.value;
         const allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
		 
		 if(!allowedExtensions.exec(photopath)){
			 alert('이미지 파일만 업로드가 가능합니다.');
			 image.value='';
			 return;
		 }
		 formData.append('file',image.files[0]);
		 let reqUrl = `/alcohol/api/shop/upload`;
		 
		 try{
			 let response = await axios.post(reqUrl,formData,{
				 headers: {
					 'Content-Type' : 'multipart/form-data'
				 }
			 });
			 let data = response.data;
			 console.log(data);
			 const name = data;
			 console.log(name);
			 
			 photopathinput.value = name;
			 
			 let reqUrl2= `/alcohol/api/shop/loadimg`;
			 data = {
				 
				 name : name
				 
			 } 
			 
			 let response2 = await axios.post(reqUrl2,data);
			 let imgname = response2.data;
			 
			 imgpreview.innerHTML = `<img src="data:image/jpeg;base64,${imgname}" />`;
		 } catch(error){
			 console.log(error);
		 }
		 
		 
	 })
	 
	 btndelete.addEventListener('click',(e)=>{
		 
		 e.preventDefault();
		 
		 let result = confirm('정말로 삭제하시겠습니까?')
		 if(!result){
			 return;
		 }
		 
		 let pid = pidinput.value;
		 
		 modifyform.action = `/alcohol/shop/delete?pid=${pid}`;
		 modifyform.method = 'get';
		 modifyform.submit();
		 
	 })
	 
	 btnmodify.addEventListener('click',(e)=>{
		 
		 e.preventDefault();
		 let pid = pidinput.value;
		 let productname = productnameinput.value;
		 let standard = standardinput.value;
		 let unit = unitinput.value;
		 let price = priceinput.value;
		 let brand = brandinput.value;
		 let expirationdate = expirationdateinput.value;
		 let alcohol_level = alcohollevelinput.value;
		 let hashtag = hashtaginput.value;
		 let category = categoryselect.value;
		 let photopath = photopathinput.value;
		 
		 if(alcohol_level>=100){
			 
			 alert('도수를 잘못 입력하셨습니다.');
			 alcohollevelinput.value='';
		 }
		 
		 if(photopath==''){
			 
			 alert('사진을 업로드하지 않아 기본 사진으로 업로드됩니다');
			 photopath='C:\imgs\defaultimg.jpg'
			 
		 }
		 
		 modifyform.method = 'post';
		 modifyform.action = '/alcohol/shop/pdmodify';
		 modifyform.submit();
		 
		 
		 
	 })
	 
 })