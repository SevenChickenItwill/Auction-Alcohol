<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
        <header>
            <h1>수정페이지</h1>
        </header>
        
         <main>
            <div>
                <form id="modifyForm">
                    <div>
                        <label for="id" >번호</label>
                        <input id="id" name="id" value="${ deal.id }" readonly />
                    </div>
                    <div>
                        <label for="title">제목</label>
                        <input id="title" name="title" value="${ deal.title }" />
                    </div>
                    <div>
                        <label for="content">내용</label>
                        <textarea name="content" id="content">${ deal.content }</textarea>
                    </div>
                    <div>
                        <label for="user">작성자</label>
                        <input id="user" name="user" 
                        value="${ deal.nickname }(${ deal.user_id })[${ deal.user_ranking }]" readonly />
                    </div>
                </form>
                <div>
                    <div>
                        <button id="btnUpdate" >수정완료</button>
                        <button id="btnDelete" >삭제하기</button>
                    </div>
                </div>
            </div>
        </main>
        
        <script src="../../static/js/deal-modify.js" ></script>
        
    </body>
</html>