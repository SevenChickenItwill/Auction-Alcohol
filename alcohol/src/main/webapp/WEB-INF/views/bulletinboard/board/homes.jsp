<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
        
        /* Header styles */
        header {
            background-color: #333;
            color: #fff;
            padding: 20px;
        }
        
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        
        nav ul li {
            display: inline;
            margin-right: 20px;
        }
        
        nav ul li a {
            color: #fff;
            text-decoration: none;
            text-decoration-style: solid;
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
            background-image: url('../../static/images/mainBackground.jpg');
            background-color: rgba(0, 0, 0, 1.0); 
            background-size: 1200px 600px;
            background-position: 50% 4px;
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
        margin-top: -5px;
        }
        
        .bidmall-font {
        text-decoration: none;
        margin-top: -5px;
        }
        
       	.grids {
       		text-align: center;
       		
       	}
        
    </style>
</head>
<body>
    <header>
        <h1>Alcohol Event Mall</h1>
        
        <nav class="navi">
            <ul>
                <li><a href="#">주류 쇼핑몰</a></li>
                <li><a href="#">주류 경매</a></li>
                <li><a href="#">마이페이지</a></li>
            </ul>
        </nav>
    </header>
    <h2 class="welcome">Welcome to our Korean Traditional Alcohol Event Mall</h2>
    <main class="mainBackground">
        
        <div class= "grids">
    		<p><a href="#" class="shoppingmall-font">주류 쇼핑몰로 이동</a></p>
        	<p><a href="#" class="bidmall-font">경매몰로 이동</a></p>
        </div>
        
    </main>
    	
    <footer>
        <p>&copy; Alcohol Event Mall of Team Turkey(칠면조). All rights reserved.</p>
    </footer>
</body>
</html>
