<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product detail</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/ctProduct.css">
<link rel="stylesheet" type="text/css" href="../css/product_detail.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>

	<%@include file="../parts/mothertop.jsp"%>


	<div id="productPage">
			<div id="productList">
			홈 > 
			<select onchange="if(this.value) location.href=(this.value);">
				<option selected disabled>카테고리</option>
				<option value="product.jsp?product=디지털기기">디지털기기</option>
				<option value="product.jsp?product=생활가전">생활가전</option>
				<option value="product.jsp?product=가구/인테리어">가구/인테리어</option>
				<option value="product.jsp?product=유아동">유아동</option>
				<option value="product.jsp?product=유아도서">유아도서</option>
				<option value="product.jsp?product=생활/가공식품">생활/가공식품</option>
				<option value="product.jsp?product=스포츠/레저">스포츠/레저</option>
				<option value="product.jsp?product=여성잡화">여성잡화</option>
				<option value="product.jsp?product=여성의류">여성의류</option>
				<option value="product.jsp?product=남성패션/잡화">남성패션/잡화</option>
				<option value="product.jsp?product=게임/취미">게임/취미</option>
				<option value="product.jsp?product=뷰티/미용">뷰티/미용</option>
				<option value="product.jsp?product=반려동물용품">반려동물용품</option>
				<option value="product.jsp?product=도서/티켓/음반">도서/티켓/음반</option>
				<option value="product.jsp?product=식물">식물</option>
				<option value="product.jsp?product=기타 중고물품">기타 중고물품</option>
				<option value="product.jsp?product=삽니다">삽니다</option>
			</select>
			</div>
			<div class="container1">
				<div class="item" id="picture" onclick = "zoom()">
					<img src="../images/camera.png" id="image">
					<button>+확대</button>
				</div>
				<div class="container2">
					<div class="item" id="detail">
						<div id="title">디지털 카메라<br>100000원<br></div>
						<hr style="border: 0.3px solid lightgray;">
					</div>
					<div class="item">
					<button>♥36</button> | <button>⊙70</button> | <button>⏲5일전</button> | <button>신고하기</button><br>
						<div id="info">
							<ul>
								<li>상품상태</li>
								<li>교환여부</li>
								<li>배송비</li>
								<li>거래지역</li>
							</ul>
						</div>
					</div>
					<div class="item">
						<div id="info_ans">
							<ul>
								<li>중고</li>
								<li>교환불가능</li>
								<li>배송비포함</li>
								<li>전국</li>
							</ul>
						</div>
					</div>
					<div class="item" id="func">
						<button id="jjim" type="button">찜</button>
						<button>연락하기</button>
						<button onclick="requestPay()">바로구매</button>
					</div>
					<div><img id="status"></div>
				</div>
				<div class="item2">
					연관상품
					<div id="rt_product">
    					<div class="slider">
    					<div><img src="../images/1.png" title="1st"></div>
    					<div><img src="../images/2.png" title="2nd"></div>
    					<div><img src="../images/3.png" title="3rd"></div>
    					<div><img src="../images/4.png" title="4th"></div>
    					<div><img src="../images/5.png" title="5th"></div>
    					<div><img src="../images/5.png" title="1st"></div>
    					<div><img src="../images/4.png" title="1st"></div>
    					<div><img src="../images/3.png" title="1st"></div>
    					<div><img src="../images/2.png" title="1st"></div>
    					<div><img src="../images/1.png" title="1st"></div>
						</div>
				</div>
				<hr style="border:2px solid gray;">
				<div class="container3">
					<div class="container2">
						<div class="item" id="product_info">상품정보<hr style="border:1px solid gray;">
							<div id="product_desc">
								소니가 1985년에 발매한 최초의 핸디캠 캠코더입니다.
								SONY CCD-M8로 구글에 치면 자세한 정보가 나옵니다.
								80년대 일본을 상징하는 물건이기도 합니다.
								희소가치가 워크맨 급입니다.
								워크맨처럼 각이 져있다는점이 특징입니다.
								오래되었기때문에 소품용, 수집용으로 권장합니다.
								배터리는 방전되었기에 작동여부를 알수 없습니다.
								관심있으신분은 문자주세요.<br>
								제조: 1985, 일본
							</div>
						</div>
					</div>
					<div class="container4">
						<div class="item">상점정보<hr style="border:1px solid gray;">
							<div id="profile_pic">
								<img src="../images/dklogo.png">
							</div>
							<div id="nickname">
								생각하는 연못
							</div>
							<div id="follow">
								<button>팔로우</button>
								<button onclick="location.href='myProductCart.jsp'">상점가기</button>
							</div>
							<div id="rt_img">
								<div class="slider2">
    								<div><img src="../images/test1.png" title="1st"></div>
    								<div><img src="../images/test2.png" title="2nd"></div>
    								<div><img src="../images/test3.png" title="3rd"></div>    								
    								<div><img src="../images/test4.png" title="4th"></div>
    								<div><img src="../images/test5.png" title="5th"></div>    								    								
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
		</div>


	<%@include file="../parts/motherbottom.jsp"%>
</body>
</html>