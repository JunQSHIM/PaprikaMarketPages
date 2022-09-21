<%@page import="com.spring.myweb.VO.UserVO.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- <script src="/myweb/login/main/header/js/nav.js"></script> -->
<link rel="stylesheet" type="text/css"
	href="/myweb/login/main/header/css/nav.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/css/grid.css">
<script src="/myweb/login/main/header/js/nav.js"></script>
<head>
<meta charset="UTF-8">
<title>nav</title>
</head>
<body>
	<div class="grid_12 nav">
		<div class="grid_12 nafix">
			<div class="grid_4 loca">
				<div class="row category_btn">
					<button id="showCategory">
						<div class="cb">
							<img src="/myweb/login/images/category_button.png">
						</div>
					</button>
				</div>
				<div class="grid_2 logo">
					<img src="/myweb/login/images/dklogo.png" width="120%"
						onclick="location.href='main.do'">
				</div>
			

			</div>
			<div class="grid_6 search">
				<div class="search_text">
					<input type="text" placeholder="상품명, 지역명, @상점명 입력"
						name="keyword" value="${page.keyword }"><a type="button"><img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/search.png" width="50" height="25"></a>
				</div>
			</div>
			<div class="row grid_4 bts">

				<div class="nav_btn">

					<a class="mystore" href="create.do" onclick="post_check()">
					<!--  	<a class="sell_btn" href="/myweb/login/sell.jsp">-->
						<div class="btn_img">
							<img src="/myweb/login/images/sell_list.png" width="23"
								height="24">
						</div>
						<div class="btn_words">판매하기</div>
					</a>
				</div>
				<c:if test="${user.user_seq == null }">
				<div class="nav_btn_1">
					<a class="mystore" onclick="sangjum_chk();">
						<div class="btn_img">
							<img src="/myweb/login/images/mystore.png" width="23" height="24">
						</div>
						<div class="btn_words">상 점</div>
					</a>
				</div>
				</c:if>
				<c:if test="${user.user_seq != null }">
				<div class="nav_btn_1">
					<a class="mystore" onclick="location.href='myProductCart.do?user_seq=${user.user_seq}'">
						<div class="btn_img">
							<img src="/myweb/login/images/mystore.png" width="23" height="24">
						</div>
						<div class="btn_words">상 점</div>
					</a>
				</div>
				</c:if>
				<div class="nav_btn">
					<a class="chat" onclick="location.href='boardlist.do'">
						<div class="btn_img">
							<img src="/myweb/login/images/chatting.png" width="23"
								height="24">
						</div>
						<div class="btn_words">파프리카톡</div>
					</a>
				</div>
			</div>
		</div>
	</div>

	<div class="grid_12 fakenav"></div>

	<div class="grid_12">
		<hr id="mainLine">
	</div>
	
	<form id="moveForm" method="get">
				<input type="hidden" name="keyword" value="${page.keyword }">
				<input type="hidden" name="num" value="${page.num }">
	</form>
	<script type="text/javascript">
	$(".search_text a").on("click", function(e){
        e.preventDefault();
        let val = $("input[name='keyword']").val();
        let moveForm =$("#moveForm");
        console.log(val);
        moveForm.find("input[name='keyword']").val(val);
        console.log(val);
        moveForm.find("input[name='num']").val(1);
        moveForm.submit();
    });
	
	function sangjum_chk() {
		let id = "${user.user_seq}"
		var seq = "<c:out value='${user.user_seq}'/>"
		console.log(seq);
		if (id == "") {
			alert("상점은 로그인 후 사용하실 수 있습니다.");
			location.href = "loginForm.do";
		}
	}
	function talk_chk() {
		let id = "${user.id}"
		if (id == "") {
			alert("채팅 기능은 로그인 후 사용하실 수 있습니다.");
			location.href = "login.do";
		} else {
			location.href = "create.do"
		}
	}
	</script>

</body>
</html>