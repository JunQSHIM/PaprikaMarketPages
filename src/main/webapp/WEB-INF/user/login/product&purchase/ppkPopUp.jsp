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
	var message = "<c:out value='${message}'/>";
	var mes = message.substr(14);
	const ms = mes.split("'");
	alert(ms[0]);
	//창 크기 지정
	if(ms[0] == "이미 구매 예약이 된 상품입니다."){
		opener.parent.location.reload();
		window.close();
	}
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