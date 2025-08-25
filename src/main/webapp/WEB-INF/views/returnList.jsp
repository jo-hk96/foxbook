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
			 <form class = "search-box" action="/ReturnList" method="get">
		    	<input class ="search-txt" type = "text" name="keyword" placeholder="반납한 도서명을 입력해주세요">
		    	<button class = "search-btn" type ="submit">
		    		<i class="fa-solid fa-magnifying-glass fa-xl" style="color: #003049;"></i>
		    	</button>
			</form>
			 
			<table id = "renList">
					<h2>${yu_userid}님의 반납 내역</h2> <h2><a href = "/RentalList">대여내역</a></h2>
						<tr>
							<td>책번호</td>
							<td>책제목</td>
							<td>출판사</td>
							<td>저자</td>
							<td>대여한날짜</td>
							<td>반납한날짜</td>
							<td>대여/반납</td>
						</tr>
						
					<c:forEach var = "returns" items = "${returnList}" varStatus = "loop"> 
							<tr>
									<td>${returns.ybi_idx}</td>
									<td>${returns.ybi_subject}</td>
									<td>${returns.ybi_publi}</td>
									<td>${returns.ybi_name}</td>
									<td>${returns.yri_rtdate}</td>
									<td>${returns.yri_redate}</td>
									<td>
									<%-- 	<c:if test = "${returns.yri_redate eq '대여중'}">
											<form action = "/ReturnBook"  method = "get" onsubmit="return confirm('${rentals.ybi_subject}을(를)반납 하시겠습니까?');">
												<input type="hidden" name="ybi_idx" value="${rentals.ybi_idx}">
												<input type ="submit" id = "returnbook" name = "returnbook" value = "반납하기" >
											</form>
										</c:if>	 --%>
										
											<c:if test = "${not empty returns.yri_redate and returns.yri_redate ne '대여중'}">
													<span class="returned-status">반납완료</span>
											</c:if>
									</td>
							</tr>
					</c:forEach>
			</table>
			
	<%@include file = "/WEB-INF/include/pagingReturnList.jsp" %>
</body>
</html>