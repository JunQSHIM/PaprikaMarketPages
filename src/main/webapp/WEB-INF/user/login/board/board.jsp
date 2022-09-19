<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/myweb/login/main/main.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/board/board.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main Page</title>
<script>
var link =  document.location.href;

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
				
				<c:forEach items="${board }" var="board" varStatus="status">
				<article class="article">
					<a class="article_link" href="boardDetail.do?user_seq=${user.user_seq }&board_seq=${board.board_seq }">
						<div class="article_photo">
							<img id="article_thumbnail" src="${photo[status.index] }">
						</div>
						<p class="article_title">${board.title }</p>
						<p class="article_content">${board.content }</p>
						<span class="article_comment_info">
							<span>작성자 : ${board.nickname }</span>
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
				<button id="myboard_button" onclick="location.href='myboard.do?user_seq=${user.user_seq}&mypage=y'">내 게시글 보기</button>
				<button id="myboard_button" onclick="location.href='boardlist.do'">전체 보기</button>
				
				
			</div>
		</div>
	</article>
	<br>
	<c:choose>
		<c:when test="${param.mypage eq 'y'}">
			<div class="pagingBody">
			 	<div class= "paging">
				<c:if test="${page.prev}">
					<a href="myboard.do?user_seq=${user.user_seq}&num=${page.startPageNum - 1}&mypage=y"> ◀ </a>
					
				</c:if>
			
				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
					<c:if test="${select != num}">
							<a href="myboard.do?user_seq=${user.user_seq}&num=${num}&mypage=y" class="present_page">${num}</a>
						</c:if> <c:if test="${select == num}">
							<b>${num}</b>
						</c:if>
					
				</c:forEach>
			
				<c:if test="${page.next}">
					<a href="myboard.do?user_seq=${user.user_seq}&num=${page.endPageNum + 1}&mypage=y">▶</a>
					
				</c:if>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="pagingBody">
			 	<div class= "paging">
				<c:if test="${page.prev}">
					<a href="boardlist.do?&num=${page.startPageNum - 1}"> ◀ </a>
					
				</c:if>
			
				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
					<c:if test="${select != num}">
							<a href="boardlist.do?&num=${num}" class="present_page">${num}</a>
						</c:if> <c:if test="${select == num}">
							<b>${num}</b>
						</c:if>
					
				</c:forEach>
			
				<c:if test="${page.next}">
					<a href="boardlist.do?num=${page.endPageNum + 1}">▶</a>
					
				</c:if>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<div style="margin-bottom:40px;"></div>
	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>