/**
 * 채팅 관련 모든 기능은 여기서 구현(JS)
 * 우선 1버전은 WebSocket활용 안되면 다른 방식 찾기
 */

 document.addEventListener('DOMContentLoaded',()=>{
	 const cid = document.querySelector('input#cid').value;
	 const bidders = document.querySelector('input#bidder');
	 const bidcounts = document.querySelector('input#bidcount');
	 let nowbids = document.querySelector('input#nowbid');
	 let passbid = document.querySelector('input#passbid').value;
	 // 웹소켓 객체 생성
	 let ws = new WebSocket("ws://"+ location.host + "/alcohol/chat?aid="+cid); 
	 const loginid = document.querySelector('#loginid').value;
	 
	 let otherchatlist = document.querySelector('div#otherchatcontent');
	 
	 // 웹소켓 연결될 경우 실행되는 이벤트 핸들러
	 ws.onopen = () =>{
		
		console.log("WebSocket Connection opened");
		 
	 };
	 
	 // 메시지를 수신하는 함수
	 ws.onmessage = function(event){
		 let aid = document.querySelector('input#cid').value;
		 const data = JSON.parse(event.data);
		 
		 if(data.cid!=aid){
			 return;
		 }
		 console.log(data);
		 const message = data.message;
		 const userid = data.userid;
		 const cid = data.cid;
		 const nowbid = data.nowbid;
		 const bidcount = data.bidcount;
		 const bidder =data.bidder;
		 console.log(cid);
		 let html = '';
		 if(loginid==userid){
		 
		 html = `<input class="form-control text-end text-bg-warning" type="text" value="${message} : ${userid}" readonly="readonly"/>
		 		<input class="d-none" name="cid${cid}" id="cid${cid}" value="${cid}"/>`;
		 ;
		 } else{
			 html = `<input class="form-control text-bg-secondary" type="text" value="${userid} : ${message}" readonly="readonly"/>
			 <input class="d-none" name="cid${cid}" id="cid${cid}" value="${cid}"/>`;
		 }
		 nowbids.value = `${nowbid}`;
		 bidders.value = `${bidder}`;
		 bidcounts.value = `${bidcount}`;
		 otherchatlist.innerHTML += html;
		 
		 
	 }
	 
	 async function senddaomsg(msgData){
		 console.log(msgData.message);
		 let conversation = msgData.message;
		 let userid = msgData.userid;
		 let cids = msgData.cid;
		 let bidup = msgData.nowbid;
		 let bidman = msgData.bidder;
		 let countup = msgData.bidcount;
		 
		 let reqUrl = `/alcohol/api/auction/send/${msgData.cid}/${msgData.userid}`;
		 let senddata = {
			 cid : cids ,
			 conversation : conversation,
			 userid : userid,
			 nowbid : bidup,
			 bidder : bidman,
			 bidcount : countup
		 }
		 
		 axios.post(reqUrl,senddata)
		 .then(response=>{
			 console.log(response.data);
		 })
		 .catch(error=>{
			 console.log(error);
		 })
		 
	 }
	 
	 
	 // 메시지를 전송하는 함수
	 function sendMessage(event) {
		 const useridinput = document.querySelector('input#userid');
		 const btndbid = event.target;
		 const databid = btndbid.getAttribute('data-bid');
		 	 
		 console.log(databid);

		 let bidnow = nowbids.value;
		 let bidman = bidders.value;
		 let countbid = bidcounts.value;
		 
		 
		 const messageInput = document.querySelector('input#chatcontent');
		 let message = messageInput.value;
		 let userid = useridinput.value;
		 passbid = parseInt(passbid);
		 bidnow = parseInt(bidnow);
		 countbid = parseInt(countbid);
		 let dealbid = `${bidnow + (passbid * 0.01)}`;
		 let batmsg = `${userid} 님이 ${dealbid} 원 금액에 배팅했습니다.`;
		 let bidup = `${dealbid}`;
		 let countup = `${countbid+1}`;
		 let msgData;
		 if(databid==1){
			 
			 msgData = {
				 
				 cid : cid,
				 userid : userid,
				 message : batmsg,
				 nowbid : bidup,
				 bidder : bidman,
				 bidcount : countup
				 
				 
			 }
			 
		 } else {
		 
		 
		 	msgData = {
			 
			 cid : cid,
			 userid : userid,
			 message : message,
			 nowbid : bidnow,
			 bidder : bidman,
			 bidcount : countbid
			 
			 
		 	}
		 }
		 // 메시지 값을 서버로 전달
		 ws.send(JSON.stringify(msgData));
		 senddaomsg(msgData);
		 // 입력 창을 초기화
		 messageInput.value='';
		 
	 }
	 
	 const btnSubmit = document.querySelector('button#btnsubmit');
	 const btnbat = document.querySelector('button#btnbat');
	 
	 btnSubmit.addEventListener('click',sendMessage);
	 btnbat.addEventListener('click',sendMessage);
	
	 const messageInput = document.querySelector('input#chatcontent');
	 messageInput.addEventListener('keypress',(event)=>{
		
		if(event.key === 'Enter'){
			sendMessage();
		}
		 
	 });
	 
 });