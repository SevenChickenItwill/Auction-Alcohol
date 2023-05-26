<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <li>
                        <c:url value="/deal/comment/create" var="dealCreated" />
                        <a href="${ dealCreated }" >새글작성</a>
                    </li>
                    <li>
                        <c:url value="/" var="mainPage" />
                        <a href="${ mainPage }" >메인페이지</a>
                    </li>
                </ul>
            </div>
        </nav>
        
        <main>
            <div>
                <table>
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>제목</th>   <!-- 제목[댓글수] -->
                            <th>작성자</th>  <!-- 작성자별명(아이디)[랭킹] -->
                            <th>시간</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach items="${ deals }" var="dealList">
                            <tr>
                                <td>${ dealList.id }</td>
                                <td>
                                    <c:url var="commentDetail" value="/deal/comment/detail"  >
                                        <c:param name="id" value="${ dealList.id }" />
                                    </c:url>
                                    <a href="${ commentDetail }" >${ dealList.title }</a>
                                    <span>[${ dealList.rcnt }]</span>
                                </td>
                                <td>${ dealList.nickname }(${ dealList.user_id })[${ dealList.user_ranking }]</td>
                                <td>
                                    <fmt:formatDate value="${ dealList.modified_time }" 
                                        pattern="yyyy/MM/dd HH:mm:ss"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
        
    </body>
</html>