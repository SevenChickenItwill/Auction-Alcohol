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
/*document.addEventListener('DOMContentLoaded', ()=> {
	
	const btnkakaopay = document.querySelector('div#btnkakaopay');
	btnkakaopay.addEventListener('click', async () => {
		let reqUrl = '/alcohol/payment/kakaopay.cls';

		try {
			const response = await axios({
				url: reqUrl,
				method: 'get',
				responseType: 'json'
			});

			console.log(response.data);
			alert('response: '+response.data);
			
			var box = response.data.next_redirect_pc_url;
			window.open(box);
		} catch (error) {
			console.log(error);
			alert('error'+error);
		}
	});
});*/
$(function(){
  $('#btnkakaopay').click(function(){
    $.ajax({
      url: '/alcohol/payment/kakaopay.cls',
      dataType: 'json',
      success: function(data){
        var box = data.next_redirect_pc_url;
        window.open(box);
      },
      error: function(error) {
        alert(error);
      }
    });
  });
});







