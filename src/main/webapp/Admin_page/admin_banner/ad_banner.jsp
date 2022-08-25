<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/Admin_page/admin_banner/css/admin_banner.css">
</head>
<body>
<header class="top_header" id="header">
	<div class="headerbar">
		<div class="headerbar-left">
			<ul class="header-nav header-nav-options">
				<li class="header-nav-brand">
					<div class="brand-holder">
						<span class="location_text">
							<a href="/admin/config/popup">팝업/배너 관리</a></span>
					</div>
				</li>
			</ul>
		</div>

		<div class="headerbar-right">
			<ul class="header-nav header-nav-options _option_list">
				<li>
					<a class="btn btn-default-bright hidden-xs" id="site_confirm" href="/" target="_blank">사이트 확인하기</a>
					<a class="btn btn-bright hidden-sm hidden-md hidden-lg" style="padding: 4px 6px;" href="/" target="_blank"><i class="btl bt-external-link vertical-middle"></i></a>
				</li>
				<li>
											<a class="btn btn-primary hidden-xs" onclick="location.href='/myweb/Admin_page/admin_banner/register_banner.jsp'">팝업 추가</a>
										<a class="btn btn-bright hidden-sm hidden-md hidden-lg" style="padding: 4px 6px;" onclick="location.href='/admin/config/popup/?mode=add'"><i class="btl bt-plus vertical-middle"></i></a>
				</li>
			</ul><!--end .header-nav-options -->
		</div><!--끝 #header-navbar-collapse -->

		<!--끝 #header-navbar-collapse -->
	</div>
	
	

</header>
<div id="content"><div id="alertBox" class="alert__wrap">    </div>
	<section>
		<div class="section-body">
							<!-- 검색 결과가 없거나 빈상태일 때 -->
				<div class="force-padding text-gray-bright text-center" style="padding-bottom:84px">
					<div class="text-xxxl">
						<i class="zmdi zmdi-info"></i>
					</div>
					<div class="text-lg" style="padding-bottom: 10px;">등록된 팝업/배너가 없습니다.<br>내 사이트에 중요한 소식을 알리고 싶으면 등록해 주세요.<br>
					</div>
											<a class="btn btn-primary" onclick="location.href='/myweb/Admin_page/admin_banner/register_banner.jsp'">팝업 추가</a>
									</div>
				<!-- end.빈상태 -->
					</div>
	</section>
	<!--섹션 끝 -->
</div>
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            const alertBox = document.querySelector('#alertBox');
            const contentArea = document.querySelector('#content');
    
            alertBox.classList.remove('alert__wrap-fixed');
            alertBox.classList.add('alert__wrap');
            contentArea.prepend(alertBox);
        });
    </script>
</body>
</html>