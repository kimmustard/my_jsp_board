<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 게시글 작성 </h1>

	<form action="/brd/insert" method="post" enctype="multipart/form-data">
	제목 : <input type="text" name="title"> <br>
	작성자 : <input type="text" name="writer" value="${ses.id}" readonly="readonly"> <br>
	내용 : <textarea rows="3" cols="30" name="content"></textarea> <br>
	파일 : <input type="file" name="image_file" accept="image/*"> <br>
	<button type="submit"> 작성 </button>
	</form>
</body>
</html>