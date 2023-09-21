<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1> 게시글 상세보기 </h1>
	
	<c:if test="${bvo.image_File ne '' && bvo.image_File ne null}">
		<div>
			<img src="/_fileUpload/${bvo.image_File}" alt="이미지가 없습니다.">
		</div>
	</c:if>
	
	<table>
		<tr>
			<th>글번호</th>
			<td>${bvo.bno}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${bvo.writer}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${bvo.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${bvo.content}</td>
		</tr>
		<tr>
			<th>게시날짜</th>
			<td>${bvo.regdate}</td>
		</tr>
		<tr>
			<th>수정날짜</th>
			<td>${bvo.moddate}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${bvo.readcount}</td>
		</tr>
		<tr>
			<th>추천수</th>
			<td>${bvo.recommend}</td>
		</tr>
	</table>
	
	<a href="/brd/recommend?bno=${bvo.bno}"> <button> 추천 </button></a>
	<br>
	<br>
	<a href="/brd/modify?bno=${bvo.bno}"> <button> 수정 </button></a>
	<a href="/brd/remove?bno=${bvo.bno}"> <button> 삭제 </button></a>
	<a href="/brd/list"> <button> 게시물 리스트 </button> </a>
	
</body>
</html>