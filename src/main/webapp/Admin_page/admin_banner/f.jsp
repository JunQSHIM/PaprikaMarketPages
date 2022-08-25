<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta name="robots" content="noindex">
<!--<link href="http://cocoaphp.com/publish/bootstrap/css/material-design-iconic-font.min.css" rel="stylesheet">-->
<script type="text/javascript" async=""
	src="https://cdn.channel.io/plugin/ch-plugin-web.js" charset="UTF-8"
	style="z-index: 1100;"></script>
<script>
		var TEST_SERVER = false;
		var VENDOR_DOMAIN = 'https://vendor-cdn.imweb.me';
		var UPLOAD_URL = '/upload/';
		var CDN_UPLOAD_URL = 'https://cdn.imweb.me/upload/';
		var IS_MAIN = false;
		var IS_MOBILE = false;
		var ADMIN_URL = '/admin/';
		var THUMBNAIL_URL= '/thumbnail/';
		var CDN_THUMBNAIL_URL= 'https://cdn.imweb.me/thumbnail/';
		var SITE_CODE = 'S20220822a09cedc4f039d';
		var UNIT_CODE = 'u2022082263031091116e8';
		var SITE_NO = 'S20220822a09cedc4f039d';
		var UNIT_NO = 'u2022082263031091116e8';
		var MAIN_DOMAIN = 'dddrsersrty.imweb.me';
		var CURRENT_DOMAIN = 'dddrsersrty.imweb.me';
		var CURRENT_PROTOCOL = 'https://';
		var GOOGLE_API_KEY = 'AIzaSyA8CCexf9XTJcH09mStr-HRW4nin4k8J7w';
		var FROALA_VERSION = 311;
		var FROALA_KEY = '6LF5g1B3D3F3C6C3E2F-11SLJCKHXOSLMc1YGSGb1ZXHSe1CgB5A4D4C3E3C2A13A19B7B2==';
		var ADOBE_AVIARY_KEY = '94bd22b5cc05424494c5e7aeabab8466';
		var LIMIT_API_LIST = [];
		var NO_IMAGE_URL = '/img/no-image.png';
		var ADMIN_LANG_CODE = 'KR';
		var SITE_COUNTRY_CODE = 'kr';
		var KOREA_COUNTRY_CODE = 'kr';
		var TAIWAN_COUNTRY_CODE = 'tw';
		var IS_GUEST = false;
		var MEMBER_HASH = '7ca8b9b0dd06bf6e6c3ffd86c37f4f817d69be33';
		var CHECK_OFFICE = false;

                    /****************************************************************/
            /* m_Completepayment  설명                                      */
            /****************************************************************/
            /* 인증완료시 재귀 함수                                         */
            /* 해당 함수명은 절대 변경하면 안됩니다.                        */
            /* 해당 함수의 위치는 payplus.js 보다먼저 선언되어여 합니다.    */
            /* Web 방식의 경우 리턴 값이 form 으로 넘어옴                   */
            /* EXE 방식의 경우 리턴 값이 json 으로 넘어옴                   */
            /****************************************************************/
            function m_Completepayment( FormOrJson, closeEvent )
            {
                var frm = document.order_info;

                /********************************************************************/
                /* FormOrJson은 가맹점 임의 활용 금지                               */
                /* frm 값에 FormOrJson 값이 설정 됨 frm 값으로 활용 하셔야 됩니다.  */
                /* FormOrJson 값을 활용 하시려면 기술지원팀으로 문의바랍니다.       */
                /********************************************************************/
                GetField( frm, FormOrJson );


                if( frm.res_cd.value == "0000" )
                {
                    /*
                     가맹점 리턴값 처리 영역
                     */

                    frm.submit();
                }
                else
                {
                    alert( "[" + frm.res_cd.value + "] " + frm.res_msg.value );

                    closeEvent();
                }
            }
        	</script>

<script src="/js/localize/KR_KRW_currency.js?1658879873"></script>
<script src="/js/localize/admin/KR.js?1658879872"></script>
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/bootstrap.css?1630317764">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/jquery-ui.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/ii.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/db-icons.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/material-design-iconic-font.min.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/bootstrap-datepicker.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/black-tie.css?1608189400">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/simple-line-icons.css?1608179394">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/fonts/im-icon/style.css?1656383913">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/fonts/froala-emoji-tap/style.css?1660095148">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/preloader.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/owl.carousel2.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/slick.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/animate.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/nprogress.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/trackpad-scroll-emulator.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/font-awesome.min.css?1626931454">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/font-awesome5.min.css?1660780829">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/froala_311/css/froala_editor.pkgd.css?1660095140">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/froala_311/css/froala_style.min.css?1660095060">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/emoji.css?1660095097">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/froala/custom-theme-v3.css?1660095156">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/colorpicker.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/codemirror.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/bootstrap-spinner.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/chosen.css?1617331870">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/fullcalendar.min.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/morris.core.css?1577682282">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/lightgallery.min.css?1596596378">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/im_component.css?1636689958">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/site/admin/admin.css?1590627710">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/site/admin/toastr.css?1593569516">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/site/alarm_menu.css?1648796493">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/fonts/fontello/src/css/fontello.css?1657576838">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/site/admin/bootstrap-theme-dashboard.css?1618365623">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/site/admin/dashboard.css?1661323548">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/site/admin/select2.css?1590627710">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/site/admin/accordion.css?1653367465">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/regularly.css?1658818153">
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/tailwind.css?1661331179">
<script src="https://vendor-cdn.imweb.me/js/jquery.js?1627517460"></script>
<script
	src="https://vendor-cdn.imweb.me/js/jquery.browser.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/jquery-ui.min.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/bootstrap.min.js?1630317768"></script>
<script src="https://vendor-cdn.imweb.me/js/tinycolor-min.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/common.js?1661221108"></script>
<script src="https://vendor-cdn.imweb.me/js/im_component.js?1636940317"></script>
<script src="https://vendor-cdn.imweb.me/js/admin_common.js?1660095188"></script>
<script src="https://vendor-cdn.imweb.me/js/table_list.js?1633057104"></script>
<script src="https://vendor-cdn.imweb.me/js/data.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/owl.carousel2.js?1638150602"></script>
<script src="https://vendor-cdn.imweb.me/js/slick.min.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/preloader.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/jquery.lazyload.min.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/jquery.trackpad-scroll-emulator.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/jquery.fileupload.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/nprogress.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/froala_editor.min.js?1608673099"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/align.min.js?1607673165"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/char_counter.min.js?1607673165"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/code_beautifier.min.js?1607673167"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/code_view.min.js?1608643124"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/colors.min.js?1607673167"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/draggable.min.js?1607673168"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/emoticons.min.js?1660095136"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/entities.min.js?1607673170"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/file.min.js?1607673170"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/font_family.min.js?1607673170"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/font_size.min.js?1607673170"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/forms.min.js?1607673170"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/fullscreen.min.js?1607673170"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/image.min.js?1607673172"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/image_manager.min.js?1607673172"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/inline_style.min.js?1607673173"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/line_breaker.min.js?1607673173"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/link.min.js?1607673173"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/lists.min.js?1607673174"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/paragraph_format.min.js?1607673174"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/paragraph_style.min.js?1607673174"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/quote.min.js?1607673174"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/save.min.js?1607673174"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/table.min.js?1607673177"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/url.min.js?1607673177"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/video.min.js?1625125569"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/plugins/line_height.min.js?1607673173"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/third_party/font_awesome.min.js?1607673192"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/languages/ko.js?1607680617"></script>
<script
	src="https://vendor-cdn.imweb.me/froala_311/js/languages/zh_tw.js?1608685913"></script>
<script
	src="https://vendor-cdn.imweb.me/js/jquery-scrolltofixed-min.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/colorpicker.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/jquery.chosen.js?1619084781"></script>
<script
	src="https://vendor-cdn.imweb.me/js/jquery.timepicker.min.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/jquery.print.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/autolinker.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/ThreeCanvas.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/snow.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/lightgallery-all.min.js?1596595980"></script>
<script src="https://vendor-cdn.imweb.me/js/autosize.js?1577682292"></script>
<link rel="stylesheet" type="text/css"
	href="https://vendor-cdn.imweb.me/css/lightgallery.css?1577682282">
<script
	src="https://vendor-cdn.imweb.me/js/jquery.nestable.doznut.js?1658822737"></script>
