/**
 * 
 */

 document.addEventListener('DOMContentLoaded',()=>{
	 
	 const form = document.querySelector('form#imginsert');
	 const imgupload = document.querySelector('button#imgupload');
	 const imgshow = document.querySelector('div#imgshow');
	 const productid = document.querySelector('input#productid').value;
	 
	 
	 
	 imgupload.addEventListener('click',async (e)=>{
		 // 폼데이터 객체 생성
		 e.preventDefault();
		 
		 let formData = new FormData();
		 const image = document.querySelector('input#image');
		 // Form 데이터에 객체 추가
		 
		 
		 let filePath = image.value;
         const allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
		 
		 if(!allowedExtensions.exec(filePath)){
			 alert('이미지 파일만 업로드가 가능합니다.');
			 image.value='';
			 return;
		 }
		 formData.append('file',image.files[0]);
		 let reqUrl = `/alcohol/api/auction/upload/${productid}`;
		 
		 try{
			 let response = await axios.post(reqUrl,formData,{
				 headers: {
					 'Content-Type' : 'multipart/form-data'
				 }
			 });
			 const data = response.data;
			 console.log(data);
			 const name = data;
			 console.log(name);
			 
			
			 
			 
			 imgshow.innerHTML = `<img src="data:image/jpeg;base64,${name}" />`;
		 } catch(error){
			 console.log(error);
		 }
		 
	 })
	 
 })