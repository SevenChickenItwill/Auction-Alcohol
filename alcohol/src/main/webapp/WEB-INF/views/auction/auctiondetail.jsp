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
            <h1>경매 상세보기 페이지</h1>
            
        </header>
        
        <br />
        
		<div class="card">
            <c:url var="auctionmodify" value="/auction/modify">
                <c:param name="aid" value="${ aid }" />
            </c:url>
            <form action="${ auctionmodify }" method="get">
                <div>
                    <input id="aid" name="aid" readonly value="${ detail.aid }" />
                </div>
                <div>
                    
                    <input id="auctioneer" value="${ detail.auctioneer }" name="auctioneer" class="d-none" readonly="readonly"/>
                </div>
                <div>
                    <label for="auctionName">경매명</label>
                    <input value="${ detail.auctionName }" id="auctionName" name="auctionName" type="text" readonly="readonly" />
                </div>
                
                <div>
                    <label for="pname">상품명</label>
                    <input value="${ detail.pname }" id="pname" name="pname" type="text" readonly="readonly" />
                    <!-- <button id="btnProductSearch">내 상품 찾기</button>  -->
                </div>
                <div>
                    <label for="constructor">제조사(생산자)</label>
                    <input value="${ detail.constructor }" id="constructor" name="constructor" type="text" readonly="readonly" />
                </div>
                <div>
                    <label for="brandname">브랜드</label>
                    <input value="${ detail.brandname }" id="brandname" name="brandname" type="text" readonly="readonly" />
                </div>
                <div>
                    <label for="category">종류</label>
                    <input value="${ detail.category }" id="category" name="category" type="text" readonly="readonly" />
                </div>
                <div>
                    <label for="passBid">즉시 낙찰가</label>
                    <input value="${ detail.passbid }" id="passbid" name="passbid" type="number" readonly="readonly" />
                </div>
                <div>
                    <label for="auctionStart">경매 시작일</label>
                    <input value="${ detail.auctionStart }" id="auctionStart" name="auctionStart" type="datetime-local" readonly="readonly" />
                </div>
                <div>
                    <label for="auctionEnd">경매 종료일</label>
                    <input value="${ detail.auctionEnd }" id="auctionEnd" name="auctionEnd" type="datetime-local" readonly="readonly" />
                </div>
                <div>
                    <!-- 현재 입찰가(시작가) -->
                    <label for="nowbid">입찰가액</label>
                    <input value="${ detail.nowbid }" id="nowBid" name="nowBid" type="number" readonly="readonly" />
                </div>
                <div>
                    <!-- 현재 입찰자 -->
                    <label for="bidder">입찰자</label>
                    <input value="${ detail.bidder }" id="nowBid" name="nowBid" type="text" readonly="readonly" />
                </div>
                <div>
                    <!-- status -->
                    <label for="status">경매 상태</label>
                    <input value="${ detail.status }" id="status" name="status" type="text" readonly="readonly" />
                </div>
                <div>
                    <!-- 상품코드 -->
                    <input class="d-none" value="${ detail.productId }" id="productId" name="productId" type="number" readonly="readonly" />
                </div>
                <div>
                    <input type="submit" value="수정 / 삭제" class="btn">
                </div>
            </form>
        </div>
        
        
       
    </div>   
     <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="../static/js/auctiondetail.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" 
                crossorigin="anonymous">
        </script> 
	</body>
</html>