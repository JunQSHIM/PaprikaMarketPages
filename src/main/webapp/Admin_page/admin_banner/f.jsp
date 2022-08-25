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
	href="/myweb/Admin_page/admin_banner/css/post_banner.css">
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
	
</head>


<body class="menubar-hoverable header-fixed menubar-pin">
			
		<!-- BEGIN CONTENT-->
		<div id="content">
			<div id="alertBox" class="alert__wrap"></div>
			<section>
				<div class="section-body">
					<div class="row" id="popup_list">
						<div class="ma-item col-md-3 col-sm-6 col-xs-12">
							<div class="cards">
								<div class="cards-head">
									<header>
										<a href="?idx=128091&amp;mode=add"> fff</a> <span
											class="badge style-gray">중지</span>
									</header>
									<div class="tools">
										<div class="btn-group">
											<div class="btn-group">
												<a href="#" class="btn btn-icon-toggle dropdown-toggle"
													data-toggle="dropdown" aria-expanded="false"><i
													class="zmdi zmdi-more"></i></a>
												<ul
													class="dropdown-menu animation-dock pull-right menu-cards-styling"
													role="menu" style="text-align: left;">
													<li><a href="?idx=128091&amp;mode=add">수정</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;"
														onclick="CONFIG_POPUP.deletePopup('128091')">삭제</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<a href="?idx=128091&amp;mode=add"> <img class=""
									src="https://cdn.imweb.me/upload/S20220822a09cedc4f039d/e1ac67265b814.jpg"
									style="width: 100%"></a>
								<div class="cards-body">
									<p>기간: 2022-08-25 13:10 ~ 2022-08-25 13:10</p>
									<p>위치: 홈 화면</p>
									<p>
										대상: <i class="btl bt-desktop"></i>
									</p>
								</div>
							</div>
						</div>
						<div class="ma-item col-md-3 col-sm-6 col-xs-12">
							<div class="cards">
								<div class="cards-head">
									<header>
										<a href="?idx=128090&amp;mode=add"> fgfgf</a> <span
											class="badge style-gray">중지</span>
									</header>
									<div class="tools">
										<div class="btn-group">
											<div class="btn-group">
												<a href="#" class="btn btn-icon-toggle dropdown-toggle"
													data-toggle="dropdown"><i class="zmdi zmdi-more"></i></a>
												<ul
													class="dropdown-menu animation-dock pull-right menu-cards-styling"
													role="menu" style="text-align: left;">
													<li><a href="?idx=128090&amp;mode=add">수정</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;"
														onclick="CONFIG_POPUP.deletePopup('128090')">삭제</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<a href="?idx=128090&amp;mode=add"> <img class=""
									src="https://cdn.imweb.me/upload/S20220822a09cedc4f039d/3190d19dd2e9e.png"
									style="width: 100%"></a>
								<div class="cards-body">
									<p>기간: 2022-08-25 13:09 ~ 2022-08-25 13:09</p>
									<p>위치: 홈 화면</p>
									<p>
										대상: <i class="btl bt-desktop"></i>
									</p>
								</div>
							</div>
						</div>

					</div>
				</div>
			</section>
			<!--섹션 끝 -->
		</div>
				
</body>
</html>
</body>
</html>