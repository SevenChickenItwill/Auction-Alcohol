<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 메인 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
	
	<style>
    .card {
      width: 200px;
      height: 300px;
      background-color: #f2f2f2;
      border: 1px solid #ccc;
      border-radius: 4px;
      margin-left: 50px;
      margin-right: 50px;
      margin-top: 50px;
      margin-bottom: 50px;
      float: left;
    }

    .card:last-child {
      margin-right: 0;
    }
  </style>
</head>

<body>
	<header>
		<div id="p-header" class="mobile-content-hide header-hover"
			style="border-bottom: 1px solid rgba(255, 255, 255, 0.2); padding: 0px; background-color: black;">
			<div class="layout-row" style="background-color: transparent">
				<nav class="hearder-top"
					style="display: flex; justify-content: space-between; align-items: center; padding: 20px 0px;">
					

					<div class="my-nav"
						style="position: absolute; left: 50%; transform: translateX(-50%);">
						<ul class="prd_cate" style="display: flex; column-gap: 50px;">
							<li><a href="/brand/index.html">커뮤니티</a></li>
							<li class="gnb-shop" style="cursor: pointer;"><a> SHOP </a>
								<img class="gnb-shop-arrow"
								src="/web/upload/onns/shop_arrow.svg" alt=""> &nbsp;
								<div class="gnb-shop-nav"
									style="display: none; position: absolute; left: 50%; transform: translateX(-50%); padding: 46px 0px; transition: padding 1s ease 0s;">
									<ul class="gnb-cate"
										style="display: flex; column-gap: 40px; margin: 0px 100px;">
										<li><a class="gnb-shop-sub-title"
											href="/product/wonsoju_list.html?cate_no=43&amp;display_group=1&amp;page=1#none">WONSOJU</a></li>
										<li><a class="gnb-shop-sub-title"
											style="white-space: nowrap;"
											href="/product/set_list.html?cate_no=45&amp;display_group=1&amp;page=1#none">SPECIAL
												EDITION</a></li>
										<li><a class="gnb-shop-sub-title"
											href="/product/acc_list.html?cate_no=44&amp;display_group=1&amp;page=1#none">ACC</a></li>
									</ul>
								</div></li>
							<li><a href="/board/gallery/list.html?board_no=12">PROJECT</a></li>
							<li><a href="/board/gallery/list.html?board_no=8">PRESS</a></li>
						</ul>
					</div>

					<nav class="my-nav" style="display: none;">
						<ul
							class="xans-element- xans-layout xans-layout-statelogoff member ">
							<li><a href="#none" class="menu-slide-cate"
								data-link="/member/login-side.html"
								style="font-family: Pretendard, serif; margin-right: 20px;">LOGIN</a></li>
						</ul>
						<ul class="util">
							<li class="cate-down-x"><a href="#none"
								class="menu-slide-cate" data-link="/myshop/index-side.html">ACCOUNT</a></li>



							<li
								class="xans-element- xans-layout xans-layout-statelogoff cate-down-x cart-count "><a
								href="#none" class="menu-slide-cate"
								data-link="/order/basket-side.html">CART<span
									class="count EC-Layout_Basket-count-display">(<span
										class="EC-Layout-Basket-count">0</span>)
								</span></a></li>

							<li><a href="#none" class="search-open">SEARCH</a></li>
						</ul>
					</nav>
					
				</nav>
			</div>
			<div class="gnb-shop-nav-contain"
				style="border-top: 1px solid rgba(255, 255, 255, 0.2); height: 0px; transition: all 0.25s ease;"></div>

			<form id="searchBarForm" name="" action="/product/search.html"
				method="get" target="_self" enctype="multipart/form-data">
				<input id="banner_action" name="banner_action" value=""
					type="hidden">
				<div class="xans-element- xans-layout xans-layout-searchheader ">
	
					<a href="#none" class="search-close"><i class="ti-close"></i></a>
					<div class="searchheader-wrap color">
						<div class="td">
							<div class="search-wrap">
								<span class="textHolder" style="display: none;">Start
									Searching</span> <input id="keyword" name="keyword" fw-filter=""
									fw-label="검색어" fw-msg="" class="inputTypeText"
									placeholder="Start Searching"
									onmousedown="SEARCH_BANNER.clickSearchForm(this)" value=""
									type="text"> <span alt="검색" class="go"
									onclick="SEARCH_BANNER.submitSearchBanner(this); return false;">GO</span>
								<div class="guide-word">
									<div class="ko">검색어를 입력하시고 엔터를 누르세요.</div>
									<div class="eng">Enter keywords and press Return to
										search.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="menu-slide-bg ease"></div>
		</div>
	</header>
	
		<c:url var="detailPage" value="/shop/shopdetail">
			<c:param name="id" value="${shop.board_id }"></c:param>
		</c:url>
	<a href="${ detailPage }">
	<div class="card" style="width: 18rem;">
		<div class="card-body">
			<h5 class="card-title">원소주</h5>
		<img src="..." class="card-img-top" alt="...">
		</div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">WON SOJU TO GO PACKAGE</li>
			<li class="list-group-item">비오는 날엔 파전에 막걸리</li>
			<li class="list-group-item">KRW: 3,000\</li>
		</ul>
	</a>
		<div class="card-body">
			<a href="#" class="card-link">구매하기</a>
		</div>
	</div>
	
	<div class="card-footer">
					<div class="d-flex justify-content-center">
						<button class="mx-1 btn btn-outline-danger" id="btnCencle">수정취소</button>
						<button class="mx-1 btn btn-outline-success" id="btnUpdate">수정하기</button>				
					</div>
				</div>


</body>
</html>