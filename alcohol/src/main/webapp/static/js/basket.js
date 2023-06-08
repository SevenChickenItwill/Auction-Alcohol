/**
 * basket.js
 * payindex에서 input 수량 값에 따라 금액 변동
 */

document.addEventListener('DOMContentLoaded', () => {
	// 전체 체크박스 선택 or 해제 ===============================================
	var selectAllCheckbox = document.querySelector('#myCheckbox');

	// 전체선택 체크박스 클릭 시 실행되는 함수
	selectAllCheckbox.addEventListener('click', function() {
		var checkboxes = document.querySelectorAll('.card-boby input[type="checkbox"]');

		// 전체선택 체크박스의 상태에 따라 다른 동작 수행
		if (selectAllCheckbox.checked) {
			// 전체선택 체크박스가 선택된 경우, 나머지 체크박스 모두 선택
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = true;
			}
		} else {
			// 전체선택 체크박스가 선택되지 않은 경우, 나머지 체크박스 모두 해제
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = false;
			}
		}
	});
	//^전체 체크박스 선택 or 해제 ===============================================^

	// 박스 선택 시 총 주문금액 바꿈===============================================
	let totalPrice = 0;
	const totalPriceMethod = (event) => {
		const checkbox = event.target;
		const priceElement = checkbox.closest('.card-body').querySelector('.price');
		const price = parseFloat(priceElement.textContent);

		if (checkbox.checked) {
			totalPrice += price;
		} else {
			totalPrice -= price;
		}
	};

	var checkboxes = document.querySelectorAll('.card-body input[type="checkbox"]');
	for (var i = 0; i < checkboxes.length; i++) {
		checkboxes[i].addEventListener('change', totalPriceMethod);
	}
});