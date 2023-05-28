/**
 * product-management.js
 * 상품 수정 삭제 자바스크립트
 */

 document.addEventListener('DOMContentLoaded', () => {
	 // 실제로는 아이디값 받기 현재는 로그인 기능 없으니
 	 const userid = 'test';
 	 
	 // 수정 전 제품 정보 가져오기 -----------------------------------------------------
	 const productid = document.querySelector('td#productid');
	 const getProduct = async () => {
		 const reqUrl = `/alcohol/api/product/${productid}`;
		 
		 try {
			 const response = await axios.get(reqUrl);
			 
		 } catch(error) {
			 console.log(error);
		 }
	 };
	 
	 // 모달 객체 생성
	 const modal = new bootstrap.Modal('div#replyUpdateModal', {backdrop: false});
	 
	 // 모달 엘리먼트 가져오기
	 const modalPeoductId = document.querySelector('input#productId');
	 const modalpname = document.querySelector('input#pname');
	 const constructor = document.querySelector('input#constructor');
	 const modalbrandname = document.querySelector('input#brandname');
	 const modalcategory = document.querySelector('select#category');
	 const madalcost = document.querySelector('input#cost');
	 const modalBtnUpdate = document.querySelector('button#modalBtnUpdate');
	 
	 // 수정 버튼의 이벤트 리스너(콜백) 함수 - 수정 모달을 보여주는 함수
	 const showUpdateModal = () => {
		 
	 }
	 // 목록 갱신 ------------------------------------------------------------------
	 //const productid = document.querySelector('td#productid');
	 //const pname = document.querySelector('td#pname');
	 //const constructor = document.querySelector('td#constructor');
	 //const brandname = document.querySelector('td#brandname');
	 //const category = document.querySelector('td#category');
	 //const cost = document.querySelector('td#cost');
	 const productList = document.querySelector('div#productList');
	 
	 const listUpdate = async () => {
		 const reqUrl = `/alcohol/api/product/all/${userid}`;
		 
		 try {
			 const response = await axios.get(reqUrl);
			 console.log(response);
			 productList.innerHTML = '';
		 } catch(error) {
			 console.log(error);
		 }
	 }
		 
	 
	 
	 // 수정 버튼 ------------------------------------------------------------------
	 const btnProductUpdate = document.querySelectorAll('button#btnProductUpdate');
	 
	 btnProductUpdate.addEventListener('click', (e) => {
		 e.preventDefault();
		 
		 listUpdate();
	 });
	 
	 // 삭제 버튼 ------------------------------------------------------------------
	 const btnProductDelete = document.querySelectorAll('button#btnProductDelete');
	 
	 btnProductDelete.addEventListener('click', (e) => {
		 
	 });
 });