<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/myweb/login/css/oneonone.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal1 hidden1">
		<div class="bg1"></div>
		<div class="modalBox1">
			<div class="popup">
				<div class="singo_board">
					<div class="singo_titles">
						<div class="singo_title">1:1 문의하기</div>
						<button class="closeBt">
							<img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/close.png" width="24" height="24">
						</button>
					</div>
				<form>
				<input type="hidden" id="user_seq" value="${user.user_seq }">
					<div class="singo">
						<div class="singo_list">
							<div class="singo_list_1">
								<span>문의내용</span>
							</div>
							<div class="prod_info_board" id="panel">
								<div class="prod_info_content">
									<textarea id="reportText"
										placeholder="문의할 내용을 입력해주세요."></textarea>
									<button type="button" class="content" onclick="textarea3()" >등록</button>
								</div>
							</div>
						</div>
					</div>
				</form>
				</div>
			</div>
			
		</div>
	</div>
<script type="text/javascript" src="/myweb/login/js/oneonone.js"></script>
</body>
</html>