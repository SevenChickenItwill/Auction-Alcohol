/**
 * 
 */

document.addEventListener('DOMContentLoaded', () => {

	// 수정완료 버튼
	const createBtn = document.querySelector('input#createBtn');

	// 카테고리
	const selectCategory = document.querySelector('select#category');

	// 닉네임
	const inputNickname = document.querySelector('input#nickname');

	// 아이디
	const inputUserId = document.querySelector('input#userId');

	// 제목
	const inputTitle = document.querySelector('input#title');

	// 내용
	const textareaContent = document.querySelector('textarea#content');

	// 이미지를 전달할 form
	const createForm = document.querySelector('form#createForm');
	
	// 이미지 파일 이름
	let filename = '';
	
	file.addEventListener('handleFileChange', (e) => {
		const fileInput = event.target;
		const file = fileInput.files[0];
		const fileName = file.name;
		
		filename = fileName;

		// 이미지 파일 이름으로 수행할 작업 수행
		console.log(fileName); // 예시: 콘솔에 파일 이름 출력
	})
	
	
	
	const createPost = (e) => {
		console.log(filename);
		const fileName = filename;
		const category = selectCategory.value;
		const nickname = inputNickname.value;
		const user_id = inputUserId.value;
		const tilte = inputTitle.value;
		const content = textareaContent.value;
		
		const data = { fileName, category, nickname, user_id, tilte, content };
		
		const result = confirm('생성하시겠습니까?');
		
		if (result) {
			createForm.method = 'post';
			createForm.action = './create';
			createForm.sumit(data);
		}
		
	};
	
	createBtn.addEventListener('click', createPost);
	

});