<script
	src="https://vendor-cdn.imweb.me/js/jquery.number.min.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/masonry.pkgd.min.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/Chart.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/jquery.autosize.min.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/codemirror.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/mode/xml/xml.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/mode/javascript/javascript.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/mode/css/css.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/mode/htmlmixed/htmlmixed.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/jquery.select2.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/jquery.select2_ko.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/imagesloaded.pkgd.min.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/jquery.nanoscroller.min.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/html5shiv.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/jquery.validate.js?1621218311"></script>
<script
	src="https://vendor-cdn.imweb.me/js/jquery.inputmask.bundle.min.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/moment-with-locales.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/moment-timezone.js?1581998425"></script>
<script
	src="https://vendor-cdn.imweb.me/js/bootstrap-datepicker.js?1577682292"></script>
<script
	src="https://vendor-cdn.imweb.me/js/ie-checker-min.js?1577682292"></script>
<script src="https://vendor-cdn.imweb.me/js/lodash.min.js?1656295899"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/admin/js/doz_post.js?1577682293"></script>
<script src="/admin/js/admin.js?1657576839"></script>
<script src="/admin/js/coupon.js?1658822765"></script>
<script src="/admin/js/doznut.js?1656296713"></script>
<script src="/admin/js/event_check.js?1585896056"></script>
<script src="/js/site_member.js?1658822765"></script>
<script src="/js/alarm_menu.js?1603862128"></script>
<script src="/admin/js/imweb_analytics.js?1604543771"></script>
<script src="/admin/js/site_manage.js?1660780829"></script>
<script src="/admin/js/admin_search.js?1639983006"></script>
<script src="/admin/js/dashboard.js?1640738292"></script>
<script src="/admin/js/config.js?1660623649"></script>
<script src="/admin/js/member.js?1658822750"></script>
<script src="/admin/js/permission.js?1633057103"></script>
<script src="/admin/js/contents.js?1640137207"></script>
<script src="/admin/js/payment.js?1637302294"></script>
<script src="/admin/js/toastr.js?1577682293"></script>
<script src="/admin/js/contents_list.js?1638842547"></script>
<script src="/admin/js/zipcode_daum.js?1577682293"></script>
<script>var IS_ANDROID_APP = 'N';
	(function(){
		var customTooltipAllowList = $.fn.tooltip.Constructor.DEFAULTS.whiteList;
		customTooltipAllowList.table = [];
		customTooltipAllowList.thead = [];
		customTooltipAllowList.tbody = [];
		customTooltipAllowList.tr = [];
		customTooltipAllowList.td = ["rowspan", "colspan"];
		customTooltipAllowList.th = [];
		customTooltipAllowList.caption = [];
		customTooltipAllowList["*"].push("style");
	})();

function determineDropDirection(){
	$(".dropdown-menu").each( function(){
		$(this).css({
			visibility: "hidden",
			display: "block"
		});

		$(this).parent().removeClass("dropup");

		if ($(this).offset().top + $(this).outerHeight() + 60 > $(window).innerHeight() + $(window).scrollTop()){
			$(this).parent().addClass("dropup");
		}
		$(this).removeAttr("style");
	});
}

determineDropDirection();

$(window).scroll(determineDropDirection);
	</script>
</head>


<body class="menubar-hoverable header-fixed menubar-pin">
	<!-- BEGIN BASE-->
	<div id="dashboard_loader" class="se-pre-con" style="display: none">
		<div class="page-loader-spinner">
			<div class="double-bounce1"></div>
			<div class="double-bounce2"></div>
		</div>
		<div class="progress">
			<div class="progress-bar" role="progressbar" style="width: 70%">
				<label>70%</label>
			</div>
		</div>
	</div>
	<div id="base">

		<script>
        document.addEventListener('DOMContentLoaded', function() {
            const alertBox = document.querySelector('#alertBox');
            const contentArea = document.querySelector('#content');
    
            alertBox.classList.remove('alert__wrap-fixed');
            alertBox.classList.add('alert__wrap');
            contentArea.prepend(alertBox);
        });
    </script>
		<!-- END OFFCANVAS LEFT -->
		<script type="text/javascript">
	$(function(){
		SADMIN_MENU_ALERT.openAlert();
	});
