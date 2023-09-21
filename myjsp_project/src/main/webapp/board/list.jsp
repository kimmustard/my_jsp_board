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
	
	<h1> 게시물 리스트 </h1>
	
	<table>
	
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>추천수</th>
	</tr>
	
	
	<c:forEach items="${list}" var="bvo">
		<tr>
			<td><a href="/brd/detail?bno=${bvo.bno}">${bvo.bno}</a></td>
			<td>
			<c:if test="${bvo.image_File ne '' && bvo.image_File ne null }">
				<img src="/_fileUpload/_th_${bvo.image_File}">
			</c:if>
			<a href="/brd/detail?bno=${bvo.bno}">${bvo.title}</a>
			<td>${bvo.writer }</td>
			<td>${bvo.regdate }</td>
			<td>${bvo.readcount }</td>
			<td>${bvo.recommend }</td>
			</td>
		</tr>	
	</c:forEach>
	
	
	</table>
</body>
</html>