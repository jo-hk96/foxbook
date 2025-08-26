<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css">
<title>여우별 도서관</title>
</head>
<body id="back">

	<main>
		<!--헤더 -->
		<div id="header">
			<a href="/" class="logo"><img src="/images/index/LightModeLogo.png"
				id="logoimg" height="40" alt="Logo" /></a>
				
			<div id="burger-menu">
				<span></span> <span></span> <span></span>
			</div>
			<div id="nav-menu">
				<c:if test="${sessionScope.login_id == null}">
					<a href="/LoginForm">로그인</a>
					<a href="/join">회원가입</a>
				</c:if>
				<c:if test="${sessionScope.login_id != null}">
					<a class = "nohover">${sessionScope.login_id}님 반갑습니다!</a>
					<a href="/RentalList">내 정보</a>
					<a href="/logout">로그아웃</a>
				</c:if>
					<a href="/" class="dark"><img src="/images/index/moon.svg"
									id="moonimg" height="30" alt="moon" /></a>
			  </div>
		</div>
		
		<!--메인글,검색창 -->
		<h1 id="mainread">잠시 쉬어가는 지식의 요람</h1>
		<h3 id="mainread2">안녕하세요 여우별 도서관 입니다.</h3>
		<div class="search-container">
				<form class="search-box" action="/BookList" method="get">
					<input class="search-txt" type="text" name="keyword" placeholder="도서명을 입력해주세요.">
					<button class="search-btn" type="submit">
						<i class="fa-solid fa-magnifying-glass fa-xl" style="color: #003049;"></i>
					</button>
				</form>
			<table id="menu2">
				<tr>
					<td><a href="">공지사항</a></td>
					<td><a href="">##</a></td>
					<td><a href="">##</a></td>
				</tr>
			</table>
		</div>
	</main>
	
	<!--푸터 -->
	<footer>
		<div id="footer">
			<span>부산광역시 못골번영로56번길 8</span><br> <span>Copyright © 2025
				FoxStar Library. All rights reserved.</span><br>
		</div>
	</footer>
	
	
	<!--햄버거메뉴스크립트 -->
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