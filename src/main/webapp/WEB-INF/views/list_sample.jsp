<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/list_sample.css"/>
<title>BookRen</title>
</head>
<body>
	<div id="header">
		<a href="/"><img src="/images/index/logo.png" height="60" alt="Logo"/></a>
		<b style="color:gray;font-size:20px;">홍길동</b>
		<b style="color:gray;font-size:15px;"> 님 환영합니다.</b>
	</div>
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
		<div id="right" >
			<table>
				<tr>
					<td>
						<select id="sel">
							<option value="">전체</option>
							<option value="1">제목</option>
							<option value="1">저자</option>
						</select></td>
					<td colspan="3"><input type="text" id="search" placeholder="검색어를 입력하세요" /><input type="button" value="검색" /></td>
				</tr>
				<tr>
					<td>1</td><td>류수영의 평생 레시피</td><td>류수영</td><td><input type="button" value="대여가능" /></td>
				</tr>
				<tr>
					<td>2</td><td>다크 심리학</td><td>다크 사이드 프로젝트</td><td>대여불가</td>
				</tr>
				<tr>
					<td>3</td><td>자몽살구클럽</td><td>한로로</td><td><input type="button" value="대여가능" /></td>
				</tr>
				<tr>
					<td>4</td><td>가공범</td><td>히가시노 게이고</td><td><input type="button" value="대여가능" /></td>
				</tr>
				<tr>
					<td>5</td><td>혼모노</td><td>성해나</td><td><input type="button" value="대여가능" /></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>