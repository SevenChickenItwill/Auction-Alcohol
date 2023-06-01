/**
 * board-modify.js
 */


document.addEventListener('DOMContentLoaded', () => {
    
    const form = document.querySelector('form#modifyForm');

    const inputId = document.querySelector('input#board_id');
    const inputTitle = document.querySelector('input#title');
    const textareaContent = document.querySelector('textarea#content');

    const updateBtn = document.querySelector('button#updateBtn');


    updateBtn.addEventListener('click', (e) => {
        e.preventDefault;

        const board_id = inputId.value;
        const title = inputTitle.value;
        const content = textareaContent.value;
        
        if (title === '' || content === '') {
            alert('제목과 내용을 입력 해주세요.');
            return;
        }

        const result = confirm(`${board_id}번 게시물을 수정하시겠습니까?`);

        if (result) {
            form.action = './update';
            form.method = 'post';
            form.submit();
        }

    });

});