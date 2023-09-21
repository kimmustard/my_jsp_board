<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/brd/insert" method="post">
	제목 : <input type="text" name="title"> <br>
	작성자 : <input type="text" name="writer"> <br>
	내용 : <textarea rows="3" cols="30" name="content"></textarea>
	파일 : <input type="file" name="image_File"> <br>
	<button type="submit"> 작성 </button>
	</form>
</body>
</html>