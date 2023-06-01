<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Payment</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" 
            rel="stylesheet" 
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" 
            crossorigin="anonymous">
</head>

<body>
	<h1>주문/결제 정보 상세보기 페이지</h1>	
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
            <ul class="navbar-nav bg-light">
                <li class="nav-item">
                    <c:url var="informationPage" value="/payment/information" />
                    <a class="nav-link" href="${ informationPage }">결제 확인 페이지</a>
                </li>
            </ul>
        </nav>
        
        <main class="my-2">
            <div class="card">
                <table class="card-body table table-hover">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>판매자</th>
                            <th>수량</th>
                            <th>상품정보</th>
                            <th>상품가격</th>
                            <th>총 결제 금액</th>
                            <th>구매자</th>
                            <th>결제 날짜</th>
                            <th>구매 날짜</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </main>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" 
            crossorigin="anonymous">
        </script>
</body>
</html>