<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/Admin_page/admin_banner/css/register_banner.css">

</head>
<body>
		<form action="addbannerProc.mdo" id="bannerForm"  method="post" enctype="multipart/form-data">
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
							onclick="history.go(-1);" id="site_confirm">취소</a></li>
		<li><a class="btn btn-primary" onclick="document.getElementById('bannerForm').submit()">저장</a></li>
		</ul>
		<!--end .header-nav-options -->
		</div>
		<!--끝 #header-navbar-collapse -->
		
		<!--끝 #header-navbar-collapse -->
					</div>
				</header>
				
				<div id="root">
		  <h2 class="title">배너 업로드</h2>
		  <hr>
		  
		  <div class="contents">
		  <div class="content-header">
		 	<div class="banner-title">
		 		<div>제목</div>
		 		<div><input name="title" type="text"></div>
		 	</div>
		   	<div class="banner-discription">
		   		<div>설명</div>
		   		<div class="banner-content"><textarea name="content"></textarea></div>
		   	</div>
		  </div>
		  <div class="upload-box">
		      <div id="drop-file" class="drag-file">
		        <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" >
		        <p class="message">이미지를 여기로 드래그</p>
		        <img src="" alt="미리보기 이미지" class="preview">
		      </div>
		      <label class="file-label" for="chooseFile">이미지 업로드</label>
		      <input class="file" name="chooseFile" id="chooseFile" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif">
		  </div>
		  </div>
		</div>
		<script type="text/javascript" src="/myweb/Admin_page/admin_banner/register_banner.js"></script>
		</form>

</body>
</html>