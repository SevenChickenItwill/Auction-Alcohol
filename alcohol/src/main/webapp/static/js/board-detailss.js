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

	// 댓글 카운트
	const boardCommendCount = document.querySelector('span#boardCommendCount');
	
	deleteBtn.addEventListener('click', (e) => {

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

		htmlStr += `추천수 ${data.recommend}<span class="vr" style="margin-left: 8px; margin-right: 8px;">`;

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
		e.preventDefault();

		const boardId = inputId.value;
		const loginId = document.querySelector('input#loginId').value;

		axios.post(`/alcohol/api/recommend/recommendup/boardId=${boardId},loginId=${loginId}`)
			.then((response) => {
				console.log(response.data);

				if (response.data != 0) {
					alert("추천은 한 번만 가능합니다.");
				}

				getRecommendWithBoardId(); // 갱신
			})
			.catch((error) => console.log(error));

	};

	recommendUp.addEventListener('click', recommendClickUp);


	// 추천을 내려주는 버튼 생성.
	const recommendDo = document.querySelector('input#recommendDo');

	const recommendClickDo = (e) => {
		e.preventDefault();

		const boardId = document.querySelector('input#boardId').value;
		const loginId = document.querySelector('input#loginId').value;

		axios.post(`/alcohol/api/recommend/recommenddo/${boardId},${loginId}`)
			.then((response) => {
				console.log(response);

				if (response.data != 0) {
					alert("비추천은 한 번만 가능합니다.");
				}

				getRecommendWithBoardId();

			})
			.catch((error) => console.log(error));




	};

	recommendDo.addEventListener('click', recommendClickDo);

	///////////////////////////////////////////////////// 댓글//////////////////////////////////////////////////////

	// 등록버튼 처리

	const commentCount = document.querySelector('span#commentCount');

	const commentReg = document.querySelector('button#commentReg');

	const textareaContent = document.querySelector('textarea#content');
	const inputUserNickname = document.querySelector('input#userNickname');


	// ajax 방식 처리를 위한 주소값 삽입
	const getCommentWithBoardId = async () => {
		// 댓글 목록을 요청하기 위한 보드 아이디(번호)
		const boardId = document.querySelector('input#boardId').value;
		console.log('boardId');
		// 댓글 목록을 요청할 URL
		const reqUrl = `/alcohol/api/comment/all/${boardId}`;

		try {
			const response = await axios.get(reqUrl);
			console.log(response);
			// 댓글 개수 업데이트 & 댓글 목록 보여주기
			makeCommentElements(response.data);
		} catch (error) {
			console.log(error);

		}
	}


	const deleteReply = (e) => {
		console.log(e.target); // e.target = 삭제 버튼.

		if (!confirm('정말 삭제할까요?')) {
			return;
		}

		// 삭제할 댓글 아이디
		const idval = e.target;
		let id = idval.getAttribute('data-id');
		console.log(id);
		// 삭제 요청 URL
		const reqUrl = `/alcohol/api/comment/${id}`;
		// 삭제 요청을 Ajax 방식으로 보내기
		axios.delete(reqUrl)
			.then((response) => {
				console.log(response);
				alert('댓글 삭제 성공');
				getCommentWithBoardId(); // 댓글 목록 갱신.
			})
			.catch((error) => {
				console.log(error);
			});

	};




	// 댓글 목록 표시
	const replies = document.querySelector('div#replies');

	// comment domain 데이터를 받아서 String 형식을 html에 저장, 추가.
	const makeCommentElements = (data) => {
		const userNickname = document.querySelector('input#userNickname').value;

		// 댓글 개수 업데이트
		commentCount.innerHTML = data.length; // 배열 길이(원소 개수)
		boardCommendCount.innerHTML = data.length;

		replies.innerHTML = ''; // <div>의 컨텐트를 지움.

		let htmlStr = '';

		for (let comment of data) // data에서 뽑아오는 comment
		{
			console.log(comment);

			// Timestamp 타입 값을 날짜/시간 타입 문자열로 변환:
			const time = new Date(comment.time).toLocaleString();

			// userCheckHTML의 값을 빈 값으로 일단 설정한 뒤
			let userCheckHTML = '';
			// 조건문을 먹여 닉네임 일치 시 삭제 수정 버튼을 보여줌
			if (comment.nickname === userNickname) {
				userCheckHTML = `
          <button class="btnDelete btn btn-dark" style="font-size: 16px; padding: 10px; width: 60px;" data-id="${comment.commentId}">
            삭제
          </button>
          <button class="btnUpdate btn btn-dark" data-id="${comment.commentId}" style="font-size: 16px; padding: 10px; width: 60px;">
            수정
          </button>
      `;
			}

			htmlStr += `
      <div class="cardDiv">
        <div id="commentcontent">
          <span class="d-none">${comment.commentId}</span>
          <span class="fw-bold">${comment.nickname}</span>
          <span class="text-secondary">(${time})</span>
        </div>
        <div class="form-floating mb-3">
          <textarea class="col-5 form-control" style="height: 100px; height: 100px;" id="writrings" readonly>${comment.content}</textarea>
        </div>
        <div id="userCheck" class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-top: 5px; margin-bottom: 30px;">
        ${userCheckHTML}
        </div>
      </div>
    `;
		}
		// 작성된 HTML 코드 replies <div> 영역에 산입.
		replies.innerHTML = htmlStr;

		// HTML 코드 작성으로 만든 삭제 버튼을 찾아서 클릭 시 이벤트 등록
		const deleteButtons = document.querySelectorAll('button.btnDelete');
		for (let btn of deleteButtons) {
			btn.addEventListener('click', deleteReply);
		}
		const updateButtons = document.querySelectorAll('button.btnUpdate');
		for (let btn of updateButtons) {
			btn.addEventListener('click', showComment);
		}

	}

	// 댓글 수정 핸들러
	let btnSave;

	const showComment = (e) => {
		const btn = e.target;
		const card = btn.closest('.cardDiv');
		const textarea = card.querySelector('textarea');
		const buttonDiv = document.createElement('div');
		const showBtnDelete = card.querySelector('.btnDelete');
		buttonDiv.classList.add('buttonDiv');

		btnSave = document.createElement('button');
		btnSave.textContent = '수정 완료';
		btnSave.classList.add('btnSave');
		btnSave.classList.add('btn');
		btnSave.classList.add('btn-dark');
		btnSave.style.padding = '10px';
		btnSave.style.width = '100px';
		btnSave.style.marginRight = '5px';
		btnSave.dataset.id = btn.dataset.id;

		const btnCancel = document.createElement('button');

		btnCancel.textContent = '수정 취소';
		btnCancel.classList.add('btnCancel');
		btnCancel.classList.add('btn');
		btnCancel.classList.add('btn-dark');
		btnCancel.style.padding = '10px';
		btnCancel.style.width = '100px';

		textarea.readOnly = false;
		textarea.classList.add('editable');
		btn.disabled = true;
		btn.style.display = 'none';
		showBtnDelete.style.display = 'none';

		buttonDiv.classList.add('d-grid');
		buttonDiv.classList.add('gap-2');
		buttonDiv.classList.add('d-md-flex');
		buttonDiv.classList.add('justify-content-md-end');
		buttonDiv.style.marginTop = '5px';
		buttonDiv.style.marginBottom = '10px';
		buttonDiv.appendChild(btnSave);
		buttonDiv.appendChild(btnCancel);
		
		card.appendChild(buttonDiv);

		btnSave.addEventListener('click', updateComment);
		btnCancel.addEventListener('click', cancelComment);
	};

	function cancelComment(event) {

		const btnCancel = event.target;
		const card = btnCancel.closest('.cardDiv');
		const textarea = card.querySelector('.editable');
		const btnUpdate = card.querySelector('button.btnUpdate');

		textarea.readOnly = true;
		textarea.classList.remove('editable');
		btnUpdate.disabled = false;
		btnUpdate.style.display = '';
		btnSave.remove();
		btnCancel.remove();
		getCommentWithBoardId();
	}


	function updateComment(event) {
		const btnSave = event.target;
		const card = btnSave.closest('.cardDiv');
		const textarea = card.querySelector('.editable');
		const btnCancel = card.querySelector('.btnCancel');
		const updateButton = card.querySelector('button.btnUpdate');
		const commentId = btnSave.dataset.id;
		const updatedContent = textarea.value;

		const reqUrl = `/alcohol/api/comment/${commentId}`;
		const data = { content: updatedContent };

		axios
			.put(reqUrl, data)
			.then((response) => {
				alert('댓글 업데이트 성공');
				textarea.readOnly = true;
				textarea.classList.remove('editable');
				updateButton.disabled = false;
				updateButton.style.display = '';
				btnSave.remove();
				btnCancel.remove();
				getCommentWithBoardId(); // 댓글 목록 갱신
			})
			.catch((error) => {
				console.log(error);
			});
	}

	const updateButtons = document.querySelectorAll('button.btnUpdate');
	for (let btn of updateButtons) {
		btn.addEventListener('click', showComment);
	}


	const createComment = (e) => {
		e.preventDefault();
		console.log('이벤트');
		const boardId = document.querySelector('input#boardId').value;
		const content = textareaContent.value;
		const nickname = inputUserNickname.value;

		const data = { boardId, content, nickname, };

		const createUrl = '/alcohol/api/comment';

		if (content === '') {
			alert('댓글 내용을 입력하세요.');
			return;
		}
		
		if (content.length > 500) {
			alert('댓글은 500자 이하로 작성가능합니다.');
			return;
		}

		axios.post(createUrl, data)
			.then((response) => {
				console.log(response);
				alert('댓글 등록 성공');
				// 댓글창 비우기
				document.querySelector('textarea#content').value = '';
				// 댓글 목록 새로고침
				getCommentWithBoardId();
			})
			.catch((error) => {
				console.log(error);
			});
	};
	commentReg.addEventListener('click', createComment);

	getCommentWithBoardId();

});