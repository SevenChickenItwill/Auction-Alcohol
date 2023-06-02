/**
 * 채팅 관련 모든 기능은 여기서 구현(JS)
 * 우선 1버전은 WebSocket활용 안되면 다른 방식 찾기
 */

 document.addEventListener('DOMContentLoaded',()=>{
	 const cid = document.querySelector('input#cid').value;
	 // 웹소켓 객체 생성
	 let ws = new WebSocket("ws://"+ location.host + "/alcohol/chat"); 
	 const loginid = document.querySelector('#loginid').value;
	 
	 let otherchatlist = document.querySelector('div#otherchatcontent');
	 let mychatlist = document.querySelector('div#mychatcontent');
	 // 웹소켓 연결될 경우 실행되는 이벤트 핸들러
	 ws.onopen = () =>{
		
		console.log("WebSocket Connection opened");
		 
	 };
	 
	 // 메시지를 수신하는 함수
	 ws.onmessage = function(event){
		 
		 const data = JSON.parse(event.data);
		 console.log(data);
		 const message = data.message;
		 const userid = data.userid;
		 const cid = data.cid;
		 console.log(cid);
		 let html = '';
		 if(loginid==userid){
		 
		 html = `<input class="form-control text-end text-bg-warning" type="text" value="${cid} // ${message} : ${userid}"/>`;
		 ;
		 } else{
			 html = `<input class="form-control text-bg-secondary" type="text" value="${userid} : ${message} // ${cid}"/>`;
		 }
		 otherchatlist.innerHTML += html;
		 
		 console.log(cid + " : " + userid + " : " + message);
	 }
	 
	 // 메시지를 전송하는 함수
	 function sendMessage(){
		 const useridinput = document.querySelector('input#userid');
		 
		 const messageInput = document.querySelector('input#chatcontent');
		 const message = messageInput.value;
		 const userid = useridinput.value;
		 
		 let msgData = {
			 
			 cid : cid,
			 userid : userid,
			 message : message
			 
		 }
		 
		 // 메시지 값을 서버로 전달
		 ws.send(JSON.stringify(msgData));
		 
		 // 입력 창을 초기화
		 messageInput.value='';
		 
	 }
	 
	 const btnSubmit = document.querySelector('button#btnsubmit');
	 const btnBat = document.querySelector('button#btnbat');
	 
	 btnSubmit.addEventListener('click',sendMessage);
	 const btnconn = document.querySelector('button#btnconn');
	 btnconn.addEventListener('click',()=>{
		 
	 })
	 
	 const messageInput = document.querySelector('input#chatcontent');
	 messageInput.addEventListener('keypress',(event)=>{
		
		if(event.key === 'Enter'){
			sendMessage();
		}
		 
	 });
	 
 });