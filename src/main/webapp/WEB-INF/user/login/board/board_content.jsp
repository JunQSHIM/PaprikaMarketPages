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
		<jsp:include page="/login/main/header/header.jsp"></jsp:include>
	</header>
	<article class="container_12">
		<jsp:include page="/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">
		<div id="content_mainForm">
			<div id="content_img">
				<img id="image" src="https://dnvefa72aowie.cloudfront.net/origin/article/202208/89E071DCFCDF8FD4E621F5027C9A82603FBF15DE3E9F7D644038831E5B750413.jpg?q=82&amp;s=300x300&amp;t=crop">
			</div>
			<div id="writer_info">
				<div id="writer">
					<div id="writer_profile_img">
						<img src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-0443429487fdc2277fc8f9dd1eca6fb8b678862f593e21222ba9f6592b99ad14.png">
					</div>
					<div id="writer_name">
						<div id="nickname">김유신</div>
						<div id="region_name">구로구 오류동</div>
					</div>
				</div>
			</div>
			<div id="content_detail">
				<p>
					오류동역 주차장 앞 길에 강아지 한 마리가 힘 없이 고개만 들고 누워있네요. 길강아지는 아닌거 같은데,, 버려진 강아지가 아니길 바라며 얼른 주인 찾아갔으면 좋겠어요.
				</p>
			</div>
			<div id="reply_area">
				
			</div>
		</div>
	</article>
	<div style="margin-bottom: 40px;"></div>
	<footer class="container_12">
		<jsp:include page="/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>