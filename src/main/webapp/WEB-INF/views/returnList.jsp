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
<title>여우별 도서관</title>
</head>
<body id = "back">
	<div id="header">
		<a href="/"><img src="/images/index/SmallLogoLight.png"  alt="Logo"/></a>
	</div>
	
		<div id = "returned">
			 <form class = "search-box" action="/ReturnList" method="get">
		    	<input class ="search-txt" type = "text" name="keyword" placeholder="반납한 도서명을 입력해주세요">
		    	<button class = "search-btn" type ="submit">
		    		<i class="fa-solid fa-magnifying-glass fa-xl" style="color: #003049;"></i>
		    	</button>
			</form>
			 
			<table id = "returnedList">
					<span class = "spa">${yu_userid}님의 반납 내역</span> <span class = "spa"><a href = "/RentalList">[내가 대여한 내역보기]</a></span>
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
								
										
											<c:if test = "${not empty returns.yri_redate and returns.yri_redate ne '대여중'}">
													<span class="returned-status">반납완료</span>
											</c:if>
									</td>
							</tr>
					</c:forEach>
			</table>
	<div class = "returnPaging">
		<%@include file = "/WEB-INF/include/pagingReturnList.jsp" %>
	</div>	
	
	<script>
			    // ReturnBook 반납완료 메시지
			    let message = "${returnSuccecs}";
				    if (message) {
				        alert(message);
				    }
			</script>	
</body>
</html>