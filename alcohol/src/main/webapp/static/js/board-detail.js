/**
 * board-list.js
 */

document.addEventListener('DOMContentLoaded', () => {
    
    const form = document.querySelector('form#boardForm');
    
    const deleteBtn = document.querySelector('a#deleteBtn');
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
    
});