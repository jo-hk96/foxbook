<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/list_sample.css"/>
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css">
<title>BookRen</title>
</head>
<body id = "back">
	<div id="header">
		<a href="/"><img src="/images/index/Blogo.png" height="60" alt="Logo"/></a>
	</div>
	
	<!--
	<div id="container">
		<div id="left">
			<table>
				<tr>
					<td>BookRen 입니다</td>
				</tr>
				<tr>
					<td>도서목록</td>
				</tr>
				<tr>
					<td>도서대여목록</td>
				</tr>
				<tr>
					<td>환경설정</td>
				</tr>
			</table>
		</div>
		-->
		
		<div>
			 <form class = "search-box" action="/BookList" method="get">
		    	<input class ="search-txt" type = "text" name="search-txt" placeholder="도서명을 입력해주세요.">
		    	<button class = "search-btn" type ="submit">
		    		<i class="fa-solid fa-magnifying-glass fa-xl" style="color: #003049;"></i>
		    	</button>
			</form>
			
			
				<table>
					<tr>
						<td>번호</td>
						<td>책제목</td>
						<td>출판사</td>
						<td>저자</td>
						<td>대여하기</td>
					</tr>
					<c:forEach var = "books" items = "${bookList}"> 
						<tr>
							<td>${books.ybi_idx}</td>
							<td>${books.ybi_subject}</td>
							<td>${books.ybi_publi}</td>
							<td>${books.ybi_name}</td>
							<td>
							
						<c:if test="${books.ybi_rental eq 'N'}">	
								<form action ="/Rent" method ="get">
									<input type = "hidden" name ="ybi_idx" 		value = "${books.ybi_idx}">
									<input type = "hidden" name ="yu_userid" 	value = "${session.yu_userid}">
									<input type = "submit" value = "대여">
								</form>
						</c:if>
						<c:if test="${books.ybi_rental eq 'Y'}">
						         <span>대여중</span>
						 </c:if>
						</td>
						</tr>
					</c:forEach>
			</table>
		</div>
		
		
		
</body>
</html>