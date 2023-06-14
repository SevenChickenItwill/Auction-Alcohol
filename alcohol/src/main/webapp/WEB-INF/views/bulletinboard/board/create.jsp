<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<header>
		<h1>게시글 작성하기</h1>
	</header>

	<main>
		<div>
				<div>
					<div>
						<select name="category" id="category">
							<option value="1">공지사항</option> <!-- if문으로 운영자만 보이게 하기 -->
							<option value="0">글작성</option>
						</select>
					</div>
					<div>
						<label for="nickname">작성자</label> 
<<<<<<< HEAD
						<input type="text" name="nickname" id="nickname" value="${ sessionScope.userNickname }" readonly />
						<input type="text" name="user_id"  id="userId" value="${ sessionScope.userEmail }" readonly />
=======
						<input type="text" name="nickname" id="nickname" value="닉네임:${ sessionScope.userNickname }" readonly />
						<input type="text" name="user_id"  id="userId" value="아이디:${ sessionScope.userEmail }" readonly />
>>>>>>> origin/Taewook5
					</div>
					<div>
						<label for="title">제목</label> 
						<input type="text" name="title" id="title" autofocus required />
					</div>
					<div>
					</div>
					<div>
						<label for="content">내용</label>
						<textarea name="content" id="content" required></textarea>
					</div>
				</div>
				<form id="createForm">
					<label for="image">이미지</label> 
					<input type="file" name="file" id="file" />
				</form>
				<div>
					<input type="submit" id="createBtn" value="작성완료" />
				</div>
				
				
				
		</div>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="../../static/js/board-creates.js"></script>

</body>
</html>