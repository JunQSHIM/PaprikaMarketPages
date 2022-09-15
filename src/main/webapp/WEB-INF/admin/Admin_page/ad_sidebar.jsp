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
					<li class="nav-item"><a href="#"
						class="nav-link"> <i
							class="nav-icon fas fa-address-card"></i>
							<p>
								회원 관리 <i class="fas fa-angle-left right"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="/Admin_page/member/ad_memlist.jsp"
								class="nav-link"> <i
									class="nav-icon fas fa-address-card"></i>
									<p>회원목록</p>
							</a></li>
							<li class="nav-item"><a href="/Admin_page/member/ad_blacklist.jsp"
								class="nav-link"> <i class="nav-icon fas fa-address-card"></i>
									<p>블랙리스트</p>
							</a></li>
							<li class="nav-item"><a href="#"
								class="nav-link"> <i class="nav-icon fas fa-address-card"></i>
									<p>신고</p>
							</a></li>
							<li class="nav-item"><a href="#"
								class="nav-link"> <i class="nav-icon fas fa-address-card"></i>
									<p>신고 내용</p>
							</a></li>

						</ul></li>

					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-copy"></i>
							<p>
								콘텐츠 관리 <i class="fas fa-angle-left right"></i> <span
									class="badge badge-info right">6</span>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="nav-icon fas fa-tree"></i>
									<p>
										상품<i class="fas fa-angle-left right"></i>
									</p>
							</a>
								<ul class="nav nav-treeview">
									<li class="nav-item"><a href="pages/UI/general.html"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>상품목록</p>
									</a></li>
									<li class="nav-item"><a href="pages/UI/icons.html"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>상품 수정 및 삭제</p>
									</a></li>
									<li class="nav-item"><a href="pages/UI/buttons.html"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>후기관리</p>
									</a></li>
									<li class="nav-item"><a href="pages/UI/sliders.html"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>후기 수정 및 삭제</p>
									</a></li>

								</ul></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="nav-icon fas fa-tree"></i>
									<p>
										게시판<i class="fas fa-angle-left right"></i>
									</p>
							</a>
								<ul class="nav nav-treeview">
									<li class="nav-item"><a href="pages/UI/general.html"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>게시판 목록</p>
									</a></li>
									<li class="nav-item"><a href="pages/UI/icons.html"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>공지 사항 쓰기</p>
									</a></li>
									<li class="nav-item"><a href="pages/UI/buttons.html"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>글, 댓글 관리</p>
									</a></li>


								</ul></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-chart-pie"></i>
							<p>
								페이지 관리<i class="right fas fa-angle-left"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="pages/charts/chartjs.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>배너 이미지 변경</p>
							</a></li>
							<li class="nav-item"><a href="pages/charts/flot.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>로고 변경</p>
							</a></li>

						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-tree"></i>
							<p>
								통계 <i class="fas fa-angle-left right"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="pages/UI/general.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>탈퇴 사유</p>
							</a></li>
							<li class="nav-item"><a href="pages/UI/icons.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>인기상품</p>
							</a></li>
							<li class="nav-item"><a href="pages/UI/buttons.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>가입자수를 기간별로 필터링</p>
							</a></li>
							<li class="nav-item"><a href="pages/UI/sliders.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>상품 거래된 수 지역별 필터링</p>
							</a></li>
							<li class="nav-item"><a href="pages/UI/modals.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>주된 신고 사유</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-edit"></i>
							<p>
								관리자 업무 <i class="fas fa-angle-left right"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="pages/forms/general.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>관리자 권한 위임 및 해임</p>
							</a></li>
							<li class="nav-item"><a href="pages/forms/advanced.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>관리자 목록</p>
							</a></li>
							<li class="nav-item"><a href="pages/forms/editors.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>QnA</p>
							</a></li>
							<li class="nav-item"><a href="pages/forms/editors.html"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>파프리카페이</p>
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