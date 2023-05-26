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
            <h1>새글작성</h1>
        </header>
        
        <main>
            <div>
                <form method="post">
                    <div>
                        <div>
                            <!-- TODO : 로그인 구현후 로그인한 아이디 등록 -->
                            <label for="userId">작성자 아이디</label> 
                            <input type="text" id="userId" name="userId" required />
                        </div>
                        <div>
                            <label for="title">제목</label>
                            <input type="text" id="title" name="title" autofocus required />
                        </div>
                        <div>
                            <label for="content">내용</label>
                            <textarea id="content" name="content" required></textarea>
                        </div>
                    </div>
                    
                    <div>
                        <input type="submit" value="작성완료"/>
                    </div>
                </form>
            </div>
        </main>
    </body>
</html>