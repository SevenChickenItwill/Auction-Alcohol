<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
   pageEncoding="UTF-8"%>
=======
	pageEncoding="UTF-8"%>
>>>>>>> origin/Taewook5
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
            margin-right: 10px;
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
        .left-section {
            flex: 1;
            background-image: url('../../static/images/mainBackground.jpg');
            background-color: rgba(0, 0, 160, 1.0); 
            background-size: cover;
            background-position: center;
            background-blend-mode: lighten;
            position: relative;
            
            padding: 10px;
            text-decoration: none;
        }
        
        /* welcome 문구 */
        
<<<<<<< HEAD
       .welcome {
          text-align: left;
       }
=======
 		.welcome {
 			text-align: left;
 		}
>>>>>>> origin/Taewook5
        
        /* Right section styles */
        .right-section {
            flex: 1;
            background-image: url('../../static/images/mainBackground2.jpg');
            background-color: rgba(255, 255, 255, 0.5);
            background-size: cover;
            padding: 20px;
            
            
        }
        
        
        .navi {
<<<<<<< HEAD
           align-items: center;
        }
        
        .left-box {
             margin: 10px;
=======
        	align-items: center;
        }
        
        .left-box {
       		margin: 10px;
>>>>>>> origin/Taewook5
            transition: transform 0.1s ease;
            text-decoration: none;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
        }
        
        /* Linked fonts styles */
        .left-box:hover {
            transform: scale(1.05);
        }
        
        .left-font {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            color: inherit;
            text-decoration: none;
            font: 35px "Nunito Sans", "Noto Sans KR";
            opacity: 1;
            transform: matrix(1, 0, 0, 1, 0, 0);
        }
        
        .right-font {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            color: white;
            font: 35px "Nunito Sans", "Noto Sans KR";
<<<<<<< HEAD
             transform: matrix(1, 0, 0, 1, 0, 0);
=======
          	transform: matrix(1, 0, 0, 1, 0, 0);
>>>>>>> origin/Taewook5
            opacity: 1;
            text-decoration: none;
            
        }
        
         .right-box:hover {
            transform: scale(1.05);
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
    
    <main>
        <section class="left-section">
        <h2 class="welcome">Welcome to our Korean Traditional Alcohol Event Mall</h2>
            <p class="left-box"><a href="#" class="left-font">경매 페이지로 이동</a></p>
        </section>
        
        <section class="right-section">
            <h2></h2>
            <p class="right-box"><a href="#" class="right-font">주류 쇼핑몰로 이동</a></p>
        </section>
    </main>
    
    <footer>
        <p>&copy; Alcohol Event Mall of Team Turkey(칠면조). All rights reserved.</p>
    </footer>
</body>
</html>