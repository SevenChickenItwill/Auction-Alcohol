/**
 * commnent.js
 * 댓글 목록 불러오기, 수정, 삭제 핸들링
 * /bulletinBoard/board/detail.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {

const deleteReply = (e) => {
        console.log(e.target); // e.target = 삭제 버튼.
        
        if (!confirm('정말 삭제할까요?')) {
            return;
        }
        
        // 삭제할 댓글 아이디
        const id = e.target.getAttribute('data-id');
        // 삭제 요청 URL
        const reqUrl = `/alcohol/api/comment/${id}`;
        // 삭제 요청을 Ajax 방식으로 보내기
        axios.delete(reqUrl)
            .then((response) => {
                console.log(response);
                alert('댓글 삭제 성공');
                getRepliesWithBoardId(); // 댓글 목록 갱신.
            })
            .catch((error) => {
                console.log(error);
            });
        
    };
    
    
	
	const commentCountSpan = document.querySelector('span#commentCount');
	// 댓글 목록 표시
	const replies = document.querySelector('div#replies');

	// comment domain 데이터를 받아서 String 형식을 html에 저장, 추가.
	const makeCommentElements = (data) => {
		// 댓글 개수 업데이트
		commentCountSpan.innerHTML = data.length; // 배열 길이(원소 개수)

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
                    ${comment.content}
                </div>
                <div>
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
		
	}
	

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
	
	getCommentWithBoardId();

});