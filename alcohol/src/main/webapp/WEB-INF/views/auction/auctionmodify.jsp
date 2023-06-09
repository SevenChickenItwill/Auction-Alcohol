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
                                <style>
        .sidebars{
        
            position: fixed;
            left:0;
            top:0;
            width:200px;
            height: 100%;
            
        }
        .mainsite{
            margin-left: 220px;
        
        }
    </style>
	</head>
	<body>
    <div class="flex-shrink-0 p-3 bg-white sidebars" style="width: 200px;">
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <c:url var="auctionProduct" value="/auction/product" />
        <a href="${ auctionProduct }" class="nav-link link-dark" aria-current="page">
          경매상품조회/수정
        </a>
      </li>
      <li>
        <c:url var="productcreate" value="/auction/productcreate" />
        <a href="${ productcreate }" class="nav-link link-dark rounded border-0">
          경매상품등록
        </a>
      </li>
      <li>
        <c:url var="auctionManagement" value="/auction/auction" />
        <a href="${ auctionManagement }" class="nav-link link-dark">
          경매조회/수정
        </a>
      </li>
      <li>
        <c:url var="auctionRegistration" value="/auction/registration" />
        <a href="${ auctionRegistration }" class="nav-link link-dark">
          경매등록
        </a>
      </li>
    </ul>
  </div>
    
                <div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="/alcohol/auction" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <span class="fs-4">경매 수정 페이지</span>
      </a>

      <ul class="nav nav-pills">
        <li class="nav-link px-2 link-dark">
        <a href="#" class="nav-link active" aria-current="page">Home</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Features</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
        <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
        <li class="nav-item"><a href="#" class="nav-link">About</a></li>
        <li class="nav-item">*** 님</li>
      </ul>
    </header>
  </div>
    
    
	<div class="mainsite">
        
        
        <br />
        
		<div class="card">
            <c:url var="auctionupdate" value="/auction/update">
               <c:param name="aid" value="${ detail.aid }" />
            </c:url>
            <form id="forms" name="forms" action="${ auctionupdate }" method="post">
                <div>
                    <input type="number" id="aid" name="aid" readonly value="${ detail.aid }" />
                </div>
                <div>
                    
                    <input type="text" id="auctioneer" value="${ detail.auctioneer }" name="auctioneer" class="d-none" readonly="readonly"/>
                </div>
                <div>
                    <label for="auctionName">경매명</label>
                    <input value="${ detail.auctionName }" id="auctionName" name="auctionName" type="text" />
                </div>
                
                <div>
                    <label for="pname">상품명</label>
                    <input value="${ detail.pname }" id="pname" name="pname" type="text"  />
                    <button id="btnProductSearch">내 상품 찾기</button>
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
                    <input value="${ detail.passbid }" id="passbid" name="passbid" type="number"  />
                </div>
                <div>
                    <label for="auctionStart">경매 시작일</label>
                    <input value="${ detail.auctionStart }" id="auctionStart" name="auctionStart" type="datetime-local"  />
                </div>
                <div>
                    <label for="auctionEnd">경매 종료일</label>
                    <input value="${ detail.auctionEnd }" id="auctionEnd" name="auctionEnd" type="datetime-local"  />
                </div>
                <div>
                    <!-- 현재 입찰가(시작가) -->
                    <label for="nowbid">입찰가액</label>
                    <input value="${ detail.nowbid }" id="nowBid" name="nowBid" type="number" readonly="readonly" />
                </div>
                <div>
                    <!-- 현재 입찰자 -->
                    <label for="bidder">입찰자</label>
                    <input value="${ detail.bidder }" id="nowBid" name="nowBid" type="number" readonly="readonly" />
                </div>
                <div>
                    <!-- status -->
                    <label for="status">경매 상태</label>
                    <select name = "status" id="status">
                        <option value="1">경매 진행 확정</option>
                        <option value="0">경매 진행 보류</option>
                    </select>
                </div>
                <div>
                    <!-- 상품코드 -->
                    <input class="d-none" value="${ detail.productId }" id="productId" name="productId" type="number" readonly="readonly" />
                </div>
                <div>
                	<c:if test="${ detail.status < 1 }">
                    <input type="submit" value="수정" class="btn">
                    </c:if>
                    <button id="btndelete" data-v="${ detail.aid }" class="btn btndelete">삭제</button>
                    
                </div>
            </form>
            
        </div>
        <div class="card">
            <table>
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
                <tbody id="productTboby">
                    
                </tbody>
            </table>
        </div>
        
        
    </div>
    <script src="../static/js/auction-delete.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="../static/js/auction-registration2.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" 
                crossorigin="anonymous">
        </script>    
	</body>
</html>