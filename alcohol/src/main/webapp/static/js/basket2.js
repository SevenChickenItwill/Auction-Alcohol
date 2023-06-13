document.addEventListener('DOMContentLoaded', () => {
	// 체크박스 전체 선택 총액 변경
	const allCheckbox = document.querySelector('input#allCheckbox');

	allCheckbox.addEventListener('click', () => {
		const checkboxes = document.querySelectorAll('input[name="checkbox"]');
		let totalAmount = 0;

		checkboxes.forEach((checkbox) => {
			checkbox.checked = allCheckbox.checked;

			if (checkbox.checked) {
				const id = checkbox.getAttribute('data-id');
				const orderAmount = document.querySelector(`span#orderAmount-${id}`).getAttribute('data-value');
				totalAmount += Number(orderAmount);
			}
		});

		const labelTotalAmount = document.querySelector('label#totalAmount');
		labelTotalAmount.setAttribute('data-totalAmount', totalAmount);
		labelTotalAmount.innerHTML = totalAmount + '원';
	});

	// 개별 체크박스 선택 시 총액 변경
	const checkboxes = document.querySelectorAll('input[name="checkbox"]');
	checkboxes.forEach((checkbox) => {
		checkbox.addEventListener('click', () => {
			const totalAmount = document.querySelector('label#totalAmount');
			let getTotalAmount = 0;

			checkboxes.forEach((checkbox) => {
				if (checkbox.checked) {
					const id = checkbox.getAttribute('data-id');
					const orderAmount = document.querySelector(`span#orderAmount-${id}`).getAttribute('data-value');
					getTotalAmount += Number(orderAmount);
				}
			});

			totalAmount.setAttribute('data-totalAmount', getTotalAmount);
			totalAmount.innerHTML = getTotalAmount + '원';
		});
	});

	// 수량을 변경하면 주문금액과 총 주문금액을 변경한다.
	const inputQuantities = document.querySelectorAll('input[name="inputQuantity"]');
	inputQuantities.forEach((inputQuantity) => {
		inputQuantity.addEventListener('input', () => {
			const id = inputQuantity.getAttribute('data-id');
			const price = document.querySelector(`input#price-${id}`).value;

			// 주문금액 변경
			const changedQuantity = inputQuantity.value;
			const amount = Number(changedQuantity) * Number(price);
			const orderAmount = document.querySelector(`span#orderAmount-${id}`);
			orderAmount.setAttribute('data-value', amount);
			orderAmount.innerHTML = amount + '원';

			const labelTotalAmount = document.querySelector('label#totalAmount');
			let getTotalAmount = 0;

			checkboxes.forEach((checkbox) => {
				if (checkbox.checked) {
					const id = checkbox.getAttribute('data-id');
					const orderAmount = document.querySelector(`span#orderAmount-${id}`).getAttribute('data-value');
					getTotalAmount += Number(orderAmount);
				}
			});

			labelTotalAmount.setAttribute('data-totalAmount', getTotalAmount);
			labelTotalAmount.innerHTML = getTotalAmount + '원';
		});
	});

	// 결제 정보 넘기기
	// formSubmit.js 파일의 내용

	document.getElementById("paymentSubmit").addEventListener("click", function(event) {
		event.preventDefault(); // 폼 제출 기본 동작 막기

		// 체크된 항목 가져오기
		var checkboxes = document.querySelectorAll('input[name="checkbox"]:checked');

		// 체크된 항목을 담을 객체 배열
		var selectedItems = [];

		checkboxes.forEach(function(checkbox) {
			const basketid = checkbox.getAttribute("data-id");
			const productid = document.getElementById("productid-" + basketid).value;
			const quantity = document.getElementById("quantity-" + basketid).value;
			const price = document.getElementById("price-" + basketid).value;
            const totalAmount = Number(quantity) * Number(price);
			const item = {
				basketid: basketid,
				productId: productid,
				quantity: quantity,
				price: price,
				totalAmount: totalAmount
			};

			selectedItems.push(item);
		});
		selectedItems.forEach((item) => {
			console.log(item);
		});

		// 선택된 항목 리스트를 폼에 추가
		var hiddenInput = document.createElement("input");
		hiddenInput.type = "hidden";
		hiddenInput.name = "selectedItems";
		hiddenInput.value = JSON.stringify(selectedItems);

		document.getElementById("myForm").appendChild(hiddenInput);

		// 폼 제출
		document.getElementById("myForm").submit();
	});

	/*const btnPayment = document.querySelector('span#btnPayment');
	btnPayment.addEventListener('click', () => {
		let list = [];
		checkboxes.forEach((checkbox) => {
			if (checkbox.checked) {
				const basketid = checkbox.getAttribute('data-id');
				const productid = document.querySelector(`input#productid-${basketid}`).value;
				const quantity = document.querySelector(`input#quantity-${basketid}`).value;
				const totalAmount = document.querySelector('label#totalAmount').getAttribute('data-totalAmount');
				
				const data = {
					basketid,
					productid,
					quantity,
					totalAmount
				};
				
				list.push(data);
			}
		});
		
		axios.post('/alcohol/payment/paymentmain', list)
			.then((response) => {
				window.location.href = '/alcohol/payment/paymentmain';
			})
	});*/
});
