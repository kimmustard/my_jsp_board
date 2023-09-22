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
	<h1> 회원 가입 </h1>

	<form action="/mem/register" method="post" enctype="multipart/form-data">
	 
		아이디 : <input type="text" name="id"> <br>
		비밀번호 : <input type="text" name="pwd"> <br>
		이메일 : <input type="text" name="email"> <br>
		나이 : <input type="text" name="age"> <br>
		자기소개 : <textarea rows="3" cols="30" name="introduce"></textarea> <br>
		프로필사진 : <input type="file" name="profile"> <br>
		<br>
		<button type="submit"> 작성완료 </button>
	</form>
	<a href="/index.jsp"> <button> 취소 </button></a>
</body>
</html>