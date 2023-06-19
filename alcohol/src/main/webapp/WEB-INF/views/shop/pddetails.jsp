<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta charset="UTF-8">
<meta charset="UTF-8">
<title>칠면주조에 오신것을 환영합니다.</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    crossorigin="anonymous">
   	<style>
   		#toBasket {
   			text-decoration: none;
   		}
   	</style>
   	
	</head>
	<body>

		<form id="detailForm">

			<div>닉네임: <input type="text" value="${ sessionScope.userNickname }" name="nickname" id="nickname" readonly="readonly"/></div>
			<div>상품명: <input type="text" value="${ product.productname }" name="productname" id="productname" readonly="readonly"/></div>
			<div><input type="hidden" value="${ product.pid }" name="productid" id="productid" readonly="readonly" /></div>	
			<!-- name은 아규먼트로 넘겨주기 위함 -->
			<!-- 장바구니에 담기 클릭 시 수량 = 0일 경우 수량 선택 필수 alert 작업 js에서 TODO -->
			<div>수량:
			<input type="number" name="quantity" id="quantity" />
			</div>
			<div>가격:<input type="number" value="${ product.price }" name="price" id="price" readonly="readonly"/></div>
			<div>
				<button id="toBasket" name="toBasket">장바구니에 담기</button>
			</div>
		</form>
		
		<!-- 댓글 영역 -->
		<div><span id="CommentCount"></span>개의 상품 리뷰</div>
		<div>사용자 닉네임: 
                    <input value="${ sessionScope.userNickname }" id="userNickname" readonly/>
                </div>
                <div>
                    <textarea class= "col-5" placeholder="댓글 쓰기" id="content"></textarea>
                </div>
                <div>
                	<button id="commentReg" >댓글 등록</button>
                </div>
                
                
                <div id="replies"></div>
		
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script src="../static/js/productComment-detail.js"></script>
		<script src="../static/js/product-detail.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
        
	</body>
	<footer>
		<p>&copy; Alcohol Event Mall of Team Turkey(칠면조). All rights reserved.</p>
	</footer>
</html>