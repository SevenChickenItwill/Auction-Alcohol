<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <header>
        <h1>거래 페이지</h1>
    </header>

    <nav>
        <div>
            <ul>
                <li><c:url value="/deal/comment/create"
                        var="dealCreated" /> <a href="${ dealCreated }">새글작성</a>
                </li>
                <li><c:url value="/" var="mainPage" /> <a
                    href="${ mainPage }">메인페이지</a></li>
            </ul>
        </div>
    </nav>

    <main>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>제목</th>
                        <!-- 제목[댓글수] -->
                        <th>작성자</th>
                        <!-- 작성자별명(아이디)[랭킹] -->
                        <th>시간</th>
                    </tr>
                </thead>

                <tbody>
                    <c:set var="len" value="${ length }"></c:set>
                    <c:set var="count" value="${ pageCount }" />
                    <c:set var="nums" value="${ param.num }" />
                    <c:set var="maxIndex" value="${ maxIndex }" />

                    <c:forEach items="${ deals }" var="deal"
                        begin="${ count }" end="${ maxIndex - 1 }">
                        <tr>
                            <td>${ deal.id }</td>
                            <td><c:url var="commentDetail"
                                    value="/deal/comment/detail">
                                    <c:param name="id"
                                        value="${ deal.id }" />
                                </c:url> <a href="${ commentDetail }">${ deal.title }</a>
                                <span>[${ deal.rcnt }]</span></td>
                            <td>${ deal.nickname }(${ deal.user_id })[${ deal.user_ranking }]</td>
                            <td><fmt:formatDate
                                    value="${ deal.modified_time }"
                                    pattern="yyyy-MM-dd HH:mm" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div>
            <c:url var="nextlist" value="/deal/comment/comment-list">
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
            <c:url var="beforelist" value="/deal/comment/comment-list">
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
            <a href="${ beforelist }"><button>이전</button></a>

            <c:choose>
                <c:when test="${ (num / 10) * 10 - 4 < 0}">

                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=0" />
                    <a href="${ listPageNum }">1</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=1" />
                    <a href="${ listPageNum }">2</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=2" />
                    <a href="${ listPageNum }">3</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=3" />
                    <a href="${ listPageNum }">4</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=4" />
                    <a href="${ listPageNum }">5</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=5" />
                    <a href="${ listPageNum }">6</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=6" />
                    <a href="${ listPageNum }">7</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=7" />
                    <a href="${ listPageNum }">8</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=8" />
                    <a href="${ listPageNum }">9</a>
                </c:when>



                <c:when test="${ (listSize - 10 * num) < 9 }">

                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=${ listSize - 9 }" />
                    <a href="${ listPageNum }">maxIndex - 8</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=${ listSize - 8 }" />
                    <a href="${ listPageNum }">maxIndex - 7</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=${ listSize - 7 }" />
                    <a href="${ listPageNum }">maxIndex - 6</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=${ listSize - 6 }" />
                    <a href="${ listPageNum }">maxIndex - 5</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=${ listSize - 5 }" />
                    <a href="${ listPageNum }">maxIndex - 4</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=${ listSize - 4 }" />
                    <a href="${ listPageNum }">maxIndex - 3</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=${ listSize - 3 }" />
                    <a href="${ listPageNum }">maxIndex - 2</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=${ listSize - 2 }" />
                    <a href="${ listPageNum }">maxIndex - 1</a>
                    <c:url var="listPageNum"
                        value="/deal/comment/comment-list?num=${ listSize - 1 }" />
                    <a href="${ listSize }">maxIndex</a>

                </c:when>
                
                <c:otherwise>
                    <c:forEach begin="${ (num / 10) * 10 - 3 }" end="${ (num / 10) * 10 + 5 }" var="listFor">
                        <c:url var="listPageNum"
                            value="/deal/comment/comment-list?num=${ listFor - 1 }" />
                        <a href="${ listPageNum }">${ listFor }</a>
                    </c:forEach>
                </c:otherwise>
                
            </c:choose>



            <a href="${ nextlist }"><button>다음</button></a>
        </div>
    </main>


</body>
</html>