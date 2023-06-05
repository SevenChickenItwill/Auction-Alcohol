<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>Payment</title>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
			crossorigin="anonymous">
	</head>
	
<body>
	<div class="container-fluid">
	   <header class="my-2 p-5 text-center text-bg-dark">
	       <h1>주문/결제 내역 페이지</h1>
	   </header>
	</div>
	
	<div class="card">
		<table>
			<thead>
				<tr>
					<th>상품정보</th>
					<th>구매자</th>
					<th>배송비</th>
					<th>수량</th>
					<th>총 상품금액</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${ posts }" var="post">
					<tr>
						<td>${ post.id }</td>
						<td><c:url var="postDetailPage" value="/post/detail">
								<c:param name="id" value="${ post.id }" />
							</c:url> <a href="${ postDetailPage }">${ post.title }</a>
							 <span class="text-danger">[${ post.rcnt }]</span></td>
						<td>${ post.author }</td>
						<td><fmt:formatDate value="${ post.created_time }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
			
	<ul>
		<li><c:url value="/payment/detail" var="paymentDetail">
				<c:param name="num" value="0" />
			</c:url><a href="${paymentDetail}">주문/결제 내역 상세보기</a>
		</li>
	</ul>
</body>
</html>