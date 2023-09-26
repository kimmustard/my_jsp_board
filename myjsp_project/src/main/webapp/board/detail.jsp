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

				.bgc {
					width: 100%;
					height: 100%;
					position: absolute;
					z-index: -1;
				}

				.detailContainer {
					font-family: 'Noto Sans KR', sans-serif;
					position: absolute;
					text-align: center;
					width: 1000px;
					top: 150px;
					left: 450px;
					background-color: #ffffff;
					border-radius: 10px;
					border: 1px solid rgb(80, 80, 80);
					margin-bottom: 100px;
				}

				.contents {
					margin: 100px;
					height: 300px;
				}


				.detailBtnContainer {
					margin: 50px;
					margin-bottom: 30px;
				}

				.detailBtnContainer1,
				.detailBtnContainer2 {

					margin: 30px;
					display: flex;
					justify-content: center;
				}

				.btn-success {
					font-family: 'Noto Sans KR', sans-serif;
					margin-right: 20px;
					width: 100px;
				}

				.btn-danger {
					font-family: 'Noto Sans KR', sans-serif;
					font-size: 20px;
					width: 180px;
					height: 80px;
				}

				h3 {
					font-family: 'Noto Sans KR', sans-serif;
					margin: 30px;
				}

				th,
				td {
					font-size: 15px;
					font-family: 'Noto Sans KR', sans-serif;
				}

				.btn-dark {
					font-family: 'Noto Sans KR', sans-serif;
					font-size: 20px;
					color: white;
					width: 200px;
					height: 50px;
				}

				.deBtnTest {
					display: flex;
					justify-content: space-between;
				}

				.cmtline {
					margin-left: 50px;
					margin-right: 50px;
					margin-bottom: 100px;
				}

				.inputContent {
					margin-left: 50px;
					margin-right: 50px;
					width: 500px;
				}

				.cmtBtnContainer {
					display: flex;

				}

				.cmtModBtn,
				.cmtDelBtn {
					width: 70px;
				}

				.commentContainer {
					display: flex;
					justify-content: center;
					margin-right: 50px;
					margin-left: 50px;
					margin-top: 100px;
					margin-bottom: 100px;
				}

				.commentContainer>span {
					font-family: 'Noto Sans KR', sans-serif;
					font-weight: 700;
					width: 100px;
					margin-top: 8px;
				}

				.inputContent2 {
					width: 400px;
					justify-content: center;
					width: 800px;
				}

				.inputWriter {
					text-align: center;
					border: none;
					height: 40px;
					width: 80px;
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
					<a class="navbar-brand" href="/index.jsp"> EZEN </a>
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







			<div class="detailContainer">

				<h3> 게시글 상세보기 </h3>

				<c:if test="${bvo.image_File ne '' && bvo.image_File ne null}">
					<div>
						<img src="/_fileUpload/${bvo.image_File}" alt="이미지가 없습니다.">
					</div>
				</c:if>

				<table class="table table-hover">
					<tr class="table-dark">
						<th>글번호</th>
						<td>${bvo.bno}</td>
						<th>작성자</th>
						<td>${bvo.writer}</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${bvo.readcount}</td>
						<th>추천수</th>
						<td>${bvo.recommend}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">${bvo.title}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="contents" colspan="3">${bvo.content}</td>
					</tr>
					<tr>
						<th>게시날짜</th>
						<td>${bvo.regdate}</td>
						<th>수정날짜</th>
						<td>${bvo.moddate}</td>
					</tr>
				</table>
				<div class="detailBtnContainer">
					<c:if test="${ses.id ne null}">
						<div class="detailBtnContainer1">
							<form action="/brd/recommend" action="post">
								<input type="hidden" name="bno" value="${bvo.bno}">
								<input type="hidden" name="id" value="${ses.id}">
								<button type="submit" id="rcmChecker" class="btn btn-danger"> 추천 </button>
							</form>
						</div>
						<div class="deBtnTest">
							<div class="detailBtnContainer2">
								<a href="/brd/modify?bno=${bvo.bno}"> <button class="btn btn-success"> 수정 </button></a>
								<a href="/brd/remove?bno=${bvo.bno}"> <button class="btn btn-success"> 삭제 </button></a>
							</div>
							<div class="detailBtnContainer2">
								<a href="/brd/pageList"> <button class="btn btn-dark"> 게시물 리스트 </button> </a>
							</div>
						</div>
					</c:if>

				</div>

				<hr>

				<div>
					<h4> 댓글 작성 </h4>

					<div class="commentContainer">
						<span> 작성자 : </span>
						<input type="text" class="inputWriter" id="cmtWriter" value="${ses.id }" readonly="readonly">
						<div class="input-group mb-3">
							<c:if test="${ses.id ne null}">
								<input type="text" class="form-control inputContent2" id="cmtText"
									placeholder="댓글을 입력하세요">
								<button class="btn btn-success" type="button" id="cmtAddBtn"> 댓글 등록 </button>
							</c:if>
							<c:if test="${ses.id eq null || ses.id eq ''}">
								<input type="text" class="form-control inputContent2" id="cmtText"
									placeholder="로그인 후 이용해주세요" readonly="readonly">
								<button class="btn btn-success" type="button" id="cmtAddBtn" disabled> 댓글 등록 </button>
							</c:if>
						</div>

					</div>
				</div>

				<hr>

				<h3> 댓글 목록 </h3>

				<!-- 댓글 표시 라인 -->
				<div class="cmtline" id="cmtContainerExample">



				</div>





			</div>

			<script type="text/javascript">
				const bnoVal = `<c:out value="${bvo.bno}"/>`;
				const loginState = `<c:out value="${ses.id}"/>`

			</script>

			<script src="/resource/board_detail.js"></script>

			<script type="text/javascript">
				printCommentList(bnoVal);
			</script>

		</body>

		</html>