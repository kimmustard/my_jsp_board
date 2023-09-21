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
	<h1> 메인 페이지 </h1>
	
	<c:if test="${ses.id eq null }">
	<form action="/mem/login" method="post">
		<div>
			아이디 : <input type="text" name="id">
		</div>
		<div>
			비밀번호 : <input type="text" name="pwd">
		</div>
		<button type="submit"> 로그인 </button>
	</form>
	<a href="/mem/join"><button>회원가입</button></a>
	</c:if>
	
	
	
	<div>
		<c:if test="${ses.id ne null }">
		    <c:if test="${ses.profile ne '' && ses.profile ne null }">
				<img src="/_profileUpload/_th_${ses.profile}">
			</c:if>
			${ses.id } 님 로그인하셨습니다. <br>
			계정 생성일 : ${ses.regdate } <br>
			마지막 접속 : ${ses.lastlogin } <br>
			<a href="/mem/modify"><button> 회원정보 수정</button></a>
			<a href="/mem/list"><button> 회원정보 리스트</button></a>
			<a href="/mem/logout"><button> 로그아웃 </button></a>
			<a href="/brd/register"><button> 게시판 글쓰기 </button></a>	
		</c:if>
	</div>
	
	<script type="text/javascript">
		const msg_login = `<c:out value="${msg_login}" />`;
		if(msg_login === '0'){
			alert("로그인 정보가 일치하지 않습니다.");
		}
		</script>
	
	<a href="/brd/ㅣist"> <button type="button"> 게시글 리스트 </button></a> <br>
</body>
</html>