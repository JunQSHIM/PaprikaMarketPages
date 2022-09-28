<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" type="text/css" href="/myweb/login/css/review_singo.css">
</head>
<body>
	<div class="modal2 hidden2">
		<div class="bg2"></div>
		<div class="modalBox2">
			<div class="popup">
				<div class="singo_board">
					<div class="singo_titles">
						<div class="singo_title">신고하기</div>
						<button class="closee">
							<img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/close.png" width="24" height="24">
						</button>
					</div>
				<form>
				<input type="hidden" id="user_seq" value="${user.user_seq }">
				<input type="hidden" id="post_seq" value="${post.post_seq }">
				<input type="hidden" id="user_singo_seq" value="${post.user_seq }">
					<div class="singo">
						<div class="singo_list">
							<div class="singo_list_1">
								<span>거래와 관계 없는 글</span>
								<button type="button" id="btn1">
									<img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/singo.png" width="13" height="8"
										alt="화살표 아이콘">
								</button>
							</div>
							<div class="prod_info_board" id="panel1">
								<div class="prod_info_content">
									<textarea id="reportText2"
										placeholder="신고 내용을 직접 작성해주세요.
자세하게 적어주시면 신고처리에 큰 도움이 됩니다."></textarea>
									<button type="button" class="report_content" onclick="textarea2()" >등록</button>
								</div>
							</div>
						</div>
					
						<div class="singo_list">
							<div class="singo_list_1">
								<span>언어폭력(비방,욕설,성희롱)</span>
								<button type="button" id="btn2">
									<img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/singo.png" width="13" height="8"
										alt="화살표 아이콘">
								</button>
							</div>
							<div class="prod_info_board" id="panel2">
								<div class="prod_info_content">
									<textarea id="reportText2"
										placeholder="신고 내용을 직접 작성해주세요.
자세하게 적어주시면 신고처리에 큰 도움이 됩니다."></textarea>
									<button type="button" class="report_content" onclick="textarea2()" >등록</button>
								</div>
							</div>
						</div>
						
				
						<div class="singo_list">
							<div class="singo_list_1">
								<span>기타</span>
								<button type="button" id="btn3">
									<img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/singo.png" width="13" height="8"
										alt="화살표 아이콘">
								</button>
							</div>
							<div class="prod_info_board" id="panel3">
								<div class="prod_info_content">
									<textarea id="reportText2"
										placeholder="신고 내용을 직접 작성해주세요.
자세하게 적어주시면 신고처리에 큰 도움이 됩니다."></textarea>
									<button type="button" class="report_content" onclick="textarea2()" >등록</button>
								</div>
							</div>
						</div>
					</div>
				</form>
				</div>
			</div>
			
		</div>
	</div>
<script type="text/javascript" src="/myweb/login/singo/review_singo.js"></script>
</body>

</html>