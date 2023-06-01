/**
 * auction-management.js
 * auction.jsp에서 사용하는 js파일
 * 
 * 기능
 * - 경매목록 검색
 * - 경매등록
 */

document.addEventListener('DOMContentLoaded', function() {
	const auctionSearch = document.querySelector('input#auctionSearch');
	const auctiondetailSearch = document.querySelector('input#searchtext2');
	const btnAuctionDetailSearch = document.querySelector('button#btnDetailSearch')
	const btnAuctionSearch = document.querySelector('button#btnAuctionSearch');
	const searchForm = document.querySelector('form#searchForm');
	const startdate = document.querySelector('input#auctionstart');
	const enddate = document.querySelector('input#auctionend');
	const minimum = document.querySelector('input#minimum');
	const maximum = document.querySelector('input#maximum');
	const category = document.querySelector('select#category');
	const status = document.querySelector('select#status');
	const textoption = document.querySelector('select#textoption');
	const modal = new bootstrap.Modal('div#modals',{backdrop: false});
	let nowdate = new Date();
	let previousDate = new Date();
	previousDate.setDate(nowdate.getDate() - 30);
	let nextDate = new Date();
	nextDate.setDate(nowdate.getDate() + 30);

	startdate.valueAsDate = previousDate;
	enddate.valueAsDate = nextDate;
	
	btnAuctionDetailSearch.addEventListener('click', async () => {

		let stdtvalue = startdate.value;
		let endvalue = enddate.value;
		let textvalue = auctiondetailSearch.value;
		let minvalue = minimum.value;
		let maxvalue = maximum.value;
		let catevalue = category.value;
		let stvalue = status.value;
		let tovalue = textoption.value;
		let userid = "test";

		const reqUrl = `/alcohol/api/auction/detail/${userid}`;
		const data = {

			userid: userid,
			searchtext2: textvalue,
			auctionstart: stdtvalue,
			auctionend: endvalue,
			category: catevalue,
			status: stvalue,
			textoption: tovalue,
			minimum: minvalue,
			maximum: maxvalue

		}

		try {

			let response = await axios.post(reqUrl, data);
			console.log(response);
			makeDetailList(response.data);
			modal.show();
		} catch (error) {
			console.log(error);

		} finally{
			modal.hide();
		}

	});

	function makeDetailList(list) {
		let responsetable = document.querySelector('tbody#responsetable');
		let strhtml = '';
		for (let x of list) {

			strhtml +=
				`<tr>
			 	<td class="d-none">${list.aid}</td>
								<td><c:url var="detail" value="/auction/detail">
										<c:param name="aid" value="${list.aid}"></c:param>
									</c:url> <a href="${detail}">${list.auctionName}</a></td>
								<td>${list.pname}</td>
								<td>${list.passbid}</td>
								<td>${list.nowbid}</td>
								<td>${list.bidcount}</td>
								<td>${list.successbid}</td>
								<td>${list.auctionStart}</td>
								<td>${list.auctionEnd}</td>
			 </tr>`
			 


		}
		responsetable.innerHTML = strhtml;
		

	}


});