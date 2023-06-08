/**
 * 
 */

 document.addEventListener('DOMContentLoaded',()=>{
	 
	 const imgread = document.querySelector('button#imgread');
	 const productid = document.querySelector('input#productid');
	 const imgcol = document.querySelector('div#imgcol');
	 imgread.addEventListener('click',async ()=>{
		 
		 const reqUrl = '/alcohol/api/auction/readImage';
		 productval = parseInt(productid.value);
		 const data = {
			 
			 productid : productval
			 
		 }
		 console.log(data);
		 try{
			 
			 let response = await axios.post(reqUrl,data);
			 let root = response.data;
			 console.log(response);
			 imgcol.innerHTML = '';
			 imgcol.innerHTML = `<img src=/static/image/chart.jpg />`;
			 
		 }catch(error){
			 
			 console.log(error);
			 
		 }
		 
	 })
	 
 })