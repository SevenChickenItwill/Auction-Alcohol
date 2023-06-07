/**
 * 
 */
document.addEventListener('DOMContentLoaded', () => {

	function updateOrderAmount(basketid) {
		const inputQuantity = document.getElementById(`inputQuantity-${basketid}`);
		const orderAmount = document.getElementById(`orderAmount-${basketid}`);
		const price = parseFloat(orderAmount.dataset.price);
		const quantity = parseInt(inputQuantity.value);

		const newAmount = price * quantity;
		orderAmount.textContent = newAmount.toLocaleString() + "원";

		updateTotalOrderAmount();
	}

	// 전체 선택 체크박스 관련 함수
	function toggleSelectAll() {
		const checkboxes = document.querySelectorAll('input[name="myCheckbox"]');
		const selectAllCheckbox = document.getElementById('myCheckbox');

		const isChecked = selectAllCheckbox.checked;
		checkboxes.forEach((checkbox) => {
			checkbox.checked = isChecked;
		});

		updateTotalOrderAmount();
	}

	// 개별 체크박스 클릭 시 실행되는 함수
	function updateTotalOrderAmount() {
		const checkboxes = document.querySelectorAll('input[name="myCheckbox"]');
		let totalAmount = 0;

		checkboxes.forEach((checkbox) => {
			if (checkbox.checked) {
				const amount = parseFloat(checkbox.value);
				totalAmount += amount;
			}
		});

		const totalAmountLabel = document.getElementById('totalAmount');
		totalAmountLabel.textContent = totalAmount.toLocaleString() + "원";
	}

	// 삭제 버튼 클릭 시 실행되는 함수
	function deleteSelectedItems() {
		const checkboxes = document.querySelectorAll('input[name="myCheckbox"]');
		checkboxes.forEach((checkbox) => {
			if (checkbox.checked) {
				checkbox.parentNode.parentNode.remove();
			}
		});

		updateTotalOrderAmount();
	}
});