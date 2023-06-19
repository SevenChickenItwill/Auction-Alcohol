/**
 * 
 */
document.addEventListener('DOMContentLoaded', ()=> {
	const btnView = document.querySelectorAll('#btnView');
	
	btnView.forEach((btn) => {
		btn.addEventListener('click', (e) => {
			const id = e.target.getAttribute('data-id');
			const tr = document.querySelector(`#userinfo[data-id="${id}"]`);
			if (tr !== null) {
			const className = tr.className;
			if (className == 'd-none') {
				tr.removeAttribute('class');
			} else {
				tr.classList.add('d-none');
			}
			}
		});
	});
});