<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="singo.css">
</head>
<body>
	<div class="popup">
		<div class="singo_board">
			<div class="singo_titles">
				<div class="singo_title">신고하기</div>
				<button class="singo_close" id="btn7">
					<img src="../images/close.png" width="24" height="24">
				</button>
			</div>
			<div class="singo" >
				<div class="singo_list" >
					<div class="singo_list_1" >
						<span>광고 (상점 및 타사이트 홍보, 상품도배)</span>
						<button type="button" id="btn1">
							<img
								src="../images/dropdown.png"
								width="13" height="8" alt="화살표 아이콘" id="img1">
						</button>
					</div>
					<div class="trade_list" id="panel1">
						<div class="trade_list_1">
							<button type="button">상점 및 타사이트 홍보</button>
						</div>
						<div class="trade_list_1">
							<button type="button">상품 도배</button>
						</div>
					</div>
				</div>
				<div class="singo_list">
					<div class="singo_list_1">
						<span>상품 정보 부정확 (상품명, 이미지, 가격, 태그 등)</span>
						<button type="button" id="btn2">
							<img
								src="../images/dropdown.png"
								width="13" height="8" alt="화살표 아이콘" >
						</button>
					</div>
					<div class="prod_info_board" id="panel2">
						<div class="prod_info_content">
							<textarea
								placeholder="신고 내용을 직접 작성해주세요.
자세하게 적어주시면 신고처리에 큰 도움이 됩니다."></textarea>
							<button type="button">등록</button>
						</div>
					</div>
				</div>
				<div class="singo_list">
					<div class="singo_list_1">
						<span>거래 금지 품목</span>
						<button type="button" id="btn3">
							<img
								src="../images/dropdown.png"
								width="13" height="8" alt="화살표 아이콘"
								onclick="buttonClicked()">
						</button>
					</div>
					<div class="trade_list"  id="panel3">
						<div class="trade_list_1">
							<button type="button">가품(위조품/이미테이션)</button>
						</div>
						<div class="trade_list_1">
							<button type="button">개인정보 거래(SNS계정, 인증번호 등)</button>
						</div>
						<div class="trade_list_1">
							<button type="button">게임계정/아이템/대리육성</button>
						</div>
						<div class="trade_list_1">
							<button type="button">담배</button>
						</div>
						<div class="trade_list_1">
							<button type="button">반려동물(분양/입양 글)</button>
						</div>
						<div class="trade_list_1">
							<button type="button">비매품 판매(화장품 샘플 등)</button>
						</div>
						<div class="trade_list_1">
							<button type="button">음란물/성인용품(중고속옷 포함)</button>
						</div>
						<div class="trade_list_1">
							<button type="button">의약품/의료기기</button>
						</div>
						<div class="trade_list_1">
							<button type="button">조건부 무료나눔</button>
						</div>
						<div class="trade_list_1">
							<button type="button">주류</button>
						</div>
						<div class="trade_list_text">
							<input type="text" placeholder="기타 (사유)" value="">
							<button type="button">등록</button>
						</div>
					</div>
				</div>
				<div class="singo_list">
					<div class="singo_list_1">
						<span>안전결제 허위매물(안전결제 표시 상품 안전결제 거부)</span>
						<button type="button" id="btn4">
							<img
								src="../images/dropdown.png"
								width="13" height="8" alt="화살표 아이콘">
						</button>
					</div>
					<div class="trade_list" id="panel4">
						<div class="trade_list_1">
							<button type="button">안전결제 거부</button>
						</div>
						<div class="trade_list_1">
							<button type="button">배송전 구매확정 요청</button>
						</div>
						<div class="trade_list_1">
							<button type="button">추가 금액 요청</button>
						</div>
					</div>
				</div>
				<div class="singo_list">
					<div class="singo_list_1">
						<span>사기의심(외부채널 유도)</span>
						<button type="button" id="btn5">
							<img
								src="../images/dropdown.png"
								width="13" height="8" alt="화살표 아이콘">
						</button>
					</div>
					<div class="prod_info_board" id="panel5">
						<div class="prod_info_content">
							<textarea
								placeholder="신고 내용을 직접 작성해주세요.
자세하게 적어주시면 신고처리에 큰 도움이 됩니다."></textarea>
							<button type="button">등록</button>
						</div>
					</div>
				</div>
				<div class="singo_list">
					<div class="singo_list_1">
						<span>기타(사유)</span>
						<button type="button" id="btn6">
							<img
								src="../images/dropdown.png"
								width="13" height="8" alt="화살표 아이콘">
						</button>
					</div>
					<div class="prod_info_board" id="panel6">
						<div class="prod_info_content">
							<textarea
								placeholder="신고 내용을 직접 작성해주세요.
자세하게 적어주시면 신고처리에 큰 도움이 됩니다."></textarea>
							<button type="button">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="singo.js"> </script>
</body>
</html>