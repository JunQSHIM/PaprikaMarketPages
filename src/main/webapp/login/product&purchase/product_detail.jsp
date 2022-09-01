<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/myweb/login/main/main.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="/myweb/login/product&purchase/ctProduct.css">
<link rel="stylesheet" type="text/css"
	href="/myweb/login/product&purchase/product_detail.css">
<link rel="stylesheet" type="text/css"
	href="/myweb/login/singo/modal.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main Page</title>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String p = request.getParameter("product");
%>
<script>
	function ctProduct(){
		theForm.submit();
	}
	$(document).ready(function(){
		$("#showCategory").mouseenter(function(){
			$("#result1").show();
		});
		$("#category").mouseleave(function(){
			$("#result1").hide();
		});
		
		$("#top").click(function() {
			//$('html, body').animate({scrollTop:0}, '1000');
			$('html, body').scrollTop(0);
		});
		
	});
	$(document).ready(function(){
		$('.slider').bxSlider({
		        auto: true, 
		        mode:'horizontal',
		        minSlides: 1,
		        maxSlides: 7,
		        slideWidth: 155,
		        slideMargin: 0,
		        captions:true
	    });
		$('.slider2').bxSlider({
	        auto: true, 
	        mode:'horizontal',
	        minSlides: 1,
	        maxSlides: 2,
	        slideWidth: 130,
	        slideMargin: 5,
	        captions:true
   		 });
	});
	function login()  {
		 window.location.href ='/myweb/login/login&register/login.jsp';
	}	
	function register()  {
		 window.location.href ='/myweb/login/login&register/registerAgree.jsp';
	}
	function main(){
		window.location.href = '/myweb/login/main/mother.jsp';
	}
	function mypage(){
		window.location.href = '/myweb/login/mypage/mypage.jsp';
	}
	function zoom(){
		$("#picture").style.width = "800px";
	}
	function zoom(url){
		var image = document.getElementById("image");
		var source = image.src;
	    window.open(source,'new','width=800, height=600, scrollbars=yes');
	}
	$(function () {
		let num = 0;
		let imageName = ["check.png", "uncheck.png"];
		$("#jjim").click(function() {
			if(num == 1){
				$("#status").attr("src","/myweb/login/images/"+ imageName[num]);
				$("#status").fadeIn(1200);
				$("#status").fadeOut(2000);
				$("#jjim").html('찜');
				num=0;
			}else{
				$("#status").attr("src","/myweb/login/images/"+ imageName[num]);
				$("#status").fadeIn(1200);
				$("#status").fadeOut(2000);
				$("#jjim").html('♥찜');
				num++;	
			}
		});
	});
	/** 결제 **/
    // 결제 금액, 구매자의 이름, 이메일
    const priceAmount = "100000";
    const buyerMemberEmail = "uusin@gmail.com";
    const buyerMemberName = "김유신(부산)";
    // const form = document.getElementById("payment");

    console.log(priceAmount);
    console.log(buyerMemberName);
    console.log(buyerMemberEmail);
    const IMP = window.IMP;
    IMP.init('imp62063820');

    function requestPay() {
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: 'cart_' + new Date().getTime(),
            name: "자석펫",
            amount: priceAmount,
            buyer_email: buyerMemberEmail,
            buyer_name: buyerMemberName,

        }, function (rsp) { // callback

            /** 결제 검증 **/
            $.ajax({
                type: 'POST',
                url: '/verifyIamport/'+rsp.imp_uid,
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token);
                }
            }).done(function(result){
                // rsp.paid_amount와 result.response.amount(서버 검증) 비교 후 로직 실행
                if(rsp.paid_amount === result.response.amount){
                    alert("결제가 완료되었습니다.");
                    $.ajax({
                        type:'POST',
                        url:'/lecture/payment',
                        beforeSend: function(xhr){
                            xhr.setRequestHeader(header, token);
                        }
                    }).done(function() {
                        window.location.reload();
                    }).fail(function(error){
                            alert(JSON.stringify(error));
                    })
                } else{
                    alert("결제에 실패했습니다."+"에러코드 : "+rsp.error_code+"에러 메시지 : "+rsp.error_message);

                }
            })
        });
    };
</script>

