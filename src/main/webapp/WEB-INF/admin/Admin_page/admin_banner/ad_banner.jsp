<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							배너 관리</span>
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
					<a class="btn btn-primary hidden-xs" onclick="location.href='addbanner.mdo'">배너 추가</a>
					<a class="btn btn-bright hidden-sm hidden-md hidden-lg" style="padding: 4px 6px;" onclick="location.href='/admin/config/popup/?mode=add'"><i class="btl bt-plus vertical-middle"></i></a>
				</li>
			</ul><!--end .header-nav-options -->
		</div><!--끝 #header-navbar-collapse -->

		<!--끝 #header-navbar-collapse -->
	</div>
	
	

</header>
<div id="content"><div id="alertBox" class="alert__wrap"></div>
	<section>
		<div class="section-body">
				<c:choose>
					<c:when test="${not empty banner }">
								
						<div class="row" id="popup_list">
							<c:forEach items="${banner }" var="banner">
							<div class="card">
								<div class="card-head">
									<div class="banner-title">
											<p>${banner.title }</p>
									</div>	
									<div class="banner-content">
											<p>${banner.content }</p>
									</div>	
									<div class="tools">
										<div class="btn-group">
											<div class="btn-group">
												<a href="#" class="btn btn-icon-toggle dropdown-toggle"
													data-toggle="dropdown"><i class="zmdi zmdi-more"></i></a>
												<ul	class="dropdown-menu animation-dock pull-right menu-card-styling" role="menu" style="text-align: left;">
													<li class="divider"></li>
													<li><a href="deletebanner.mdo?banner_seq=${banner.banner_seq }">삭제</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<img src="${banner.saved_file_name }" style="width: 100%">
							<div>
							</div>
							</div>
							<form action="addbanner.mdo" id="banner" method="post">
								<input type="hidden" name="banner_seq" value="${banner.banner_seq }">
								<input type="hidden" name="title" value="${banner.title }">
								<input type="hidden" name="content" value="${banner.content }">
								<input type="hidden" name="saved_file_name" value="${banner.saved_file_name }">
							</form>
						</c:forEach>
					</div>
					</c:when>
					<c:otherwise>	<!-- 검색 결과가 없거나 빈상태일 때 -->
						<div class="force-padding text-gray-bright text-center" style="padding-bottom:84px">
						<div class="text-xxxl">
							<i class="zmdi zmdi-info"></i>
						</div>
						<div class="text-lg" style="padding-bottom: 10px;">등록된 배너가 없습니다.<br>
						</div>
							<a class="btn btn-primary" onclick="location.href='addbanner.mdo'">배너 추가</a>
						</div>
					</c:otherwise>
				</c:choose>
		</div>
	</section>
	<!--섹션 끝 -->
</div>

    
</body>
</html>