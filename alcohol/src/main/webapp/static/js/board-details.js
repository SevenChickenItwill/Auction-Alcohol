/**
 * board-list.js
 */

document.addEventListener('DOMContentLoaded', () => {

	const form = document.querySelector('form#boardForm');

	// 삭제버튼 객체 생성.
	const deleteBtn = document.querySelector('button#deleteBoardBtn');
	
	// 아이디를 불러올 수 있는 객체 생성.
	const inputId = document.querySelector('input#boardId');

	// 추천수를 바로 갱신하기 위한 객체 생성.
	const spanRecommendCnt = document.querySelector('span#recommendCnt');

	// 로그인한 아이디
	const loginId = document.querySelector('input#loginId').value;

	deleteBtn.addEventListener('click', (e) => {
		e.preventDefault;

		const board_id = inputId.value;
		const result = confirm(`${board_id}번을 정말 삭제 하시겠습니까?`);
		
		form.append('board_id', board_id);
		
		if (result) {
			form.action = './delete';
			form.method = 'post';
			form.submit();

		}
	});

	// 화면에서 바로 갱신하기 위해 선언하는 메서드
	const makeRecommendElements = (data) => {

		spanRecommendCnt.innerHTML = '';

		let htmlStr = '';

		htmlStr += `추천수[${data.recommend}]`;

		spanRecommendCnt.innerHTML = htmlStr;

	};

	const getRecommendWithBoardId = async () => {

		const boardId = document.querySelector('input#boardId').value;
		const reqUrl = `/alcohol/api/recommend/all/${boardId}`;

		// Ajax 요청을 보내고 응답을 기다림.
		try {
			const response = await axios.get(reqUrl);
			console.log(response);
			makeRecommendElements(response.data);
		} catch (error) {
			console.log(error);
		}

	};

	// 추천을 올려주는 버튼 생성.
	const recommendUp = document.querySelector('input#recommendUp');

	const recommendClickUp = (e) => {

		const boardId = document.querySelector('input#boardId').value;
		const data = { boardId };


		axios.post(`/alcohol/api/recommend/recommendup/${boardId}`)
			.then((response) => {

				if (response == -1) {
					alert('추천은 한번만 가능합니다.');
				}

				console.log(response);
				getRecommendWithBoardId(); // 갱신
			})
			.catch((error) => console.log(error));



	};

	recommendUp.addEventListener('click', recommendClickUp);


	// 추천을 내려주는 버튼 생성.
	const recommendDo = document.querySelector('input#recommendDo');

	const recommendClickDo = (e) => {

		const boardId = document.querySelector('input#boardId').value;
		const data = { boardId };


		axios.post(`/alcohol/api/recommend/recommenddo/${boardId}`)
			.then((response) => {

				if (response == -1) {
					alert('비추천은 한번만 가능합니다.');
				}

				console.log(response);
				getRecommendWithBoardId();
			})
			.catch((error) => console.log(error));




	};

	recommendDo.addEventListener('click', recommendClickDo);





});