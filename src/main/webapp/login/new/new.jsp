<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new</title>
<script src="/myweb/login/new/new.js"></script>
<link href="news.css" rel="stylesheet" type="text/css">

</head>



<body>



	<div class="grid_12 management">
		<div class="register">상품등록</div>
		<div class="bar">|</div>
		<div class="manager">상품관리</div>
		<div class="bar">|</div>
		<div class="hist">구매/판매 내역</div>

	</div>
	<div class="grid_12 newinfo">
		<div class="newinfo_1">
			<div class="grid_2 newinfo_1_1">기본정보</div>
			<div class="grid_2 newinfo_1_2">*필수항목</div>
		</div>
		<div class="grid_12 proimg">
			<div class="grid_3 explain">
				상품이미지 <span>*</span>
			</div>
			<div class="grid_9 newdata">
				<div class="grid_9 pics">
					<div class="grid_2 regpic">
						<div class="file_0">
							<div class="file_1">
								<input type="file">
							</div>
							<div class="file_2">
								<img src="images/regpic.png" alt="이미지등록" onclick="#">
							</div>
						</div>
					</div>
					<div class="grid_2 regedpic">1</div>
					<div class="grid_2 regedpic">1</div>
					<div class="grid_2 regedpic">1</div>

				</div>
				<div class="clear grid_9 warn">
					* 상품 이미지는 640x640에 최적화 되어 있습니다. <br> - 상품 이미지는 PC에서는 1:1,
					모바일에서는 1:1.23 비율로 보여집니다. <br>- 이미지는 상품 등록 시 정사각형으로 잘려서 등록됩니다.
					<br>- 이미지를 클릭할 경우 원본 이미지를 확인할 수 있습니다. <br>- 이미지를 클릭 후
					이동하여 등록순서를 변경할 수 있습니다. <br>- 큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수
					있습니다. <br>최대 지원 사이즈인 640 X 640으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)
				</div>
			</div>

		</div>
		<div class="grid_12 title">
			<div class="grid_3 explain">
				제목 <span>*</span>
			</div>
			<div class="grid_9 newdata">
				<div class="titlebox">
					<input type="text" name="title" placeholder="상품 제목을 입력해주세요.">
					<a href="#">거래금지 품목</a>
				</div>

			</div>
		</div>
		<div class="grid_12 categ">

			<div class="grid_3 explain">
				카테고리 <span>*</span>
			</div>
			<div class="grid_9 newdata"></div>
		</div>
		<div class="grid_12 location">
			<div class="grid_3 explain">
				거래지역 <span>*</span>
			</div>
			<div class="grid_9 newdata">
				<button type="button" onclick="#">내위치</button>
				<button type="button" onclick="#">최근 지역</button>
				<button type="button" onclick="#">주소 검색</button>
				<button type="button" onclick="#">지역설정안함</button>
				<input readonly value=" &nbsp;지역설정안함">
			</div>
		</div>
		<div class="grid_12 state">
			<div class="grid_3 explain">
				상태<span>*</span>

			</div>
			<div class="grid_9 newdata">
				<label><input name="schd" id="중고상품" type="radio" value="0"
					checked> 중고상품 </label> <label> <input name="schd" id="새상품"
					type="radio" value="0"> 새상품
				</label>
			</div>
		</div>
		<div class="grid_12 refund">
			<div class="grid_3 explain">
				교환 <span>*</span>
			</div>
			<div class="grid_9 newdata">
				<label><input name="refund" id="교환불가" type="radio" value="0"
					checked> 교환불가 </label> <label> <input name="refund"
					id="교환가능" type="radio" value="0"> 교환가능
				</label>
			</div>
		</div>
		<div class="grid_12 price">
			<div class="grid_3 explain">
				가격 <span>*</span>
			</div>
			<div class="grid_9 newdata">
				<div class="pri">
					<input type="text" placeholder=" 숫자만 입력해주세요."> 원
				</div>
				<p>
					<label> <input type="checkbox" name="shipfee"> 배송비
						포함
					</label>
				</p>
			</div>
		</div>
		<div class="grid_12 feat">
			<div class="grid_3 explain">
				설명 <span>*</span>
			</div>
			<div class="grid_9 newdata">
				<div class="textbox">
					<form action="" name="gForm">
						<textarea class="text_area" rows="6"
							placeholder="여러 장의 상품 사진과 구입 연도, 브랜드, 사용감, 하자 유무 등 구매자에게 필요한 정보를 꼭 포함해 주세요. (10자 이상)&#13;안전하고 건전한 거래 환경을 위해 과학기술정보통신부, 한국인터넷진흥원과 번개장터(주)가 함께 합니다."
							name="feat" onkeyup="chkMsgLength(1000,feat,currentMsgLen);"></textarea>
						<br>
						<div class="hoxy">
							혹시 <a href="https://help.bunjang.co.kr/notice/607"
								target="_blank">카카오톡 ID</a> 를 적으셨나요?
						</div>
						<div class="counter">
							<span id="currentMsgLen" style="padding-left: 60;">0</span>/1000자
						</div>

					</form>
				</div>


			</div>
		</div>
		<div class="grid_12 tag">
			<div class="grid_3 explain">연관태그</div>
			<div class="grid_9 newdata">
				<div class="tags">
					<input type="text" placeholder="연관태그를 입력해주세요. (최대 5개)" name="tags">
				</div>
				<ul class="tagrule">
					<li><p>- 태그는 띄어쓰기로 구분되며 최대 9자까지 입력할 수 있습니다.</p></li>
					<li><p>- 태그는 검색의 부가정보로 사용 되지만, 검색 결과 노출을 보장하지는 않습니다.</p></li>
					<li><p>- 검색 광고는 태그정보를 기준으로 노출됩니다.</p></li>
					<li><p>- 상품과 직접 관련이 없는 다른 상품명, 브랜드, 스팸성 키워드 등을 입력하면 노출이
							중단되거나 상품이 삭제될 수 있습니다.</p></li>
				</ul>
			</div>
		</div>

		<div class="fastsell">
			<div class="grid_2 fastsell_1">빠른 판매</div>
			<div class="grid_5 fastsell_2">
				내 상품에 안전결제 배지가 표시돼요 <a href="#">자세히</a>
			</div>
			<div class="clear"></div>
			<div class="grid_3 explain">옵션</div>
			<div class="grid_9 newdata">

				<div class="option">
					<label><input id="bunPayFilter" type="checkbox">안전결제
						환영</span></label>
				</div>
				<ul class="opt">
					<li>
						<p>안전결제(번개페이) 요청을 거절하지 않는 대신 혜택을 받을 수 있어요.</p>
						<p>
							<small>거절 시, <a
								href="https://help.bunjang.co.kr/faq/3/415" target="_blank">이용
									제재</a>가 있을 수 있으니 주의해 주세요.
							</small>
						</p>
					</li>
					<li>
						<p>내 상품을 먼저 보여주는 전용 필터로 더 빠르게 판매할 수 있어요.</p>
					</li>
					<li>
						<p>번개페이 배지로 더 많은 관심을 받을 수 있어요.</p>
					</li>
				</ul>
				<div>* 번개페이 배지와 전용 필터 기능은 앱 또는 모바일 웹에서만 볼 수 있어요.</div>
			</div>

		</div>



	</div>



</body>
</html>