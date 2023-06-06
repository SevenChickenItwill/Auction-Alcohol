<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>경매 관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
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

.scrollable-table th, .scrollable-table td {
	padding: 8px;
	border: 1px solid #ccc;
	

}
#modals{
	position: fixed;
    margin-left: 220px;

}
.sidebar{
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 200px;
    

}
.mains{
    margin-left: 220px;
}

.headers{
    margin-left:220px;
}
</style>
</head>
<body>

<div class="flex-shrink-0 p-3 bg-light sidebar" style="width: 200px;">
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
        <c:url var="auctionadmin" value="/auction" />
        <a href="${ auctionadmin }" class="nav-link link-dark">
          관리자 메인
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
  <!-- ----------------------------------------------------------------------------------------------------------------------------------------------------- -->
<div id="modals" class="modal fade" tabindex="-1">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">상세 검색 결과</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="scrollable-table-container">
						<%-- 여기가 Modal의 바디 --%>
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
					<tbody id="responsetable">
						
					</tbody>
						</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	
	<div>
        <div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="/alcohol/auction" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <span class="fs-4">경매 관리 페이지</span>
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
		

		<br />

		<main class="mains">
			<div class="card">
				<c:url var="search" value="/auction/auction">
				</c:url>
				<form method="post" action="${ search }" id="searchForm">
					<label class="form-label card" for="searchtext">검색 내용</label> 
					<input class="card form-control" name="searchtext" id="searchtext" type="text" /> 
					<input class="d-none" type="text" name="userid"	value="test" /> 
					<input class="btn form-control" type="submit" id="btnAuctionSearch" value="검색" />
				</form>
			</div>
			<div class="card">
				<div class="form-control">
					<span><h2>상세 검색 Form</h2></span> <input class="form-control"
						type="date" id="auctionstart" name="auctionstart" />
				</div>
				<div class="form-control">
					<input class="form-control" type="date" id="auctionend"
						name="auctionend" />
				</div>
				<div class="form-control">
					<select class="form-control" name="status" id="status">
						<option selected="selected" value="3">선택안함</option>
						<option value="0">경매 준비중</option>
						<option value="1">경매 진행중</option>
						<option value="2">경매 완료</option>
					</select>
				</div>
				<div class="form-control">
					<select class="form-control" id="category" name="category">
						<option selected="selected" value="0">선택안함</option>
						<option value="1">탁주</option>
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
				<div class="form-control">
					<div class="form-control">
						<label for="minimum">금액 범위</label> <input type="number"
							id="minimum" name="minimum" value="10000" /> ~ <input
							type="number" id="maximum" name="maximum" value="1000000" />
					</div>
				</div>
				<div class="form-control">
					<label for="searchtext">상세 검색 내용</label> <select id="textoption"
						name="textoption">
						<option value="1">상품명</option>
						<option value="2">경매명</option>
						<option value="3">상품,경매명</option>
					</select>
				</div>
				<div class="form-control">
					<label for="searchtext2">상세검색명</label> <input type="text"
						id="searchtext2" name="searchtext2" class="card form-control" />
				</div>

				<div class="form-control">
					<button class="btn" id="btnDetailSearch">상세검색</button>
				</div>
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
								<td><c:url var="detail" value="/auction/detail">
										<c:param name="aid" value="${ list.aid }"></c:param>
									</c:url> <a href="${ detail }">${ list.auctionName }</a></td>
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
		
		
		 <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous">
			
		</script>
		<script src="../static/js/auction-management.js"></script>
	</div>
</body>
</html>