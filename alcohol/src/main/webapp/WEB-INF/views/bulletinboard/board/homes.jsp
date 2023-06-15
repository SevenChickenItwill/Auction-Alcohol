<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>칠면조</title>
    <style>
        /* Overall styles */
        body {
            margin: 0;
            padding: 0;
            font-family: "Goudy Bookletter 1911", sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        
        #turkey {
        	margin-top: 10px;
        	margin-bottom: 10px;
        }
        /* Header styles */
        header {
            background-color: #333;
            color: #fff;
            padding: 2px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            margin-top: -45px;
            
        }
        
        nav ul li {
            display: inline;
            margin-right: 50px;
            
        }
        
        nav ul li a {
            color: #fff;
            text-decoration: none;
            text-decoration-style: solid;
            
        }
        
        .navi {
        	text-align: center;
        	font-size: 20px;
        	font-weight: 600;
        	
        }
        
       .a {
       		text-underline-offset: var(--offset, 0.2em);
  			text-decoration: underline 0.12em;
  			transition: --offset 400ms, text-decoration-color 400ms;
  			
       }
       
        .a:hover,
        .a:focus {
        	--offset: 0.5em;
 			 text-decoration-color: blue;
 			 
        }
        
        #jam {
        	margin-left: 625px;
        	margin-bottom: 20px;
        	
        }
        
        /* 경매페이지, 쇼핑몰 이동 페이지 */
        
        .shoppingmall-font,
  		.bidmall-font {
    	display: inline-block;
    	padding: 30px 60px;
    	background-color: #333;
    	color: #fff;
    	text-decoration: none;
    	font-weight: 800;
    	border-radius: 6px;
    	transition: background-color 0.3s;
    	font-size: 20px;
    	
  }

  		.shoppingmall-font:hover,
  		.bidmall-font:hover {
    	background-color: #0000FF;
  }
        
        /* Footer styles */
        footer {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
            margin-top: auto;
        }
        
        /* Main section styles */
        main {
            flex: 1;
            display: flex;
        }
    
        /* Left section styles */
        
        .mainBackground {
            flex: 1;
            background-image: url('./static/images/mainBackground.jpg');
            background-repeat: no-repeat;
            background-size: 1340px 730px;
            background-position: 52% -100px;
            background-blend-mode: lighten;
            
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
            text-decoration: none;
        }
        
        /* welcome 문구 */
       .welcome {
          text-align: left;
          mx: 10px;
       }
     
        .shoppingmall-font {
        
        text-decoration: none;
        margin-bottom: 5px;
        }
        
        .bidmall-font {
        text-decoration: none;
        margin-top: 10px;
        }
        
        .grids {
        text-align: center;
        /* 경매몰, 쇼핑몰 이동 px수치가 커질수록 아래로*/
         margin-top: 300px;
        }
       
        #nickname {
       	 margin-left: 300px;
        }
        
    </style>
</head>
<body>
    <header>
        <h1 id="turkey">Turkey Brewery</h1>
        <c:url value="/auction/auctionlist" var="auctionList" >
                </c:url>
        <c:url value="/bulletinboard/board/list" var="communityList">
        	<c:param name="num" value="0" />
        </c:url>
        
        <nav class="navi">
            <ul id="jam">
                <li><a href="#" class="a">주류 쇼핑몰</a></li>
                <li><a href="${ auctionList }" class="a">주류 경매</a></li>
                <li><a href="${ communityList }" class="a">커뮤니티</a></li>
                <li><a href="#" class="a">마이페이지</a></li>
                <li id="nickname">"${ sessionScope.userNickname }"님, 환영합니다.</li>
                <li><a href="#" class="a" id="logout">로그아웃</a></li>
            </ul>
        </nav>
        
        
    </header>
    <h2 class="welcome">Welcome to our Korean Traditional Alcohol Event Mall</h2>
    <main class="mainBackground">
        
        <div class= "grids">
    		<p><a href="#" class="shoppingmall-font">주류 쇼핑몰로 이동</a></p>
        	<p><a href="${ auctionList }" class="bidmall-font">경매몰로 이동</a></p>
        </div>
        
    </main>
    	
    <footer>
        <p>&copy; Alcohol Event Mall of Team Turkey(칠면조). All rights reserved.</p>
    </footer>
</body>
</html>
