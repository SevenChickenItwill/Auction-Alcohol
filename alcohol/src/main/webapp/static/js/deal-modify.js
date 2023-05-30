/**
 * deal-modify.js
 */

 document.addEventListener('DOMContentLoaded', () => {
     
     const inputId = document.querySelector('input#id');
     const inputTitle = document.querySelector('input#title');
     const textareaContent = document.querySelector('textarea#content');
     const inputUser = document.querySelector('input#user');
     
     const btnUpdate = document.querySelector('button#btnUpdate');
     const btnDelete = document.querySelector('button#btnDelete');
     
     const form = document.querySelector('form#modifyForm');
     
     btnUpdate.addEventListener('click', (e) => {
         e.preventDefault;
         
         const id = inputId.value;
         const title = inputTitle.value;
         const content = textareaContent.value;
         
         if (title === '' || content === '') {
             alert('제목과 내용을 입력 해주세요.');
             return;
         }
         
         const result = confirm(`${id}번 게시물을 수정하시겠습니까?`);
         
         if (result) {
             form.action = './update';
             form.method = 'post';
             form.submit();
         }
         
     });
     
     btnDelete.addEventListener('click', (e) => {
         e.preventDefault;
         
         const id = inputId.value;
         const result = confirm(`${id}번을 정말 삭제 하시겠습니까?`);
         
         if (result) {
             form.action = './delete';
             form.method = 'post';
             form.submit();
             
         }
         
     });
     
     
     
     
     
 });