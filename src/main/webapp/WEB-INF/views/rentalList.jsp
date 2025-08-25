<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/list_sample.css"/>
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css">
<title>FoxStar</title>
</head>
<body id = "back">
	<div id="header">
		<a href="/"><img src="/images/index/Blogo.png" height="40" alt="Logo"/></a>
	</div>
	
		<div id = "rental">
			 <form class = "search-box" action="/RentalList" method="get">
		    	<input class ="search-txt" type = "text" name="keyword" placeholder="대여한 도서명을 입력해주세요.">
		    	<button class = "search-btn" type ="submit">
		    		<i class="fa-solid fa-magnifying-glass fa-xl" style="color: #003049;"></i>
		    	</button>
			</form> 
			
			<table id = "renList">
					<span class = "spa">${yu_userid}님의 대여 내역</span> <span class = "spa"><a href ="/ReturnList"> [내가 반납한 내역보기]</a></span>
						<tr>
							<td>책번호</td>
							<td>책제목</td>
							<td>출판사</td>
							<td>저자</td>
							<td>대여한날짜</td>
							<td>반납여부</td>
							<td>대여/반납</td>
						</tr>
					<c:forEach var = "rentals" items = "${rentalList}" varStatus = "loop">
					
						<c:if test="${rentals.yri_redate eq '대여중'}">
							<tr>
									<td>${rentals.ybi_idx}</td>
									<td>${rentals.ybi_subject}</td>
									<td>${rentals.ybi_publi}</td>
									<td>${rentals.ybi_name}</td>
									<td>${rentals.yri_rtdate}</td>
									<td>${rentals.yri_redate}</td>
									<td>
										<c:if test = "${rentals.yri_redate eq '대여중'}">
											<form action = "/ReturnBook"  method = "get" onsubmit="return confirm('${rentals.ybi_subject}을(를)반납 하시겠습니까?');">
												<input type="hidden" name="ybi_idx" value="${rentals.ybi_idx}">
												<input type ="submit" id = "returnbook" name = "returnbook" value = "반납하기" >
											</form>
										</c:if>
										
										<c:if test = "${not empty rentals.yri_redate and rentals.yri_redate ne '대여중'}">
												<span class="returned-status">반납완료</span>
										</c:if>	
									</td>
							</tr>
						</c:if>	
					</c:forEach>
			</table>
			
			
		<div class = "rentalPaging">
		<%@include file = "/WEB-INF/include/pagingRentalList.jsp" %>
		</div>
</body>
</html>