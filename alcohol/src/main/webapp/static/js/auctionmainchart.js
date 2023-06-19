/**
 * chartmaker
 */

 document.addEventListener('DOMContentLoaded',()=>{
	 
	 const monthlysales = document.querySelector('canvas#MonthlySales');
	 const userid = document.querySelector('input#userid').value;
	 const monthlyAuction = document.querySelector('canvas#MonthlyAuction');
	 let date = new Date();
	 
	 const makingchartAuction = async () => {
		 
		 const reqUrl = '/alcohol/api/auction/loadauctionchart';
		 const data = {
			 
			 userid : userid,
			 date : date
		 }
		 
		 try{
			 
			 let response = await axios.post(reqUrl,data);
			 let chartlist = response.data;
			 drawChart(chartlist,"경매",monthlyAuction);
			 
		 } catch(error){
			 console.log(error);
		 }
		 
	 }
	 
	 const makingchart = async () => {
		 
		 const reqUrl = '/alcohol/api/auction/loadchartdata';
		 const data = {
			 
			 userid : userid,
			 date : date
		 }
		 try{
		 	let response = await axios.post(reqUrl,data);
		 	let chartlist = response.data;
		 	drawChart(chartlist, "매출",monthlysales);
		 
		 } catch(error){
			 console.log(error);
			 
		 }
	 }
	 
	 
	 
	 function drawChart(data, name, chartbase) {
  // 월별 매출 데이터 추출
  const months = data.map(item => item.month);
  const totals = data.map(item => item.total);

  // Chart.js를 사용하여 막대 그래프를 그립니다.
  const ctx = chartbase.getContext('2d');
  let options = {
	  
	  scales: {
        y: {
			min : 0,
          	ticks: {
        		stepSize: 50000
      		}
          
        }
      }
	  
  }
  
  const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: months,
      datasets: [{
        label: name,
        data: totals,
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 2
      }]
    },
    options: options
  });
  
  
}
	 makingchart();
	 makingchartAuction();
 })