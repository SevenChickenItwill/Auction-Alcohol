/**
 * board-modify.js
 */


document.addEventListener('DOMContentLoaded', () => {

	const form = document.querySelector('form#modifyForm');

	const inputBoradId = document.querySelector('input#boardId');

	const updateBtn = document.querySelector('button#updateBtn');

	// 내용
	const textareaContent = document.querySelector('textarea#content');

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
	
	const updatePost = async (e) => {
		// 폼데이터 객체 생성
		e.preventDefault();
		
		console.log('들어옴');
		
		const image = document.querySelector('input#file');

		let filePath = image.value;
		const allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
		
		const board_id = inputBoradId.value;
		const title = inputTitle.value;
		const content = textareaContent.value;
		
		console.log(board_id, title, content);

		if (!allowedExtensions.exec(filePath)) {
			alert('이미지 파일만 업로드가 가능합니다.');
			image.value = '';
			return;
		}
		
		let dtoUrl = `/alcohol/api/recommend/update/${board_id}/${title}/${content}`;
		
		try {
			let responses = await axios.post(dtoUrl);
			
			const boardId = responses.data;
			console.log(boardId);
			
			const result = confirm('수정하시겠습니까?');
			
			form.append('file', image.files[0]);
			
			if(result) {
				form.enctype = 'multipart/form-data';
				form.action = `/alcohol/bulletinboard/board/update/${boardId}`;
				form.method = 'post';
				form.submit();
				
			}
			
		} catch (error) {
			console.log(error);
		}


	};

	updateBtn.addEventListener('click', updatePost);

});