</script>
		<header class="top_header" id="header">
			<div class="headerbar">
				<div class="headerbar-left">
					<ul class="header-nav header-nav-options">
						<li class="hidden-lg hidden-md"><a
							class="btn btn-icon-toggle menubar-toggle" data-toggle="menubar"
							href="javascript:void(0);"> <i class="btl bt-bars"></i>
						</a></li>
						<li class="header-nav-brand">
							<div class="brand-holder">
								<span class="location_text"> <span>편집 및 추가</span>
								</span>
							</div>
						</li>
					</ul>
				</div>

				<div class="headerbar-right">
					<ul class="header-nav header-nav-options _option_list">
						<li><a class="btn btn-default-bright"
							onclick="history.go(-1);">취소</a></li>
						<li><a class="btn btn-primary disabled">저장</a></li>
					</ul>
					<!--end .header-nav-options -->
				</div>
				<!--끝 #header-navbar-collapse -->

				<!--끝 #header-navbar-collapse -->
			</div>
		</header>
		<!-- BEGIN CONTENT-->
		<div id="content">
			<div id="alertBox" class="alert__wrap"></div>
			<section class="section-max-width">
				<div class="section-body">

					<!-- 입력화면 -->
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">
									<form id="dof" method="post" enctype="multipart/form-data"
										class="form-horizontal form-validate" action="" role="form"
										target="hidden_frame" novalidate="novalidate">
										<input type="hidden" name="popup_idx" id="popup_idx" value="0">
										<input type="hidden" name="img_name" id="img_name" value="">
										<div class="form-group">
											<label class="col-sm-2 control-label" for="">제목</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="subject"
													id="title" placeholder="관리용 제목(사용자에겐 표시되지 않습니다)" value="">
												<div class="form-control-line"></div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="">기간</label>
											<div class="col-sm-6 time_duration">
												<div class="input-group">
													<div class="input-group-content">
														<div style="position: relative">
															<input type="text" class="form-control" name="start_time"
																id="start_time" placeholder="날짜와 시간을 입력해주세요"
																value="2022-08-25 09:51">
															<div class="form-control-line"></div>
														</div>
													</div>
													<span class="input-group-addon">~</span>
													<div class="input-group-content">
														<div style="position: relative">
															<input type="text" class="form-control" name="end_time"
																id="end_time" placeholder="날짜와 시간을 입력해주세요"
																value="2022-08-25 09:51">
															<div class="form-control-line"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="">대상 기기</label>
											<div class="col-sm-10">
												<label class="checkbox-inline checkbox-styled"> <input
													type="checkbox" class="_show_device" name="show_device"
													value="desktop"><span>데스크톱</span>
												</label> <label class="checkbox-inline checkbox-styled"> <input
													type="checkbox" class="_show_device" name="show_device"
													value="mobile"><span>모바일</span>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="">노출 페이지</label>
											<div class="col-sm-10">
												<label class="radio-inline radio-styled"> <input
													type="radio" class="_show_page" name="show_page"
													value="home" checked="checked"><span>홈 화면</span>
												</label> <label class="radio-inline radio-styled"> <input
													type="radio" class="_show_page" name="show_page"
													value="custom"><span>사용자 정의</span>
												</label>
												<div class="row _show_page_list">
													<div class="col-sm-12">
														<div
															class="menu_tree alert alert-info _show_page_list_wrap"
															style="display: none;">
															<ul>

																<li><label class="checkbox-inline checkbox-styled">
																		<input type="checkbox" class="" name="show_page_list"
																		value="m20220822a25538954e138"><span>Overview</span>


																</label></li>

																<li><label class="checkbox-inline checkbox-styled">
																		<input type="checkbox" class="" name="show_page_list"
																		value="m202208222d25f35d4937c"><span>Online
																			Shop</span>

																		<ul>

																			<li><label
																				class="checkbox-inline checkbox-styled"> <input
																					type="checkbox" class="" name="show_page_list"
																					value="m202208220d2a93689923b"><span>Top</span>


																			</label></li>

																			<li><label
																				class="checkbox-inline checkbox-styled"> <input
																					type="checkbox" class="" name="show_page_list"
																					value="m202208226a4d0fb382f05"><span>Bottom</span>


																			</label></li>

																			<li><label
																				class="checkbox-inline checkbox-styled"> <input
																					type="checkbox" class="" name="show_page_list"
																					value="m20220822f64aa6721a8de"><span>Dress&amp;Setup</span>


																			</label></li>

																			<li><label
																				class="checkbox-inline checkbox-styled"> <input
																					type="checkbox" class="" name="show_page_list"
																					value="m2022082263852190c9793"><span>ACC</span>


																			</label></li>

																		</ul>


																</label></li>

																<li><label class="checkbox-inline checkbox-styled">
																		<input type="checkbox" class="" name="show_page_list"
																		value="m202208222871bc2883f38"><span>Review</span>


																</label></li>

																<li><label class="checkbox-inline checkbox-styled">
																		<input type="checkbox" class="" name="show_page_list"
																		value="m20220822409da59225120"><span>Help
																			Center</span>

																		<ul>

																			<li><label
																				class="checkbox-inline checkbox-styled"> <input
																					type="checkbox" class="" name="show_page_list"
																					value="m202208225d00a2f5d122f"><span>Notice</span>


																			</label></li>

																			<li><label
																				class="checkbox-inline checkbox-styled"> <input
																					type="checkbox" class="" name="show_page_list"
																					value="m20220822618829194969f"><span>Q&amp;A</span>


																			</label></li>

																		</ul>


																</label></li>

															</ul>

															<ul>

															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="">적용 조건</label>
											<div class="col-sm-10">
												<label class="radio-inline radio-styled"> <input
													type="radio" class="_launch_type" name="launch_type"
													value="all" checked="checked"><span>모든 방문자</span>
												</label> <label class="radio-inline radio-styled"> <input
													type="radio" class="_launch_type" name="launch_type"
													value="login"><span>로그인 방문자</span>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="">위치/형태</label>
											<div class="col-sm-10">
												<div class="btn-group" data-toggle="buttons">
													<label class="btn btn-default-bright _position_type active">
														<input type="radio" class="" name="type" id="" value="PL"
														checked="checked">팝업 레이어
													</label> <label class="btn btn-default-bright _position_type ">
														<input type="radio" class="" name="type" id="" value="TB">상단
														배너
													</label>
												</div>
											</div>
										</div>

										<div class="_popup_option_wrap form-group">
											<label class="col-sm-2 control-label" for="">버튼 설정</label>
											<div class="col-sm-10">
												<label class="radio-inline radio-styled"> <input
													type="radio" class="_menu_btn" name="menu_btn" value="Y"
													checked="checked"><span>배너 하단 버튼 표시</span>
												</label> <label class="radio-inline radio-styled"> <input
													type="radio" class="_menu_btn" name="menu_btn" value="N"><span>표시안함</span>
												</label>
											</div>
										</div>
										<div class="_popup_option_wrap form-group">
											<label class="col-sm-2 control-label" for="">우측 상단 닫기
												설정</label>
											<div class="col-sm-10">
												<label class="radio-inline radio-styled"> <input
													type="radio" class="_cls_btn" name="cls_btn" value="close"
													checked="checked"><span>닫기</span>
												</label> <label class="radio-inline radio-styled"> <input
													type="radio" class="_cls_btn" name="cls_btn"
													value="close_today"><span>오늘 하루 다시 보지 않기</span>
												</label> <label class="radio-inline radio-styled"> <input
													type="radio" class="_cls_btn" name="cls_btn" value="none"><span>표시안함</span>
												</label>
											</div>
										</div>



										<div class="form-group _positon_center_options"
											style="display: block;">
											<label class="col-sm-2 control-label" for="">PC 팝업 위치</label>
											<div class="col-sm-2">
												<select class="form-control position_horizontal_option"
													name="position_horizontal_option"
													id="position_horizontal_option">
													<option value="center">가운데</option>42
													<option value="browser_left">화면 왼쪽에서</option>58
													<option value="browser_right">화면 오른쪽에서</option>62
													<option value="body_left">본문 왼쪽에서</option>55
													<option value="body_right">본문 오른쪽에서</option>59
												</select>
												<div class="form-control-line"></div>
											</div>
											<div class="col-sm-1" style="display: none;">
												<input type="text" class="form-control"
													name="position_horizontal" id="position_horizontal"
													value="">
												<div class="form-control-line"></div>
											</div>
											<div class="col-sm-1" style="display: none;">
												<select class="form-control" name="horizontal_unit"
													id="horizontal_unit">
													<option value="px">px</option>31
													<option value="%">%</option>29
												</select>
												<div class="form-control-line"></div>
											</div>
											<label class="col-sm-2 control-label" for=""
												style="display: none;">화면 위쪽에서</label>
											<div class="col-sm-1" style="display: none;">
												<input type="text" class="form-control"
													name="position_vertical" id="position_vertical" value="">
												<div class="form-control-line"></div>
											</div>
											<div class="col-sm-1" style="display: none;">
												<select class="form-control" name="vertical_unit"
													id="vertical_unit">
													<option value="px">px</option>31
													<option value="%">%</option>29
												</select>
												<div class="form-control-line"></div>
											</div>
										</div>

										<div class="form-group _positon_center_options on_mobile"
											style="display: none;">
											<label class="col-sm-2 control-label" for="">모바일 팝업
												위치</label>
											<div class="col-sm-2">
												<select class="form-control position_horizontal_option"
													name="mobile_position_horizontal_option"
													id="mobile_position_horizontal_option">
													<option value="center">가운데</option>42
													<option value="browser_left">화면 왼쪽에서</option>58
													<option value="browser_right">화면 오른쪽에서</option>62
													<option value="body_left">본문 왼쪽에서</option>55
													<option value="body_right">본문 오른쪽에서</option>59
												</select>
												<div class="form-control-line"></div>
											</div>
											<div class="col-sm-1" style="display: none;">
												<input type="text" class="form-control"
													name="mobile_position_horizontal"
													id="mobile_position_horizontal" value="">
												<div class="form-control-line"></div>
											</div>
											<div class="col-sm-1" style="display: none;">
												<select class="form-control" name="mobile_horizontal_unit"
													id="mobile_horizontal_unit">
													<option value="px">px</option>31
													<option value="%">%</option>29
												</select>
												<div class="form-control-line"></div>
											</div>
											<label class="col-sm-2 control-label" for=""
												style="display: none;">화면 위쪽에서</label>
											<div class="col-sm-1" style="display: none;">
												<input type="text" class="form-control"
													name="mobile_position_vertical"
													id="mobile_position_vertical" value="100">
												<div class="form-control-line"></div>
											</div>
											<div class="col-sm-1" style="display: none;">
												<select class="form-control" name="mobile_vertical_unit"
													id="mobile_vertical_unit">
													<option value="px">px</option>31
													<option value="%">%</option>29
												</select>
												<div class="form-control-line"></div>
											</div>
										</div>


										<input type="hidden" name="content_type" value="image">

										<div class="_body_image_options">
											<div class="form-group">
												<label class="col-sm-2 control-label">이미지</label>
												<div class="col-sm-4">
													<div class="wrap-image-upload ">
														<!-- 파일 첨부 후 .image-include 추가 -->
														<div class="image-list" id="icon_img_wrap"
															style="display: none">
															<div class="item">
																<img src="" id="icon_src"> <a href="javascript:;"
																	class="close" onclick="removeImg('icon')"><i
																	class="zmdi zmdi-close"></i></a>
															</div>
														</div>
														<div class="wrap-upload-button btn-file"
															id="icon_img_upload_wrap" style="display: block">
															<button class="btn-image-upload" role="button">
																<div class="btn-content">
																	<p class="icon">
																		<i class="fa fa-picture-o"></i>
																		<!--파일 첨부 후 .fa-plus로 변환 -->
																	</p>
																	<div>이미지를 여기로 드래그</div>
																</div>
															</button>
															<a href="javascript:;"><input type="file"
																id="icon_img"></a>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="img_url">이미지
													링크</label>
												<div class="col-sm-5">
													<div class="input-group">
														<div class="input-group-content">
															<input type="text" class="form-control" name="link_url"
																id="img_url" value="http://">
															<div class="form-control-line"></div>
														</div>
														<div class="input-group-addon opacity-100 no-padding-y">
															<label class="checkbox-inline checkbox-styled"> <input
																type="checkbox" name="link_target" value="Y"><span>새
																	창에서 열기</span>
															</label>
														</div>
													</div>
												</div>
											</div>
											<div class="_popup_option_wrap">
												<div class="form-group">
													<label class="col-sm-2 control-label">너비</label>
													<div class="col-sm-2 width-3">
														<div class="input-group-content">
															<input type="text" class="form-control" name="img_width"
																id="img_width" value="320">
															<div class="form-control-line"></div>
														</div>
														<div class="input-group-addon opacity-100 no-padding-y">
															px</div>
													</div>
												</div>

												<div class="form-group on_mobile" style="display: none;">
													<label class="col-sm-2 control-label">모바일 배너 너비</label>
													<div class="col-sm-2 width-3">
														<div class="input-group-content">
															<input type="text" class="form-control"
																name="mobile_width" id="mobile_width" value="auto">
															<div class="form-control-line"></div>
														</div>
														<div class="input-group-addon opacity-100 no-padding-y">
															px</div>
													</div>
												</div>
											</div>
											<div class="_banner_option_wrap" style="display: none;">
												<div class="form-group">
													<label class="col-sm-2 control-label">PC 높이</label>
													<div class="col-sm-2 width-3">
														<div class="input-group-content">
															<input type="text" class="form-control"
																name="banner_pc_height" id="banner_pc_height"
																value="120">
															<div class="form-control-line"></div>
														</div>
														<div class="input-group-addon opacity-100 no-padding-y">
															px</div>
													</div>
												</div>
												<div class="form-group _banner_mobile_height_wrap">
													<label class="col-sm-2 control-label">MOBILE 높이</label>
													<div class="col-sm-2 width-3">
														<div class="input-group-content">
															<input type="text" class="form-control"
																name="banner_mobile_height" id="banner_mobile_height"
																value="60">
															<div class="form-control-line"></div>
														</div>
														<div class="input-group-addon opacity-100 no-padding-y">
															px</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="">배경색</label>
													<div class="col-sm-10">
														<div class="_background_color"
															style="width: 135px; position: relative;">
															<div>
																<input class="dz-form-control" type="text"
																	maxlength="25">
																<div class="color_pick input-group-addon"
																	style="left: auto; right: 0; z-index: 99">
																	<span class="color"></span><i class="frame_box fr_20"
																		style="background-color: rgb(0, 0, 0);"></i>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="">닫기 버튼색</label>
													<div class="col-sm-10">
														<div class="_close_btn_color"
															style="width: 135px; position: relative;">
															<div>
																<input class="dz-form-control" type="text"
																	maxlength="25">
																<div class="color_pick input-group-addon"
																	style="left: auto; right: 0; z-index: 99">
																	<span class="color"></span><i class="frame_box fr_20"
																		style="background-color: rgb(0, 0, 0);"></i>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="_body_html_options" style="display: none;">
											<div class="form-group">
												<label class="col-sm-2 control-label"></label>
												<div class="col-sm-10">
													<div class="_body_html_editor"></div>
												</div>
											</div>
										</div>
										<!-- end 에디터 선택시 -->
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<a class="btn btn-primary disabled">저장</a>
				</div>
			</section>
			<!--섹션 끝 -->
		</div>
		<script>
	$(function () {
		CONFIG_POPUP.init({"idx":0,"site_code":null,"unit_code":null,"type":"PL","subject":null,"show_device":[""],"show_page":null,"show_page_list":null,"launch_type":null,"options":{"mobile_position":{"location":{"top":100}}},"content_type":null,"img":null,"content_html":null,"link_url":null,"link_target":null,"start_time":"2022-08-25 09:51","end_time":"2022-08-25 09:51","write_time":null});

		$('#start_time').datetimepicker({
			dayViewHeaderFormat: 'YYYY MMMM',
			locale: getMomentLangCode(ADMIN_LANG_CODE),
			icons: {
				time: 'zmdi zmdi-time',
				date: 'zmdi zmdi-calendar',
				up: 'zmdi zmdi-chevron-up',
				down: 'zmdi zmdi-chevron-down',
				previous: 'zmdi zmdi-chevron-left',
				next: 'zmdi zmdi-chevron-right',
				today: 'glyphicon glyphicon-screenshot',
				clear: 'glyphicon glyphicon-trash'
			},
			format : 'YYYY-MM-DD HH:mm',
		}).on('blur',function(data){
			if($('#start_time').val() > $('#end_time').val()){
				$('#end_time').val($('#start_time').val());
			}
		});
		$('#end_time').datetimepicker({
			dayViewHeaderFormat: 'YYYY MMMM',
			locale: getMomentLangCode(ADMIN_LANG_CODE),
			icons: {
				time: 'zmdi zmdi-time',
				date: 'zmdi zmdi-calendar',
				up: 'zmdi zmdi-chevron-up',
				down: 'zmdi zmdi-chevron-down',
				previous: 'zmdi zmdi-chevron-left',
				next: 'zmdi zmdi-chevron-right',
				today: 'glyphicon glyphicon-screenshot',
				clear: 'glyphicon glyphicon-trash'
			},
			format : 'YYYY-MM-DD HH:mm',
		}).on('blur',function(data){
			if($('#start_time').val() > $('#end_time').val()){
				$('#end_time').val($('#start_time').val());
			}
		});
	});

	function removeImg(mode){
		if(mode=='icon'){
			$("#icon_img_url").val("");
			$("#icon_img_wrap").hide();
			$("#icon_img_upload_wrap").show();
		}else{
			$("#launch_img_url").val("");
			$("#launch_img_wrap").hide();
			$("#launch_img_upload_wrap").show();
		}
	}

	var brand_color = function (){
		if("#a4a237"){
			return "#a4a237";
		}else{
			return "#000";
		}
	}

    const popup_location = document.querySelectorAll("input[name=position_horizontal],input[name=position_vertical]");
    const popup_width = document.querySelectorAll("input[name=img_width],input[name=mobile_width]");

    const check_location_validation = (e)=>{
      let target_value = e.target.value;
      if(isNaN(Number(target_value))){
        alert("숫자만 입력해주세요.")
        e.target.value = ""
      }

    }
    const check_width_validation = (e)=>{
      let target_value = e.target.value;
      if(isNaN(Number(target_value)) && target_value !="auto"){
        alert("auto 혹은 숫자만 입력해주세요.")
        e.target.value = ""
      }

    }
    popup_location.forEach((p)=>{
      p.addEventListener("focusout",check_location_validation);
    })
    popup_width.forEach((p)=>{
      p.addEventListener("focusout",check_width_validation);
    })


