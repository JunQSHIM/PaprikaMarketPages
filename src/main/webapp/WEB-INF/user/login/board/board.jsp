<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/myweb/login/main/main.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/board/board.css">
<script type="text/javascript" src="/myweb/login/board/board.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main Page</title>
<script>
	function toWritePage(){
		window.location.href = '/myweb/login/board_write/write.jsp';
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/user/login/main/header/header.jsp"></jsp:include>
	</header>
	<article class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">
		<div id="board_list">
			<div id="board_content">
				<div id="board_head">
					<div id="board_head_title">동네 정보</div>
					<div id="search_category">
						<select class="category" >
							<option value="category_title">제목</option>
							<option value="category_content">내용</option>
						</select>
					</div>
					<div id="board_head_search">
						<input type="text" placeholder="search">
					</div>
					<button type="submit">검색</button>
				</div>
				
				<c:forEach items="${board }" var="board">
				<article class="article">
					<a class="article_link" href="/myweb/login/board/board_content.jsp">
						<div class="article_photo">
							<img id="article_thumbnail" src="${board_photo }">
						</div>
						<p class="article_title">${board.title }</p>
						<p class="article_content">${board.content }</p>
						<span class="article_comment_info">
							<span class="article_comment">
								<img class="chat_icon" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/message-78e946f283b8e1e127133cbdc4195faaed6bd0e45cf697eb3430030d40329d38.svg">
								${reply }
							</span>
						</span>
					</a>
				</article>
				</c:forEach>
			</div>
			<div id="write_button_wrap">
				<button id="write_button" onclick="location.href='insertboard.do'">글 작성하기</button>
			</div>
		</div>
	</article>
	<div id="paging_button">
		<div class="page_wrap">
		   <div class="page_nation">
		      <a class="arrow prev" href="#"></a>
		      <a class="active num" href="#">1</a>
		      <a class="num" href="#">2</a>
		      <a class="num" href="#">3</a>
		      <a class="num" href="#">4</a>
		      <a class="num" href="#">5</a>
		      <a class="arrow next" href="#"></a>
		   </div>
		</div>
	</div>
	<div style="margin-bottom:40px;"></div>
	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>