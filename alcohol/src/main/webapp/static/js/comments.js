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
	const confirmButton = document.querySelector('button#confirmButton');
	
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
			
			// 댓글 1개를 표시할 HTML 코드:
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
                <div id="userCheck">
                    <button class="btnDelete" data-id="${comment.commentId}">
                    삭제</button>
                    <button class="btnUpdate" data-id="${comment.commentId}">수정</button>
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
	
	const updateTest = document.querySelector('textarea#updateTest');
	const updateCommentId = document.querySelector('input#updateCommentId');
	
	const showComment = (e) => {
		console.log(e.target); 
		
		const id = e.target.getAttribute('data-id');
		console.log(id);
		// 수정 요청할 url
		const reqUrl = `/alcohol/api/comment/${id}`;
		
		// 댓글 수정하기 위해서 클릭한 댓글 아이디가 작성한 댓글 불러오기
		axios.get(reqUrl) // @GetMapping("/{commentId}")서버로 Get 방식의 Ajax 요청을 보냄
            .then((response) => {
				console.log(response.data);
                // response에 포함된 data 객체에서 id, replyText 값을 찾음.
                // dto에 있는 data 이름과 똑같이 첫번째 값, 두번째 값을 설정
                // axios는 http요청을 보내고 받은 응답을 response.data에 자동 저장한다.
                // 이 때 response.data에는 CommentController클래스 CommentReadDto의 객체에 저장된 값이 담김. 
                const { commentId, content } = response.data;
                
                updateCommentId.value = commentId;
                updateTest.value = content
                
		})
		.catch((error) => console.log(error));
	};
	
	const updateComment = (e) => {
		// 수정할 댓글 아이디
		const commentId = updateCommentId.value; 
		// 수정할 댓글 내용
		const content = updateTest.value;
		// put 방식의 ajax 요청 
		const reqUrl = `/alcohol/api/comment/${commentId}`;
		const data = { content }; 
		// Ajax 요청에 대한 성공/실패 콜백 등록.
		axios.put(reqUrl, data)
			.then((response) => {
				alert(`댓글 업데이트 성공(${response.data})`);
				getCommentWithBoardId();
			})
			.catch((error) => console.log(error))
		
	};
	
	confirmButton.addEventListener('click', updateComment);
	
	const createBtn = (e) => {
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
				alert('댓글을 등록 성공');
				// 댓글창 비우기
				document.querySelector('textarea#content').value = '';
				// 댓글 목록 새로고침
				getCommentWithBoardId();
			})
			.catch((error) => {
				console.log(error);
			});
	};
	commentReg.addEventListener('click', createBtn);

	getCommentWithBoardId();

});