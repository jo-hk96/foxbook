<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/index_sample.css"/>
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css">

<title>BookRen</title>

</head>
<body id = "back">

<main>
	<div id="header">
			<a href="/" class = "logo"><img src="/images/index/Blogo.png" id = "logoimg" height ="40" alt="Logo"/></a>
			
			<div id="burger-menu">
		        <span></span>
		        <span></span>
		        <span></span>
   			 </div>
			
		<div id = "nav-menu">	
			<a href="/login">로그인</a>
			<a href="/mypage">내 정보</a>
			<a href="/join">회원가입</a>
			<a href="/">◐</a>
		</div>
	</div>		
	
	
		<h1 id = "mainread">잠시 쉬어가는 지식의 요람</h1>	
		<h3 id = "mainread2">안녕하세요 여우별 도서관 입니다.</h3>	
		
			<div class="search-container">
				    <form class = "search-box" action="/list" method="get">
				    	<input class ="search-txt" type = "text" name="serach-txt" placeholder="도서명을 입력해주세요.">
				    	<button class = "search-btn" type ="submit">
				    		<i class="fa-solid fa-magnifying-glass fa-xl" style="color: #003049;"></i>
				    	</button>
				    </form>
					<table id = "menu2">
						<tr>
							<td><a href = "">여우별</a></td>
							<td><a href = "">안녕하세요</a></td>
							<td><a href = "">책을 많이 읽으면 복이와요 : )</a></td>
						</tr>
					</table>
			</div>
</main>


    <footer>
        <div id="footer">
            <span>부산광역시 못골번영로56번길 8</span><br>
            <span>Copyright © 2025 FoxStar Library. All rights reserved.</span><br>
        </div>
    </footer>
    
    <script>
   		document.addEventListener('DOMContentLoaded', function() {
        const burgerMenu = document.getElementById('burger-menu');
        const navMenu = document.getElementById('nav-menu');

        burgerMenu.addEventListener('click', function() {
            navMenu.classList.toggle('active');
        });
    });
</script>
    
    
</body>
</html>