<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
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
            <h1>상세보기페이지</h1>
        </header>
        
        <main>
            
            <section>
                <form id="boardForm">
                    <input type="hidden" value="${ board.board_id }" id="boardId" name="board_id" />
                    <div>
                        <span>${ board.title }</span>
                    </div>
                    <div>
                        <span>${ board.nickname }(${ board.user_id })</span>
                        <span>${ board.time }</span>
                    </div>
                    <div>
                        <span>${ board.views }</span>
                        <span>${ board.recommend }</span>
                        <span>댓글[개수]</span>
                    </div>
                        이미지
                    <div>
                        <textarea>${ board.content }</textarea>
                    </div>
                    <div>
                        <button>추천</button>
                        <button>비추천</button>
                    </div>
                </form>
                <span>
                    <c:url value="/bulletinboard/board/list?num=0" var="boardList" />
                    <a href="${ boardList }">목록페이지</a>
                </span>
                
                <span>
                    <c:url var="boardModify" value="/bulletinboard/board/modify">
                        <c:param name="id" value="${ board.board_id }"></c:param>
                    </c:url>
                    <a href="${ boardModify }">수정하기</a>
                    
                    <a id="deleteBtn">삭제하기</a>
                </span>
                 <div>
                    <span>댓글[개수]</span>
                </div>
                
                
                <div>
                    <form id="commentForm">
                        <textarea class= "col-5" placeholder="댓글 쓰기" id="content"></textarea>
                    </form>
                    
                    <div>
                        <table>        
                            <thead>
                                <tr>
                                    <th>닉네임</th>
                                    <th>작성시간</th>
                                </tr>
                            </thead>       
                              <tbody>    
                                <c:forEach items="${ comment }" var="comments">
                                    <tr>
                                        <td>${ comments.content }</td>
                                        <td>${ comments.nickname }</td>
                                        <td>
                                            <fmt:formatDate value="${ comments.time }"
                                                pattern="yyyy-MM-dd HH:mm"/>
                                        </td>
                                </c:forEach>
                              </tbody> 
                        </table>    
                    </div>    
                </div>
                <div>    
                    <button id="commentRegister">등록</button>
                </div>
            </section>
            
            
        </main>
        
        <div>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
            <script src="../../static/js/board-detail.js"></script>
        </div>
        
    </body>
</html>