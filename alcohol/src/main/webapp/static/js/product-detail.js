/**
 * produvt-detail.js
 * pddetail.jsp 이벤트 처리
 */

document.addEventListener('DOMContentLoaded', () => {

	const toBasket = document.querySelector('button#toBasket');
	const inputProductid = document.querySelector('input#productid');
	const inputPrice = document.querySelector('input#price');
	const inputQuantity = document.querySelector('input#quantity');



	const sendToBasket = (e) => {
		e.preventDefault();
		
		console.log(e.target);
		
		const productid = inputProductid.value;
		const price = inputPrice.value;
		const quantity = inputQuantity.value;
		
		var a = 1;
		
		if (quantity < a || quantity === '') {
			alert('수량은 1이상으로 선택이 가능합니다');
			return;
		}

		if (!confirm('정말 장바구니에 추가할까요?')) {
			return;
		}

		const reqUrl = `/alcohol/api/shop/pddetails/productid=${productid}/price=${price}/quantity=${quantity}`
		
		axios.post(reqUrl)
			.then((response) => {
				alert(`장바구니 추가 성공(${response.data})`);

			})
			.catch((error) => {
				console.log(error);
			});
	};

	toBasket.addEventListener('click', sendToBasket);

});

