<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/myweb/login/record_dealing/record_dealing.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="productPage">
	<div id="root">
		<div class="root_container">
			<div class="record_container">
				<header class="record_header">
					<h1>거래내역</h1>
				</header>
				<main class="record_main">
					<nav class="record_nav">
						<ul class="record_ul">
							<li class="selected">
								<button type="button" data-index="0">구매</button>
							</li>
							<li class="">
								<button type="button" data-index="1">판매</button>
							</li>
							<li class="">
								<button type="button" data-index="2">전산</button>
							</li>
							<li class="line" role="presentation"></li>
						</ul>
						<div class="record_body">
							<nav class="filters">
								<div>
									<button class="Filter_select">전체 상태</button>
									<button class="Filter_unselect">진행 중</button>
									<button class="Filter_unselect">완료</button>
									<button class="Filter_unselect">취소/환불</button>
								</div>
								<div>
									<div class="filter_array">
										<svg width="20" height="20" xmlns="http://www.w3.org/2000/svg"
											fill="#fffef" viewBox="0 0 20 20">
								<path
												d="M0 3a1 1 0 011-1h3.185A2.995 2.995 0 017 0a2.995 2.995 0 012.815 2H19a1 1 0 010 2H9.815A2.995 2.995 0 017 6a2.995 2.995 0 01-2.815-2H1a1 1 0 01-1-1zm20 14a1 1 0 01-1 1H9.815A2.995 2.995 0 017 20a2.995 2.995 0 01-2.815-2H1a1 1 0 010-2h3.185A2.995 2.995 0 017 14a2.995 2.995 0 012.815 2H19a1 1 0 011 1zm0-7a1 1 0 01-1 1h-3.185A2.995 2.995 0 0113 13a2.995 2.995 0 01-2.815-2H1a1 1 0 010-2h9.185A2.995 2.995 0 0113 7a2.995 2.995 0 012.815 2H19a1 1 0 011 1zM6 3a1 1 0 102 0 1 1 0 00-2 0zm2 14a1 1 0 10-2 0 1 1 0 002 0zm6-7a1 1 0 10-2 0 1 1 0 002 0z"
												fill="#fffef" fill-rule="evenodd"></path>
								</svg>
									</div>
								</div>
							</nav>
							<div class="record_contents">
								<div class="record_content">
								구매 내역이 없습니다.
								</div>
							</div>
						</div>
					</nav>
				</main>
			</div>
		</div>
	</div>
</div>
</body>
</html>