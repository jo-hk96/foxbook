<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>도서 목록</title>
  <!-- CSS -->
  <link rel="stylesheet" href="/css/common.css">
  <link rel="stylesheet" href="/css/menu.css">

  <!-- Icon CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css"
    integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- Favicon -->
  <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22256%22 height=%22256%22 viewBox=%220 0 100 100%22><text x=%2250%%22 y=%2250%%22 dominant-baseline=%22central%22 text-anchor=%22middle%22 font-size=%2290%22>🌠</text></svg>" />

</head>

<body>
  <!-- ======= nav ======= -->
  <nav>
	    <!-- === 로고 === -->
	    <div class="logo-name">
	      <div class="logo-image">
	        <a href="/">
	          <img id="logoimg" src="/img/LightModeLogo.png" alt="logo">
	          <img id="logoimgsmall" src="img/SmallLogoLight.png" alt="logo">
	        </a>
	      </div>
	    </div>
	    <!-- === 메뉴 아이템 === -->
	    <div class="menu-items">
	      <ul class="nav-links">
	        <!-- 화면 크기 400 미만일 때 로고 대신 홈 버튼 등장 -->
	        <li id="house">
	          <a href="/">
	            <i class="fa-solid fa-house"></i>
	            <span class="link-name">홈으로</span>
	          </a>
	        </li>
	       <!--  <li>
	          <a href="/">
	            <i class="fa-solid fa-clipboard-list"></i>
	            <span class="link-name">메인으로</span>
	          </a>
	        </li> -->
	        
	      <%--   <c:if test = "${sessionScope.login_id != null}">
		        <li>
		          <a href="userInfo.jsp">
		            <i class="fa-solid fa-users"></i>
		            <span class="link-name">내 정보 수정</span>
		          </a>
		        </li>
	        </c:if> --%>
	        
	        <li>
	          <a href="/BookList">
	            <i class="fa-solid fa-book"></i>
	            <span class="link-name">도서 목록</span>
	          </a>
	        </li>
		     <c:if test="${sessionScope.login_id != null}">   
			        <li>
			          <a href="/RentalList">
			            <i class="fa-solid fa-book"></i>
			            <span class="link-name">대여 내역</span>
			          </a>
			        </li>
			        
			        <li>
			          <a href="/ReturnList">
			            <i class="fa-solid fa-book"></i>
			            <span class="link-name">반납 내역</span>
			          </a>
			        </li>
		      </c:if> 
		       
	      </ul>
	      <!-- === 로그아웃 / 다크모드 스위치 === -->
	      
	      
	 <c:if test = "${sessionScope.login_id != null}">
		      <ul class="logout-mode">
		        <li>
		          <a>
		             <i class="fa-solid fa-users"></i>
		            <span class="link-name">${sessionScope.login_id}</span>
		          </a>
		        </li>
		        
		        <c:if test = "${sessionScope.login_id != null}">
			        <li>
			          <a href="/userInfo">
			            <i class="fa-solid fa-users"></i>
			            <span class="link-name">내 정보 수정</span>
			          </a>
			        </li>
	       	 	</c:if>
	        
		        <li>
		          <a href="/logout">
		            <i class="fa-solid fa-arrow-right-from-bracket"></i>
		            <span class="link-name" onclick="return confirm('로그아웃 하시겠습니까?');">로그아웃</span>
		          </a>
		        </li>
		        <li class="mode">
		          <a href="#">
		            <div class="switch-icon" id="sun">
		              <svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px"
		                fill="currentColor">
		                <path
		                  d="M480-280q-83 0-141.5-58.5T280-480q0-83 58.5-141.5T480-680q83 0 141.5 58.5T680-480q0 83-58.5 141.5T480-280ZM217-433H23v-94h194v94Zm720 0H743v-94h194v94ZM433-743v-194h94v194h-94Zm0 720v-194h94v194h-94ZM261-633 138-754l66-69 122 122-65 68Zm496 495L633-261l66-66 123 120-65 69ZM633-699l121-123 69 65-121 124-69-66ZM138-204l122-124 67 67-120 123-69-66Z" />
		              </svg>
		            </div>
		            <div class="switch-icon" id="moon">
		              <svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px"
		                fill="currentColor">
		                <path
		                  d="M615-656 490-781l125-125 125 125-125 125Zm200 131-90-91 90-90 91 90-91 91ZM474-55q-87 0-163-32.5T178-177q-57-57-90-133.5T55-474q0-155 100.5-271.5T408-890q-12 101 14.5 198.5T522-522q71 71 168.5 97.5T889-404q-26 151-143 250T474-55Z" />
		              </svg>
		            </div>
		            <span class="link-name" id="modeword">다크모드</span>
		          </a>
		        </li>
		      </ul>
	   </c:if>
	   
	   
	<c:if test = "${sessionScope.login_id == null}">
	    <ul class="logout-mode">
		        <li>
		          <a href="/LoginForm">
		            <i class="fa-solid fa-arrow-right-from-bracket"></i>
		            <span class="link-name">로그인</span>
		          </a>
		        </li>
		        <li class="mode">
		          <a href="#">
		            <div class="switch-icon" id="sun">
		              <svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px"
		                fill="currentColor">
		                <path
		                  d="M480-280q-83 0-141.5-58.5T280-480q0-83 58.5-141.5T480-680q83 0 141.5 58.5T680-480q0 83-58.5 141.5T480-280ZM217-433H23v-94h194v94Zm720 0H743v-94h194v94ZM433-743v-194h94v194h-94Zm0 720v-194h94v194h-94ZM261-633 138-754l66-69 122 122-65 68Zm496 495L633-261l66-66 123 120-65 69ZM633-699l121-123 69 65-121 124-69-66ZM138-204l122-124 67 67-120 123-69-66Z" />
		              </svg>
		            </div>
		            <div class="switch-icon" id="moon">
		              <svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px"
		                fill="currentColor">
		                <path
		                  d="M615-656 490-781l125-125 125 125-125 125Zm200 131-90-91 90-90 91 90-91 91ZM474-55q-87 0-163-32.5T178-177q-57-57-90-133.5T55-474q0-155 100.5-271.5T408-890q-12 101 14.5 198.5T522-522q71 71 168.5 97.5T889-404q-26 151-143 250T474-55Z" />
		              </svg>
		            </div>
		            <span class="link-name" id="modeword">다크모드</span>
		          </a>
		        </li>
		      </ul>
		</c:if>      
		      
  </nav>

  <!-- ====== 대시보드 ====== -->
  <section class="dashboard">
     <div class = "binder searchbar-binder">
        <!-- 메뉴 버튼 -->
        <i class="fa-solid fa-bars sidebar-toggle"></i>

        <!-- 검색 바 -->
      <form action="/BookList" method="get" onsubmit = "return eq()">
      		<div class = "search-container">
		        <input class="search-box" type="text" name="keyword" placeholder="찾으시는 도서명을 입력하세요">
		        <button type = "submit" class ="hidden-button">
		       	 	<i class="search-box fa-solid fa-magnifying-glass" id="searchbtn"></i>
		        </button>
	        </div>
        </form>
        
    </div>
    <!-- == 도서 목록 == -->
    <div class="activity">
      <div class="title">
        <i class="fa-solid fa-book"></i>
        <span class="text">도서 목록 [도서수 : ${totalCount}]</span>
      </div>
      <table class="activity-table">
        <thead>
	          <tr>
	            <th class="table-title">번호</th>
	            <th class="table-title">책제목</th>
	            <th class="table-title">출판사</th>
	            <th class="table-title">저자</th>
	            <th class="table-title">대여/반납</th>
	          </tr>
        </thead>
        <tbody>
       <c:forEach var = "books" items = "${bookList}"> 
			<tr>
				<td>${books.ybi_idx}</td>
				<td>${books.ybi_subject}</td>
				<td>${books.ybi_publi}</td>
				<td>${books.ybi_name}</td>
				<td>
					<c:if test="${books.rentalst eq '대여가능'}">	
							<form action ="/Rent" method ="get" onsubmit="return confirmRental('${books.ybi_subject}');">
								<input type = "hidden" name ="ybi_idx" 		value = "${books.ybi_idx}">
								<input type = "hidden" name ="ybi_subject" 		value = "${books.ybi_subject}">
								<button class="rent-btn" type = "submit">대여</button>
							</form>
					</c:if> 
					<c:if test="${books.rentalst eq '대여중'}">
					        <form action="/ReturnBook" method="get">
								<input type="hidden" name="ybi_idx" value="${books.ybi_idx}">
								<span>대여중</span>
							</form>
					</c:if>
				</td>
			</tr>
		</c:forEach>
        	</tbody>
		      </table>
		    </div>
  </section>
  
	  	
			<div class = "listPaging">
				<%@include file = "/WEB-INF/include/paging.jsp" %>
			</div>	
			
	  	
  
  
	  		<!--목록과 일치하는 도서명이없을시 메시지-->
	  			<script>
	        // 서버에서 전달받은 값이 true인지 확인
			        <c:if test="${neResult}">
			            alert("해당하는 도서내역이 없습니다.");
			        </c:if>
			    </script>
		    
	  
  
  			<!--검색창을 비우고 검색시 메시지-->
	  		<script>
				function eq(){
					const keywordInput = document.querySelector('.search-box[name="keyword"]');
					const keyword = keywordInput.value.trim(); 
					
					if(keyword === ""){
							alert("찾으시는 도서명 입력후 검색해주세요.");
						return false;
					}
					return true;
				}
			</script>
						
			<!--로그인상태가 아닐시-->	
	  		<script>
					function confirmRental(bookName){
						var loginId = "${sessionScope.login_id}";
						//!loginId : 없으면 true 또는 null일 경우 알림창과 함께 로그인창으로 이동
						if(!loginId || loginId === "null"){
							if(confirm("로그인후 대여가 가능합니다.\n로그인페이지로 이동하시겠습니까?")){
							 		 window.location.href = "/LoginForm";
								}
							 return false; // form 전송을 막음
						}
							  // 로그인이 되어 있다면 confirm 창을 띄움
							  return confirm(bookName + "을(를) 대여 하시겠습니까?");
				}
			</script>
		
			
				
  <!-- ===== 다크모드 전환, 메뉴 토글 스크립트 ===== -->
  <script src="./js/darkmode.js"></script>

</body>

</html>