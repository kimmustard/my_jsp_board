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
	<h1> 회원정보 수정 페이지 </h1>
	
	<form action="/mem/update" method="post" enctype="multipart/form-data">
	
	아이디 : <input type="text" name="id" value="${ses.id }" readonly="readonly"> <br> 
	비밀번호 : <input type="text" name="pwd" value="${ses.pwd }"> <br> 
	이메일 : <input type="text" name="email" value="${ses.email }"> <br> 
	나이 : <input type="text" name="age" value="${ses.age }"> <br> 
	자기소개 : <textarea rows="3" cols="30" name="introduce">${ses.introduce }</textarea> <br>
	<hr>
	<br>
	현재 프로필 사진 : <br>
	
	
			<c:if test="${ses.profile ne '' && ses.profile ne null }">
				<img src="/_profileUpload/${ses.profile}" alt="설정된 프로필사진이 없습니다." width="300" height="300">
			</c:if>
			<br>
	<input type="hidden" name="profile" value="${ses.profile }">
	<input type="file" name="new_profile" accept="image/*"> <br> 
	<button type="submit"> 작성완료 </button>
	</form>
	
	<a href="/mem/remove"> <button type="button"> 회원탈퇴 </button></a> 
	<a href="/index.jsp"> <button type="button"> 메인으로 </button></a> 
</body>
</html>