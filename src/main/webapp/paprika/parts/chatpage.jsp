<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="utf-8" />
<c:set value="${param.id }" var="id" />
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/a75c39dc66.js" crossorigin="anonymous"></script>
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
 $(document).ready(function(){
	 $("ul.list li").click(function(){
			var chatname = $(this).find('.name').text();
			var chatimg = $(this).find('.cimg').attr("src");
	 		$(".chat").load("chatcontent.jsp?chatname="+chatname+"&chatimg="+chatimg);
	 	})
	 })
</script>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/mychat.css">

<title>Insert title here</title>
</head>
<body>
	<div class="container clearfix">
		<div class="people-list" id="people-list">
			<div class="search">
				<input type="text" placeholder="search" /> <i class="fa fa-search"></i>
			</div>
			<ul class="list">
				<li class="clearfix"><img class="cimg"
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_01.jpg"
					alt="avatar" />
					<div class="about">
						<div class="name">임승택</div>
						<div class="status">
							<i class="fa fa-circle online"></i> online
						</div>
					</div></li>

				<li class="clearfix"><img class="cimg"
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_02.jpg"
					alt="avatar" />
					<div class="about">
						<div class="name">장문기</div>
						<div class="status">
							<i class="fa fa-circle offline"></i> left 7 mins ago
						</div>
					</div></li>

				<li class="clearfix"><img class="cimg"
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_03.jpg"
					alt="avatar" />
					<div class="about">
						<div class="name">박예솔</div>
						<div class="status">
							<i class="fa fa-circle online"></i> online
						</div>
					</div></li>

				<li class="clearfix"><img class="cimg"
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_04.jpg"
					alt="avatar" />
					<div class="about">
						<div class="name">심준규</div>
						<div class="status">
							<i class="fa fa-circle online"></i> online
						</div>
					</div></li>

				<li class="clearfix"><img class="cimg"
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_05.jpg"
					alt="avatar" />
					<div class="about">
						<div class="name">임홍</div>
						<div class="status">
							<i class="fa fa-circle online"></i> online
						</div>
					</div></li>

				<li class="clearfix"><img class="cimg"
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_06.jpg"
					alt="avatar" />
					<div class="about">
						<div class="name">김유신</div>
						<div class="status">
							<i class="fa fa-circle offline"></i> left 30 mins ago
						</div>
					</div></li>
			</ul>
		</div>
		<div class="chat">
			

		</div>
		<!-- end chat -->
		
	</div>
</body>
</html>