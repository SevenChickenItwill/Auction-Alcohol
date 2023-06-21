/**
 * 상품 상세페이지 댓글 처리 js
 */

 document.addEventListener('DOMContentLoaded', () => {
	 
	 // 등록버튼 처리
	 
	 const commentReg = document.querySelector('button#commentReg');
	 const textareaContent = document.querySelector('textarea#content');
	 const inputUserNickname = document.querySelector('input#userNickname');
	 
	 // 상품 리뷰 갯수
	 const commentCount = document.querySelector('span#CommentCount');
	 
	 const getCommentWithPid = async () => {
		 
		 const pId = document.querySelector('input#productid').value;
		 console.log('pId');
		 // 댓글 요청 URL
		 const reqUrl = `/alcohol/api/pdComment/all/${pId}`;
		 
		 try {
			 const response = await axios.get(reqUrl);
			 console.log(response);
			 makeCommentElements(response.data);
		 } catch (error) {
			 console.log(error);
		 }
	 }
	 
	 const deleteReply = (e) => {
		 console.log(e.target);
	
		if (!confirm('정말 삭제할까요?')) {
			return;
		}

		// 삭제할 댓글 아이디
		const idval = e.target;
		let id = idval.getAttribute('data-id');
		console.log(id);
		// 삭제 요청 URL
		const reqUrl = `/alcohol/api/pdComment/${id}`;
		// 삭제 요청을 Ajax 방식으로 보내기
		axios.delete(reqUrl)
			.then((response) => {
				console.log(response);
				alert('댓글 삭제 성공');
				getCommentWithPid(); // 댓글 목록 갱신.
			})
			.catch((error) => {
				console.log(error);
			});

	};
		 
	 
	 
	 
	 // 댓글 목록 표시
	 const replies = document.querySelector('div#replies');
	 
	 // productcomment domain 데이터를 받아서  String 형식을 html에 저장, 추가.
	 const makeCommentElements = (data) => {
		 const userNickname = document.querySelector('input#userNickname').value;
		 
		// 댓글 개수 업데이트
		commentCount.innerHTML = data.length; // 배열 원소 갯수
		
		replies.innerHTML = ''; // 등록 밑 댓글 내용 지움
		
		let htmlStr = '';
		
		for (let comment of data) {
			console.log(comment);
			
			const time = new Date(comment.time).toLocaleDateString();
			
			// userCheckHTML의 값을 빈 값으로 일단 설정한 뒤
			let userCheckHTML = '';
			// 조건문을 먹여 닉네임 일치 시 삭제 수정 버튼을 보여줌
			if (comment.nickname === userNickname) {
				userCheckHTML = `
				<div id="userCheck">
				<button class="btnDelete btn btn-secondary" style="font-size: 16px; padding: 10px; width: 60px;" data-id="${comment.commentId}">
           		 삭제
         		</button>
          		<button class="btnUpdate btn btn-secondary" data-id="${comment.commentId}" style="font-size: 16px; padding: 10px; width: 60px;">
           		 수정
          		</button>
        	</div>
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
			`
		}
		replies.innerHTML = htmlStr;
		
		// 모든 수정, 삭제 버튼 찾기
		const deleteButtons = document.querySelectorAll('button.btnDelete');
		for (let btn of deleteButtons) {
			btn.addEventListener('click', deleteReply);
		}
		const updateButtons = document.querySelectorAll('button.btnUpdate');
		for (let btn of updateButtons) {
			btn.addEventListener('click', showComment);
		}
	 }
	 
	 // 댓글 수정
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
	}


	function updateComment(event) {
		const btnSave = event.target;
		const card = btnSave.closest('.cardDiv');
		const textarea = card.querySelector('.editable');
		const btnCancel = card.querySelector('.btnCancel');
		const updateButton = card.querySelector('button.btnUpdate');
		const commentId = btnSave.dataset.id;
		const updatedContent = textarea.value;

		const reqUrl = `/alcohol/api/pdComment/${commentId}`;
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
				getCommentWithPid(); // 댓글 목록 갱신
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
		const pId = document.querySelector('input#productid').value;
		const content = textareaContent.value;
		const nickname = inputUserNickname.value;
		const pname = document.querySelector('input#productname').value;

		const data = { pid: pId, content, nickname, pname };

		const createUrl = '/alcohol/api/pdComment';

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
				getCommentWithPid();
			})
			.catch((error) => {
				console.log(error);
			});
	};
	commentReg.addEventListener('click', createComment);

	getCommentWithPid();
 });