<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/myweb/login/main/main.js"></script>
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/board/board_content.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main Page</title>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/user/login/main/header/header.jsp"></jsp:include>
	</header>
	<article class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">
		
		<div id="content_mainForm">
			<div id="content_img">
				<img id="image" src="${photo }">
			</div>
			<div>
				<div id="writer_info">
					<div id="writer">
						<div id="writer_profile_img">
							<img src="">
						</div>
						<div id="writer_name">
							<div id="nickname">${board.nickname }</div>
						</div>
					</div>
				</div>
				<div id="content_detail">
					<p>${board.content }</p>
				</div>
				<div id="reply_area">
					
				</div>
			</div>
		</div>
		<div id="buttons">
			<button>수정</button>
			<button>삭제</button>
			<button onclick="location.href='boardlist.do'">목록</button>
		</div>
	</article>
	<div style="margin-bottom: 40px;"></div>	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>