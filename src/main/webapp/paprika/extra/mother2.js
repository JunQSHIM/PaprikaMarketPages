$(document).ready(function() {
	$('.slider').bxSlider({
		auto: true,
		mode: 'horizontal',
		minSlides: 1,
		maxSlides: 5,
		slideWidth: 155,
		slideMargin: 0,
		captions: true
	});
	$('.slider2').bxSlider({
		auto: true,
		mode: 'horizontal',
		minSlides: 1,
		maxSlides: 2,
		slideWidth: 130,
		slideMargin: 5,
		captions: true
	});
});
