<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/myweb/login/main/main.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link rel="stylesheet" type="text/css"
	href="/myweb/login/board_write/write.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main Page</title>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String p = request.getParameter("product");
%>
<script>
	function ctProduct() {
		theForm.submit();
	}
	$(document).ready(function() {
		$("#showCategory").mouseenter(function() {
			$("#result1").show();
		});
		$("#category").mouseleave(function() {
			$("#result1").hide();
		});

		$("#top").click(function() {
			//$('html, body').animate({scrollTop:0}, '1000');
			$('html, body').scrollTop(0);
		});

	});
	function login() {
		window.location.href = '/myweb/login/login&register/login.jsp';
	}
	function register() {
		window.location.href = '/myweb/login/login&register/registerAgree.jsp';
	}
	function main() {
		window.location.href = '/myweb/login/main/mother.jsp';
	}
	function mypage() {
		window.location.href = '/myweb/login/mypage/mypage.jsp';
	}
	function toBoard() {
		window.location.href = '/myweb/login/board/board.jsp';
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/login/main/header/header.jsp"></jsp:include>
	</header>
	<article class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">
		<div id="write_mainForm">
			<div id="write_detail">
				<div id="write_head">
					<div id="pageName">글 쓰기</div>
				</div>
				<div id="write_form">
					<div class="new_title">
						<input type="text" id="title" placeholder="제목을 입력해주세요">
					</div>
					<div class="new_region">
						<input type="text" id="region" placeholder="지역을 입력해주세요">
					</div>
					<div class="new_content">
						<textarea rows="20" cols="80" placeholder="내용을 입력해주세요"></textarea>
					</div>
					<div class="new_file">
						<input type="file" id="file_1">
					</div>
					<div class="new_file">
						<input type="file" id="file_2">
					</div>
					<div class="button_wrap">
						<button id="cancel" onclick="toBoard()">작성 취소</button>
						<button id="save" onclick="toBoard()">글 등록</button>
					</div>
				</div>
			</div>
		</div>
	</article>
	<div style="margin-bottom: 40px;"></div>
	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>