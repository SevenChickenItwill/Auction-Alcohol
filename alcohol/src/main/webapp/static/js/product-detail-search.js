/**
 * product-detail-search.js
 * productmanage.jsp 파일의 span#btninit 버튼의 초기화 기능
 */
document.addEventListener('DOMContentLoaded', () => {
	const userid1 = document.querySelector('input#userid');
	const productname1 = document.querySelector('input#productname');
	const constructor1 = document.querySelector('input#constructor');
	const brandname1 = document.querySelector('input#brandname');
	const category1 = document.querySelector('select#category');

	const btninit = document.querySelector('span#btninit');
	const btnsearch = document.querySelector('span#btnsearch');

	// 초기화 버튼
	btninit.addEventListener('click', () => {
		productname1.value = '';
		constructor1.value = '';
		brandname1.value = '';
		category1.value = 50;
	});

	// 검색된 리스트 테이블에 그려주기
	const makeTableSearchResult = (data) => {
	const productList = document.querySelector('tbody#productList');
		productList.innerHTML = '';

		let htmlStr = '';
		for (let product of data) {
			let categoryStr = '';
			switch(product.category) {
					case 1:
						categoryStr = '탁주';
						break;
					case 2:
						categoryStr = '약주';
						break;
					case 3:
						categoryStr = '청주';
						break;
					case 4:
						categoryStr = '맥주';
						break;
					case 5:
						categoryStr = '과실주';
						break;
					case 6:
						categoryStr = '소주';
						break;
					case 7:
						categoryStr = '위스키';
						break;
					case 8:
						categoryStr = '브랜디';
						break;
					case 9:
						categoryStr = '증류주';
						break;
					case 10:
						categoryStr = '리큐르';
						break;
					case 11:
						categoryStr = '주정';
						break;
					case 12:
						categoryStr = '기타주류';
						break;						
				}
			htmlStr += `
			<tr>
				<td class="d-none">${product.userid}</td>
				<td class="d-none" id="productid">${product.productid}</td>
				<td>
					<a href="/alcohol/auction/productdetail?productid=${product.productid}">
						${product.pname}
					</a>
				</td>
				<td>${product.constructor}</td>
				<td>${product.brandname}</td>
				<td>${categoryStr}</td>
				<td>${product.cost}</td>
			</tr>
			`;
		}
			productList.innerHTML = htmlStr;
	};

	// 상세검색 버튼
	btnsearch.addEventListener('click', () => {
		console.log('btnsearch');
		const userid = userid1.value;
		const pname = productname1.value;
		const constructor = constructor1.value;
		const brandname = brandname1.value;
		const category = category1.value;
		
		console.log(pname);
		console.log(constructor);
		console.log(brandname);
		console.log(category);

		const data = {
			userid,
			pname,
			constructor,
			brandname,
			category
		};
		

		axios.post('/alcohol/api/product/detailsearch', data)
			.then(response => {
				console.log(response.data);
				makeTableSearchResult(response.data);
			})
			.catch(error => {
				console.log(error);
			});
	});














});