</script>
		<script>	
			$(window).on("keyup", function(e){
				if ( $.cocoaDialog.isOpen() ) {
					$.cocoaDialog.modalControl(e);
				}
				return false;
			});</script>
		<!-- BEGIN MENUBAR-->
		<button type="button" class="hidden-lg hidden-md toggle-btn"
			data-dismiss="menubar">
			<span class="sr-only">Toggle navigation</span> <i
				class="btl bt-times"></i>
		</button>

		<div id="menubar" class="animate">
			<div class="nano has-scrollbar" style="height: 929px;">
				<div class="nano-content" tabindex="0" style="right: -17px;">
					<div class="menubar-scroll-panel" style="padding-bottom: 50px;">
						<div class="tabled full-width">
							<a href="javascript:"
								class="holder global_icon_menu dropdown-toggle"
								data-toggle="dropdown" aria-expanded="true">
								<div
									style="position: absolute; left: 22px; top: 0; line-height: 36px;">
									<img src="/common/img/flag_shapes/flag_kr_circle.png"
										width="20" height="20">
								</div>
								<div class="brand-holder">
									<span class="title_controls">dddrgtertwe</span>
								</div>
							</a>
							<ul
								class="dropdown-menu global_setting animation-dock menu-card-styling">
								<li class="holder "><a href="/admin/config/popup/?mode=add">
										<div class="tabled">
											<div class="table-cell vertical-middle width-1">
												<img width="30" height="30"
													src="/common/img/flag_shapes/flag_kr_circle.png">
											</div>
											<div class="table-cell vertical-middle domain">
												<div class="inline-blocked">
													<span class="domain_name">dddrgtertwe</span>
												</div>
												<span
													data-original-title="일반 방문자의 접속이 제한됩니다. 글로벌 버전으로 업그레이드 해주세요"
													data-toggle="tooltip" class="badge" data-placement="top"
													style="margin-left: 5px; vertical-align: top;">미결제</span>
												<div class="text-gray-bright text-12">dddrsersrty.imweb.me</div>
											</div>
										</div>
								</a>
									<div class="tools"></div></li>
								<li class="border-top"><a href="javascript:;"
									onclick="SITE_MANAGE.openAddUnit('S20220822a09cedc4f039d')"
									class="text-primary" style="padding-top: 15px;">새 언어 사이트 추가</a></li>
							</ul>
						</div>
						<ul id="main-menu" class="gui-controls">
							<li class="  " data-title="design_mode"><a
								href="/admin/design"><div class="gui-icon">
										<i class="db-wand"></i>
									</div>
									<span class="title title_controls">디자인모드</span></a></li>
							<li class="  " data-title="preview"><a
								href="//dddrsersrty.imweb.me" target="_blank"><div
										class="gui-icon">
										<i class="db-preview"></i>
									</div>
									<span class="title title_controls">사이트 바로가기</span></a></li>
							<li class="spacer"></li>
							<li class="top-menu"><a href="javascript:;"
								onclick="DASHBOARD.openSiteManagementDialog(this);"><span>사이트
										관리</span><i class="btm bt-plus-circle"></i></a></li>
							<li class="  " data-title="dashboard"><a href="/admin//"><div
										class="gui-icon">
										<i class="db-dashboard"></i>
									</div>
									<span class="title title_controls">대시보드</span></a></li>
							<li class=" gui-folder " data-title="member"><a
								href="/admin/member" class="sidebar-nav-menu"
								onclick="return false;"><div class="gui-icon">
										<i class="db-user"></i>
									</div>
									<span class="title title_controls">사용자 관리</span></a>
							<ul>
									<li class="  " data-title="member_list"><a
										href="/admin/member/list"><span
											class="title title_controls">사용자 목록</span></a></li>
									<li class="  " data-title="member_msg"><a
										href="/admin/member/send"><span
											class="title title_controls">메세지 보내기</span></a></li>
									<li class="  " data-title="member_permission"><a
										href="/admin/member/permission"><span
											class="title title_controls">운영진 설정</span></a></li>
									<li class="  " data-title="member_mail"><a
										href="/admin/member/mail"><span
											class="title title_controls">메일 발송 설정</span></a></li>
									<li class="  " data-title="member_sms"><a
										href="/admin/member/sms"><span
											class="title title_controls">SMS/알림톡 설정</span></a></li>
								</ul></li>
							<li class=" gui-folder " data-title="shopping"><a
								href="/admin/shopping" class="sidebar-nav-menu"
								onclick="return false;"><div class="gui-icon">
										<i class="db-shopping-bag"></i>
									</div>
									<span class="title title_controls">쇼핑</span></a>
							<ul>
									<li class="  " data-title="shopping_product"><a
										href="/admin/shopping/product"><span
											class="title title_controls">상품관리</span></a></li>
									<li class="  " data-title="shopping_interlocking"><a
										href="/admin/shopping/interlocking"><span
											class="title title_controls">연동 상품관리</span><span
											class="badge_icon" style="background-color: #00bb73;">Beta</span></a></li>
									<li class="  " data-title="shopping_order"><a
										href="/admin/shopping/order"><span
											class="title title_controls">주문관리</span></a></li>
									<li class="  " data-title="shopping_cancel"><a
										href="/admin/shopping/cancel"><span
											class="title title_controls">취소관리</span></a></li>
									<li class="  " data-title="shopping_return"><a
										href="/admin/shopping/return"><span
											class="title title_controls">반품관리</span></a></li>
									<li class="  " data-title="shopping_exchange"><a
										href="/admin/shopping/exchange"><span
											class="title title_controls">교환관리</span></a></li>
									<li class="  " data-title="shopping_regularly"><a
										href="/admin/shopping/regularly"><span
											class="title title_controls">정기구독 관리</span></a></li>
									<li class="  " data-title="shopping_review"><a
										href="/admin/shopping/review"><span
											class="title title_controls">구매평 관리</span></a></li>
									<li class="  " data-title="shopping_answers"><a
										href="/admin/shopping/answers"><span
											class="title title_controls">문의관리</span></a></li>
									<li class="  " data-title="member_mileage"><a
										href="/admin/shopping/mileage"><span
											class="title title_controls">적립금 관리</span></a></li>
									<li class="  " data-title="shopping_coupon"><a
										href="/admin/shopping/coupon"><span
											class="title title_controls">쿠폰</span></a></li>
									<li class="  " data-title="shopping_naver"><a
										href="/admin/shopping/naver"><span
											class="title title_controls">네이버/카카오 쇼핑</span></a></li>
									<li class="  " data-title="shopping_shipping"><a
										href="/admin/shopping/shipping"><span
											class="title title_controls">배송관리</span><span
											class="badge_icon" style="background-color: #00bb73;">N</span></a></li>
									<li class="  " data-title="shopping_config"><a
										href="/admin/shopping/config"><span
											class="title title_controls">쇼핑 환경설정</span></a></li>
								</ul></li>
							<li class=" gui-folder animated animated-hidden"
								data-title="booking"><a href="/admin/booking"
								class="sidebar-nav-menu" onclick="return false;"><div
										class="gui-icon">
										<i class="db-calendar"></i>
									</div>
									<span class="title title_controls">예약</span></a>
							<ul>
									<li class="  " data-title="booking_product"><a
										href="/admin/booking/product"><span
											class="title title_controls">객실/사이트 관리</span></a></li>
									<li class="  " data-title="booking_order_cal"><a
										href="/admin/booking/order_cal"><span
											class="title title_controls">예약 현황 관리</span></a></li>
									<li class="  " data-title="booking_order"><a
										href="/admin/booking/order"><span
											class="title title_controls">예약 신청 관리</span></a></li>
									<li class="  " data-title="booking_review"><a
										href="/admin/booking/review"><span
											class="title title_controls">후기 관리</span></a></li>
									<li class="  " data-title="booking_answers"><a
										href="/admin/booking/answers"><span
											class="title title_controls">문의관리</span></a></li>
									<li class="  " data-title="booking_option"><a
										href="/admin/booking/option"><span
											class="title title_controls">옵션 관리</span></a></li>
									<li class="  " data-title="booking_season"><a
										href="/admin/booking/season"><span
											class="title title_controls">성수기/휴일 관리</span></a></li>
									<li class="  " data-title="booking_config"><a
										href="/admin/booking/config"><span
											class="title title_controls">예약 설정</span></a></li>
								</ul></li>
							<li class=" gui-folder " data-title="contents"><a
								href="/admin/contents" class="sidebar-nav-menu"
								onclick="return false;"><div class="gui-icon">
										<i class="db-pencil"></i>
									</div>
									<span class="title title_controls">컨텐츠 관리</span></a>
							<ul>
									<li class="  " data-title="contents_post"><a
										href="/admin/contents/post"><span
											class="title title_controls">게시물 관리</span></a></li>
									<li class="  " data-title="contents_comment"><a
										href="/admin/contents/comment"><span
											class="title title_controls">댓글 관리</span></a></li>
									<li class="  " data-title="contents_form"><a
										href="/admin/contents/form"><span
											class="title title_controls">입력폼 관리</span></a></li>
									<li class="  " data-title="contents_map"><a
										href="/admin/contents/map"><span
											class="title title_controls">지도 관리</span></a></li>
									<li class="  " data-title="contents_calendar"><a
										href="/admin/contents/calendar"><span
											class="title title_controls">일정 관리</span></a></li>
									<li class="  " data-title="contents_gallery"><a
										href="/admin/contents/gallery"><span
											class="title title_controls">갤러리 관리</span></a></li>
									<li class="  " data-title="contents_report"><a
										href="/admin/contents/report"><span
											class="title title_controls">신고/차단 관리</span></a></li>
								</ul></li>
							<li class=" gui-folder " data-title="marketing"><a
								href="/admin/marketing" class="sidebar-nav-menu"
								onclick="return false;"><div class="gui-icon">
										<i class="db-megaphone"></i>
									</div>
									<span class="title title_controls">마케팅 관리</span></a>
							<ul>
									<li class="  " data-title="marketing_adbot"><a
										href="https://ad.imweb.me/main?utm_source=imweb&amp;utm_medium=link_click&amp;utm_campaign=admin_menu"
										target="_blank"><span class="title title_controls">통합
												광고 관리(아임웹 애드)</span></a></li>
									<li class="  " data-title="marketing_trace"><a
										href="/admin/marketing/trace"><span
											class="title title_controls">전환추적/리타게팅 관리</span></a></li>
									<li class="  " data-title="marketing_facebook_fbe"><a
										href="/admin/marketing/facebook_fbe"><span
											class="title title_controls">페이스북 마케팅(FBE)</span></a></li>
									<li class="  " data-title="marketing_acecounter"><a
										href="/admin/marketing/ace_counter"><span
											class="title title_controls">에이스카운터</span></a></li>
								</ul></li>
							<li class=" gui-folder " data-title="app"><a
								href="/admin/app" class="sidebar-nav-menu"
								onclick="return false;"><div class="gui-icon">
										<i class="db-mobile"></i>
									</div>
									<span class="title title_controls">App 신청 및 관리</span></a>
							<ul>
									<li class="  " data-title="app_android"><a
										href="/admin/app/android"><span
											class="title title_controls">Android 앱</span></a></li>
									<li class="  " data-title="app_ios"><a
										href="/admin/app/ios"><span class="title title_controls">iOS
												앱</span></a></li>
								</ul></li>
							<li class=" gui-folder " data-title="stat"><a
								href="/admin/stat" class="sidebar-nav-menu"
								onclick="return false;"><div class="gui-icon">
										<i class="db-status-up"></i>
									</div>
									<span class="title title_controls">통계</span></a>
							<ul>
									<li class="  " data-title="stat_summary"><a
										href="/admin/stat/summary"><span
											class="title title_controls">개요</span></a></li>
									<li class="  " data-title="stat_analytics"><a
										href="/admin/stat/analytics"><span
											class="title title_controls">기간별 분석</span></a></li>
									<li class="  " data-title="admin_stat_mileage"><a
										href="/admin/stat/mileage"><span
											class="title title_controls">적립금 통계</span><span
											class="badge_icon" style="background-color: #00bb73;">N</span></a></li>
									<li class="  " data-title="stat_shopping"><a
										href="/admin/stat/shopping"><span
											class="title title_controls">매출</span><span
											class="badge_icon" style="background-color: #00bb73;">Beta</span></a></li>
									<li class="  " data-title="stat_feedback"><a
										href="/admin/stat/feedback"><span
											class="title title_controls">컨텐츠 반응</span></a></li>
									<li class="  " data-title="stat_visitor"><a
										href="/admin/stat/visitor"><span
											class="title title_controls">방문자 통계</span></a></li>
									<li class="  " data-title="stat_site"><a
										href="/admin/stat/site"><span class="title title_controls">유입
												사이트</span></a></li>
									<li class="  " data-title="stat_keyword"><a
										href="/admin/stat/keyword"><span
											class="title title_controls">유입 검색어</span></a></li>
									<li class="  " data-title="stat_page"><a
										href="/admin/stat/page"><span class="title title_controls">많이
												방문한 페이지</span></a></li>
									<li class="  " data-title="stat_storage"><a
										href="/admin/stat/storage"><span
											class="title title_controls">저장공간</span></a></li>
									<li class="  " data-title="stat_traffic"><a
										href="/admin/stat/traffic"><span
											class="title title_controls">트래픽</span></a></li>
								</ul></li>
							<li class="  " data-title="payment"><a href="/admin/payment"><div
										class="gui-icon">
										<i class="icon-rocket"></i>
									</div>
									<span class="title title_controls">결제/앱스토어</span></a></li>
							<li class="active gui-folder expanded" data-title="config"><a
								href="/admin/config" class="sidebar-nav-menu1"
								onclick="return false;"><div class="gui-icon">
										<i class="db-settings"></i>
									</div>
									<span class="title title_controls">환경설정</span></a>
							<ul>
									<li class="  " data-title="config_default"><a
										href="/admin/config/default"><span
											class="title title_controls">기본 설정</span></a></li>
									<li class="  " data-title="config_localize"><a
										href="/admin/config/localize"><span
											class="title title_controls">언어/지역/통화</span></a></li>
									<li class="  " data-title="config_pg"><a
										href="/admin/config/pg"><span class="title title_controls">전자결제(PG)
												설정</span></a></li>
									<li class="  " data-title="config_domain"><a
										href="/admin/config/domain"><span
											class="title title_controls">도메인 구입 및 설정</span></a></li>
									<li class="  " data-title="config_ssl"><a
										href="/admin/config/ssl"><span
											class="title title_controls">SSL(보안서버) 구입 및 설정</span></a></li>
									<li class="  " data-title="config_security"><a
										href="/admin/config/security"><span
											class="title title_controls">보안 및 개인정보 보호</span></a></li>
									<li class="  " data-title="config_membership"><a
										href="/admin/config/membership"><span
											class="title title_controls">가입 및 그룹 설정</span></a></li>
									<li class="  " data-title="config_seo"><a
										href="/admin/config/seo"><span
											class="title title_controls">SEO, 헤더설정</span></a></li>
									<li class="  " data-title="config_etc"><a
										href="/admin/config/etc"><span
											class="title title_controls">약관 설정</span></a></li>
									<li class="active expanded" data-title="config_popup"><a
										href="/admin/config/popup" class=" active"><span
											class="title title_controls">팝업/배너 관리</span></a></li>
									<li class="  " data-title="config_adult"><a
										href="/admin/config/adult"><span
											class="title title_controls">본인인증/성인인증</span></a></li>
									<li class="  " data-title="config_oauth"><a
										href="/admin/config/oauth"><span
											class="title title_controls">소셜 로그인 / API 설정</span></a></li>
									<li class="  " data-title="config_chat"><a
										href="/admin/config/chat"><span
											class="title title_controls">실시간 상담 설정</span></a></li>
									<li class="  " data-title="config_find_designer"><a
										href="/admin/config/find_designer"><span
											class="title title_controls">디자이너/리셀러 찾기</span></a></li>
									<li class="  " data-title="config_api_v2"><a
										href="/admin/config/rest_v2"><span
											class="title title_controls">외부 서비스 연동 (API)</span></a></li>
								</ul></li>
							<li class="spacer"></li>
							<li class="top-menu"><div>
									<span>리소스</span>
								</div></li>
							<li class="  " data-title="support"><a
								href="//imweb.me/customer" target="_blank"><div
										class="gui-icon">
										<i class="db-comments"></i>
									</div>
									<span class="title title_controls">고객지원</span></a></li>
							<li class=" gui-folder " data-title="campus"><a href="edu"
								class="sidebar-nav-menu" onclick="return false;"><div
										class="gui-icon">
										<i class="db-graduation-cap"></i>
									</div>
									<span class="title title_controls">아임웹 교육</span></a>
							<ul>
									<li class="  " data-title="campus_edu"><a
										href="https://imweb.me/edu" target="_blank"><span
											class="title title_controls">교육 일정/신청</span></a></li>
									<li class="  " data-title="campus_video"><a
										href="https://imweb.me/video_lecture" target="_blank"><span
											class="title title_controls">동영상 강의</span></a></li>
								</ul></li>
							<li class="  " data-title="consulting_design"><a
								href="https://imweb.me/find_designer" target="_blank"><div
										class="gui-icon">
										<i class="db-glasses"></i>
									</div>
									<span class="title title_controls">디자이너 찾기</span></a></li>
						</ul>
						<div class="height-1"></div>
						<div class="menubar-foot-panel">
							<div class="full-height">
								<a href="javascript:" class="dropdown-toggle block _lang_button"
									data-toggle="dropdown" tabindex="-1" aria-expanded="false">
									<i class="icon-globe"></i> <span class="panel-text">한국어</span>
								</a>
								<ul class="dropdown-menu pull-right">
									<li><a href="javascript:;"
										onclick="ADMIN.changeAdminLang('KR')">한국어</a></li>
									<li><a href="javascript:;"
										onclick="ADMIN.changeAdminLang('EN')">English (Beta)</a></li>
									<li><a href="javascript:;"
										onclick="ADMIN.changeAdminLang('zh-TW')">中文 (繁體)</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="nano-pane">
					<div class="nano-slider" style="height: 665px; top: 0px;"></div>
				</div>
			</div>
		</div>
		<div class="fold_area tabled animate" style="padding-left: 24px;">
			<div class="table-cell vertical-middle" style="padding-right: 45px;">
				<a href="/admin/" class="logo_icon_menu"> <img
					src="/common/img/imweb_new_logo_white2.png?v2">
				</a>
			</div>
			<a class="_tooltip_btn side_bar_btn" href="javascript:void(0)"
				role="button" id="toggle_button"> <span class="fold_button left"
				data-original-title="사이드바 접어두기" data-toggle="tooltip"
				data-placement="bottom"> <i class="icons fa fa-chevron-left"
					style="opacity: 0.6"></i> <i class="icons fa fa-chevron-left"></i>
			</span> <span class="fold_button right" data-original-title="사이드바 펼쳐두기"
				data-toggle="tooltip" data-placement="bottom"> <i
					class="icons fa fa-chevron-right"></i> <i
					class="icons fa fa-chevron-right" style="opacity: 0.6"></i>
			</span>
			</a>
		</div>

		<script>
  (function(){
    let body = document.body;
    let btn = document.querySelector('#toggle_button');
    let sidebar_mini_class = 'sidebar-mini';
    let user_sm_status = getCookie('sm_status');
    let window_width = window.innerWidth;
    setPrimarySideMenu();

    btn.addEventListener('click', handleToggleButton);
    btn.addEventListener('touch', handleToggleButton);

    //만약 사용자가 버튼을 누르지 않았을때만 이 이벤트 리스너를 사용할것임.
      window.onresize = () => {
        window_width = window.innerWidth;
        if(user_sm_status !== 'h'&& user_sm_status !== 's') {
          resizeWindow(window_width)
        }
      }

    function handleToggleButton(){
      if (user_sm_status == 'h') {
        setSideMenu('show');
      } else {
        setSideMenu('hide');
      }
    }

    function resizeWindow(window_width){
      if (window_width > 1280 || window_width < 991) {
        body.classList.remove(sidebar_mini_class);
      }
      //992~1279 일때
     else {
        body.classList.add(sidebar_mini_class)
      }
    }

    function setPrimarySideMenu() {
      if( window_width > 1280 && user_sm_status !== 'h'|| window_width < 991 ) {
        body.classList.remove(sidebar_mini_class);
      }
      //992~1279 일때
      else if( window_width <=1280 && window_width >= 991) {
          if(user_sm_status == 's') body.classList.remove(sidebar_mini_class);
          else body.classList.add(sidebar_mini_class)
      }
      else{
        body.classList.add(sidebar_mini_class)
      }
    }

    function setSideMenu(show){
      if(show == "show") {
        setCookie('sm_status', 's',1);
        body.classList.remove(sidebar_mini_class);
        user_sm_status = 's'
      }
      else{
        setCookie('sm_status','h',1);
        body.classList.add(sidebar_mini_class);
        user_sm_status = 'h';
      }
    }
  })()

