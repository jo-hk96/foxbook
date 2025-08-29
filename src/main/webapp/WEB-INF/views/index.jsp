<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/index.css" />
<!-- ICON css  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css"
    integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css">
<link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22256%22 height=%22256%22 viewBox=%220 0 100 100%22><text x=%2250%%22 y=%2250%%22 dominant-baseline=%22central%22 text-anchor=%22middle%22 font-size=%2290%22>🌠</text></svg>" />
<title>여우별 도서관</title>
</head>

<body id="back">

	<main>
		<!--헤더 -->
		<div id="header">
			<a href="/" class="logo"><img src="/img/LightModeLogo.png"
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
					<a href="/logout"  onclick="return confirm('로그아웃 하시겠습니까?');">로그아웃</a>
				</c:if>
					<a href="/" class="dark"><img src="/img/moon.svg"
									id="moonimg" height="30" alt="moon" /></a>
			  </div>
		</div>
		
		
		<!--메인글,검색창 -->
		<h1 id="mainread">잠시 쉬어가는 지식의 요람</h1>
		<h3 id="mainread2">안녕하세요 여우별 도서관 입니다.</h3>
		<div class="search-container">
				<form class="search-box" action="/BookList" method="get" onsubmit = "return eq()">
					<input class="search-txt" type="text" name="keyword" placeholder="도서명을 입력해주세요.">
					<button class="search-btn" type="submit">
						<i class="fa-solid fa-magnifying-glass fa-xl" style="color: #003049;"></i>
					</button>
				</form>
				<div class="vertical-slider">
					  <div class="slider-content">
						    <div class="menu-item"><a href="/BookList?keyword=행복한 가족을 만드는 가족생활백서"><i class="fa-solid fa-book"></i>추천도서&lt;행복한 가족을 만드는 가족생활백서&gt; 방규원</a></div>
						    <div class="menu-item"><a href="/BookList?keyword=훌쩍 커버린 15세, 이제 부모가 말을 걸 차례다"><i class="fa-solid fa-book"></i>추천도서&lt;훌쩍 커버린 15세, 이제 부모가 말을 걸 차례다&gt; 손석한</a></div>
						    <div class="menu-item"><a href="/BookList?keyword=지리산 둘레길, 사람과 풍경이 만나는 곳"><i class="fa-solid fa-book"></i>추천도서&lt;지리산 둘레길, 사람과 풍경이 만나는 곳&gt; 이송이</a></div>
						    <div class="menu-item"><a href="/BookList?keyword=항산화제, 내 몸을 살린다"><i class="fa-solid fa-book"></i>추천도서&lt;항산화제, 내 몸을 살린다&gt; 정윤상</a></div>
					  </div>
					</div>
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



	<!--다크모드 -->
<!--   <script src="./js/darkmode.js"></script> -->

</body>
</html>