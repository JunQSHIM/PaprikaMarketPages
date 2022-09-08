/**
 * 
 */
 // 슬라이드 배너 ==> 이동시키는 버튼이 있으면 카테고리에 마우스 올렸을때
// 그 버튼만 보여서 버튼을 없애고 오토 슬라이드로 변경했습니다(준규)
// 버튼가리는거를 찾아보다가 못찾았어여...
$(document).ready(function() {
	$('.slider').bxSlider({
		controls: false,
		auto: true,
		mode: 'horizontal',
		pager:false
	});
});