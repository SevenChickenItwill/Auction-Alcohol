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
                <form id="modifyForm">
                    <div>
                        <span id="title" name="title">${ board.title }</span>
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
                    <div>
                        
                        <!-- 이미지 -->
                        
                        
                    </div>
                    </div>
                    <div>
                        <textarea name="content" id="content">${ board.content }</textarea>
                    </div>
                    <div>
                        <button id="recommendUp">추천</button>
                        <button id="recommendDown">비추천</button>
                    </div>
                </form>
                <span>
                    <a id="btnUpdate">수정완료</a>
                </span>
            </section>
            
        </main>
        
         <div>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        </div>
    </body>
</html>