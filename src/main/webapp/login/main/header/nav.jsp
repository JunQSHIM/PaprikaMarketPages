<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/header/css/nav.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/grid.css">
<head>
<meta charset="UTF-8">
<title>nav</title>
</head>
<body>
			<div class="grid_12 nav">
				<div class="grid_12 nafix">
					<div class="grid_4 loca">
						<div class="grid_1 category_btn">
							<button id="showCategory">
								<img src="images/category_button.png">
							</button>
						</div>
						<div class="grid_2 logo">
							<img src="images/pklogo.png" onclick="main()">
						</div>


					</div>
					<div class="grid_6 search">
						<div class="search_text">
							<input type="text" placeholder="상품명, 지역명, @상점명 입력"><a>검색</a>
						</div>
					</div>
						<div class="row grid_4 bts">

							<div class="nav_btn">
								<a class="sell_btn"><img src="images/sell_list.png" width="23" height="24">판매하기</a>
							</div>
							<div class="nav_btn_1">
								<a class="mystore" href="myProductCart.jsp"><img src="images/mystore.png" width="23" height="24">상점
								</a>
							</div>
							<div class="nav_btn">
								<a class="chat">
									<img src="images/chatting.png" width="23" height="24">파프리카톡
								</a>
							</div>
						</div>
				</div>
			</div>

			<div class="grid_12 fakenav"></div>

			<div class="grid_12">
				<hr id="mainLine">
			</div>

</body>
</html>