/**
 * 
 */

 document.addEventListener('DOMContentLoaded', () => {
     const signupEmailForm = document.querySelector('#signupEmailForm');
     const btnNext = document.querySelector('#btnNext');
     const userEmail = document.querySelector('#userEmail');
     btnNext.addEventListener('click', () => {
         const check = confirm('gogo');
         
         if (userEmail === '') {
             alert('항복을 반드시 작성하세요')
         }
         
         if (check) {
             signupEmailForm.action = './signup';
             signupEmailForm.method = 'post';
             signupEmailForm.submit();
             
         }
     });
     
 });