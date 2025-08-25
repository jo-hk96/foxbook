<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="paging">
	
	<style>
		#page{font-size : 30px; }
		#page td{padding : 20px; }
	</style>
<c:if test = "${totalCount > 0 }">
	<table id = "page">
		<tr>
			<c:if test="${searchDTO.pagination.existPrevPage}">
				<td><a href="/RentalList?page=1&keyword=${searchDTO.keyword}">맨처음</a></td>		
				<td><a href="/RentalList?page=${searchDTO.page - 1}&keyword=${searchDTO.keyword}">이전</a></td>		
			</c:if>	
				
			<c:forEach var="pagenum" begin="${searchDTO.pagination.startPage}" end="${searchDTO.pagination.endPage}" step="1">
				<td><a href="/RentalList?page=${pagenum}&keyword=${searchDTO.keyword}">${pagenum}</a></td>		
			</c:forEach>
				
			<%-- <c:if test="${searchDTO.pagination.existNextPage}"> --%>
				<td><a href="/RentalList?page=${searchDTO.page + 1}&keyword=${searchDTO.keyword}">다음</a></td>		
				<td><a href="/RentalList?page=${searchDTO.pagination.totalPageCount}&keyword=${searchDTO.keyword}">맨끝</a></td>		
			<%-- </c:if>	 --%>
		</tr>
	</table>
</c:if>	

<c:if test ="${totalCount == 0 }">
	<h2>대여목록이없습니다</h2>
</c:if>	
	
	
</div>