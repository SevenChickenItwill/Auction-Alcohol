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
              <style>
    .scrollable-table-container {
        height: 200px;
        overflow-y: scroll;
    }
    
    .scrollable-table {
        width: 100%;
        border-collapse: collapse;
    }
    
    .scrollable-table th,
    .scrollable-table td {
        padding: 8px;
        border: 1px solid #ccc;
    }
</style>
	</head>
	<body>
	<div>
        <header>
            <h1>경매 관리 페이지</h1>
            <h4>***님 반갑습니다</h4>
        </header>
        
        <br />
        
        <main>
            <div class="card">
            	<c:url var="search" value="/auction/auction">
            	</c:url>
            	<form method="post" action="${ search }" id="searchForm">
            	<label class="form-control" for="searchtext">검색 내용</label>
                <input class="card form-control" name="searchtext" id="searchtext" type="text" />
                <input class="d-none" type="text" name="userid" value="test" />
                <input class="btn form-control" type="submit" id="btnAuctionSearch" value="검색" />
                </form>
            </div>
            <div class="card" >
            	<input class="form-control" type="date" id="auctionstart" name="auctionstart"/>
            	<input class="form-control" type="date" id="auctionend" name="auctionend" />
            	<select class="form-control" name="status" id="status">
            		<option value="0">경매 준비중</option>
            		<option value="1">경매 진행중</option>
            		<option value="2">경매 완료</option>
            	</select>           	
            	<select class="form-control" id="category" name="category">
						<option selected="selected" value="1">탁주</option>
						<option value="2">약주</option>
						<option value="3">청주</option>
						<option value="4">맥주</option>
						<option value="5">과실주</option>
						<option value="6">소주</option>
						<option value="7">위스키</option>
						<option value="8">브랜디</option>
						<option value="9">증류주</option>
						<option value="10">리큐르</option>
						<option value="11">주정</option>
						<option value="12">기타주류</option>
					</select>
            </div>
            <div>
            	<button>상세검색</button>
            </div>
            <div>
                
                
                <button class="btn" id="btnAuctionRegistration">
                <c:url var="auctionRegistration" value="/auction/registration" />
                <a href="${ auctionRegistration }">경매등록</a>
                </button>
            </div>
            
            <div class="scrollable-table-container">
                <table class="scrollable-table">
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