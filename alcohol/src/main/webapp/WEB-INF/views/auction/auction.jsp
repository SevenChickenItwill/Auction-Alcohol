
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>경매 관리</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" 
              crossorigin="anonymous">
	</head>
	<body>
	<div>
        <header>
            <h1>경매 관리 페이지</h1>
            <h4>***님 반갑습니다</h4>
        </header>
        
        <br />
        
        <main>
            <div>
                <input id="auctionSearch" type="text" />
                <button id="btnAuctionSearch">검색하기</button>
                
                <button id="btnAuctionRegistration">
                <c:url var="auctionRegistration" value="/auction/registration" />
                <a href="${ auctionRegistration }">경매등록</a>
                </button>
            </div>
            
            <div>
                <table>
                    <thead>
                        <tr>
                            <th>상태</th>
                            <th>경매명</th>
                            <th>상품</th>
                            <th>즉시낙찰가</th>
                            <th>현재입찰가</th>
                            <th>입찰횟수</th>
                            <th>실낙찰가</th>
                            <th>경매시작일</th>
                            <th>경매종료일</th>
                        </tr>
                    </thead>
                    
                    <tbody id="auctionlist">
                        <c:forEach var="list" items="${ auctionlist }">
                            <tr>
                                <c:if test="${ list.status == 0 }">
                                    <td>경매 준비중</td>
                                </c:if>
                                <c:if test="${ list.status == 1 }">
                                    <td>경매 진행중</td>
                                </c:if>
                                <c:if test="${ list.status == 2 }">
                                    <td>경매 종료</td>
                                </c:if>
                                <td class="d-none">${ list.aid }</td>
                                <td>
                                <c:url var="detail" value="/auction/detail">
                                    <c:param name="aid" value="${ list.aid }"></c:param>
                                </c:url>
                                <a href="${ detail }">${ list.auctionName }</a></td>
                                <td>${ list.pname }</td>
                                <td>${ list.passbid }</td>
                                <td>${ list.nowbid }</td>
                                <td>${ list.bidcount }</td>
                                <td>${ list.successbid }</td>
                                <td>${ list.auctionStart }</td>
                                <td>${ list.auctionEnd }</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>                
            </div>
        </main>
        
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" 
                crossorigin="anonymous">
        </script>
        <script src="../static/js/auction-management.js"></script>
    </div>    
	</body>
</html>