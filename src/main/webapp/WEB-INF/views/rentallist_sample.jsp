<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/list_sample.css"/>
<title>FoxStar</title>
</head>
<body>
	<div id="header">
		<a href="/"><img src="/images/index/logo.png" height="60" alt="Logo"/></a>
		<b style="color:gray;font-size:20px;">홍길동</b>
	</div>
	<div id="container">
		<div id="left">
			<table>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td>사용자관리</td>
				</tr>
				<tr>
					<td>도서관리</td>
				</tr>
			</table>
		</div>
		<div id="right" >
			<table>
				<tr>
					<td>순위</td><td>제목</td><td>저자</td><td>대여여부</td>
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