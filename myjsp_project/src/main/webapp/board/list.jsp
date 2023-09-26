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

				h1 {
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

				.boardContainer {
					display: block;
					text-align: center;
					width: 1000px;
					position: absolute;
					top: 50%;
					left: 50%;
					transform: translate(-50%, -50%);
					background-color: #ffffff;
					border-radius: 10px;
					border: 1px solid rgb(80, 80, 80);
					padding: 30px;
				}

				.pgContainer {
					display: flex;
					justify-content: center;
				}

				.boardBox {
					display: flex;
				}

				.boardSearch {
					display: flex;
					justify-content: center;
				}


				.form-select {
					width: 200px;
					line-height: -100px;
				}

				.form-control {
					width: 200px;
				}

				.boardBtnContainer {
					display: flex;
					justify-content: center;
					margin: 30px;
				}

				.btn-success {
					width: 150px;
					margin-right: 20px;
					margin-left: 20px;
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

			<div class="boardContainer">

				<h1> 게시판 </h1>
				<c:set value="${ph.pgvo.qty }" var="qtyTest"></c:set>
				<select name="" id="boardQuantity">
					<option value="10"> 10개씩 </option>
					<option value="5"> 5개씩 </option>
					<option value="7"> 7개씩 </option>
					<option value="20"> 20개씩 </option>
				</select>





				<table class="table table-hover">

					<tr class="table-dark">
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
						</tr>
					</c:forEach>


				</table>



				<!-- "이전" 버튼 -->
				<div class="pgContainer">
					<ul class="pagination">
						<c:if test="${ph.prev}">
							<li class="page-item">
								<a class="page-link"
									href="/brd/pageList?pageNo=${ph.startPage-1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">&laquo;</a>
							</li>
						</c:if>

						<!-- 페이지 네이션 -->
						<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
							<li class="page-item">
								<a class="page-link"
									href="/brd/pageList?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i}</a>
							</li>
						</c:forEach>

						<!-- "다음"버튼 -->
						<c:if test="${ph.next}">
							<li class="page-item">
								<a class="page-link"
									href="/brd/pageList?pageNo=${ph.endPage+1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</div>

				<!-- 검색 -->
				<div class="boardSearch">
					<div class="form-group">
						<form action="/brd/pageList" method="get">
							<c:set value="${ph.pgvo.type }" var="typed"></c:set>
							<div class="boardBox">
								<select name="type" class="form-select" id="exampleDisabledSelect1">
									<option ${typed==null? 'selected' : '' }> <span class="selectText"> 검색목록 </span>
									</option>
									<option value="t" ${typed eq 't' ? 'selected' : '' }> <span class="selectText"> 제목
										</span> </option>
									<option value="w" ${typed eq 'w' ? 'selected' : '' }> <span class="selectText"> 작성자
										</span> </option>
									<option value="c" ${typed eq 'c' ? 'selected' : '' }> <span class="selectText"> 내용
										</span> </option>
									<option value="tw" ${typed eq 'tw' ? 'selected' : '' }> <span class="selectText">
											제목+작성자 </span> </option>
									<option value="tc" ${typed eq 'tc' ? 'selected' : '' }> <span class="selectText">
											제목+내용 </span> </option>
									<option value="wc" ${typed eq 'wc' ? 'selected' : '' }> <span class="selectText">
											작성자+내용 </span> </option>
									<option value="twc" ${typed eq 'twc' ? 'selected' : '' }> <span class="selectText">
											전체 </span> </option>
								</select>
								<input type="hidden" name="pageNo" value="${ph.pgvo.pageNo }">
								<input type="hidden" name="qty" value="${ph.pgvo.qty }">
								<div class="input-group mb-3">
									<input type="text" name="keyword" class="form-control" placeholder="검색어 입력"
										aria-label="Recipient's username" aria-describedby="button-addon2">
									<button class="btn btn-success" type="submit" id="button-addon2"> 검색 </button>
								</div>
							</div>
						</form>
					</div>
				</div>




				<div class="boardBtnContainer">
					<c:if test="${ses.id ne null}">
						<a href="/brd/register"> <button type="button" class="btn btn-success">글쓰기</button></a>
					</c:if>
					<a href="/brd/home?writer=${ses.id}"> <button type="button" class="btn btn-success">이전으로</button>
					</a>
				</div>
			</div>


			<script src="/resource/board_list.js"></script>


		</body>

		</html>