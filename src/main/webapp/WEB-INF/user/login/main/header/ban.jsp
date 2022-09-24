<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="/myweb/login/main/header/js/ban.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/header/css/ban.css">
<head>
<meta charset="UTF-8">
<title>ban</title>
</head>
<body>
<div class="grid_2 ban">
			<div class="banner">
				<div class="wishlist">
					<div class="jjim_text">찜한 상품</div>
					<div class="jjim_heart">
					<c:if test="${user.user_seq == null}">
						<a href="#" class="jjimBtn"><img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/noJjim.png" width="9" height="9"><span style="color:#c8c8c8;"> 0 </span></a>
					</c:if>
					
					<c:if test="${user.user_seq != null }">
						<a href="favorite.do?user_seq=${user.user_seq }" class="jjimBtn"><img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/jjim.png" width="9" height="9"><span>${jjimCart}</span></a>
					</c:if>
					</div>
				</div>
				<div class="recent">
					최근본상품<br> ........<br> <span class="recent_product">최근
						본 상품<br>이<br> 없습니다.
						<button onclick="location.href='evaluationView.do?user_seq=${user.user_seq}'">임시</button>
					</span>
				</div>
				<div class="top" style="cursor: pointer">
					<div class="top_btn">TOP</div>
				</div>
			</div>


		</div>
		
		<script type="text/javascript">
		
		
		</script>
</body>
</html>