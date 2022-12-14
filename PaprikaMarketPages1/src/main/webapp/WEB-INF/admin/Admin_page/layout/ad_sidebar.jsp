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
				<img src="${user.profile_image }"
					class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href="/myweb/mypage.do" class="d-block ad_name">${user.name }</a>
			</div>
			<div class="info">
				<a href="/myweb/logout.do">로그아웃</a>
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
							href="adminEmail.mdo"
							class="nav-link"> <i 
								class="nav-icon fa-solid fa-address-book"></i>
								<p>이메일 발송</p>
						</a></li>

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
							href="adminPostView.mdo" class="nav-link">
								<i class="nav-icon fas fa-tree"></i>
								<p>상품 목록</p>
						</a></li>
						<li class="nav-item"><a
							href="adminReview.mdo" class="nav-link">
								<i class="nav-icon fas fa-tree"></i>
								<p>후기 목록</p>
						</a></li>
						<li class="nav-item"><a href="board.mdo" class="nav-link"> <i
								class="nav-icon fas fa-tree"></i>
								<p>	게시판</p>
						</a>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-chart-pie"></i>
						<p>
							페이지 관리<i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="banner.mdo" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>배너 이미지 변경</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="admin_list.mdo?agreement_seq=1" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>약관 변경</p>
							</a>
						</li>
					</ul></li>
				<li class="nav-item"><a href="chart.mdo" class="nav-link"> <i
						class="nav-icon fas fa-tree"></i>
							통계
				</a>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-edit"></i>
						<p>
							관리자 업무 <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a
							href="adminList.mdo"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>관리자 목록</p>
						</a></li>
						<li class="nav-item"><a
							href="adminAuthority.mdo"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>관리자 권한 위임 및 해임</p>
						</a></li>
						<li class="nav-item"><a
							href="qna.mdo" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>QnA</p>
						</a></li>
						<li class="nav-item"><a
							href="oneOnAdminView.mdo" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>1:1문의</p>
						</a></li>
						<li class="nav-item"><a
							href="pay.mdo" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>파프리카페이</p>
						</a></li>
					</ul></li>

			</ul>
		</nav>
	</div>
</aside>