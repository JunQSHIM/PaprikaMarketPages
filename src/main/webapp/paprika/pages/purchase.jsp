<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product detail</title>
<script src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
  // 1. 해당 name과 동일한 모든 체크박스 루프 > 체크된 체크박스만 해당 value 값 콘솔
  $("input[name='manner_eval']").each(function(){
    if( $(this).is(":checked") == true ){
      var tmpVal = $(this).val();
      console.log(tmpVal);
    }
  });

  // 2. 해당 name과 동일한 체크박스 중 선택한 것들만 루프 > 해당 value 값 콘솔
  $("input[name='manner_eval']:checked").each(function() {
    var tmpVal = $(this).val();
    console.log(tmpVal);
  });
  
</script>
<link rel="stylesheet" type="text/css" href="../css/purchase.css">
</head>
<body>
	<%@include file="../parts/mothertop.jsp"%>
	<div>
	<h2>구매가 완료되었습니다.</h2><br><br>
	<form name="purchase" id="purchase" method="post" action="#">
	<div id="manner">
    <fieldset>
        <legend>매너온도 평가하기</legend>
	        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
	        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
	        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
	        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
	        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
    </fieldset><br>
    </div>
	<div id="manner_evaluation">
		<h3>매너평가하기 ><br></h3>
		<h4>😊매너 칭찬<br></h4>
		<input type="checkbox" name="manner_eval" id="1" value="manner_eval1"><label for="1">상품 상태가 설명한 것과 같아요.</label><br>
		<input type="checkbox" name="manner_eval" id="2" value="manner_eval2"><label for="2">시간 약속을 잘 지켜요.</label><br>
		<input type="checkbox" name="manner_eval" id="3" value="manner_eval3"><label for="3">친절하고 매너가 좋아요.</label><br>
		<input type="checkbox" name="manner_eval" id="4" value="manner_eval4"><label for="4">좋은 상품을 저렴하게 판매해요.</label><br>
		<input type="checkbox" name="manner_eval" id="5" value="manner_eval5"><label for="5">응답이 빨라요.</label><br>
		<input type="checkbox" name="manner_eval" id="6" value="manner_eval6"><label for="6">상품설명이 자세해요.</label><br>
		<h4>😔비매너 평가<br></h4>
		<input type="checkbox" name="manner_eval" id="7" value="bad_manner_eval1"><label for="7">상품상태가 설명한 것과 달라요.</label><br>
		<input type="checkbox" name="manner_eval" id="8" value="bad_manner_eval2"><label for="8">불친절하고 매너가 안좋아요.</label><br>
		<input type="checkbox" name="manner_eval" id="9" value="bad_manner_eval3"><label for="9">시간 약속을 잘 어겨요.</label><br>
		<input type="checkbox" name="manner_eval" id="10" value="bad_manner_eval4"><label for="10">상품의 가격이 너무 비싸요.</label><br>
		<input type="checkbox" name="manner_eval" id="11" value="bad_manner_eval5"><label for="11">응답이 느려요.</label><br>
		<input type="checkbox" name="manner_eval" id="12" value="bad_manner_eval6"><label for="12">상품설명이 부족해요.</label><br>
		<input type="checkbox" name="manner_eval" id="13" value="bad_manner_eval7"><label for="13">없음.</label><br>
	</div>
	</form>
	
	
	<br>
	<h3>후기작성하기 ></h3>

	</div>
	<%@include file="../parts/motherbottom.jsp"%>
</body>
</html>