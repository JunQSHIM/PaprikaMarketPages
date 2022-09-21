<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
alert("구매예약 되셨습니다! 아래 qr링크로 3일내 송금이 되지 않을시에는 예약이 취소되니 주의해주세요!");
	//창 크기 지정
	var width = 500;
	var height = 500;
	//pc화면기준 가운데 정렬
	var left = (window.screen.width / 2) - (width/2);
	var top = (window.screen.height / 4);
	//윈도우 속성 지정
	var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
	//연결하고싶은url
	const url = "https://fintastic.kakao.com/connect/money-transaction/link?qr_uuid=9fd90854-0e87-44cc-8b9d-913ffd34408b";
	//등록된 url 및 window 속성 기준으로 팝업창을 연다.
	window.open(url, "hello popup", windowStatus);
</script>
</body>
</html>