<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="jjim_cart.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".list1 thead input:checkbox[id=check]").click(function(){
		var bool =$(this).prop("checked");
		$(".list1 tbody input:checkbox[name=checkbox]").prop("checked", bool);
	});
	$(".list1 tbody input:checkbox[name=checkbox]").click(function(){
		var flag = false;
		$(".list1 tbody input:checkbox[name=checkbox]").each(function(){
			var bool = $(this).prop("checked");
			
			if(!bool){
				$(".list1 thead input:checkbox[id=check]").prop("checked",false);
				flag = true;
				return false;
			}
		});
		if(!flag){
			$(".list1 thead input:checkbox[id=check]").prop("checked",true);
		}
	
	});
	
	
	$(".aa").mouseover(function(){
		$(this).css("background","gray");
		
	})
	.mouseout(function(){
		$(this).css("background","#f5f5f0");
		
	});

});

</script>
</head>
<body class="jjimBody">
	<div id="frame">
		<form>
			<div id="frame2">
				<span style="font-size: 16pt; font-weight: bold;">찜목록</span>
				<span class="home">홈 > 찜목록</span>
			</div>
		</form>
	
	<br/>
	
	<div>
		<table class="list1">
			<tr>
				<th class="aa" width="100px" >상품 0</th>
				<th class="aa" width="100px">상점후기 0</th>
				<th class="aa" width="100px">찜 2</th>
				<th class="aa" width="100px">팔로잉 0</th>
				<th class="aa" width="100px">팔로워 0</th>
			</tr>
		</table>
	</div>
	<br>
	<div class="btns">
		<table class="list1">
		<thead>
			<tr>
				<th colspan="10" style="text-align: left; padding-right: 10px;">찜한 상품(2)<div id="array"><a href="#">최신순</a> | <a href="#">인기순</a> | <a href="#">고가순</a> | <a href="#">저가순</a></div>
				<div class="clear"></div></th>
			</tr>
			<tr>
			<th><input type="checkbox" name="checkbox" id="check"></th>
			<th><span>이미지</span></th>
			<th style="width: 550px;"><span>상품정보</span></th>
			<th>판매가</th>
			</tr>
		</thead>
		
		<tbody class="list2">
			<tr class="img1">
				<td style="text-align: left; text-align: center; border-right: none;">
					<input type="checkbox" name="checkbox" class="checkbox">
				</td>
				<td style="border-left: none; border-right: none;"><img style="max-width:200px;" src="images/travis.png"></td>
				<td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">트래비스 스캇 프라그먼트 조던 1 로우 DM7866-140</td>
				<td><span style="padding-left: 10px;">98,000원</span></td>
			</tr>
			<tr class="img1">
				<td style="text-align: left; text-align: center; border-right: none;">
					<input type="checkbox" name="checkbox" class="checkbox">
				</td>
				<td style="border-left: none; border-right: none;" ><img style="max-width:200px;" src="images/santiago.png"></td>
				<td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">레알 마드리드 - 산티아고 베르나베우 스타디움</td>
				<td><span style="padding-left: 10px;">300,000원</span></td>
			</tr>
		</tbody>
		</table>
		<div style="margin: 10px 0;" id="btns">
			<span style="margin: 0 10px;" class="btnfloat">선택 상품을</span>
			<button class="btn default btnfloat" id="btn1" disabled="disabled" style="background-color: gray; color: #fff;" onclick="alert('삭제 되었습니다.')">x 삭제하기</button>&nbsp;
		</div>
	</div>
</div>
</body>
</html>