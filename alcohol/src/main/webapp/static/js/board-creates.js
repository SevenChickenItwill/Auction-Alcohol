/**
 * 
 */

document.addEventListener('DOMContentLoaded', () => {

	// 수정완료 버튼
	const createBtn = document.querySelector('input#createBtn');

	// 카테고리
	const selectCategory = document.querySelector('select#category');

	// 닉네임
	const inputNickname = document.querySelector('span#nickname');

	// 아이디
	const inputUserId = document.querySelector('span#userId');

	// 제목
	const inputTitle = document.querySelector('input#title');

	// 내용
	const textareaContent = document.querySelector('textarea#content');

	// 이미지를 전달할 form
	const form = document.querySelector('form#createForm');
	
	const createPost = async (e) => {
		// 폼데이터 객체 생성
		e.preventDefault();
		
		console.log('들어옴');
		
		let formData = new FormData();
		const image = document.querySelector('input#file');

		let filePath = image.value;
		const allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;

		const category = selectCategory.value;
		const nickname = inputNickname.innerHTML;
		const user_id = inputUserId.innerHTML;
		const title = inputTitle.value;
		const content = textareaContent.value;

		if (!allowedExtensions.exec(filePath)) {
			alert('이미지 파일만 업로드가 가능합니다.');
			image.value = '';
			return;
		}
		
		let dtoUrl = `/alcohol/api/recommend/create/${category}/${nickname}/${user_id}/${title}/${content}`;
		
		try {
			const result = confirm('생성하시겠습니까?');
			
			let responses = await axios.post(dtoUrl);
			
			const boardId = responses.data.board_id;
			console.log(boardId);
			
			form.append('file', image.files[0]);
			
			if(result) {
				form.enctype = 'multipart/form-data';
				form.action = `/alcohol/bulletinboard/board/create/${boardId}`;
				form.method = 'post';
				form.submit();
				
			}
			
		} catch (error) {
			console.log(error);
		}


	};

	createBtn.addEventListener('click', createPost);


});