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
	
	const btnDelivery = document.querySelectorAll('#delivery');
	btnDelivery.forEach((btn) => {
		btn.addEventListener('click', async () => {
			const productid = btn.getAttribute('data-id');
			const basketid = btn.getAttribute('data-bid');
			
			let reqUrl = '/alcohol/api/shop/delivery'
			let data = {
				productid,
				basketid
			}
			try {
				const response = await axios.post(reqUrl, data);
				const td = document.querySelector(`#status[data-id="${productid}"]`)
				td.innerHTML = '배송중';
			} catch(error) {
				console.log(error);
			}
			
		}); 
	});
});