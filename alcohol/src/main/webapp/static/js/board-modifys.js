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
	
	// 수정전 이미지
	const imgDefaultImage = document.querySelector('img#DefaultImage');

	const updatePost = async (e) => {
		// 폼데이터 객체 생성
		e.preventDefault();

		console.log('들어옴');

		const image = document.querySelector('input#file');
		
		let filePath = image.value;
		// const allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
		
		const board_id = inputBoradId.value;
		const title = inputTitle.value;
		const content = textareaContent.value;
		
		console.log('filePath = ' + filePath);
		
		//if (!allowedExtensions.exec(filePath) ) {
		//	alert('이미지 파일만 업로드가 가능합니다.');
		//	image.value = '';
		//	return;
		//}
		
		if (title.length > 1000) {
			alert('제목은 1000자 이내로 작성하십시오.');
			return;
		}
		
		if (content.length > 825) {
			alert('내용은 825자 이내로 작성하십시오.');
			return;
		}
		
		let dtoUrl = `/alcohol/api/recommend/update/${board_id}/${title}/${content}`;
		
		try {
			const result = confirm('수정하시겠습니까?');
			
			let responses = await axios.post(dtoUrl);
			
			const boardId = responses.data;
			console.log(boardId);
			
			form.append('file', image.files[0]);
			
			if (result) {
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