</head>
<body>
	<header>
		<jsp:include page="/login/main/header/header.jsp"></jsp:include>
	</header>
	<article class="container_12">
		<jsp:include page="/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">
		<div id="row productPage">
			<div id="grid_12 homecate">
				홈 > <select onchange="if(this.value) location.href=(this.value);">
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
				<div class="grid_6 item" id="picture" onclick="zoom()">
					<img src="/myweb/login/images/camera.png" id="image">
					<button>+확대</button>
				</div>
				<div class="grid_6 prod_info">
					<div class="clear"></div>
					<div class="item" id="detail">
						<div id="title">
							디지털 카메라<br>100000원<br>
						</div>
						<hr style="border: 0.3px solid orange;">
					</div>
					<div class="item">
						<button>♥36</button>
						|
						<button>⊙70</button>
						|
						<button>⏲5일전</button>
						|
						<button class="openBtn">신고하기</button>
						<br>
					</div>
					<div class="grid_2" id="info">
						<ul>
							<li>상품상태</li>
							<li>교환여부</li>
							<li>배송비</li>
							<li>거래지역</li>
						</ul>
					</div>
					<div class="grid_3" id="info_ans">
						<ul>
							<li>중고</li>
							<li>교환불가능</li>
							<li>배송비포함</li>
							<li>전국</li>
						</ul>
					</div>

					<div class="item_btn" id="func">
						<button id="jjim" type="button">찜</button>
						<button>연락하기</button>
						<button onclick="requestPay()">바로구매</button>
					</div>
					<div>
						<img id="status">
					</div>
				</div>
				<div class="clear"></div>
				<div class="grid_12 item2">
					연관상품
					<div id="grid_12 rt_product">
						<div class="slider">
							<div>
								<img src="/myweb/login/images/1.png" title="1st">
							</div>
							<div>
								<img src="/myweb/login/images/2.png" title="2nd">
							</div>
							<div>
								<img src="/myweb/login/images/3.png" title="3rd">
							</div>
							<div>
								<img src="/myweb/login/images/4.png" title="4th">
							</div>
							<div>
								<img src="/myweb/login/images/5.png" title="5th">
							</div>
							<div>
								<img src="/myweb/login/images/5.png" title="1st">
							</div>
							<div>
								<img src="/myweb/login/images/4.png" title="1st">
							</div>
							<div>
								<img src="/myweb/login/images/3.png" title="1st">
							</div>
							<div>
								<img src="/myweb/login/images/2.png" title="1st">
							</div>
							<div>
								<img src="/myweb/login/images/1.png" title="1st">
							</div>
						</div>
					</div>
					<hr style="border: 1px solid orange;">
					<div class="row grid_12">
						<div class="grid_8">
							<div class="item" id="product_info">
								상품정보
								<hr style="border: 1px solid orange;">
								<div id="grid_8 product_desc">
									소니가 1985년에 발매한 최초의 핸디캠 캠코더입니다. SONY CCD-M8로 구글에 치면 자세한 정보가
									나옵니다. 80년대 일본을 상징하는 물건이기도 합니다. 희소가치가 워크맨 급입니다. 워크맨처럼 각이 져있다는점이
									특징입니다. 오래되었기때문에 소품용, 수집용으로 권장합니다. 배터리는 방전되었기에 작동여부를 알수 없습니다.
									관심있으신분은 문자주세요.<br> 제조: 1985, 일본
								</div>
							</div>
						</div>
						<div class="grid_3 market_info">
							<div class="item">
								상점정보
								<hr style="border: 1px solid orange;">
								<div id="profile_pic">
									<img src="/myweb/login/images/dklogo.png">
								</div>
								<div id="nickname">생각하는 연못</div>
								<div id="follow">
									<button>팔로우</button>
									<button onclick="location.href='myProductCart.jsp'">상점가기</button>
								</div>
								<div id="rt_img">
									<div class="slider2">
										<div>
											<img src="/myweb/login/images/test1.png" title="1st">
										</div>
										<div>
											<img src="/myweb/login/images/test2.png" title="2nd">
										</div>
										<div>
											<img src="/myweb/login/images/test3.png" title="3rd">
										</div>
										<div>
											<img src="/myweb/login/images/test4.png" title="4th">
										</div>
										<div>
											<img src="/myweb/login/images/test5.png" title="5th">
										</div>
									</div>
								</div>
								<div class="item">
									후기
									<hr style="border: 1px solid orange;">
									<div class="review_container">
										sook315 ★★★★★
										<div style="background-color: rgb(0, 0, 0, 0.08)">큘거래
											감사합니다 유용하게 잘 쓰겠습니다</div>
									</div>
									<hr style="border: 1px solid rgb(0, 0, 0, 0.07);">
									<div class="review_container">
										상점921호 ★★★★☆
										<div style="background-color: rgb(0, 0, 0, 0.08)">어차피
											수십년전 제품들이라 재생만이라도 잘 되면 좋은데 재생잘되요</div>
									</div>
									<div id="more_reivews">
										<button>후기더보기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/login/singo/singo.jsp"%>
	</article>
	<div style="margin-bottom: 40px;"></div>
	<footer class="container_12">
		<jsp:include page="/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
<script>
  const open = () => {
    document.querySelector(".modal").classList.remove("hidden");
  }

  const close = () => {
    document.querySelector(".modal").classList.add("hidden");
  }

  document.querySelector(".openBtn").addEventListener("click", open);
  document.querySelector(".closeBtn").addEventListener("click", close);
  document.querySelector(".bg").addEventListener("click", close);

</script>

</html>