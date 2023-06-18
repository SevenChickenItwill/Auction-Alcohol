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
.p-3 {
    padding: 2rem!important;
}
li{
	font-size:large;
	font-weight:bold;
	padding-bottom: 35px;
}
.container {
    
    width: 100%;
  }
  .navbar {
    background-color: #000;
    color: #fff;
  }

  .navbar .navbar-nav .nav-link {
    color: #fff;
  }


.scrollable-table-container {
	height: 300px;
	overflow-y: scroll;
}

.scrollable-table {
	width: 100%;
	border-collapse: collapse;
}

.scrollable-table th, .scrollable-table td {
	padding: 8px;
	border: 1px solid #ccc;
	

}
#modals{
	position: fixed;
    

}
.sidebar{
    position: absolute;
    top: 60px;
    left: 0;
    height: 100%;
    width: 240px;
    

}
.mains{
    margin-right: 220px;
    margin-left: 380px;
    
}

.headers{
    margin: 0px 270px;
    
}
body{

	background-color: light;
}
</style>
</head>
<body>

<div id="sidebar" class="flex-shrink-0 p-3 bg-light sidebar">
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
    <li>
        <c:url var="auctionadmin" value="/auction" />
        <a href="${ auctionadmin }" class="nav-link link-dark list-group-item list-group-item-action">
          관리자 메인
        </a>
      </li>
      <li class="nav-item">
        <c:url var="auctionProduct" value="/auction/product" />
        <a href="${ auctionProduct }" class="nav-link link-dark list-group-item list-group-item-action" aria-current="page">
          경매 상품조회/수정
        </a>
      </li>
      <li>
        <c:url var="productcreate" value="/auction/productcreate" />
        <a href="${ productcreate }" class="nav-link link-dark rounded border-0 list-group-item list-group-item-action">
          경매 상품등록
        </a>
      </li>
      <li>
        <c:url var="auctionm" value="/auction/auction" />
        <a href="${ auctionm }" class="nav-link link-dark list-group-item list-group-item-action">
          경매 조회/수정
        </a>
      </li>
      <li>
        <c:url var="auctionRegistration" value="/auction/registration" />
        <a href="${ auctionRegistration }" class="nav-link link-dark list-group-item list-group-item-action">
          경매 등록
        </a>
      </li>
            <li>
      	<c:url var="shopproducts" value="/shop/pdlist" />
        <a href="${ shopproducts }" class="nav-link link-dark list-group-item list-group-item-action">
          쇼핑몰 상품조회
        </a>
      </li>
      <li>
      	<c:url var="shopcreate" value="/shop/pdcreate" />
        <a href="${ shopcreate }" class="nav-link link-dark list-group-item list-group-item-action">
          쇼핑몰 상품등록
        </a>
      </li>
      <li>
      	<c:url var="shopcreate" value="/shop/pdcreate" />
        <a href="#" class="nav-link link-dark list-group-item list-group-item-action">
          쇼핑몰 주문현황
        </a>
      </li>
    </ul>
    
    
  </div>
    
                <div class="container" style="width: 100%; max-width: 9999px">
  <header>
		<div class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container" style="width: 100px;">
				<a href="#" class="navbar-brand d-flex align-items-center"> 
				
						<path
							d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
						<circle cx="12" cy="13" r="4"></circle></svg> <strong style="text-align: center;">칠면주조 경매 리스트</strong>
				</a>
				
				
			</div>
			
<nav class="nav nav-pills flex-column flex-sm-row">
   <a style="margin-left:80px; color:white; font-weight: bold;" class="flex-sm-fill text-sm-center nav-link" href="#">Shop</a>
  <a style="margin-left:80px; color:white; font-weight: bold;" class="flex-sm-fill text-sm-center nav-link" href="/alcohol/auction/auctionlist">Auction</a>
  <a style="margin-left:80px; color:white; font-weight: bold;" class="flex-sm-fill text-sm-center nav-link" href="/alcohol/bulletinboard/board/list?num=0">Board</a>
  <a style="margin-left:80px; color:white; font-weight: bold;" class="flex-sm-fill text-sm-center nav-link" href="#">MyPage</a>
  <a style="margin-left:437px; color:white; font-weight: bold; font-size: large;" class="flex-sm-fill text-sm-center nav-link">{${ sessionScope.userNickname } 님}</a>
  <c:url var="logout" value="/account/logout"></c:url>
      	<a style="color:white; font-weight: bold;" class="flex-sm-fill text-sm-center nav-link" href="${ logout }">로그아웃</a>
