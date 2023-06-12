<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
    crossorigin="anonymous" />
</head>
<body>
    <header>
        <h1>거래 페이지</h1>
    </header>

    <nav>
        <div>
            <ul>
                <c:if test="${ sessionScope.userNickname ne null }">
					<li>
						<c:url value="/bulletinboard/board/create" var="dealCreated" /> 
						<a href="${ dealCreated }">새글작성</a>
					</li>
				</c:if>
                <li><c:url value="/" var="mainPage" /> <a
                    href="${ mainPage }">메인페이지</a></li>
            </ul>
        </div>
    </nav>

    <main>

        <!-- 포스트 테이블 -->

        <div>
            <c:set var="len" value="${ length }"></c:set>
            <c:set var="count" value="${ pageCount }" />
            <c:set var="nums" value="${ param.num }" />
            <c:set var="maxIndex" value="${ maxIndex }" />
			
			<c:if test="${ listSize != 0 }">
			
            <c:forEach items="${ boards }" var="board"
                begin="${ count }" end="${ maxIndex - 1 }">


                <input type="hidden" value="${ board.board_id }"
                    id="boardId" />

                <div class="card mb-3" style="max-width: 540px;">
                    <c:url var="detailPage"
                        value="/bulletinboard/board/detail">
                        <c:param name="id" value="${ board.board_id }"></c:param>
                    </c:url>
                    <a href="${ detailPage }">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <!-- 이미지 -->
                                <img src="data:image/jpeg;base64,${board.image}"
												class="img-fluid rounded-start" alt="이미지">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <!-- 게시글 제목, 게시글 댓글수 -->
                                    <h5 class="card-title">${ board.title }[${ board.views }]</h5>

                                    <!-- 닉네임(아이디) ㅣ 시간 ㅣ 조회수 ㅣ 추천수   대로 나타냄 -->
                                    <p class="card-text">
                                        <small
                                            class="text-body-secondary">${ board.nickname }(${ board.board_id }),
                                            <fmt:formatDate
                                                value="${ board.time }"
                                                pattern="yyyy-MM-dd HH:mm" />,${ board.recommend },[${ board.rcnt }]
                                        </small>
                                    </p>
                                    <p class="card-text">${ board.content }</p>
                                </div>
                            </div>
                        </div>
                </div>
                </a>
            </c:forEach>
            </c:if>
        </div>
		
        <div>
            <c:url var="nextlist" value="/bulletinboard/board/search?pagenum2=${ num }&category=${ category }&keyword=${ keyword }">
                <c:choose>
                    <c:when test="${(nums) * 10 > maxIndex - 10 }">
                        <c:set var="number" value="${nums}" />
                        <c:param name="num" value="${number}"></c:param>
                    </c:when>
                    <c:otherwise>
                        <c:set var="number" value="${nums + 1}" />
                        <c:param name="num" value="${number}"></c:param>
                    </c:otherwise>
                </c:choose>
            </c:url>
            <c:url var="beforelist" value="/bulletinboard/board/search?pagenum2=${ num }&category=${ category }&keyword=${ keyword }">
                <c:choose>
                    <c:when test="${(nums - 1) * 10 < 0 }">
                        <c:set var="number" value="${nums}" />
                        <c:param name="num" value="${number}"></c:param>
                    </c:when>
                    <c:otherwise>
                        <c:set var="number" value="${nums - 1}" />
                        <c:param name="num" value="${number}"></c:param>
                    </c:otherwise>
                </c:choose>

            </c:url>
            <c:url var="indexZero"
                value="/bulletinboard/board/search?pagenum2=0&category=${ category }&keyword=${ keyword }" />
            <a href="${ indexZero }"><button>&lt;&lt;</button></a> <a
                href="${ beforelist }"><button>&lt;</button></a>

            <c:choose>
            	
            	<c:when test="${ listPageMax < 9 }">
            		<c:forEach begin="${ 1 }"
                        end="${ listPageMax }" var="listFor">
                        <c:url var="listPageNum"
                            value="/bulletinboard/board/search?pagenum2=${ listFor - 1 }&category=${ category }&keyword=${ keyword }" />
                        <a href="${ listPageNum }">${ listFor }</a>
                    </c:forEach>
            	</c:when>
            	
                <c:when test="${ (num / 10) * 10 - 4 < 0}">

                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=0&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">1</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=1&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">2</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=2&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">3</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=3&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">4</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=4&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">5</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=5&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">6</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=6&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">7</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=7&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">8</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=8&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">9</a>
                </c:when>



                <c:when test="${ (num / 10) * 10 + 5 > listPageMax  }">

                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=${ listPageMax - 9 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 8 }</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=${ listPageMax - 8 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 7 }</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=${ listPageMax - 7 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 6 }</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=${ listPageMax - 6 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 5 }</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=${ listPageMax - 5 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 4 }</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=${ listPageMax - 4 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 3 }</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=${ listPageMax - 3 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 2 }</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=${ listPageMax - 2 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax - 1 }</a>
                    <c:url var="listPageNum"
                        value="/bulletinboard/board/search?pagenum2=${ listPageMax - 1 }&category=${ category }&keyword=${ keyword }" />
                    <a href="${ listPageNum }">${ listPageMax }</a>

                </c:when>

                <c:otherwise>
                    <c:forEach begin="${ (num / 10) * 10 - 3 }"
                        end="${ (num / 10) * 10 + 5 }" var="listFor">
                        <c:url var="listPageNum"
                            value="/bulletinboard/board/search?pagenum2=${ listFor - 1 }&category=${ category }&keyword=${ keyword }" />
                        <a href="${ listPageNum }">${ listFor }</a>
                    </c:forEach>
                </c:otherwise>

            </c:choose>



            <a href="${ nextlist }"><button>&gt;</button></a>
            <c:url var="maxIndex"
                value="/bulletinboard/board/search?pagenum2=${ listPageMax - 1 }&category=${ category }&keyword=${ keyword }" />
            <a href="${ maxIndex }"><button>&gt;&gt;</button></a>
        </div>
		
        <!-- 검색 -->
        <c:url value="/bulletinboard/board/search" var="searchPage">
            <c:param name="pagenum" value="${ pagenum2 } }" />
        </c:url>
        <form action="${ searchPage }">
        	<input type="number" class="d-none" name="pagenum2" value="0" />
            <select name="category">
                <option value="t">제목</option>
                <option value="c">내용</option>
                <option value="tc">제목 + 내용</option>
                <option value="n">닉네임</option>
                <option value="i">아이디</option>
            </select> <input type="text" name="keyword" placeholder="검색어"
                required /> <input type="submit" value="검색" />
        </form>


    </main>

    <div>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    </div>
</body>
</html>