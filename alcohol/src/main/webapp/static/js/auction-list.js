/**
 * auctionlist js
 */

 document.addEventListener('DOMContentLoaded',()=>{
	 const btnrefresh = document.querySelector('input#status');
	 const listmain = document.querySelector('div#listmain'); 
	 const makeNewList = (data) => {
		 let result = '';
		 for(let list of data){
			 let viewauction = `/alcohol/auction/mainsite?aid=${list.aid}&auctionName=${list.auctionName}`;
			 
			 let start = new Date(list.auctionStart);
			 let end = new Date(list.auctionEnd);
			 
			 start = start.toLocaleString();
			 end = end.toLocaleString();
			 
			 let html = `
						<a style=" color:black; text-decoration: none;" href="${ viewauction }">
						<div class="col">
							<div class="card shadow-sm">
								<p class="my-1 mx-2">${ list.auctionName }</p>
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

								<div class="card-body">
									<p class="d-none">${ list.aid }</p>
									<p>상품명: ${ list.pname }</p>
									<p>브랜드: ${ list.brandname }</p>
									<p>즉시낙찰가: ${ list.passbid }</p>
									<p>현재입찰가: ${ list.nowbid }</p>
									<p>입찰자: ${ list.bidder }</p>
									<p>입찰횟수: ${ list.bidcount }</p>
									<p>경매시작일: ${ start }</p>
									<p>경매종료일: ${ end }</p>
								</div>
							</div>
						</div>
						</a>`;
			 
			 result += html;
			 
			 
		 }
		 listmain.innerHTML = result;
		 
	 }
	 
	 console.log('페이지 갱신 작업 시작');
		 let status = btnrefresh.value;
		 status = parseInt(status);
		 setInterval(()=>{
		 
	 		console.log(status);
		 reqUrl=`/alcohol/api/auction/refresh/${status}`;
		 axios.get(reqUrl)
		 .then(response=>{
			 console.log(response.data);
			 listmain.innerHTML='';
			 makeNewList(response.data);
			 
		 })
		 .catch(error=>{
			 console.log(error);
		 });
		 
	 },2000);
		 
	 
	 
	 
	 
	 
 })