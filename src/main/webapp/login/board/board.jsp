<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery-ui.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="board.css">
<script type="text/javascript" src="board.js"></script>
</head>
<body>
	<div class="container">
		<%@include file="header.jsp"%>
		<div class="search">
			<div class="logo">
				<img src="images/pklogo.png" onclick="main()">
			</div>
			<div class="search_bar">
				<div class="search_text">
					<input type="text" placeholder="상품명, 지역명, @상점명 입력"><a>검색</a>
				</div>
			</div>
			<div class="header_list">
				<button class="chat">
					<img src="./images/chatting.png" width="23" height="24">파프리카톡
				</button>
				<a class="mystore" href="myProductCart.jsp"><img src="./images/mystore.png" width="23" height="24">내상점</a>
				<a class="sell_btn"><img src="./images/sell_list.png" width="23" height="24">판매하기</a>
			</div>
		</div>
		<hr class="mainLine">
			<div id="category_btn">
				<button id="showCategory"><img src="images/category_button.png"></button>
			</div>
		<div id="board">
			<div id="category">
				<div id="categories">
					<form action="product.jsp" name="category">
						<ul id="result1">
							<li><button onclick="ctProduct()" name="product" value="디지털기기"><img src="images/ct_icon/digital.png"/>디지털기기/가전</button>
							<li><button onclick="ctProduct()" name="product" value="가구/인테리어"><img src="images/ct_icon/interior.png"/>가구/인테리어</button>
							<li><button onclick="ctProduct()" name="product" value="유아동/유아도서"><img src="images/ct_icon/baby.png"/>유아동/유아도서</button>
							<li><button onclick="ctProduct()" name="product" value="생활/가공식품"><img src="images/ct_icon/life.png"/>생활/가공식품</button>
							<li><button onclick="ctProduct()" name="product" value="스포츠/레저"><img src="images/ct_icon/sport.png"/>스포츠/레저</button>
							<li><button onclick="ctProduct()" name="product" value="여성잡화"><img src="images/ct_icon/waccessories.png"/>여성잡화</button>
							<li><button onclick="ctProduct()" name="product" value="여성의류"><img src="images/ct_icon/wclothes.png"/>여성의류</button>
							<li><button onclick="ctProduct()" name="product" value="남성패션/잡화"><img src="images/ct_icon/mclothes.png"/>남성패션/잡화</button>
							<li><button onclick="ctProduct()" name="product" value="게임/취미"><img src="images/ct_icon/game.png"/>게임/취미</button>
							<li><button onclick="ctProduct()" name="product" value="뷰티/미용"><img src="images/ct_icon/beauty.png"/>뷰티/미용</button>
							<li><button onclick="ctProduct()" name="product" value="반려동물용품"><img src="images/ct_icon/pet.png"/>반려동물용품</button>
							<li><button onclick="ctProduct()" name="product" value="도서/티켓/음반"><img src="images/ct_icon/ticket.png"/>도서/티켓/음반</button>
							<li><button onclick="ctProduct()" name="product" value="기타 중고물품"><img src="images/ct_icon/etc.png"/>기타 중고물품</button>
							<li><button onclick="ctProduct()" name="product" value="삽니다"><img src="images/ct_icon/buyproduct.png"/>삽니다</button>
						</ul>
					</form>
				</div>
			</div>
			<div id="board_list">
				<div id="board_content">
					<p id="board_head">동네 정보</p>
					<article class="article">
						<a class="article_link" href="">
							<div class="article_photo">
								<img id="article_thumbnail" src="https://dnvefa72aowie.cloudfront.net/origin/article/202208/89E071DCFCDF8FD4E621F5027C9A82603FBF15DE3E9F7D644038831E5B750413.jpg?q=82&amp;s=300x300&amp;t=crop">
							</div>
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
					<article class="article">
						<a class="article_link" href="">
							<div class="article_photo">
								<img id="article_thumbnail" src="https://dnvefa72aowie.cloudfront.net/origin/article/202208/89E071DCFCDF8FD4E621F5027C9A82603FBF15DE3E9F7D644038831E5B750413.jpg?q=82&amp;s=300x300&amp;t=crop">
							</div>
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
				</div>
			</div>
		</div>
		
		<footer>
			<%@include file="footer.jsp" %>
		</footer>
	</div>
	
	<div class="function">
		<div class="wishlist">
		찜한 상품<br>
		<a href="jjim_cart.jsp"> ♥ 2</a>
		</div>
		<div class="recent">
		최근본상품<br>
		........<br>
		<span class="recent_product">최근 본 상품<br>이<br> 없습니다.</span>
		</div>
	<div class="top" style="cursor: pointer"><div class="top_btn">TOP</div></div>
	</div>
	<!-- chat -->
	<div class="ui-dialog" id="chatting">
		<iframe src="chatpage.jsp"></iframe>
	</div>
</body>
</html>