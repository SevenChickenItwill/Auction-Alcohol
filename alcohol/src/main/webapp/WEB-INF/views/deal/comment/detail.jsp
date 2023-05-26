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
        <h1>상세페이지</h1>
    </header>

    <main>
        <!-- 상세보기 -->
        <section>
            <form>
                <div>
                    <label for="id">번호</label> <input id="id"
                        value="${ deal.id }" readonly />
                </div>
                <div>
                    <label for="title">제목</label> <input id="title"
                        value="${ deal.title }" readonly />
                </div>
                <div>
                    <label for="content">내용</label>
                    <textarea id="content" readonly>${ deal.content }</textarea>
                </div>
                <div>
                    <label for="user">작성자</label> <input id="user"
                        value="${ deal.nickname }(${ deal.user_id })[${ deal.user_ranking }]"
                        readonly />
                </div>
                <div>
                    <label for="createdTiem">작성 시간</label>
                    <fmt:formatDate value="${ deal.created_time }"
                        pattern="yyyy-MM-dd HH:mm:ss" var="created" />
                    <input id="createdTiem" value="${ created }"
                        readonly />
                </div>
                <div>
                    <label for="modifiedTime">수정 시간</label>
                    <fmt:formatDate value="${ deal.modified_time }"
                        pattern="yyyy-MM-dd HH:mm:ss" var="modified" />
                    <input id="modifiedTime" value="${ modified }"
                        readonly />
                </div>
            </form>
            <div>
                <div>
                    <c:url var="dealModify" value="/deal/comment/modify">
                        <c:param name="id" value="${ deal.id }"></c:param>
                    </c:url>
                    <a href="${ dealModify }">수정 하기</a>
                </div>
            </div>
        </section>
        <!-- 상세보기 끝 -->

        <!-- 댓글 -->
        <section>
            <!-- 댓글 갯수 알림 -->
            <div>
                <span>댓글</span> <span id="replyCount">100</span>개 댓글
                <!-- TODO 댓글 갯수 -->
            </div>

            <!-- 댓글 입력 칸 -->
            <div>
                <div>
                    <label for="replyText">댓글 입력</label>
                    <div>
                        <textarea id="replyText"></textarea>
                        <input class="d-none" value="admin" id="writer" />
                        <!-- TODO:로그인 사용자 아이디 -->
                    </div>
                    <div>
                        <button id="btnAddReply">등록</button>
                    </div>
                </div>

                <!-- 댓글 목록 보기 -->
                <div id="replies"></div>
            </div>
        </section>
        <!-- 댓글 보기 끝 -->
        
        <!-- 댓글 수정 기능 -->

        
         <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        
    </main>

</body>
</html>