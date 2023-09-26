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

				.memberModContainer {
					display: block;
					text-align: center;
					width: 600px;
					position: absolute;
					top: 50%;
					left: 50%;
					transform: translate(-50%, -40%);
					background-color: #ffffff;
					border-radius: 10px;
					border: 1px solid rgb(80, 80, 80);
				}

				.form-group {
					display: flex;
					justify-content: center;
					margin: 20px;
				}

				.form-control {
					margin-top: 20px;
				}

				.text-muted {
					font-size: 13px;
					color: rgb(199, 199, 199);
					left: 170px;
					position: absolute;
					top: 450px;
					margin-top: -100px;
				}

				.mt-4 {
					margin-top: -50px;
					width: 80px;
				}


				.memberTitle {
					margin: 30px;
				}

				.memberTitle>h3 {
					font-family: 'Noto Sans KR', sans-serif;
					font-weight: 600;
				}

				.memberModBtnContainer {
					display: flex;
					justify-content: center;
					margin: 30px;
				}

				.memberModBtnContainer>.btn-success,
				.memberModBtnContainer>a>.btn-success {
					margin-left: 10px;
					margin-right: 10px;
					font-weight: 700;
					font-family: 'Noto Sans KR', sans-serif;
					font-size: 18px;
				}

				.memberModBtnContainer>a>.btn-danger {
					margin-left: 50px;
					font-family: 'Noto Sans KR', sans-serif;
					font-size: 18px;
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


			<div class="memberModContainer">

				<div class="memberTitle">
					<h3> 회원 정보 수정 </h3>
				</div>

				<form action="/mem/update" method="post" enctype="multipart/form-data">

					<div class="form-group">
						<label class="col-form-label mt-4" for="inputDefault"> <span class="memberText"> 아이디 </span>
						</label>
						<input type="text" name="id" class="form-control" value="${ses.id }" readonly="readonly"
							id="inputDefault">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1" class="form-label mt-4"><span class="memberText"> 비밀번호
							</span> </label>
						<input type="password" name="pwd" value="${ses.pwd }" class="form-control"
							id="exampleInputPassword1" placeholder="PASSWORD" autocomplete="off">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1" class="form-label mt-4"><span class="memberText"> 이메일 </span>
						</label>
						<input type="email" name="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" value="${ses.email }">
						<small id="emailHelp" class="form-text text-muted"> 이메일 양식을 지켜주세요 (xxx@naver.com) </small>
					</div>
					<div class="form-group">
						<label class="col-form-label mt-4" for="inputDefault"><span class="memberText"> 나이 </span>
						</label>
						<input type="text" name="age" class="form-control" value="${ses.age }" id="inputDefault">
					</div>
					<div class="form-group">
						<label for="exampleTextarea" class="form-label mt-4"><span class="memberText"> 자기소개
							</span></label>
						<textarea class="form-control" name="introduce" id="exampleTextarea"
							rows="3">${ses.introduce }</textarea>
					</div>
					<hr>
					<br>
					<div class="memberTitle">
						<h4> 현재 프로필사진 </h4>
					</div>


					<c:if test="${ses.profile ne '' && ses.profile ne null }">
						<img src="/_profileUpload/${ses.profile}" alt="설정된 프로필사진이 없습니다." width="300" height="300">
					</c:if>
					<br>
					<input type="hidden" name="profile" value="${ses.profile }">
					<div class="form-group">
						<label for="formFile" class="form-label mt-4"><span class="memberText"> 프로필 사진 </span></label>
						<input class="form-control" name="new_profile" type="file" accept="image/*" id="formFile">
					</div>
					<div class="memberModBtnContainer">
						<button type="submit" class="btn btn-success"> 작성완료 </button>
						<a href="/index.jsp"> <button type="button" class="btn btn-success"> 메인으로 </button></a>
						<a href="/mem/remove"> <button type="button" class="btn btn-danger"> 회원탈퇴 </button></a>
					</div>
				</form>
			</div>

		</body>

		</html>