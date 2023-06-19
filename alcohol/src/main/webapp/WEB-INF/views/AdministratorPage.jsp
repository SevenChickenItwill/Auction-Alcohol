<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Administrator Page</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    crossorigin="anonymous">
    
<link href="/alcohol/static/css/sidebars.css" rel="stylesheet">
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
    <div style="height: 80px;">
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
  
  <!-- 사이드바아아아아아아아============================================================ -->
		<div class="flex-shrink-0 p-3 bg-white" style="width: 200px;">
    
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
      <li>
      	<c:url var="shopproudocts" value="/shop/pdlist" />
        <a href="${ shopproducts }" class="nav-link link-dark">
          쇼핑몰 상품조회
        </a>
      </li>
      <li>
      	<c:url var="shopcreate" value="/shop/pdcreate" />
        <a href="${ shopcreate }" class="nav-link link-dark">
          쇼핑몰 상품등록
        </a>
      </li>
    </ul>
  </div>
  <!-- ----------------------------------------------------------------------------------------------------------------------------------------------------- -->
    
	
	
        
    </div>
    <main class="mains">
    	<div class="form-control">
    		<div>
    			<h1>금월 쇼핑몰 매출액</h1>
    		</div>
    		<div>
    			<input type="text" height="50px" class="form-control" />
    		</div>
    		<div>
    			<h1>총 쇼핑몰 매출액</h1>
    		</div>
    		<div>
    			<h1>금월 경매 매출액</h1>
    		</div>
    		<div>
    			<h1>총 경매 매출액</h1>
    		</div>
    	</div>
    </main>   
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous">
									
								</script>
        <script src="sidebars.js"></script>
</body>
</html>