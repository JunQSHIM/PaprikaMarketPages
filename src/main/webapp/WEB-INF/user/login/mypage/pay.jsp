<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/myweb/login/main/main.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/mypage/mypage.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/mypage/pay.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>pay</title>
</head>
<body>
<header>
		<jsp:include page="/WEB-INF/user/login/main/header/header.jsp"></jsp:include>
	</header>
	
	<article class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">
	<h3>파프리카 페이란?</h3>
	<div>
		<b>파프리카페이</b>는 일종의 구매예약 시스템으로 파프리카 페이 사용자가 물건을 올렸을 시 구매자가 바로 구매 버튼을 눌러 구매예약을 할 수 있습니다!
		<br><br><b>파프리카 페이는 이런점에서 좋아요!</b>
		<ul>
			<li>판매자는 빠르고 안전하게 물건을 판매할 수 있어요!</li>
			<li>구매자는 다른 구매자보다 먼저 구매예약을 할 수 있어요!</li>
		</ul>
		
		<br><br><b>파프리카 페이는 이렇게 진행되어요!</b>
		<ul>
			<li>구매자가 바로구매를 누르고 송금을하면 상품이 구매예약대기로 바뀌어요!</li>
			<li>파프리카 마켓에서 확인 후 송금액과 물건 가격이 동일하면 구매예약으로 바뀌고 판매자와 약속을 잡으라고 메시지를 보내요!</li>
			<li>구매예약으로 변경 후 3일 내로 약속을 잡지 않는다면 구매예약이 취소 되고 구매자에게 금액을 다시 환불해요!</li>
			<li>판매자와 직거래 후 거래가 완료되었다면 파프리카마켓에서 보관하고있던 금액을 판매자에게 송금해요!</li>
			<li>만약 거래가 불발되었다면 구매자에게 다시 송금해서 안전해요!</li>
		</ul>
		<br>*파프리카 페이는 아직 카카오페이회원만 사용가능해요!!!*
		<br><br><br>
		<div id="pay">
		<h4>파프리카 페이 사용하기</h4>
		<form action="mypage.do" method="post" name="ppkPay" id="payForm">
		<input id="pay" type="text" name="pay" placeholder="qr을 입력해주세요.">
		<input type="text" name="KID" placeholder="카카오페이에 설정되어있는 이름을 입력해주세요.">
		<input id="send" type="button" value="전송">
		</form>
		</div>
	</div>
	</article>
	<script>
	var theForm = document.ppkPay;
	function setOutline(objFormElement, color) {
		if (objFormElement.style)
			objFormElement.style.outline = color;
	}
		$("#send").click(function() {
			if (!theForm.pay.value) {
				setOutline(theForm.pay, "2px solid red");
				theForm.pay.placeholder = 'qr을 입력해주세요';
				theForm.pay.focus();
				return;
			} else {
				setOutline(theForm.pay, "1px solid black");
			}
			if (!theForm.KID.value) {
				setOutline(theForm.KID, "2px solid red");
				theForm.KID.placeholder = '이름을 입력해주세요';
				theForm.KID.focus();
				return;
			} else {
				setOutline(theForm.KID, "1px solid black");
			}
			theForm.submit();
		});
	</script>
	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>