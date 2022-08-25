<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/myweb/Admin_page/admin_banner/css/post_banner.css">
</head>
<body>
	<header class="top_header" id="header">
		<div class="headerbar">
			<div class="headerbar-left">
				<ul class="header-nav header-nav-options">
					<li class="header-nav-brand">
						<div class="brand-holder">
							<span class="location_text"> 배너 관리</span>
						</div>
					</li>
				</ul>
			</div>

			<div class="headerbar-right">
				<ul class="header-nav header-nav-options _option_list">
					<li><a class="btn btn-default-bright hidden-xs"
						id="site_confirm" href="/" target="_blank">사이트 확인하기</a> <a
						class="btn btn-bright hidden-sm hidden-md hidden-lg"
						style="padding: 4px 6px;" href="/" target="_blank"><i
							class="btl bt-external-link vertical-middle"></i></a></li>
					<li><a class="btn btn-primary hidden-xs"
						onclick="location.href='/myweb/Admin_page/admin_banner/register_banner.jsp'">배너
							추가</a> <a class="btn btn-bright hidden-sm hidden-md hidden-lg"
						style="padding: 4px 6px;"
						onclick="location.href='/admin/config/popup/?mode=add'"><i
							class="btl bt-plus vertical-middle"></i></a></li>
				</ul>
				<!--end .header-nav-options -->
			</div>
			<!--끝 #header-navbar-collapse -->

			<!--끝 #header-navbar-collapse -->
		</div>

	</header>
	<div id="content">
		<div id="alertBox" class="alert__wrap"></div>
		<section>
			<div class="section-body">
				<div class="row" id="popup_list">
					<div class="ma-item col-md-3 col-sm-6 col-xs-12">
						<div class="card">
							<div class="card-head">
								<header>
									<a href="?idx=128091&amp;mode=add">아이유</a>
								</header>
								<div class="tools">
									<div class="btn-group">
										<div class="btn-group">
											<a href="#" class="btn btn-icon-toggle dropdown-toggle"
												data-toggle="dropdown"><i class="zmdi zmdi-more"></i></a>
											<ul
												class="dropdown-menu animation-dock pull-right menu-card-styling"
												role="menu" style="text-align: left;">
												<li><a href="/myweb/Admin_page/admin_banner/register_banner.jsp">수정</a></li>
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
							<div class="card-body">
								<p>내용 : 아이유를 좋아합니다.</p>
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