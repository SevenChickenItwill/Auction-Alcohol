/**
 * commnent.js
 * 댓글 목록 불러오기, 수정, 삭제 핸들링
 * /bulletinBoard/board/detail.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {

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
		// 댓글 개수 업데이트
		commentCount.innerHTML = data.length; // 배열 길이(원소 개수)

		replies.innerHTML = ''; // <div>의 컨텐트를 지움.

		let htmlStr = '';

		for (let comment of data) // data에서 뽑아오는 comment
		{
			console.log(comment);

			// Timestamp 타입 값을 날짜/시간 타입 문자열로 변환:
			const time = new Date(comment.time).toLocaleString();

			let userCheckHTML = '';
			if (comment.nickname === 'ada') {
				userCheckHTML = `
        <div id="userCheck">
          <button class="btnDelete" data-id="${comment.commentId}">
            삭제
          </button>
          <button class="btnUpdate" data-id="${comment.commentId}">
            수정
          </button>
        </div>
      `;
			}

			htmlStr += `
      <div class="card">
        <div id="commentcontent">
          <span class="d-none">${comment.commentId}</span>
          <span class="fw-bold">${comment.nickname}</span>
          <span class="text-secondary">(${time})</span>
        </div>
        <div>
          <textarea id="writrings">${comment.content}</textarea>
        </div>
        ${userCheckHTML}
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


	const showComment = (e) => {
		const btn = e.target;
		const card = btn.closest('.card');
		const textarea = card.querySelector('textarea');
		const btnSave = document.createElement('button');
		btnSave.textContent = '수정 완료';
		btnSave.classList.add('btnSave');
		btnSave.dataset.id = btn.dataset.id;
		const btnCancel = document.createElement('button');
		btnCancel.textContent = '수정 취소';
		btnCancel.classList.add('btnCancel');

		textarea.readOnly = false;
		textarea.classList.add('editable');
		btn.disabled = true;
		btn.style.display = 'none';

		card.appendChild(btnSave);
		card.appendChild(btnCancel);

		btnSave.addEventListener('click', updateComment);
		btnCancel.addEventListener('click', cancelComment);
	};

	function cancelComment(event) {
		const btnCancel = event.target;
		const card = btnCancel.closest('.card');
		const textarea = card.querySelector('.editable');
		const btnUpdate = card.querySelector('button.btnUpdate');

		textarea.readOnly = true;
		textarea.classList.remove('editable');
		btnUpdate.disabled = false;
		btnUpdate.style.display = '';
		btnSave.remove();
		btnCancel.remove();
	}


	function updateComment(event) {
		const btnSave = event.target;
		const card = btnSave.closest('.card');
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