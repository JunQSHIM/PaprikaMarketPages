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
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String p = request.getParameter("product");
%>
<script>
	function ctProduct(){
		theForm.submit();
	}
	$(document).ready(function(){
		$("#showCategory").mouseenter(function(){
			$("#result1").show();
		});
		$("#category").mouseleave(function(){
			$("#result1").hide();
		});
		
		$("#top").click(function() {
			//$('html, body').animate({scrollTop:0}, '1000');
			$('html, body').scrollTop(0);
		});
		
	});
	function login()  {
		 window.location.href ='/myweb/login/login&register/login.jsp';
	}	
	function register()  {
		 window.location.href ='/myweb/login/login&register/registerAgree.jsp';
	}
	function main(){
		window.location.href = '/myweb/login/main/mother.jsp';
	}
	function mypage(){
		window.location.href = '/myweb/login/mypage/mypage.jsp';
	}
	function toWritePage(){
		window.location.href = '/myweb/login/board_write/write.jsp';
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/login/main/header/header.jsp"></jsp:include>
	</header>
	<article class="container_12">
		<jsp:include page="/login/main/category.jsp"></jsp:include>
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
				<article class="article">
					<a class="article_link" href="">
						<div class="article_photo">
							<img id="article_thumbnail" src="https://dnvefa72aowie.cloudfront.net/origin/article/202208/89E071DCFCDF8FD4E621F5027C9A82603FBF15DE3E9F7D644038831E5B750413.jpg?q=82&amp;s=300x300&amp;t=crop">
						</div>
						<p class="article_title">
							첫번째 글 제목
						</p>
						<p class="article_content">
							오류동역 주차장 앞 길에 강아지 한 마리가 힘 없이 고개만 들고 누워있네요. 길강아지는 아닌거 같은데,, 버려진 강아지가 아니길 바라며 얼른 주인 찾아갔으면 좋겠어요.
						</p>
						<p class="region">
							서울 구로구 오류동
						</p>
						<span class="article_comment_info">
							<span class="article_comment">
								<img class="chat_icon" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/message-78e946f283b8e1e127133cbdc4195faaed6bd0e45cf697eb3430030d40329d38.svg">
								20
							</span>
						</span>
					</a>
				</article>
				<hr class="article_hr">
				<article class="article">
					<a class="article_link" href="">
						<p class="article_title">
							두번째 글 제목
						</p>
						<p class="article_content">
							당근 생활 중 처음으로 마음 상한 당근을 했어요 일부로 밤 늦게 시간내서 멀리 찾아간 사람에게 그냥 '안녕하세요' '안녕히 가세요' '찾아오시느라 고생했어요' 라는 일상적인 인사들을 바란 건 너무 과한 기대인...
						</p>
						<p class="region">
							서울 동작구 노량진동
						</p>
						<span class="article_comment_info">
							<span class="article_comment">
								<img class="chat_icon" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/message-78e946f283b8e1e127133cbdc4195faaed6bd0e45cf697eb3430030d40329d38.svg">
								15
							</span>
						</span>
					</a>
				</article>
				<hr class="article_hr">
				<article class="article">
					<a class="article_link" href="">
						<p class="article_title">
							세번째 글 제목
						</p>
						<p class="article_content">
							어제 화곡2동 어린이집 사고 글 작성 했던 사람 입니다.
							고민 하다 오늘 담임 만나서 한번더 상황에 대해 물어 봤습니다.
							이유식 먹는중이였고 순식간에 아이가 먹었다고 하더군요.
							원장실 가서 cctv 보...
						</p>
						<p class="region">
							서울 강서구 화곡제2동
						</p>
						<span class="article_comment_info">
							<span class="article_comment">
								<img class="chat_icon" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/message-78e946f283b8e1e127133cbdc4195faaed6bd0e45cf697eb3430030d40329d38.svg">
								15
							</span>
						</span>
					</a>
				</article>
				<hr class="article_hr">
				<article class="article">
					<a class="article_link" href="">
						<div class="article_photo">
							<img id="article_thumbnail" src="https://dnvefa72aowie.cloudfront.net/origin/article/202208/e846e5b608fbcbadf4677996db7a421989b92018cbfc6bf27f5d7ce6fd34cdc8.webp?q=82&s=300x300&t=crop">
						</div>
						<p class="article_title">
							네번째 글 제목
						</p>
						<p class="article_content">
							구월4동 현대 오일뱅크 옆 자전거 판매점 앞에서
							다친 새끼 길고양이를 봤습니다.
							거기 계셨던 라이더님 말씀으론 차에 치였다고 들었어요
							새끼 고양이는 살아 있었고
							2차 사고를 예방해서 라이더님이 구석으로 옮겨...
						</p>
						<p class="region">
							마계 인천 남동구 구월4동
						</p>
						<span class="article_comment_info">
							<span class="article_comment">
								<img class="chat_icon" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/message-78e946f283b8e1e127133cbdc4195faaed6bd0e45cf697eb3430030d40329d38.svg">
								1818
							</span>
						</span>
					</a>
				</article>
				<hr class="article_hr">
				<article class="article">
					<a class="article_link" href="">
						<div class="article_photo">
							<img id="article_thumbnail" src="https://dnvefa72aowie.cloudfront.net/origin/article/202208/7d69c6017cdd18f45e541f898c3e83dcaee5aa1bbee93d999b54483b32ff74ca.webp?q=82&s=300x300&t=crop">
						</div>
						<p class="article_title">
							다섯번째 글 제목
						</p>
						<p class="article_content">
							요즘 들어  하루건너 한번씩 문자가 와요
							헌혈할 날자가 한참 지나서랍니다
							그렇더라도 11월까지는 할수가 없는대요
							눈썹문신하면 6개월은 할수가 없답니다
							나두 간절이 하고 싶은데
							안해주면서 말입니다 
							우리 님...
						</p>
						<p class="region">
							광주 서구 화정3동
						</p>
						<span class="article_comment_info">
							<span class="article_comment">
								<img class="chat_icon" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/message-78e946f283b8e1e127133cbdc4195faaed6bd0e45cf697eb3430030d40329d38.svg">
								18
							</span>
						</span>
					</a>
				</article>
				<hr class="article_hr">
				<article class="article">
					<a class="article_link" href="">
						<p class="article_title">
							여섯번째 글 제목
						</p>
						<p class="article_content">
							5000-9000 사이  투룸 전세 알아보는데  
							어플보단 중개소 돌아다니는게 나을려나요?  
							대출도 좀 껴야해서…
						</p>
						<p class="region">
							울산 남구 삼산동
						</p>
						<span class="article_comment_info">
							<span class="article_comment">
								<img class="chat_icon" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/message-78e946f283b8e1e127133cbdc4195faaed6bd0e45cf697eb3430030d40329d38.svg">
								4
							</span>
						</span>
					</a>
				</article>
				<hr class="article_hr">
				<article class="article">
					<a class="article_link" href="">
						<div class="article_photo">
							<img id="article_thumbnail" src="https://dnvefa72aowie.cloudfront.net/origin/article/202208/89E071DCFCDF8FD4E621F5027C9A82603FBF15DE3E9F7D644038831E5B750413.jpg?q=82&amp;s=300x300&amp;t=crop">
						</div>
						<p class="article_title">
							일곱번째 글 제목
						</p>
						<p class="article_content">
							오류동역 주차장 앞 길에 강아지 한 마리가 힘 없이 고개만 들고 누워있네요. 길강아지는 아닌거 같은데,, 버려진 강아지가 아니길 바라며 얼른 주인 찾아갔으면 좋겠어요.
						</p>
						<p class="region">
							서울 구로구 오류동
						</p>
						<span class="article_comment_info">
							<span class="article_comment">
								<img class="chat_icon" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/message-78e946f283b8e1e127133cbdc4195faaed6bd0e45cf697eb3430030d40329d38.svg">
								20
							</span>
						</span>
					</a>
				</article>
				<hr class="article_hr">
				<article class="article">
					<a class="article_link" href="">
						<div class="article_photo">
							<img id="article_thumbnail" src="https://dnvefa72aowie.cloudfront.net/origin/article/202208/89E071DCFCDF8FD4E621F5027C9A82603FBF15DE3E9F7D644038831E5B750413.jpg?q=82&amp;s=300x300&amp;t=crop">
						</div>
						<p class="article_title">
							여덟번째 글 제목
						</p>
						<p class="article_content">
							오류동역 주차장 앞 길에 강아지 한 마리가 힘 없이 고개만 들고 누워있네요. 길강아지는 아닌거 같은데,, 버려진 강아지가 아니길 바라며 얼른 주인 찾아갔으면 좋겠어요.
						</p>
						<p class="region">
							서울 구로구 오류동
						</p>
						<span class="article_comment_info">
							<span class="article_comment">
								<img class="chat_icon" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/message-78e946f283b8e1e127133cbdc4195faaed6bd0e45cf697eb3430030d40329d38.svg">
								20
							</span>
						</span>
					</a>
				</article>
			</div>
			<div id="write_button_wrap">
				<button id="write_button" onclick=toWritePage()>글 작성하기</button>
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
		<jsp:include page="/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>