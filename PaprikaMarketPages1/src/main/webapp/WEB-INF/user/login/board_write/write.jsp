<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/myweb/login/main/main.js"></script>
<script src="/myweb/login/board_write/write.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link rel="stylesheet" type="text/css"
	href="/myweb/login/board_write/write.css">
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
		<div id="write_mainForm">
			<div id="write_detail">
				<div id="write_head">
					<div id="pageName">글 쓰기</div>
				</div>
				<form action="insertboardProc.do" method="post" id="board_form" name="board" enctype="multipart/form-data" accept-charset="UTF-8">
				<input type="hidden" name="user_seq"  value=${user.user_seq }>
					<div id="write_form">
							<div class="new_title">
								<input type="text" name="title"  maxlength="20" id="title" placeholder="제목을 입력해주세요">
							</div>
							<div class="new_content">
								<textarea name="content" rows="20" cols="120" onkeyup="chkMsgLength(500,content,currentMsgLen);" placeholder="내용을 입력해주세요"></textarea>
							</div>
							<div class="counter"> 
								<span id="currentMsgLen" style="padding-left: 60;">0</span>/500자
							</div>
							<div class="new_file" >
								<input type="file" name="file" id="file"  accept="image/jpg,image/png,image/jpeg" onchange="fileCheck(this)")/>
							</div>
							
						
					</div>
				</form>
			</div>
					<div class="button_wrap">
						<button onclick="location.href='boardlist.do'">작성 취소</button>
						<button type="submit" id="submit">글 등록</button>
					</div>
				</div>
		
	</article>
	<div style="margin-bottom: 40px;"></div>
	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>