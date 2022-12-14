<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/myweb/login/main/main.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/product&purchase/ctProduct.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/product&purchase/product_detail.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/singo/modal.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main Page</title>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String p = request.getParameter("product");
%>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/user/login/main/header/header.jsp"></jsp:include>
	</header>
	<article class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">
			<div id="productPage">
			<div id="productList">
				홈 > 
				<select onchange="if(this.value) location.href=(this.value);">
					<option selected disabled>카테고리</option>
					<option value="mother.jsp?product=디지털기기">디지털기기</option>
					<option value="mother.jsp?product=생활가전">생활가전</option>
					<option value="mother.jsp?product=가구/인테리어">가구/인테리어</option>
					<option value="mother.jsp?product=유아동">유아동</option>
					<option value="mother.jsp?product=유아도서">유아도서</option>
					<option value="mother.jsp?product=생활/가공식품">생활/가공식품</option>
					<option value="mother.jsp?product=스포츠/레저">스포츠/레저</option>
					<option value="mother.jsp?product=여성잡화">여성잡화</option>
					<option value="mother.jsp?product=여성의류">여성의류</option>
					<option value="mother.jsp?product=남성패션/잡화">남성패션/잡화</option>
					<option value="mother.jsp?product=게임/취미">게임/취미</option>
					<option value="mother.jsp?product=뷰티/미용">뷰티/미용</option>
					<option value="mother.jsp?product=반려동물용품">반려동물용품</option>
					<option value="mother.jsp?product=도서/티켓/음반">도서/티켓/음반</option>
					<option value="mother.jsp?product=식물">식물</option>
					<option value="mother.jsp?product=기타 중고물품">기타 중고물품</option>
					<option value="mother.jsp?product=삽니다">삽니다</option>
				</select>
			</div>
			<div class="row grid_12">
				<div class="grid_4 item" id="picture">
					<img src="/myweb/login/images/camera.png" id="image">
					<button type="button" onclick = "zoom()">+확대</button>
				</div>
					<div class="grid_6 prod_info">
					<div class="item" id="detail" style="border-bottom: 1px solid rgb(238, 238, 238)">
						<div id="title">${post.post_title }</div>
						<div class="post_price"><div class="postPrice"><fmt:formatNumber value="${post.price }" pattern="###,###,###"/><span>원</span></div></div>
						
					</div>
					<div class="item">
 
					<div class="etc"><div class="etc_items"><img alt="상품 상태 아이콘" src="https://paprikaproject.s3.ap-northeast-2.amazonaws.com/main/heart.png" width="16" height="16">36</div><div class="etc_items"><img alt="상품 상태 아이콘" src="https://paprikaproject.s3.ap-northeast-2.amazonaws.com/main/eye.png" width="21" height="13">${post.cnt}</div><div class="etc_items"><img alt="상품 상태 아이콘" src="https://paprikaproject.s3.ap-northeast-2.amazonaws.com/main/clock.png" width="16" height="16">${post.upload_date}</div><div class="etc_items"><button class="openBtn">신고하기</button></div></div>
						<a href="postDelete.do?post_seq=${post.post_seq }" role="button">삭제</a>
						<br>
					</div>
					<br>
					<div class="item_btn" id="func">
						<span>구매가 완료된 상품입니다.</span>
					</div>
					</div>
				</div>
				<div class="clear"></div>
				<div class="grid_12 item2">
					연관상품
					<div id="rt_product">
    					<div class="slider">
    					<div><img src="/myweb/login/images/1.png" title="1st"></div>
    					<div><img src="/myweb/login/images/2.png" title="2nd"></div>
    					<div><img src="/myweb/login/images/3.png" title="3rd"></div>
    					<div><img src="/myweb/login/images/4.png" title="4th"></div>
    					<div><img src="/myweb/login/images/5.png" title="5th"></div>
    					<div><img src="/myweb/login/images/5.png" title="1st"></div>
    					<div><img src="/myweb/login/images/4.png" title="1st"></div>
    					<div><img src="/myweb/login/images/3.png" title="1st"></div>
    					<div><img src="/myweb/login/images/2.png" title="1st"></div>
    					<div><img src="/myweb/login/images/1.png" title="1st"></div>
						</div>
				</div>
				<hr style="border:1px solid gray;">
					<div class="row grid_12">
						<div class="grid_8">
							<div class="item" id="product_info">상품정보<hr style="border:1px solid gray;">
							<div id="product_desc">
								${post.post_content}
							</div>
						</div>
					</div>
					<div class="grid_3 market_info">
							<div class="item">상점정보<hr style="border:1px solid gray;">
							<div id="profile_pic">
								<img src="/myweb/login/images/dklogo.png">
							</div>
							<div id="nickname">
								${post.nickname}
							</div>
							<div id="follow">
								<button>팔로우</button>
								<button onclick="location.href='myProductCart.jsp'">상점가기</button>
							</div>
							<div id="rt_img">
								<div class="slider2">
    								<div><img src="/myweb/login/images/test1.png" title="1st"></div>
    								<div><img src="/myweb/login/images/test2.png" title="2nd"></div>
    								<div><img src="/myweb/login/images/test3.png" title="3rd"></div>    								
    								<div><img src="/myweb/login/images/test4.png" title="4th"></div>
    								<div><img src="/myweb/login/images/test5.png" title="5th"></div>    								    								
								</div>
						</div>
						<div class="item">후기<hr style="border:1px solid gray;">
							<div class="review_container">
								sook315 ★★★★★
								<div style="background-color: rgb(0,0,0,0.08)">큘거래 감사합니다 유용하게 잘 쓰겠습니다</div>
							</div>
								<hr style="border: 1px solid rgb(0,0,0,0.07);">
							<div class="review_container">
								상점921호 ★★★★☆
								<div style="background-color: rgb(0,0,0,0.08)">어차피 수십년전 제품들이라 재생만이라도 잘 되면 좋은데 재생잘되요</div>
							</div>
							<div id="more_reivews"><button>후기더보기</button></div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/user/login/singo/singo.jsp" %>
	</article>
	<div style="margin-bottom:40px;"></div>
	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>


<script type="text/javascript" src="/myweb/login/product&purchase/product_detail.js"></script>
</html>