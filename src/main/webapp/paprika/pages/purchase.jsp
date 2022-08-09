<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product detail</title>
<script src="../js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/purchase.css">
</head>
<body>
	<%@include file="../parts/mothertop.jsp"%>
	<div>
	<h3>거래가 완료되었습니다.</h3><br><br>
	<form name="manner" id="manner" method="post" action="#">
    <fieldset>
        <legend>매너온도 평가하기</legend>
	        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
	        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
	        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
	        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
	        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
    </fieldset>
	</form>
	
	매너평가하기 >
	<br>
	후기작성하기 >
	</div>
	<%@include file="../parts/motherbottom.jsp"%>
</body>
</html>