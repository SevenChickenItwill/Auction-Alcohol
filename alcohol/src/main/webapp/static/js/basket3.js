/**
 * 
 */
document.addEventListener('DOMContentLoaded', () => {
	const updateOrderAmount = (basketid) => {
		const orderAmount = document.getElementById(`inputQuantity-${basketid}`).value;
		console.log(orderAmount);
	};
  

  function toggleSelectAll() {
    const checkboxes = document.querySelectorAll('input[name="myCheckbox"]');
    const selectAllCheckbox = document.getElementById('myCheckbox');
    const isChecked = selectAllCheckbox.checked;

    checkboxes.forEach((checkbox) => {
      checkbox.checked = isChecked;
    });

    updateTotalOrderAmount();
  }

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
    totalAmountLabel.textContent = `${totalAmount.toLocaleString()}원`;
  }

  function deleteSelectedItems() {
    const checkboxes = document.querySelectorAll('input[name="myCheckbox"]');
    checkboxes.forEach((checkbox) => {
      if (checkbox.checked) {
        checkbox.parentNode.parentNode.remove();
      }
    });

    updateTotalOrderAmount();
  }

  // Add event listeners
  const checkboxes = document.querySelectorAll('input[name="myCheckbox"]');
  const selectAllCheckbox = document.getElementById('myCheckbox');
  const deleteButton = document.querySelector('.btninit');

  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener('change', updateTotalOrderAmount);
  });

  selectAllCheckbox.addEventListener('change', toggleSelectAll);
  deleteButton.addEventListener('click', deleteSelectedItems);
});
