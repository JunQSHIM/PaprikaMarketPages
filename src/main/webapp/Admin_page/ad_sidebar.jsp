<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Main Sidebar Container -->
	<aside class="main-sidebar sidebar-light-orange elevation-4">
		<!-- Brand Logo -->
		<a href="ad_mother.jsp" class="brand-link  navbar-orange"> <img
			src="../login/images/paplogo.png" alt="paprikaLogo"
			class="brand-image" style="opacity: .8"> <span
			class="brand-text font-weight-light pap"><h5>파프리카 마켓</h5></span>
		</a>

		<div class="sidebar">
			<!-- Sidebar user panel (optional) -->
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">
				<div class="image">
					<img src="dist/img/usin.png" class="img-circle elevation-2"
						alt="User Image">
				</div>
				<div class="info">
					<a href="#" class="d-block ad_name">김유신</a>
				</div>
			</div>


			<!-- SidebarSearch Form -->
			<div class="form-inline">
				<div class="input-group" data-widget="sidebar-search">
					<input class="form-control form-control-sidebar" type="search"
						placeholder="Search" aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-sidebar">
							<i class="fas fa-search fa-fw"></i>
						</button>
					</div>
				</div>
			</div>


			<!-- Sidebar Menu -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column"
					data-widget="treeview" role="menu" data-accordion="false">
					<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
					<li class="nav-item menu-open"><a href="#"
						class="nav-link active"> <i
							class="nav-icon fas fa-address-card"></i>
							<p>
								회원 관리 <i class="fas fa-angle-left right"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="ad_memlist.jsp"
								class="nav-link active"> <i
									class="nav-icon fas fa-address-card"></i>
									<p>회원목록</p>
							</a></li>

						</ul></li>

					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-copy"></i>
							<p>
								페이지 관리 <i class="fas fa-angle-left right"></i> <span
									class="badge badge-info right">6</span>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="pages/layout/top-nav.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>페이지 관리</p>
							</a></li>

						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-chart-pie"></i>
							<p>
								구매 관리 <i class="right fas fa-angle-left"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="pages/charts/chartjs.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>상품관리(카테고리 연동)</p>
							</a></li>
							<li class="nav-item"><a href="pages/charts/flot.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>연동 상품관리</p>
							</a></li>
							<li class="nav-item"><a href="pages/charts/inline.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>구매평 관리</p>
							</a></li>
							<li class="nav-item"><a href="pages/charts/uplot.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>적립금 관리</p>
							</a></li>
							<li class="nav-item"><a href="pages/charts/uplot.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>쿠폰</p>
							</a></li>
							<li class="nav-item"><a href="pages/charts/uplot.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>네이버/카카오</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-tree"></i>
							<p>
								콘텐츠 관리 <i class="fas fa-angle-left right"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="pages/UI/general.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>게시물 관리</p>
							</a></li>
							<li class="nav-item"><a href="pages/UI/icons.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>댓글 관리</p>
							</a></li>
							<li class="nav-item"><a href="pages/UI/buttons.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>입력폼 관리</p>
							</a></li>
							<li class="nav-item"><a href="pages/UI/sliders.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>상단 메뉴 관리</p>
							</a></li>
							<li class="nav-item"><a href="pages/UI/modals.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>푸터 관리</p>
							</a></li>
							<li class="nav-item"><a href="pages/UI/navbar.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>지도 관리</p>
							</a></li>
							<li class="nav-item"><a href="pages/UI/timeline.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>일정 관리</p>
							</a></li>
							<li class="nav-item"><a href="pages/UI/ribbons.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>이미지 관리</p>
							</a></li>
							<li class="nav-item"><a href="pages/UI/ribbons.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>신고 관리</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-edit"></i>
							<p>
								통계 <i class="fas fa-angle-left right"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="pages/forms/general.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>개요</p>
							</a></li>
							<li class="nav-item"><a href="pages/forms/advanced.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>기간별 분석</p>
							</a></li>
							<li class="nav-item"><a href="pages/forms/editors.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>방문자 통계(일간, 주별, 월별)</p>
							</a></li>
							<li class="nav-item"><a href="pages/forms/validation.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>많이 구매한 상품(카테고리?)</p>
							</a></li>
							<li class="nav-item"><a href="pages/forms/validation.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>많이 방문한 페이지</p>
							</a></li>
							<li class="nav-item"><a href="pages/forms/validation.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>트래픽</p>
							</a></li>
						</ul></li>

				</ul>
			</nav>
			<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
	</aside>
</body>
</html>