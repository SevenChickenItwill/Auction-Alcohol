/**
 * auction-registration.js
 * registration.jsp의 기능들을 담당하는 js
 * 내 상품 찾기 버튼을 누르면 상품정보를 찾아와 상품테이블에 그려준다.
 * 
 */

 document.addEventListener('DOMContentLoaded', function() {
     const pNameValue = document.querySelector('input#pName').value;
     const idValue = document.querySelector('input#id').value;
     const btnProductSearch = document.querySelector('button#btnProductSearch');
     
     
     btnProductSearch.addEventListener('click', function(pNameValue, idValue) {
           
     });
     
     const getProductswithId = async () => {
         const pName = document.querySelector('input#pName').value;
         const userId = document.querySelector('input#id').value;
         const reqUrl = `/alcohol/auction/productlist/${pName}/${userId}`;
         
         try {
             const response = await axios.get(reqUrl);
             console.log(response);
             // 상품정보가 오면 테이블에 보여주기
             
         } catch (error) {
             
         }
     }
     
 });
 