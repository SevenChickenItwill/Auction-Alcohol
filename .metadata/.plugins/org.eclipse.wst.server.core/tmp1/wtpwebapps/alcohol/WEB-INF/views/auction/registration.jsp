<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Auction</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" 
              crossorigin="anonymous">
	</head>
	<body>
	<div>
        <header>
            <h1>경매 등록 페이지</h1>
        </header>
        
        <br />
        
		<div>
            <c:url var="postRegistration" value="/auction/registration"/>
            <form action="${ postRegistration }" method="post">
                <div>
                    <!-- TODO: value test -> ${id}로 바꾸기 -->
                    <input id="id" value="test" class="d-none"/>
                </div>
                <div>
                    <label for="auctionName">경매명</label>
                    <input id="auctionName" type="text">
                </div>
                <div>
                    <label for="pName">상품명</label>
                    <input id="pName" type="text">
                    <button id="btnProductSearch">내 상품 찾기</button>
                </div>
                <div>
                    <label for="passBid">즉시 낙찰가</label>
                    <input id="passBid" type="number">
                </div>
                <div>
                    <label for="auctionStart">경매 시작일</label>
                    <input id="auctionStart" type="datetime-local">
                </div>
                <div>
                    <label for="auctionEnd">경매 종료일</label>
                    <input id="auctionEnd" type="datetime-local">
                </div>
                <div class="d-none">
                    <!-- 현재 입찰가(시작가) -->
                    <input id="nowBid" type="number">
                </div>
                <div class="d-none">
                    <!-- 상품코드 -->
                    <input id="productId" type="number">
                </div>
                <div>
                    <input type="submit" value="경매등록">
                </div>
            </form>
        </div>
        
        <div>
            <table>
                <thead>
                    <tr>
                        <th class="d-none">상품코드</th>
                        <th>상품명</th>
                        <th>제조사(생산자)</th>
                        <th>브랜드</th>
                        <th>종류</th>
                        <th>원가</th>
                    </tr>
                </thead>
                <tbody id="productTboby">
                    
                </tbody>
            </table>
        </div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" 
                crossorigin="anonymous">
        </script>
    </div>    
	</body>
</html>