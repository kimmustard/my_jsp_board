<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
				crossorigin="anonymous"></script>
			<link rel="stylesheet" href="/resource/bootstrap.css">

			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@600&display=swap" rel="stylesheet">
			<link rel="stylesheet" href="/resource/background.css">


			<style>
				body {
					font-family: 'Noto Sans KR', sans-serif;

				}

				.navbar>.container-fluid {
					margin-left: 300px;
					margin-right: 300px;
				}

				.loginBox {
					display: block;
					text-align: center;
					width: 400px;
					height: 350px;
					position: absolute;
					padding: 30px;
					top: 50%;
					left: 50%;
					transform: translate(-50%, -50%);
					background-color: #ffffff;
					border-radius: 10px;
					border: 1px solid rgb(80, 80, 80);
				}


				.loginMenu {
					margin-top: 40px;
					font-family: 'Noto Sans KR', sans-serif;
					color: white;
				}

				.loginMenu>.btn {
					margin-right: 20px;
					width: 140px;
					height: 38px;
					font-size: 15px;
				}

				.loginMenu>a>.btn {
					margin-left: 20px;
					width: 140px;
					height: 38px;
					font-size: 15px;
				}


				.memberBox {
					width: 500px;
					margin: 50px;
				}

				.profile {
					margin: 30px;
				}

				.mt-4>h3 {
					font-family: 'Noto Sans KR', sans-serif;
					color: rgb(83, 83, 83);
					margin-top: -50px;
					font-size: 30px;
				}

				.btn-group-vertical,
				.card-title {
					margin: 10px;
					margin-left: 40px;
				}

				.card-text {
					text-align: center;
					margin-left: 10px;
					font-weight: 700;
				}

				.btn-group-vertical>a {
					margin-bottom: 10px;
				}

				.btn-group-vertical>a>.btn {
					text-align: center;
					width: 200px;
				}

				.bgc {
					width: 100%;
					height: 100%;
					position: absolute;
					z-index: -1;
				}

				.content {
					margin-top: 50px;
				}


				.ProfileContainer {
					display: flex;
					width: 100%;
				}

				.ProfileContainer>.myBoardList {

					margin-top: 50px;
					width: 800px;
				}

				.tableTitle {
					color: white;

				}
			</style>

		</head>

		<body>
			<div class="bgc">
				<div class="header">

					<!--Content before waves-->
					<div class="inner-header flex">
						<!--Just the logo.. Don't mind this-->
						<svg version="1.1" class="logo" baseProfile="tiny" id="Layer_1"
							xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
							y="0px" viewBox="0 0 500 500" xml:space="preserve">
							<path fill="#FFFFFF" stroke="#000000" stroke-width="10" stroke-miterlimit="10"
								d="M57,283" />
							<g>
							</g>
						</svg>
					</div>

					<!--Waves Container-->
					<div>
						<svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
							viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
							<defs>
								<path id="gentle-wave"
									d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
							</defs>
							<g class="parallax">
								<use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.7" />
								<use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
								<use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)" />
								<use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
							</g>
						</svg>
					</div>
					<!--Waves end-->

				</div>
				<!--Header ends-->

				<!--Content starts-->
				<div class="content flex">
					<p> EZEN | Test Board </p>
				</div>

			</div>



			<nav class="navbar navbar-expand-lg bg-body-tertiary">
				<div class="container-fluid">
					<a class="navbar-brand" href="/brd/home?writer=${ses.id}"> EZEN </a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
						data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarColor01">
						<ul class="navbar-nav me-auto">
							<li class="nav-item">
								<a class="nav-link active" href="#"> 공지사항
									<span class="visually-hidden">(current)</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/brd/pageList"> 게시판 </a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">회원정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">제작자</a>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
									aria-haspopup="true" aria-expanded="false">Dropdown</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">Action</a>
									<a class="dropdown-item" href="#">Another action</a>
									<a class="dropdown-item" href="#">Something else here</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Separated link</a>
								</div>
							</li>
						</ul>
						<form class="d-flex">
							<input class="form-control me-sm-2" type="search" placeholder="Search">
							<button class="btn btn-secondary my-2 my-sm-0" type="button">Search</button>
						</form>
					</div>
				</div>
			</nav>


			<c:if test="${ses.id eq null }">
				<div class="loginBox">
					<form action="/mem/login" method="post">
						<div class="form-group">
							<label class="form-label mt-4">
								<h3> BOARD LOGIN </h3>
							</label>
							<div class="form-floating mb-3">
								<input type="text" name="id" class="form-control" id="floatingInput" placeholder="아이디">
								<label for="floatingInput"> 아이디 </label>
							</div>
							<div class="form-floating">
								<input type="password" name="pwd" class="form-control" id="floatingPassword"
									placeholder="비밀번호" autocomplete="off">
								<label for="floatingPassword"> 비밀번호 </label>
							</div>

							<div class="loginMenu">
								<button type="submit" class="btn btn-success"> 로그인 </button>
								<a href="/mem/join">
									<button type="button" class="btn btn-success">회원가입</button></a>
							</div>
						</div>
					</form>
				</div>
			</c:if>

			<div class="ProfileContainer">

				<div>
					<c:if test="${ses.id ne null }">
						<div class="memberBox">
							<div class="card border-secondary mb-3" style="max-width: 20rem;">
								<div class="card-header"> 회원 프로필 </div>
								<c:if test="${ses.profile ne '' && ses.profile ne null }">
									<img class="profile" src="/_profileUpload/${ses.profile}" width="250" height="250">
								</c:if>

								<div class="card-body">
									<h4 class="card-title">${ses.id }님 환영합니다</h4>
									<p class="card-text">
										가입 날짜 : ${ses.regdate } <br>
										마지막 접속 : ${ses.lastlogin } <br>
									</p>
									<div class="btn-group-vertical">
										<a href="/brd/register"><button type="button" class="btn btn-success"> 게시판 글쓰기
											</button></a>
										<a href="/mem/modify"><button type="button" class="btn btn-success"> 회원정보
												수정</button></a>
										<a href="/mem/list"><button type="button" class="btn btn-success"> 회원정보
												리스트</button></a>
										<a href="/mem/logout"><button type="button" class="btn btn-success"> 로그아웃
											</button></a>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</div>



				<div class="myBoardList">
					<c:if test="${ses.id ne null }">
						<table class="table table-hover">
							<h3 class="tableTitle">나의 게시물 목록</h3>
							<tr class="table-dark">
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>추천수</th>
							</tr>


							<c:forEach items="${mylist}" var="bvo">
								<tr scope="row">
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
								</tr>
							</c:forEach>


						</table>
					</c:if>
				</div>

			</div>



			<script type="text/javascript">
				const msg_login = `<c:out value="${msg_login}" />`;
				if (msg_login === '0') {
					alert("로그인 정보가 일치하지 않습니다.");
				}
			</script>
		</body>

		</html>