</nav>
		</div>
		<input class="card d-none" type="text" id="userid" name="userid" value="${ sessionScope.userNickname }" readonly="readonly"/>
	</header>
</div>
    
	<div class="mainsite mains">
        
        
        <br />
        
		<div class="card">
            <c:url var="auctionupdate" value="/auction/update">
               <c:param name="aid" value="${ detail.aid }" />
            </c:url>
            <form id="forms" name="forms" >
                <div>
                    <input class="d-none" type="number" id="aid" name="aid" readonly value="${ detail.aid }" />
                </div>
                <div>
                    
                    <input type="text" id="auctioneer" value="${ detail.auctioneer }" name="auctioneer" class="d-none" readonly="readonly"/>
                </div>
                <div>
                    <label class="form-label mx-2" for="auctionName">경매명</label>
                    <input class="form-control" value="${ detail.auctionName }" id="auctionName" name="auctionName" type="text" />
                </div>
                
                <div>
                    <label class="form-label mx-2" for="pname">상품명</label>
                    <input class="form-control" value="${ detail.pname }" id="pname" name="pname" type="text"  />
                    <button class="card btn" id="btnsearch">내 상품 찾기</button>
                </div>
                <div>
                    <label class="form-label mx-2" for="constructor">제조사(생산자)</label>
                    <input class="form-control" value="${ detail.constructor }" id="constructor" name="constructor" type="text" readonly="readonly" />
                </div>
                <div>
                    <label class="form-label mx-2" for="brandname">브랜드</label>
                    <input class="form-control" value="${ detail.brandname }" id="brandname" name="brandname" type="text" readonly="readonly" />
                </div>
                <div>
                    <label class="form-label mx-2" for="category">종류</label>
                    <input class="form-control" value="${ detail.category }" id="category" name="category" type="text" readonly="readonly" />
                </div>
                <div>
                    <label class="form-label mx-2" for="passBid">즉시 낙찰가</label>
                    <input class="form-control" value="${ detail.passbid }" id="passbid" name="passbid" type="number"  />
                </div>
                <div>
                    <label class="form-label mx-2" for="auctionStart">경매 시작일</label>
                    <input class="form-control" value="${ detail.auctionStart }" id="auctionStart" name="auctionStart" type="datetime-local"  />
                </div>
                <div>
                    <label class="form-label mx-2" for="auctionEnd">경매 종료일</label>
                    <input class="form-control" value="${ detail.auctionEnd }" id="auctionEnd" name="auctionEnd" type="datetime-local"  />
                </div>
                <div>
                    <!-- 현재 입찰가(시작가) -->
                    <label class="form-label mx-2" for="nowbid">입찰가액</label>
                    <input class="form-control" value="${ detail.nowbid }" id="nowBid" name="nowBid" type="number" readonly="readonly" />
                </div>
                <div>
                    <!-- 현재 입찰자 -->
                    <label class="form-label mx-2" for="bidder">입찰자</label>
                    <input class="form-control" value="${ detail.bidder }" id="bidder" name="bidder" type="text" readonly="readonly" />
                </div>
                <div>
                    <!-- status -->
                    <label class="form-label mx-2" for="status">경매 상태</label>
                    <select class="form-control" name = "status" id="status">
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
                    <button id="btnupdates" class="btn btn-outline-success form-control">수정</button>
                    
                    <button id="btndelete" data-v="${ detail.aid }" class="btn btndelete btn-outline-danger form-control">삭제</button>
                    </c:if>
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
        <script src="../static/js/auction-modify.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" 
                crossorigin="anonymous">
        </script>    
	</body>
</html>