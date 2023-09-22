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
	<h1> 회원정보 리스트 </h1>
	
	<table border="1">
	
	<tr>
		<th> 썸네일</th>
		<th> 아이디 </th>
		<th> 비밀번호 </th>
		<th> 이메일 </th>
		<th> 나이 </th>
		<th> 자기소개 </th>
		<th> 회원등급 </th>
		<th> 가입날짜 </th>
		<th> 마지막 로그인 </th>
	</tr>
	
	<c:forEach items="${list }" var="mvo">
	
	<tr>
		<th> <img src="/_profileUpload/_th_${mvo.profile}" alt="X"></th>
		<th>${mvo.id }</th>
		<th>${mvo.pwd }</th>
		<th>${mvo.email }</th>
		<th>${mvo.age }</th>
		<th>${mvo.introduce }</th>
		<th>${mvo.grade }</th>
		<th>${mvo.regdate }</th>
		<th>${mvo.lastlogin }</th>
	</tr>
	</c:forEach>
	
	
	
	
	</table>
	
	
</body>
</html>