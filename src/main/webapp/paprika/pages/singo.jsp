<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-3.6.0.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">

 $(document).ready(function(){     
	   // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때   
	     $(".singo_list_1 > a").click(function(){       
		     var submenu = $(this).next("div");      
		       // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기      
		      if( submenu.is(":visible") ){           
			     submenu.slideUp();       
			     }else{         
				       submenu.slideDown();    
				        }   
				     }); 
  });







//$(document).ready(function() {
//	$(".dropDown").mouseenter(function() {
//		$(".trade_list").show();
//	});
//	$(".dropDown").mouseleave(function() {
//		$(".trade_list").hide();
//	});

//});

//$(document).ready(function() {
//	$(".dropDown").mouseenter(function() {
//		$(".prod_info_board").show();
//	});
//	$(".dropDown").mouseleave(function() {
//		$(".prod_info_board").hide();
//	});

//});

</script>
<link rel="stylesheet" type="text/css" href="singo.css">

</head>
<body>
	<div class="popup">
		<div class="singo_board">
			<div class="singo_titles">
				<div class="singo_title">신고하기</div>
				<button class="singo_close">
					<img src="../images/close.png" width="24" height="24">
				</button>
			</div>
			<div class="singo">
				<div class="singo_list">
					<div class="singo_list_1">
						<span>광고 (상점 및 타사이트 홍보, 상품도배)</span>
						<a type="button" class="dropDown">
							<img
								src="../images/dropdown.png"
								width="13" height="8" alt="화살표 아이콘">
						</a>
					</div>
					<div class="trade_list">
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
						<button type="button">
							<img
								src="../images/dropdown.png"
								width="13" height="8" alt="화살표 아이콘">
						</button>
					</div>
					<div class="prod_info_board">
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
						<button type="button">
							<img
								src="../images/dropdown.png"
								width="13" height="8" alt="화살표 아이콘"
								onclick="buttonClicked()">
						</button>
					</div>
					<div class="trade_list" >
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
						<button type="button">
							<img
								src="../images/dropdown.png"
								width="13" height="8" alt="화살표 아이콘">
						</button>
					</div>
					<div class="trade_list">
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
						<button type="button">
							<img
								src="../images/dropdown.png"
								width="13" height="8" alt="화살표 아이콘">
						</button>
					</div>
					<div class="prod_info_board">
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
						<button type="button">
							<img
								src="../images/dropdown.png"
								width="13" height="8" alt="화살표 아이콘">
						</button>
					</div>
					<div class="prod_info_board">
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
</body>
</html>