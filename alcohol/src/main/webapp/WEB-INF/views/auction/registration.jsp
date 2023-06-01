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
            <form class="card" name="createform" id="createform">
               
                <div class="form-control">
                    <!-- TODO: value test -> ${id}로 바꾸기 -->
                    <input id="id" value="test" name="auctioneer" class="d-none"/>
                </div>
                <div class="form-control">
                    <label for="auctionName">경매명</label>
                    <input id="auctionName" name="auctionName" type="text">
                </div>
                
                <div class="form-control">
                    <label for="pname">상품명</label>
                    <input id="pname" name="pname" type="text">
                    <button class="btn btn-outline-dark" id="btnProductSearch">내 상품 찾기</button>
                </div>
                <div class="form-control">
                    <label for="constructor">제조사(생산자)</label>
                    <input id="constructor" name="constructor" type="text" readonly="readonly">
                </div>
                <div class="form-control">
                    <label for="brandname">브랜드</label>
                    <input id="brandname" name="brandname" type="text" readonly="readonly">
                </div>
                <div class="form-control">
                    <label for="category">종류</label>
                    <input id="category" name="category" type="text" readonly="readonly">
                </div>
                <div class="form-control">
                    <label for="passBid">즉시 낙찰가</label>
                    <input id="passbid" name="passbid" type="number" value="100000">
                </div>
                <div class="form-control">
                    <label for="auctionStart">경매 시작일</label>
                    <input id="auctionStart" name="auctionStart" type="datetime-local">
                </div>
                <div class="form-control">
                    <label for="auctionEnd">경매 종료일</label>
                    <input id="auctionEnd" name="auctionEnd" type="datetime-local">
                </div>
                <div class="d-none">
                    <!-- 현재 입찰가(시작가) -->
                    <input id="nowBid" name="nowBid" type="number">
                </div>
                <div class="form-control">
                    <!-- 상품코드 -->
                    <input class="d-none" id="productId" name="productId" type="number">
                </div>
                <div class="form-control">
                     <button id="btncreateAuction" class="btn btn-outline-dark">경매 등록</button>
                </div>
            </form>
        </div>
        
        <div class="table-responsive">
            <table class="table align-middle">
                <thead>
                    <tr>
                        <th class="d-none">상품코드</th>
                        <th>선택</th>
                        <th>상품명</th>
                        <th>제조사(생산자)</th>
                        <th>브랜드</th>
                        <th>종류</th>
                        <th>원가</th>
                    </tr>
                </thead>
                <tbody id="productTboby" >
                    
                </tbody>
            </table>
        </div>
        
    </div>  
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" 
                crossorigin="anonymous">
        </script>  
        <script src="../static/js/auction-registration2.js"></script>
	</body>
</html>