</script>
	</div>
	<!-- END BASE -->

	<script>
</script>
	<div
		style="position: absolute; width: 1px; height: 1px; left: -10000px;"
		data-ip="112.221.246.166" data-ip2=""
		data-ip3="112.221.246.166, 130.176.125.96">
		<input id="dummy_input" type="text">
	</div>

	<div class="modal" id="cocoaModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>

	<div class="modal submodal" role="dialog" id="cocoaSubModal"
		style="z-index: 17001">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>

	<iframe name="hidden_frame" id="hidden_frame"
		style="position: absolute; left: -9999px; width: 1px; height: 1px; top: -9999px;"></iframe>

	<!-- Channel Script -->
	<script type="text/javascript">
window.channelPluginSettings = {"pluginKey":"6a8aaaf7-8e2f-400b-9946-491b9354592f","userId":"M20220810466e666579a03","profile":{"name":"\uc7a5\ubb38\uae30","mobileNumber":"01041250363","email":"ansrlwkd225@naver.com","joinTime":"2022-08-10 14:58:37","avatarUrl":"https:\/\/cdn.imweb.me\/thumbnail\/20220524\/51fe38c3a13fd.png","memberType":"Free","educationApplication":"N","visitsCount":13,"usingConsulting":"","siteVersion":"Free","isSiteExpired":"N","makeDate":"2022-08-22 14:13:56","expireDate":null,"siteMemberCount":2,"mainDomain":"dddrsersrty.imweb.me","imwebDomain":"dddrsersrty.imweb.me","useSSL":"","usingTrace":"N","pgName":"\ubbf8\uac00\uc785","usingNpay":false,"npayVersion":1,"totalSalePrice":0,"lastMonthSalePrice":0},"locale":"ko","zIndex":1000};
(function() {
	var w = window;
	if (w.ChannelIO) {
		return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
	}
	var d = window.document;
	var ch = function() {
		ch.c(arguments);
	};
	ch.q = [];
	ch.c = function(args) {
		ch.q.push(args);
	};
	w.ChannelIO = ch;
	function l() {
		if (w.ChannelIOInitialized) {
			return;
		}
		w.ChannelIOInitialized = true;
		var s = document.createElement('script');
		s.style.zIndex = 1100; 
		s.type = 'text/javascript';
		s.async = true;
		s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
		s.charset = 'UTF-8';
		var x = document.getElementsByTagName('script')[0];
		x.parentNode.insertBefore(s, x);
	}
	if (document.readyState === 'complete') {
		l();
	} else if (window.attachEvent) {
		window.attachEvent('onload', l);
	} else {
	window.addEventListener('DOMContentLoaded', l, false);
	window.addEventListener('load', l, false);
	}
})();
</script>



	<script>
	</script>
	<script src="https://vendor-cdn.imweb.me/dist/app.js?1660634624"></script>
	<div id="device-breakpoints">
		<div class="device-xs visible-xs" data-breakpoint="xs"></div>
		<div class="device-sm visible-sm" data-breakpoint="sm"></div>
		<div class="device-md visible-md" data-breakpoint="md"></div>
		<div class="device-lg visible-lg" data-breakpoint="lg"></div>
	</div>
	<div class="doz-colorpicker" id="503bEhRS47"
		style="display: none; position: absolute;">
		<div class="_picker_wrap colorpicker-element">
			<div
				class="colorpicker dropdown-menu colorpicker-inline colorpicker-visible colorpicker-horizontal colorpicker-with-alpha colorpicker-right colorpicker-no-arrow">
				<div class="colorpicker-saturation">
					<i><b></b></i>
				</div>
				<div class="color-wrap">
					<div class="colorpicker-color">
						<div></div>
					</div>
				</div>
				<div class="hue-alpha-wrap">
					<div class="colorpicker-hue">
						<i></i>
					</div>
					<div class="colorpicker-alpha">
						<i></i>
					</div>
				</div>
				<div class="colorpicker-selectors"></div>
			</div>
			<div class="input">
				<input type="text" class="dz-form-control">
			</div>
		</div>
	</div>
	<div class="doz-colorpicker" id="6UTQ8185FS"
		style="display: none; position: absolute;">
		<div class="_picker_wrap colorpicker-element">
			<div
				class="colorpicker dropdown-menu colorpicker-inline colorpicker-visible colorpicker-horizontal colorpicker-with-alpha colorpicker-right colorpicker-no-arrow">
				<div class="colorpicker-saturation">
					<i><b></b></i>
				</div>
				<div class="color-wrap">
					<div class="colorpicker-color">
						<div></div>
					</div>
				</div>
				<div class="hue-alpha-wrap">
					<div class="colorpicker-hue">
						<i></i>
					</div>
					<div class="colorpicker-alpha">
						<i></i>
					</div>
				</div>
				<div class="colorpicker-selectors"></div>
			</div>
			<div class="input">
				<input type="text" class="dz-form-control">
			</div>
		</div>
	</div>
	<div id="ch-plugin">
		<div id="ch-plugin-core">
			<style data-styled="active" data-styled-version="5.1.1"></style>
			<div size="300"
				class="Screenstyled__Screen-ch-front__sc-3ge3qf-0 hajAwC"></div>
			<div data-ch-testid="launcher"
				class="Launcherstyled__Wrapper-ch-front__sc-oef45p-0 QZWQp">
				<div
					class="Launcherstyled__LauncherIconWrapper-ch-front__sc-oef45p-1 gFAPNC">
					<div
						class="LauncherIconstyled__LauncherWrapper-ch-front__sc-mnslcf-0 bxEzpp launcherIcon">
						<div style="position: absolute; inset: 0px; margin: auto;">
							<img
								src="https://cf.channel.io/asset/plugin/images/shadow-body.png"
								role="presentation" alt="" foundation="[object Object]"
								class="InnerIconstyled__Icon-ch-front__sc-197h5bb-0 hsmtUp LauncherIconstyled__Bubble-ch-front__sc-mnslcf-1 dMLQd"
								color="#1268ff" width="48" height="48" defaultopacity="1"
								hoveredopacity="1" margintop="0" marginright="0"
								marginbottom="0" marginleft="0" withtheme="false"
								style="position: absolute;">
							<svg width="48" height="48" viewBox="0 0 48 48" fill="none"
								xmlns="http://www.w3.org/2000/svg" foundation="[object Object]"
								class="InnerIconstyled__Icon-ch-front__sc-197h5bb-0 hsmtUp LauncherIconstyled__Bubble-ch-front__sc-mnslcf-1 dMLQd"
								color="#1268ff" defaultopacity="1" hoveredopacity="1"
								margintop="0" marginright="0" marginbottom="0" marginleft="0"
								withtheme="false" style="position: absolute;">
								<path fill="#1268ff" fill-opacity="0.6"
									d="M24 6C14.0589 6 6 14.0589 6 24C6 33.9411 14.0589 42 24 42C26.5503 42 28.9767 41.4696 31.175 40.5132C32.4937 39.9394 33.9715 39.7362 35.3397 40.1796L39.7048 41.5942C40.8697 41.9717 41.9717 40.8697 41.5942 39.7048L40.1796 35.3397C39.7362 33.9715 39.9394 32.4937 40.5132 31.175C41.4696 28.9767 42 26.5503 42 24C42 14.0589 33.9411 6 24 6Z"></path></svg>
							<img
								src="https://cf.channel.io/asset/plugin/images/gradient-body.png"
								role="presentation" alt="" foundation="[object Object]"
								class="InnerIconstyled__Icon-ch-front__sc-197h5bb-0 hsmtUp LauncherIconstyled__Bubble-ch-front__sc-mnslcf-1 dMLQd"
								color="#1268ff" width="48" height="48" defaultopacity="1"
								hoveredopacity="1" margintop="0" marginright="0"
								marginbottom="0" marginleft="0" withtheme="false"
								style="position: absolute;">
							<svg width="48" height="48" viewBox="0 0 48 48" fill="none"
								xmlns="http://www.w3.org/2000/svg" foundation="[object Object]"
								class="InnerIconstyled__Icon-ch-front__sc-197h5bb-0 hsmtUp LauncherIconstyled__Bubble-ch-front__sc-mnslcf-1 dMLQd"
								color="#1268ff" defaultopacity="1" hoveredopacity="1"
								margintop="0" marginright="0" marginbottom="0" marginleft="0"
								withtheme="false" style="position: absolute;">
								<g filter="url(#filter0_i)">
								<path fill="white" fill-opacity="0.01"
									d="M24 6C14.0589 6 6 14.0589 6 24C6 33.9411 14.0589 42 24 42C26.5503 42 28.9767 41.4696 31.175 40.5132C32.4937 39.9394 33.9715 39.7362 35.3397 40.1796L39.7048 41.5942C40.8697 41.9717 41.9717 40.8697 41.5942 39.7048L40.1796 35.3397C39.7362 33.9715 39.9394 32.4937 40.5132 31.175C41.4696 28.9767 42 26.5503 42 24C42 14.0589 33.9411 6 24 6Z"></path></g>
								<defs>
								<filter id="filter0_i" x="4" y="2" width="38" height="40"
									filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
								<feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
								<feBlend mode="normal" in="SourceGraphic"
									in2="BackgroundImageFix" result="shape"></feBlend>
								<feColorMatrix in="SourceAlpha" type="matrix"
									values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
									result="hardAlpha"></feColorMatrix>
								<feOffset dx="-2" dy="-4"></feOffset>
								<feGaussianBlur stdDeviation="4"></feGaussianBlur>
								<feComposite in2="hardAlpha" operator="arithmetic" k2="-1"
									k3="1"></feComposite>
								<feColorMatrix type="matrix"
									values="0 0 0 0 0.07058823529411765 0 0 0 0 0.40784313725490196 0 0 0 0 1 0 0 0 0.2 0"></feColorMatrix>
								<feBlend mode="normal" in2="shape" result="effect1_innerShadow"></feBlend></filter></defs></svg>
							<svg width="48" height="48" viewBox="0 0 48 48" fill="none"
								xmlns="http://www.w3.org/2000/svg" foundation="[object Object]"
								class="InnerIconstyled__Icon-ch-front__sc-197h5bb-0 hsmtUp LauncherIconstyled__Bubble-ch-front__sc-mnslcf-1 dMLQd"
								color="#1268ff" defaultopacity="1" hoveredopacity="1"
								margintop="0" marginright="0" marginbottom="0" marginleft="0"
								withtheme="false" style="position: absolute;">
								<g filter="url(#filter0_f)">
								<path fill="white" fill-opacity="0.15"
									d="M19.8462 20.1538C19.8462 22.448 19.2404 24.3077 17.4231 24.3077C15.6058 24.3077 15 22.448 15 20.1538C15 17.8597 15.6058 16 17.4231 16C19.2404 16 19.8462 17.8597 19.8462 20.1538Z"></path>
								<path fill="white" fill-opacity="0.15"
									d="M24.0001 29.8462C21.201 29.8462 19.7599 27.5828 19.3109 25.9843C19.1615 25.4526 19.6016 25.0001 20.1539 25.0001H27.8462C28.3985 25.0001 28.8386 25.4526 28.6893 25.9843C28.2402 27.5828 26.7992 29.8462 24.0001 29.8462Z"></path>
								<path fill="white" fill-opacity="0.15"
									d="M30.5768 24.3077C32.3941 24.3077 32.9999 22.448 32.9999 20.1538C32.9999 17.8597 32.3941 16 30.5768 16C28.7595 16 28.1537 17.8597 28.1537 20.1538C28.1537 22.448 28.7595 24.3077 30.5768 24.3077Z"></path></g>
								<path fill="#1268ff"
									d="M19.8462 19.1538C19.8462 21.448 19.2404 23.3077 17.4231 23.3077C15.6058 23.3077 15 21.448 15 19.1538C15 16.8597 15.6058 15 17.4231 15C19.2404 15 19.8462 16.8597 19.8462 19.1538Z"></path>
								<path fill="#17113F" fill-opacity="0.7"
									d="M19.8462 19.1538C19.8462 21.448 19.2404 23.3077 17.4231 23.3077C15.6058 23.3077 15 21.448 15 19.1538C15 16.8597 15.6058 15 17.4231 15C19.2404 15 19.8462 16.8597 19.8462 19.1538Z"></path>
								<path fill="#1268ff"
									d="M24.0001 28.8462C21.201 28.8462 19.7599 26.5828 19.3109 24.9843C19.1615 24.4526 19.6016 24.0001 20.1539 24.0001H27.8462C28.3985 24.0001 28.8386 24.4526 28.6893 24.9843C28.2402 26.5828 26.7992 28.8462 24.0001 28.8462Z"></path>
								<path fill="#17113F" fill-opacity="0.7"
									d="M24.0001 28.8462C21.201 28.8462 19.7599 26.5828 19.3109 24.9843C19.1615 24.4526 19.6016 24.0001 20.1539 24.0001H27.8462C28.3985 24.0001 28.8386 24.4526 28.6893 24.9843C28.2402 26.5828 26.7992 28.8462 24.0001 28.8462Z"></path>
								<path fill="#1268ff"
									d="M30.5768 23.3077C32.3941 23.3077 32.9999 21.448 32.9999 19.1538C32.9999 16.8597 32.3941 15 30.5768 15C28.7595 15 28.1537 16.8597 28.1537 19.1538C28.1537 21.448 28.7595 23.3077 30.5768 23.3077Z"></path>
								<path fill="#17113F" fill-opacity="0.7"
									d="M30.5768 23.3077C32.3941 23.3077 32.9999 21.448 32.9999 19.1538C32.9999 16.8597 32.3941 15 30.5768 15C28.7595 15 28.1537 16.8597 28.1537 19.1538C28.1537 21.448 28.7595 23.3077 30.5768 23.3077Z"></path>
								<defs>
								<filter id="filter0_f" x="13" y="14" width="21.9999"
									height="17.8462" filterUnits="userSpaceOnUse"
									color-interpolation-filters="sRGB">
								<feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
								<feBlend mode="normal" in="SourceGraphic"
									in2="BackgroundImageFix" result="shape"></feBlend>
								<feGaussianBlur stdDeviation="1" result="effect1_foregroundBlur"></feGaussianBlur></filter></defs></svg>
						</div>
						<div data-ch-testid="badge"
							class="Badgestyled__Badge-ch-front__sc-1ztqq4-0 hsryEE LauncherIconstyled__Badge-ch-front__sc-mnslcf-2 jZtAtV">6</div>
					</div>
				</div>
			</div>
		</div>
		<div id="ch-plugin-script" style="display: none">
			<iframe id="ch-plugin-script-iframe"
				style="position: relative !important; height: 100%; width: 100% !important; border: none !important;"></iframe>
		</div>
	</div>
	<style data-styled="active" data-styled-version="5.1.1"></style>
</body>
</html>