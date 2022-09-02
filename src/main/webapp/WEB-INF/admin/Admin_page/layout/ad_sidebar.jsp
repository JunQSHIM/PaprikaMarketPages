<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-light-orange elevation-4">
	<!-- Brand Logo -->
	<a href="main.mdo" class="brand-link  navbar-white" style="background:orange"> 
		<span class="brand-text font-weight-light pap">
			<h4 style="color:white; margin-top:5px; margin-left:30px;"><b>파 프 리 카 마 켓</b></h4>
		</span>
	</a>

	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="/myweb/Admin_page/dist/img/usin.png"
					class="img-circle elevation-2" alt="User Image">
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
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fa-solid fa-user-gear"></i>
						<p>
							회원 관리 <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">


						<li class="nav-item"><a
							href="sms.mdo"
							class="nav-link"> <i
								class="nav-icon fa-solid fa-address-book"></i>
								<p>SMS</p>
						</a></li>

						<li class="nav-item"><a
							href="user.mdo" class="nav-link">
								<i class="nav-icon fa-solid fa-address-book"></i>
								<p>회원 관리</p>
						</a></li>

					</ul></li>

				<li class="nav-item"><a
					href="singo.mdo" class="nav-link">
						<i class="nav-icon fa-solid fa-circle-exclamation"></i>
						<p>신고 관리</p>
				</a></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-copy"></i>
						<p>
							콘텐츠 관리<i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a
							href="/myweb/Admin_page/member/ad_prods.jsp" class="nav-link">
								<i class="nav-icon fas fa-tree"></i>
								<p>상품 / 후기</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-tree"></i>
								<p>
									게시판<i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="/myweb/Admin_page/admin_page_board/article_manage.jsp"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>게시물 관리</p>
								</a></li>
								<li class="nav-item"><a
								href="/myweb/Admin_page/admin_page_board/comment_manage.jsp"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>댓글 관리</p>
								</a></li>
								<li class="nav-item"><a href="pages/UI/icons.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>공지 사항 쓰기</p>
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
						<li class="nav-item"><a
							href="/myweb/Admin_page/admin_banner/admin_banner.jsp"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>배너 이미지 변경</p>
						</a></li>
						<li class="nav-item"><a
							href="/myweb/Admin_page/pages/charts/flot.html" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>로고 변경</p>
						</a></li>

					</ul></li>
				<li class="nav-item"><a href="/myweb/Admin_page/chart/chart.jsp" class="nav-link"> <i
						class="nav-icon fas fa-tree"></i>
							통계
				</a>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-edit"></i>
						<p>
							관리자 등록 <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a
							href="/myweb/Admin_page/admin_list/admin_list.jsp"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>관리자 목록</p>
						</a></li>
						<li class="nav-item"><a
							href="/myweb/Admin_page/admin_list/admin_authority.jsp"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>관리자 권한 위임 및 해임</p>
						</a></li>
						<li class="nav-item"><a
							href="/myweb/Admin_page/admin_list/qna.jsp" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>QnA</p>
						</a></li>

					</ul></li>

			</ul>
		</nav>
	</div>
</aside>