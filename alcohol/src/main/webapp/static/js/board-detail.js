/**
 * board-list.js
 */

document.addEventListener('DOMContentLoaded', () => {
    
    const form = document.querySelector('form#boardForm');
    
    // 삭제버튼 객체 생성.
    const deleteBtn = document.querySelector('a#deleteBtn');
    
    // 아이디를 불러올 수 있는 객체 생성.
    const inputId = document.querySelector('input#boardId');
    
    deleteBtn.addEventListener('click', (e) => {
        e.preventDefault;
         
         const board_id = inputId.value;
         const result = confirm(`${board_id}번을 정말 삭제 하시겠습니까?`);
         
         
         if (result) {
             form.action = './delete';
             form.method = 'post';
             form.submit(board_id);
             
         }
    });
    
    // 추천을 올려주는 버튼 생성.
    const recommendUp = document.querySelector('button#recommendUp');
    
    
    // 추천을 내려주는 버튼 생성.
    const recommendDown = document.querySelector('button#recommendDown');
    
    
    
});