<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new</title>
<link href="/myweb/login/sellpage/news.css" rel="stylesheet"
	type="text/css">
</head>
<body>
<form enctype="multipart/form-data" action="createProc.do"
			name="post" method="post">
			<sec:csrfInput/>
			<input type="hidden" name="location1" value=${user.location1 }>
			<input type="hidden" name="user_seq" value=${user.user_seq }>
			<input type="hidden" name="nickname" value=${user.nickname }>
			<input type="hidden" name="pay" value=${user.pay }>
		<div class="grid_12 newinfo">
			<div class="newinfo_1">
				<div class="grid_2 newinfo_1_1">기본정보</div>
				<div class="grid_2 newinfo_1_2">*필수항목</div>
			</div>

			<div class="grid_12 proimg">
				<div class="grid_2 explain">
					상품이미지 <span>*</span>
				</div>
				<div class="grid_10 newdata">
					<div class="grid_10 pics">
						<div class="grid_2 regpic">
							<div class="file_0">
								<div class="file_1">
								
									<input type="file" name="origin_file_name" multiple="multiple" onchange="fileCheck(this)"
										id="origin_file" class="form-control user_picked_files" accept="image/jpg,image/png,image/jpeg"/>
									</div>
							</div>
						</div>
						<div class="file_2">
							<img src="login/images/regpic.png" alt="이미지등록" onclick="#">

						</div>
						<ul class="cvf_uploaded_files"></ul>

					</div>
					<div class="clear grid_9 warn">
						<b>* 상품 이미지는 640x640에 최적화 되어 있습니다.</b> <br> - 상품 이미지는 PC에서는
						1:1, 모바일에서는 1:1.23 비율로 보여집니다. <br>- 이미지는 상품 등록 시 정사각형으로 잘려서
						등록됩니다. <br>- 이미지를 클릭할 경우 원본 이미지를 확인할 수 있습니다. <br>- 이미지를
						클릭 후 이동하여 등록순서를 변경할 수 있습니다. <br>- 큰 이미지일 경우 이미지가 깨지는 경우가 발생할
						수 있습니다. <br>최대 지원 사이즈인 640 X 640으로 리사이즈 해서 올려주세요.(개당 이미지 최대
						10M)
					</div>
				</div>
			</div>

			<div class="grid_12 title">
				<div class="grid_2 explain">
					제목<span>*</span>
				</div>
				<div class="grid_10 newdata">
					<div class="titlebox" id="titlebox">
						<input type="text" id="prod_title" name="post_title" placeholder="상품 제목을 입력해주세요."  maxlength="40" onkeyup="titleChk();">
						<a href="#">거래금지 품목</a>
					</div>
					<div id="titleCnt">
						<div id="counter"></div>
					</div>
					<span id="titleChk"></span>
				</div>
			</div>
			<div class="grid_12 categ">

				<div class="grid_2 explain">
					카테고리 <span>*</span>
				</div>
				<div class="grid_10 newdata">
					<select id="selectbox" onchange="handleOnChange(this)" name="category_seq">
						<option value="none" disabled selected>카테고리선택&nbsp;&nbsp;▼</option>
						<c:forEach items="${category }" var="category">
						<option value="${category.category_seq }">${category.category_name }</option>
						</c:forEach>
					</select>
				
					
				<div class="cate_value"><span><b>선택한 카테고리 : &nbsp; </b></span><div id='result_category'></div></div>	
				</div>
			</div>
		</div>
		<div class="grid_12 new_price">
			<div class="grid_2 explain">
				가격 <span>*</span>
			</div>
			<div class="grid_10 newdata">
				<div class="pri">
					<input type="text" id="price" name="price" maxlength="9"
						placeholder=" 숫자만 입력해주세요." onkeydown="chkNum()"> 원
				</div>
			</div>
		</div>
		<div class="grid_12 new_price">
			<div class="grid_2 explain">
				상태 <span>*</span>
			</div>
			<div class="grid_10 newdata">
				<div class="pri">
				<div class="statusBtn" id="align">
				<input type="radio" id="usedBtn" name="prod_status" value="0" checked> <label for="usedBtn" class="used">중고상품</label>	
				<input type="radio" id="newProdBtn" name="prod_status" value="1"> <label for="newProdBtn" class="newProd">새상품</label>
				</div>
				</div>
			</div>
		</div>
		<div class="grid_12 feat">
			<div class="grid_2 explain">
				설명 <span>*</span>
			</div>
			<div class="grid_10 newdata">
				<div class="textbox">
					<textarea class="text_area" rows="6"
						placeholder="여러 장의 상품 사진과 구입 연도, 브랜드, 사용감, 하자 유무 등 구매자에게 필요한 정보를 꼭 포함해 주세요. (10자 이상)&#13;안전하고 건전한 거래 환경을 위해 과학기술정보통신부, 한국인터넷진흥원과 번개장터(주)가 함께 합니다."
						name="post_content"
						onkeyup="chkMsgLength(1000,post_content,currentMsgLen);"></textarea>
					<br>
					<div class="hoxy">
						혹시 <a href="https://help.bunjang.co.kr/notice/607" target="_blank">카카오톡
							ID</a> 를 적으셨나요?
					</div>
					<div class="counter"> 
						<span id="currentMsgLen" style="padding-left: 60;">0</span>/1000자
					</div>
				</div>
			</div>
		</div>

		<div class="grid_2 explain">안전 결제 선택</div>
		<div class="grid_10 newdata">

			<div class="option">
				<label class="chk_box"><input id="bunPayFilter" id="agree" type="checkbox" name="pay_check" value="1">안전결제
					환영</label>
			</div>
			<ul class="opt">
				<li>
					<p>안전결제(카카오페이) 요청을 거절하지 않는 대신 혜택을 받을 수 있어요.</p>
					<p>
						<small><a
							href="pay.do?user_seq=${user.user_seq }" target="_blank">안전결제(카카오페이) 설정하러 가기</a>
						</small>
					</p>
				</li>
				<li>
					내 상품에 안전결제 배지가 표시돼요 <a href="#">자세히</a>
				</li>
			</ul>
		</div>


		<div class="row container_12">
			<div class="grid_12 form-group">
				<button type="submit" class="new_btn" >상품 등록</button>
			</div>
		</div>
		
	</form>


	<script src="https://sdk.amazonaws.com/js/aws-sdk-2.891.0.min.js"></script>
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.3.0/bootbox.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
		integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
		crossorigin="anonymous"></script>
	<script src="/myweb/login/sellpage/new.js"></script>
<script>

//카카오페이 체크박스 자바스크립트
function checkboxArr() {   
	var checkArr = [];     // 배열 초기화   
	$("input[name='pay_check']:checked").each(function(i)) {     
		checkArr.push($(this).val());  
		// 체크된 것만 값을 뽑아서 배열에 push   
		 }  
		 $.ajax({    
			url: '/payCheck.do',
			type: 'post',
			dataType: 'json',
			data: {
				valueArrTest: checkArr
				}
		});
		}
// 상품 상태 라디오버튼 자바스크립트
function radioArr() {   
	var radioArr = [];     // 배열 초기화   
	$("input[name='prod_status']:checked").each(function(i)) {     
		radioArr.push($(this).val());  
		// 체크된 것만 값을 뽑아서 배열에 push   
		 }  
		 $.ajax({    
			url: '/payCheck.do',
			type: 'post',
			dataType: 'json',
			data: {
				valueArrTest: radioArr
				}
		});
		}

</script>

</body>
</html>