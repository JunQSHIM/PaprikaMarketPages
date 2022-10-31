<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/login/singo/singo.css">
</head>
<body>
	<div class="modal hidden">
		<div class="bg"></div>
		<div class="modalBox">
			<div class="popup">
				<div class="singo_board">
					<div class="singo_titles">
						<div class="singo_title">신고하기</div>
						<button class="closeBtn">
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
								<span>광고 (상점 및 타사이트 홍보, 상품도배)</span>
								<button type="button" id="btn1">
									<img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/singo.png" width="13" height="8"
										alt="화살표 아이콘" id="img1">
								</button>
							</div>
							<div class="trade_list" id="panel1">
								<div class="trade_list_1">
									<button type="button" class="report_content" value="상점 및 타사이트 홍보">상점 및 타사이트 홍보</button>
								</div>
								<div class="trade_list_1">
									<button type="button" class="report_content" value="상품 도배">상품 도배</button>
								</div>
							</div>
						</div>
						<div class="singo_list">
							<div class="singo_list_1">
								<span>상품 정보 부정확 (상품명, 이미지, 가격, 태그 등)</span>
								<button type="button" id="btn2">
									<img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/singo.png" width="13" height="8"
										alt="화살표 아이콘">
								</button>
							</div>
							<div class="prod_info_board" id="panel2">
								<div class="prod_info_content">
									<textarea id="reportText1"
										placeholder="신고 내용을 직접 작성해주세요.
자세하게 적어주시면 신고처리에 큰 도움이 됩니다."></textarea>
									<button type="button" onclick="textarea1()" >등록</button>
								</div>
							</div>
						</div>
						<div class="singo_list">
							<div class="singo_list_1">
								<span>거래 금지 품목</span>
								<button type="button" id="btn3">
									<img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/singo.png" width="13" height="8"
										alt="화살표 아이콘" >
								</button>
							</div>
							<div class="trade_list" id="panel3">
								<div class="trade_list_1">
									<button class="report_content" type="button" value="가품(위조품/이미테이션)">가품(위조품/이미테이션)</button>
								</div>
								<div class="trade_list_1">
									<button class="report_content" type="button" value="개인정보 거래(SNS계정, 인증번호 등)">개인정보 거래(SNS계정, 인증번호 등)</button>
								</div>
								<div class="trade_list_1">
									<button class="report_content" type="button" value="게임계정/아이템/대리육성">게임계정/아이템/대리육성</button>
								</div>
								<div class="trade_list_1">
									<button class="report_content" type="button" value="담배">담배</button>
								</div>
								<div class="trade_list_1">
									<button class="report_content" type="button" value="반려동물(분양/입양 글)">반려동물(분양/입양 글)</button>
								</div>
								<div class="trade_list_1">
									<button class="report_content" type="button" value="비매품 판매(화장품 샘플 등)">비매품 판매(화장품 샘플 등)</button>
								</div>
								<div class="trade_list_1">
									<button class="report_content" type="button" value="음란물/성인용품(중고속옷 포함)">음란물/성인용품(중고속옷 포함)</button>
								</div>
								<div class="trade_list_1">
									<button class="report_content" type="button" value="의약품/의료기기">의약품/의료기기</button>
								</div>
								<div class="trade_list_1">
									<button class="report_content" type="button" value="조건부 무료나눔">조건부 무료나눔</button>
								</div>
								<div class="trade_list_1">
									<button class="report_content" type="button" value="주류">주류</button>
								</div>
							</div>
						</div>
						<div class="singo_list">
							<div class="singo_list_1">
								<span>안전결제 허위매물(안전결제 표시 상품 안전결제 거부)</span>
								<button type="button" id="btn4">
									<img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/singo.png" width="13" height="8"
										alt="화살표 아이콘">
								</button>
							</div>
							<div class="trade_list" id="panel4">
								<div class="trade_list_1">
									<button type="button" class="report_content" value="안전결제 거부">안전결제 거부</button>
								</div>
								<div class="trade_list_1">
									<button type="button" class="report_content" value="배송전 구매확정 요청">배송전 구매확정 요청</button>
								</div>
								<div class="trade_list_1">
									<button type="button" class="report_content" value="추가 금액 요청">추가 금액 요청</button>
								</div>
							</div>
						</div>
						<div class="singo_list">
							<div class="singo_list_1">
								<span>기타(사유)</span>
								<button type="button" id="btn6">
									<img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/singo.png" width="13" height="8"
										alt="화살표 아이콘">
								</button>
							</div>
							<div class="prod_info_board" id="panel6">
								<div class="prod_info_content">
									<textarea id="reportText2"
										placeholder="신고 내용을 직접 작성해주세요.
자세하게 적어주시면 신고처리에 큰 도움이 됩니다."></textarea>
									<button type="button" class="report_content1" onclick="textarea2()" >등록</button>
								</div>
							</div>
						</div>
					</div>
				</form>
				</div>
			</div>
			
		</div>
	</div>
	<script type="text/javascript" src="/myweb/login/singo/singo.js"> </script>
	
</body>
</html>