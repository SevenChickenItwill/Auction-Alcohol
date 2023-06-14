<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>게시글 이력</h1>
		<table>
			<thead>
				<tr>
					<th>게시글 번호</th>
					<th>제목</th>
					<th>작성자</th><!-- boardId, nickname -->
					<th>내용</th>
					<th>작성시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ histories }" var="history">
				<tr>
					<td>${ history.board_id }</td>
					<td>
						<c:url var="postDetailPage" value="/bulletinbaord/board/historydetail">
							<c:param name="id" value= "${ history.board_id }" />
						</c:url>
						<a href="${ postDetailPage }">${ history.title }</a>
					</td>	
					<td>${ history.user_id }(${ history.nickname })</td>
					<td>${ history.time }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
</body>
</html>