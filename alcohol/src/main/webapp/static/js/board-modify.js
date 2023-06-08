/**
 * board-modify.js
 */


document.addEventListener('DOMContentLoaded', () => {
    
    const form = document.querySelector('form#modifyForm');

    const boardId = document.querySelector('input#boardId').value;

    const updateBtn = document.querySelector('button#updateBtn');
	
	// 내용
	const textareaContent = document.querySelector('textarea#content');
	
	// 이미지 파일 이름
	let filename = '';
	
	// 제목
	const inputTitle = document.querySelector('input#title');
	
	file.addEventListener('handleFileChange', (e) => {
		const fileInput = event.target;
		const file = fileInput.files[0];
		const fileName = file.name;
		
		filename = fileName;

		// 이미지 파일 이름으로 수행할 작업 수행
		console.log(fileName); // 예시: 콘솔에 파일 이름 출력
	})

    updateBtn.addEventListener('click', (e) => {
        e.preventDefault;
		
        const title = inputTitle.value;
        const content = textareaContent.value;
        
        const data = {};
        
        if (filename === '') {
			data = {board_id : boardId, title, content};
		} else {
			const fileName = filename.value;
			data = {board_id : boardId, title, content, fileName};
		}
        
        
        if (title === '' || content === '') {
            alert('제목과 내용을 입력 해주세요.');
            return;
        }

        const result = confirm(`${board_id}번 게시물을 수정하시겠습니까?`);

        if (result) {
            form.action = './update';
            form.method = 'post';
            form.submit(data);
        }

    });

});