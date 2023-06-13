/**
 * 
 */
/*$(function(){
	$('#btnkakaopay').click(function(){
		url: '/cls/jq/kakaopay.cls',
		dataType: 'json',
		success: function(data){
			alert(data);
		},
		error: function(error) {
			alert(error);
		}
	});
});*/
document.addEventListener('DOMContentLoaded', ()=> {
	
	const btnkakaopay = document.querySelector('div#btnkakaopay');
	btnkakaopay.addEventListener('click', async () => {
		let reqUrl = '/alcohol/payment/kakaopay.cls';
		let data = {};

		try {
			const response = await axios({
				url: reqUrl,
				method: 'get',
				responseType: 'json'
			});

			console.log(response.tid);
			alert(response.tid);
		} catch (error) {
			console.log(error);
			alert('error'+error);
		}
	});
});







