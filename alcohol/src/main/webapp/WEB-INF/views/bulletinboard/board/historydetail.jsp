<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous" />
</head>
</head>
<body>
	<h1>�󼼺��� ������</h1>
	<div>
		<c:url var="historylist" value="/bulletinboard/board/historylist">
			<c:param value="${board.nickname}" name="nickname" />
		</c:url>
		<a type="button" href= "${historylist}">�ڷΰ���</a>
	</div>
	
	<main>
		
		<input type="text" class="d-none" value="${ sessionScope.userEmail }" id="loginId" />
		
		<section>
			<form id="boardForm">
				<input type="number" class="d-none" value="${ board.board_id }" id="boardId"
					name="board_id" />
				<div class="container">
					<div class="row">
						<div class="col-lg-8 offset-lg-2 mt-5">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">${ board.title }</h5>
									<p class="card-text">${ board.nickname }(${ board.user_id })
										${ board.time }</p>
									<p class="card-text" >
										<span>��ȸ�� : [${ board.views }]</span>
										<span id="recommendCnt">��õ�� : [${ board.recommend }]</span>
										<span>���[����]</span>
									</p>
									<img src="data:image/jpeg;base64,${ image }" alt="�̹���" />
									<p class="card-text">${ board.content }</p>
									
										<div>
											<input type="button" value="��õ" id="recommendUp" />
											<input type="button" value="����õ" id="recommendDo" />
										</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
				<span> 
				<c:url var="boardModify" value="/bulletinboard/board/modify">
					<c:param name="id" value="${ board.board_id }"></c:param>
				</c:url> 
				<a href="${ boardModify }">�����ϱ�</a> 
				<a id="deleteBtn">�����ϱ�</a>
				</span>
			  <div>
                 <!-- ��� ��� ������ ���� -->
                    <span>���</span>
                    <span id="commentCount"></span>
                </div>
                
                
                
                <div>
                ��� ���� �׽�Ʈ
                </div>
                <div>
                <input id="updateCommentId" type="hidden"/>
                </div>
                 
                
                
                <div>
                    <input value="test33" id="userNickname" readonly/>
                </div>
                <div>
                    <textarea class= "col-5" placeholder="��� ����" id="content"></textarea>
                </div>
                <div>
                	<button id="commentReg" >���</button>
                </div>
                
                
                <div id="replies"></div>

				
			
		</section>
		

	</main>
	
	<div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="../../static/js/board-history.js"></script>
</body>
</html>