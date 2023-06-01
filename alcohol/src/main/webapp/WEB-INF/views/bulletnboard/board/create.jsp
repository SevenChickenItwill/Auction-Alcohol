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
        <h1>게시글 작성하기</h1>
    </header>

    <main>
            <div>
                <form method="post">
                    <div>
                        <div>
                            <select name="category">
                                <option value="0">공지사항</option>
                                <option value="1">글 작성</option>
                            </select> 
                        </div>
                        <div>
                            <!-- TODO : 로그인 구현후 로그인한 아이디 등록 -->
                            <label for="nickname">작성자</label> 
                            <input type="text" id="nickname" name="nickname" />
                            <input type="text" id="user_id" name="user_id"  />
                        </div>
                        <div>
                            <label for="title">제목</label>
                            <input type="text" id="title" name="title" autofocus required />
                        </div>
                        <div>
                            <input type="text" name="image" />
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
        
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
            

</body>
</html>