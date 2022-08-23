<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head> 
<%
	request.setCharacterEncoding("UTF-8");
%>
=======
<!DOCTYPE html>
<html>
<head>
>>>>>>> JunQ
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | DataTables</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/fontawesome-free/css/all.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="/myweb/Admin_page/dist/css/adminlte.min.css">
<link rel="stylesheet" type="text/css" href="admins.css">
<link rel="stylesheet" href="qna_list.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function add(){
	window.location.href ='/myweb/Admin_page/admin_list/addQna.jsp';
}
function update(){
	 window.location.href ='/myweb/Admin_page/admin_list/editQna.jsp';
}
$(document).ready(function(){
<<<<<<< HEAD
	$(".flip").click(function() {
		$(".panel").slideToggle("slow");
	});
=======
	  $("#flip").click(function(){
	    $("#panel").slideToggle("slow");
	  });
	  $("#flip1").click(function(){
		    $("#panel1").slideToggle("slow");
	  });
	  $("#flip2").click(function(){
		    $("#panel2").slideToggle("slow");
	  });
	  $("#flip3").click(function(){
		    $("#panel3").slideToggle("slow");
	  });
	  $("#flip4").click(function(){
		    $("#panel4").slideToggle("slow");
	  });
	  $("#flip5").click(function(){
		    $("#panel5").slideToggle("slow");
	  });
>>>>>>> JunQ
	  $('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab'); 

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
	});
});
</script>
</head>
<body>
<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
<<<<<<< HEAD
						<h1>QnA</h1>
=======
						<h1>*nA</h1>
>>>>>>> JunQ
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<div style="float: right;">
									<button onclick="update()">수정</button>
									<button onclick="add()">추가</button>
								</div>
							</div>
							<div class="card-body">
								<ul class="tabs">
									<li class="tab-link" data-tab="tab-1"><b>운영정책</b></li>
									<li class="tab-link" data-tab="tab-2"><b>계정 / 인증</b></li>
									<li class="tab-link" data-tab="tab-3"><b>분쟁 및 이용제재</b></li>
									<li class="tab-link" data-tab="tab-4"><b>거래 및 환불 정책</b></li>
									<li class="tab-link" data-tab="tab-5"><b>판매 금지 물품</b></li>
									<li class="tab-link" data-tab="tab-6"><b>개인정보처리방침</b></li>
								</ul>
<<<<<<< HEAD


								<div id="tab-1" class="tab-content current">
									<div>
									
										<div class="flip">Q.운영정책</div>
										<div class="panel" style="display: none;">
											<div>서로 존중하고 배려해요.</div>
											<div>존댓말로 솔직하게 대화해요.</div>
											<div>늦은 시간에는 채팅을 자제해 주세요.</div>
											<div>택배 거래보다는 만나서 직거래하기로 해요.</div>
											<div>거래는 만 14세 이상 부터 하기로 해요.</div>
											<div>구매자, 판매자가 함께 노력하여 신뢰를 만들어요.</div>
										</div>
									</div>
									<div>
										<div class="flip">Q.직거래 주의사항</div>
										<div class="panel" style="display: none;">
											<div>
												<div>누구나찾기 쉽고 안전한 공공장소에서 만나요.</div>
												<div>서로의 집 앞까지 오더라도 집 밖에서 거래하기로 해요.</div>
												<div>구매자는 판매자를 배려하며 물건 상태를 조심히 확인해요.</div>
												<div>물품의 상태를 꼼꼼하게 확인해주세요.</div>
												<div>높은 가격의 물품은판매자, 구매자 모두 더 신중하게 거래해요</div>
												<div>직접 만나 구매한 경우 사용감으로 인한 환불은 어려워요.</div>
												<div>거래 관련 모든 문제는 중고거래 게시판 거래 및 환불 정책을 따르고 있어요.</div>
											</div>
										</div>
									</div>
									<div>
										<div class="flip">Q.판매자 주의사항</div>
										<div class="panel" style="display: none;">
											<div>
												<div>직접 촬영한 사진으로 판매글을 작성해요.</div>
												<div>value="실제 물품 사진이 아닌 경우 오해가 생길 수 있어요.</div>
												<div>물품에 대한 설명을 자세히 써요.(특히. 주요 하자에 대한 내용은 꼭 명시!)</div>
												<div></div> value="판매하기 전에 깨끗하게 세탁 또는 관리해요."</
											</div>
										</div>
									</div>
									<div>
										<div class="flip">Q.구매자 주의사항</div>
										<div class="panel" style="display: none;">
											<div>
												<div>판매글을 꼼꼼히 읽고 질문해요.</div>
												<div>미리 신중하게 고민한 뒤 판매자와 장소에서 만나요.</div>
											</div>
										</div>
									</div>
									<div>
										<c:if test="${param.category eq '운영정책'}">
											<div class="flip">Q.${param.Q}</div>
											<div class="panel" style="display:none;">
												<div>
													<%
													String[] Answers = request.getParameterValues("A");
													for (String s : Answers) {
														out.println("<div>"+s + "</div>");
													}
													%>
												</div>
											</div>
										</c:if>
									</div>
								</div>
								<div id="tab-2" class="tab-content">
									<div>
										<div class="flip"><input type="text" value="Q.동네인증이 안 돼요!"></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="동네인증을 하기 전에 현재 내 위치가 인증하려는 동네(접속하려는 동네)에 있는지 확인해주세요.">
												<input type="text" value="인증하려는 동네(접속하려는 동네)와 현재 내 위치가 다르다면 인증에 실패해요.">
												<input type="text" value="해당 동네에 있을 때 인증해 주시길 바라요. :)">
											</div>
										</div>
									</div>
									<div>
										<div class="flip"><input type="text" value="Q.동네인증이 안 되는 경우 체크리스트"></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="휴대폰에서 위치정보승인을 안 한 경우">
												<div class="second">
													<input type="text" value="안드로이드 (안드로이드 6.0 버전 이상) [휴대폰의 설정 > 개인정보 보호 및 안전 > 앱 권한 > 위치] 에서 당근마켓 앱을 찾아 위치정보를 허용해 주세요.">
													<input type="text" value="iOS [휴대폰의 설정 > 당근마켓 > 위치] 에서 1)위치 접근 허용이 허용되어 있는지, 2)정확한 위치 설정이 켜져 있는지 확인해 주세요.">
												</div>
												<input type="text" value="GPS 설정이 잘못된 경우 (안드로이드만 해당)">
													<div class="second">
														<input type="text" value="[휴대폰 설정 > 연결 > 위치 > 위치 인식 방식] 에 접속해 주세요. (갤럭시 S6 기준)">
														<input type="text" value="위치 인식 방식이 [높은 정확도] 로 잘 선택되어 있는지 확인해 주세요. 만약 다르게 되어 있다면 [높은 정확도] 로 바꿔 주세요.">
														<input type="text" value="휴대폰마다 위치 인식 방식에 접속하는 경로가 다를 수 있어요. 휴대폰 설정에서 위치 관련 메뉴를 확인해 보세요. (하단 이미지를 참고해 주세요.)">
													</div>
												<input type="text" value="위치 정보를 켜놓아도 휴대폰이 현재 위치를 인식하지 못하는 경우)">
													<div class="second">
														<input type="text" value="창가나 야외에서 동네인증을 다시 시도해 주세요.">
														<input type="text" value="여전히 안 되면 '네이버 지도'나 '다음 지도' 등 지도 앱을 실행한 뒤 [현재 위치 가져오기] 또는 [현재 위치 인식하기] 를 시도해 주세요.">
														<input type="text" value="다시 한번 당근마켓 앱을 실행하여 동네인증을 시도해 주세요.">
													</div>
												<input type="text" value="현재 설정된 동네에 내가 실제로 있지 않는 경우">
													<div class="second">
														<input type="text" value="내 동네가 제대로 설정되어 있는지 확인해 보세요.">
														<input type="text" value="현재 위치로 동네를 변경하고 싶다면 [나의 당근 > 내 동네 설정] 에서 동네를 변경할 수도 있어요.">
													</div>
												<input type="text" value="단기간에 너무 많은 동네에서 인증하거나 정상적이지 않은 방법으로 동네인증 할 경우 동네인증이 제한될 수 있어요.">
												<input type="text" value="위의 다섯 가지 경우에 해당하지 않는데 동네인증이 안 된다면 [고객센터에 문의하기]를 통해 문의 남겨 주세요.">
											</div>
=======
								<div id="tab-1" class="tab-content current">
									<div>
										<div id="flip">중고거래 운영정책</div>
										<div id="panel" style="display: none;">
											<ul>
												<li class="title">*운영정책
													<ul>
														<li>서로 존중하고 배려해요.</li>
														<li>존댓말로 솔직하게 대화해요.</li>
														<li>늦은 시간에는 채팅을 자제해 주세요.</li>
														<li>택배 거래보다는 만나서 직거래하기로 해요.</li>
														<li>거래는 만 14세 이상 부터 하기로 해요.</li>
														<li>구매자, 판매자가 함께 노력하여 신뢰를 만들어요.</li>
													</ul>
												</li>
												<li class="title">*직거래 주의사항
													<ul>
														<li>누구나찾기 쉽고 안전한 공공장소에서 만나요.</li>
														<li>서로의 집 앞까지 오더라도 집 밖에서 거래하기로 해요.</li>
														<li>구매자는 판매자를 배려하며 물건 상태를 조심히 확인해요.</li>
														<li>물품의 상태를 꼼꼼하게 확인해주세요.</li>
														<li>높은 가격의 물품은판매자, 구매자 모두 더 신중하게 거래해요.</li>
														<li>직접 만나 구매한 경우 사용감으로 인한 환불은 어려워요.</li>
														<li>거래 관련 모든 문제는 중고거래 게시판 거래 및 환불 정책을 따르고 있어요.</li>
													</ul>
												</li>
												<li class="title">*판매자 주의사항
													<ul>
														<li>직접 촬영한 사진으로 판매글을 작성해요.</li>
														<li>실제 물품 사진이 아닌 경우 오해가 생길 수 있어요.</li>
														<li>물품에 대한 설명을 자세히 써요.(특히, 주요 하자에 대한 내용은 꼭 명시!)</li>
														<li>판매하기 전에 깨끗하게 세탁 또는 관리해요.</li>
													</ul>
												</li>
												<li class="title">*구매자 주의사항
													<ul>
														<li>판매글을 꼼꼼히 읽고 질문해요.</li>
														<li>미리 신중하게 고민한 뒤 판매자와 장소에서 만나요.</li>
													</ul>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div id="tab-2" class="tab-content">
									<div>
										<div id="flip2">계정 / 인증</div>
										<div id="panel2" style="display: none;">
											<ul>
												<li class="title">*동네인증이 안 돼요!
													<ul>
														<li>동네인증을 하기 전에 현재 내 위치가 인증하려는 동네(접속하려는 동네)에 있는지 확인해
															주세요.</li>
														<li>인증하려는 동네(접속하려는 동네)와 현재 내 위치가 다르다면 인증에 실패해요.</li>
														<li>해당 동네에 있을 때 인증해 주시길 바라요. :)</li>
													</ul>
												</li>
												<li class="title">*동네인증이 안 되는 경우 체크리스트
													<ul>
														<li>휴대폰에서 위치정보승인을 안 한 경우
															<ul>
																<li>안드로이드 (안드로이드 6.0 버전 이상) [휴대폰의 설정 > 개인정보 보호 및 안전
																	> 앱 권한 > 위치] 에서 당근마켓 앱을 찾아 위치정보를 허용해 주세요.</li>
																<li>iOS [휴대폰의 설정 > 당근마켓 > 위치] 에서 1)위치 접근 허용이 허용되어
																	있는지, 2)정확한 위치 설정이 켜져 있는지 확인해 주세요.</li>
															</ul>
														</li>
														<li>GPS 설정이 잘못된 경우 (안드로이드만 해당)
															<ul>
																<li>[휴대폰 설정 > 연결 > 위치 > 위치 인식 방식] 에 접속해 주세요. (갤럭시
																	S6 기준)</li>
																<li>위치 인식 방식이 [높은 정확도] 로 잘 선택되어 있는지 확인해 주세요. 만약 다르게
																	되어 있다면 [높은 정확도] 로 바꿔 주세요.</li>
																<li>휴대폰마다 위치 인식 방식에 접속하는 경로가 다를 수 있어요. 휴대폰 설정에서 위치
																	관련 메뉴를 확인해 보세요. (하단 이미지를 참고해 주세요.)</li>
															</ul>
														</li>
														<li>위치 정보를 켜놓아도 휴대폰이 현재 위치를 인식하지 못하는 경우)
															<ul>
																<li>창가나 야외에서 동네인증을 다시 시도해 주세요.</li>
																<li>여전히 안 되면 '네이버 지도'나 '다음 지도' 등 지도 앱을 실행한 뒤 [현재 위치
																	가져오기] 또는 [현재 위치 인식하기] 를 시도해 주세요.</li>
																<li>다시 한번 당근마켓 앱을 실행하여 동네인증을 시도해 주세요.</li>
															</ul>
														</li>
														<li>현재 설정된 동네에 내가 실제로 있지 않는 경우
															<ul>
																<li>내 동네가 제대로 설정되어 있는지 확인해 보세요.</li>
																<li>현재 위치로 동네를 변경하고 싶다면 [나의 당근 > 내 동네 설정] 에서 동네를
																	변경할 수도 있어요.</li>
															</ul>
														</li>
														<li>단기간에 너무 많은 동네에서 인증하거나 정상적이지 않은 방법으로 동네인증 할 경우
															동네인증이 제한될 수 있어요.</li>
														<li>위의 다섯 가지 경우에 해당하지 않는데 동네인증이 안 된다면 [고객센터에 문의하기]를
															통해 문의 남겨 주세요.</li>
													</ul>
												</li>
												<li class="title">*탈퇴하기
													<ul>
														<li>[마이페이지 > 탈퇴하기] 에서 탈퇴할 수 있어요.</li>
														<li>탈퇴하면 모든 게시글과 채팅 내용, 매너온도, 관심, 활동정보가 삭제되고 복구할 수
															없으니 신중하게 탈퇴해 주세요.</li>
														<li>탈퇴 후 7일 간 재가입 할 수 없어요.</li>
													</ul>
												</li>
												<li class="title">*동네인증은 어떻게 하나요?
													<ul>
														<li>홈페이지 오른쪽 상단 [마이페이지] 클릭</li>
														<li>[동네 인증하기] 클릭</li>
														<li>지도의 오른쪽에 있는 [우리동네보기] 클릭하여 위치 가져오기</li>
														<li>현재 사용자의 위치를 클릭하기</li>
														<li>[주변동네보기] 클릭해서 추가로 동네 설정하기</li>
													</ul>
												</li>
											</ul>
>>>>>>> JunQ
										</div>
									</div>
								</div>
								<div id="tab-3" class="tab-content">
									<div>
<<<<<<< HEAD
										<div class="flip"><input type="text" value="Q.신고방법"></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="[상대방과의 채팅방 오른쪽 위 점 3개 클릭] 또는 [상대방의 프로필 접속 후 오른쪽 위 점 3개 클릭]">
												<input type="text" value="[거래/환불 분쟁 신고 클릭] 어떠한 문제가 발생하였는지 내용을 포함하여 신고해 주세요.">
												<input type="text" value="처음 신고가 접수되었다면 신고 상대방에게 채팅방을 확인하여 문제를 해결해 달라는 안내 메세지를 발송하고 있어요. 신고한 다음 날까지 답변이 없거나 문제가 해결되지 않은 경우 다시 한번 사용자를 신고해 주세요.">
											</div>
										</div>
									</div>
									<div>
										<div class="flip"><input type="text" value="Q.정지기간"></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="고지 되지 않은 경미한 하자로 인한 분쟁일 경우 30일">
												<input type="text" value="중대한 하자로 인한 분쟁일 경우 문제가 해결되기 전까지 이용 정지">
											</div>
										</div>
									</div>
									<div>
										<div class="flip"><input type="text" value="Q.주요분쟁사항(판매자의 잘못)"></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="상이한 물품(A 거래 ➔ B가 온 경우 / 실제 제품이 아닌 다른 제품을 고지하여 거래)">
												<input type="text" value="중대한 하자(수리가 어렵거나 불가한 하자 / 고지 되지 않은 전자 제품 성능 하자 : 하자 시점 확인 가능 / 필수 구성품 누락 : 키보드의 자판, 퍼즐의 조각, 문제지의 정답지 / 가품을 속여 판매)">
												<input type="text" value="양도 시 필수정보 누락(정상 해지되지 않은 핸드폰으로 개통 불가, 핸드폰/노트북 비밀번호 잠김 / A/S 가능 고지 후 A/S에 필요한 정보 미제공)">
												<input type="text" value="양도 전 취소 거부(물품 배송 전 구매자가 거래 취소, 환불 요청하였으나 거절 후 제품
													발송)">
											</div>
										</div>
									</div>
									<div>
										<div class="flip"><input type="text" value="Q.주요분쟁사항(구매자의 잘못)"></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="반품 후 판매전 없던 하자 확인(하자로 반품해주었으나 판매 전 없던 하자가 있는 상황, 구매자 협의 의사 없거나 연락두절)">
												<input type="text" value="협의 되지 않은 물품 수거(비대면 거래에서 판매자와 협의 되지 않은 물품 수거 후 반환 거부 또는 연락두절)">
												<input type="text" value="구매자 취소 거부(선입금 받은 후 판매자 거래 취소, 구매자에게 환불 받을 계좌 요청하였으나 거부)">
												<input type="text" value="단순변심 반품(구매자의 하자 주장으로 반품하였으나 제품이 정상으로 확인, 구매자 재거래 거부)">
												<input type="text" value="나눔 수거 거부(약속장소에 배송하였으나 구매자의 단순 변심 수거 거부)">
											</div>
										</div>
									</div>
								</div>
								<div id="tab-4" class="tab-content">
									<div>
										<div class="flip"><input type="text" value="Q.판매자에게는 이런 권리가 있어요."></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="구매자의 무리한 요구는 거절할 권리가 있어요">
												<input type="text" value="무리한 요구나 비매너 행위를 지속한다면 '비매너 평가하기'나 '사용자 신고하기', '문의 및 제안하기'를 통해서 알려주세요.">
												<input type="text" value="환불 관련 문제가 생겼을 때, 판매자의 실수나 잘못이 없는 다음과 같은 상황이라면 거부할 권리가 있습니다.">
													<div class="second">
														<input type="text" value="단순한 변심으로 인한 환불 요청">
														<input type="text" value="객관적인 정보가 아닌 주관적인 판단에 의한 환불 요청(예: M사이즈 명시된 제품을 구매후, 맞지 않는다고 환불 요청)">
														<input type="text" value="판매글에 명시한 내용을 몰랐다는 이유로 환불 요청">
														<input type="text" value="거래 후 오랜 기간이 지난 후에 환불 요청(예: 구매 후 한 달이 지난 시점에서 환불 요청)">
														<input type="text" value="위 제시한 상황 외에 명백한 잘못이 구매자에게 있는 경우">
													</div>
											</div>
										</div>
									</div>
									<div>
										<div class="flip"><input type="text" value="Q.판매자의 잘못이 명백한 다음과 같은 상황에서는 환불을 해주셔야해요."></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="판매글(사진, 설명, 채팅 내용 등)과 실제 물건이 객관적으로 상이한 경우">
												<input type="text" value="판매 물품에 주요 하자가 있음에도 불구하고 판매글에 명확히 밝히지 않고 판매한 경우.">
												<input type="text" value="판매자가 배송한 물품이 배송 과정에서 분실된 경우(택배 배송의 경우 택배사 잘못으로 물품이 분실된 경우 판매자는 택배사로부터 보상 가능)">
												<input type="text" value="환불할 물품을 양도받으면 거래대금을 구매자에게 바로 보내주세요. 입금을 미룬다면 '거래 불이행' 사유로 이용 제한될 수 있습니다.">
											</div>
										</div>
									</div>
									<div>
										<div class="flip"><input type="text" value="Q.탈퇴하기"></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="[마이페이지 > 탈퇴하기] 에서 탈퇴할 수 있어요.">
												<input type="text" value="탈퇴하면 모든 게시글과 채팅 내용, 매너온도, 관심, 활동정보가 삭제되고 복구할 수 없으니 신중하게 탈퇴해 주세요.">
												<input type="text" value="탈퇴 후 7일 간 재가입 할 수 없어요.">
											</div>
										</div>
									</div>
									<div>
										<div class="flip"><input type="text" value="Q.예약금/계약금은 보호받기 어려워요."></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="물건을 양도하기 전이라면 구매자와 판매자는 거래를 취소할 수 있어요">
												<input type="text" value="다만, 예약금/계약금 관련된 규정은 없으나 상호 합의에 따른 예약금/계약금 선입금 진행시 구매자의 사정으로 거래 약속이 취소된다면 예약금은 보호받지 못할 수도 있어요.">
												<input type="text" value="가급적 계약금/예약금을 선입금하지 않도록 주의해주세요.">
											</div>
										</div>
									</div>
									<div>
										<div class="flip"><input type="text" value="Q.미성년자와의 거래시 거래가 취소될 수 있어요."></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="민법상 미성년자가 중고거래를 하기 위해서는 법정 대리인의 동의를 받아야 해요.">
												<input type="text" value="보호자 동의 없이 거래한 경우 거래가 취소될 수 있어요.">
												<input type="text" value="다만, 미성년자가 거짓으로 동의했다고 믿게 한 경우에는 거래를 취소할 수 없어요.">
											</div>
=======
										<div id="flip1">거래 도중에 분쟁이 발생한 경우</div>
										<div id="panel1" style="display: none;">
											<ul>
												<li class="title">*신고방법
													<ul>
														<li>[상대방과의 채팅방 오른쪽 위 점 3개 클릭] 또는 [상대방의 프로필 접속 후 오른쪽 위
															점 3개 클릭]</li>
														<li>[거래/환불 분쟁 신고 클릭] 어떠한 문제가 발생하였는지 내용을 포함하여 신고해 주세요.</li>
														<li>처음 신고가 접수되었다면 신고 상대방에게 채팅방을 확인하여 문제를 해결해 달라는 안내
															메세지를 발송하고 있어요. 신고한 다음 날까지 답변이 없거나 문제가 해결되지 않은 경우 다시 한번
															사용자를 신고해 주세요.</li>
													</ul>
												</li>
												<li class="title">*정지기간
													<ul>
														<li>고지 되지 않은 경미한 하자로 인한 분쟁일 경우 30일</li>
														<li>중대한 하자로 인한 분쟁일 경우 문제가 해결되기 전까지 이용 정지</li>
													</ul>
												</li>
												<li class="title">*주요분쟁사항(판매자의 잘못)
													<ul>
														<li>상이한 물품(A 거래 ➔ B가 온 경우 / 실제 제품이 아닌 다른 제품을 고지하여 거래)</li>
														<li>중대한 하자(수리가 어렵거나 불가한 하자 / 고지 되지 않은 전자 제품 성능 하자 :
															하자 시점 확인 가능 / 필수 구성품 누락 : 키보드의 자판, 퍼즐의 조각, 문제지의 정답지 / 가품을
															속여 판매)</li>
														<li>양도 시 필수정보 누락(정상 해지되지 않은 핸드폰으로 개통 불가, 핸드폰/노트북 비밀번호
															잠김 / A/S 가능 고지 후 A/S에 필요한 정보 미제공)</li>
														<li>양도 전 취소 거부(물품 배송 전 구매자가 거래 취소, 환불 요청하였으나 거절 후 제품
															발송)</li>
													</ul>
												</li>
												<li class="title">*주요분쟁사항(구매자의 잘못)
													<ul>
														<li>반품 후 판매전 없던 하자 확인(하자로 반품해주었으나 판매 전 없던 하자가 있는 상황,
															구매자 협의 의사 없거나 연락두절)</li>
														<li>협의 되지 않은 물품 수거(비대면 거래에서 판매자와 협의 되지 않은 물품 수거 후 반환
															거부 또는 연락두절)</li>
														<li>구매자 취소 거부(선입금 받은 후 판매자 거래 취소, 구매자에게 환불 받을 계좌
															요청하였으나 거부)</li>
														<li>단순변심 반품(구매자의 하자 주장으로 반품하였으나 제품이 정상으로 확인, 구매자 재거래
															거부)</li>
														<li>나눔 수거 거부(약속장소에 배송하였으나 구매자의 단순 변심 수거 거부)</li>
													</ul>
												</li>
											</ul>
										</div>
									</div>
								</div>


								<div id="tab-4" class="tab-content">
									<div>
										<div id="flip3">중고거래 게시판 거래 및 환불 정책</div>
										<div id="panel3" style="display: none;">
											<ul>
												<li class="title">*판매자에게는 이런 권리가 있어요.
													<ul>
														<li>구매자의 무리한 요구는 거절할 권리가 있어요</li>
														<li>무리한 요구나 비매너 행위를 지속한다면 '비매너 평가하기'나 '사용자 신고하기', '문의
															및 제안하기'를 통해서 알려주세요.</li>
														<li>환불 관련 문제가 생겼을 때, 판매자의 실수나 잘못이 없는 다음과 같은 상황이라면 거부할
															권리가 있습니다.
															<ul>
																<li>단순한 변심으로 인한 환불 요청</li>
																<li>객관적인 정보가 아닌 주관적인 판단에 의한 환불 요청(예: M사이즈 명시된 제품을
																	구매 후, 맞지 않는다고 환불 요청)</li>
																<li>판매글에 명시한 내용을 몰랐다는 이유로 환불 요청</li>
																<li>거래 후 오랜 기간이 지난 후에 환불 요청(예: 구매 후 한 달이 지난 시점에서 환불
																	요청)</li>
																<li>위 제시한 상황 외에 명백한 잘못이 구매자에게 있는 경우</li>
															</ul>
														</li>
													</ul>
												</li>
												<li class="title">*판매자의 잘못이 명백한 다음과 같은 상황에서는 환불을 해주셔야 해요.
													<ul>
														<li>판매글(사진, 설명, 채팅 내용 등)과 실제 물건이 객관적으로 상이한 경우</li>
														<li>판매 물품에 주요 하자가 있음에도 불구하고 판매글에 명확히 밝히지 않고 판매한 경우.</li>
														<li>판매자가 배송한 물품이 배송 과정에서 분실된 경우(택배 배송의 경우 택배사 잘못으로
															물품이 분실된 경우 판매자는 택배사로부터 보상 가능)</li>
														<li>환불할 물품을 양도받으면 거래대금을 구매자에게 바로 보내주세요. 입금을 미룬다면 '거래
															불이행' 사유로 이용 제한될 수 있습니다.</li>
													</ul>
												</li>
												<li class="title">*탈퇴하기
													<ul>
														<li>[마이페이지 > 탈퇴하기] 에서 탈퇴할 수 있어요.</li>
														<li>탈퇴하면 모든 게시글과 채팅 내용, 매너온도, 관심, 활동정보가 삭제되고 복구할 수
															없으니 신중하게 탈퇴해 주세요.</li>
														<li>탈퇴 후 7일 간 재가입 할 수 없어요.</li>
													</ul>
												</li>
												<li class="title">*구매자에게는 이런 권리가 있어요.
													<ul>
														<li>판매자의 무리한 요구는 거절할 권리가 있어요.</li>
														<li>거래 관련 문제가 생겼을 때, 판매자의 의무에 명시된 상황에 해당하면 환불을 요구할
															권리가 있어요.</li>
														<li>무리한 요구나 비매너 행위를 지속한다면 '비매너 평가하기'나 '사용자 신고하기', '문의
															및 제안하기'를 통해서 알려주세요.</li>
													</ul>
												</li>
												<li class="title">*예약금/계약금은 보호받기 어려워요.
													<ul>
														<li>물건을 양도하기 전이라면 구매자와 판매자는 거래를 취소할 수 있어요</li>
														<li>다만, 예약금/계약금 관련된 규정은 없으나 상호 합의에 따른 예약금/계약금 선입금 진행시
															구매자의 사정으로 거래 약속이 취소된다면 예약금은 보호받지 못할 수도 있어요.</li>
														<li>가급적 계약금/예약금을 선입금하지 않도록 주의해주세요.</li>
													</ul>
												</li>
												<li class="title">*미성년자와의 거래시 거래가 취소될 수 있어요.
													<ul>
														<li>민법상 미성년자가 중고거래를 하기 위해서는 법정 대리인의 동의를 받아야 해요.</li>
														<li>보호자 동의 없이 거래한 경우 거래가 취소될 수 있어요.</li>
														<li>다만, 미성년자가 거짓으로 동의했다고 믿게 한 경우에는 거래를 취소할 수 없어요.</li>
													</ul>
												</li>
											</ul>
>>>>>>> JunQ
										</div>
									</div>
								</div>
								<div id="tab-5" class="tab-content">
									<div>
<<<<<<< HEAD
										<div class="flip"><input type="text" value="Q.판매 금지 물품"></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="판매 금지 물품은 나눔, 교환, 삽니다 게시글 또한 허용되지 않습니다.">
												<input type="text" value="당근마켓은 현행법령상 판매가 허용되지 않는 불법상품 및 유해 상품을 판매하는 것은 제한하고 있어요.">
												<input type="text" value="판매 자격을 갖췄더라도 개인 간 거래를 지향하는 당근마켓에서는 해당 물품을 판매할 수 없어요.">
												<input type="text" value="현행법을 위반할 경우 처벌 받을 수 있습니다. 이점 유의해 주시길 바랍니다.">
											</div>
										</div>
									</div>
									<div>
										<div class="flip"><input type="text" value="Q.물폼목록"></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="가품∙이미테이션 (상표권, 저작권 침해 물품, 특정 브랜드의 스타일을 모방한 물품)">
												<input type="text" value="주류(무알콜 주류 포함), 담배, 전자담배, 모의총포 및 그 부속품 일체 (ex. 라이터, 비비탄 총알 등 청소년 유해물건)">
												<input type="text" value="경유, LPG, 휘발유 등의 유류 거래">
												<input type="text" value="반려동물, 생명이 있는 동물·곤충 (무료분양, 열대어 포함)">
												<input type="text" value="한약∙의약품 ∙ 의료기기∙마약류 (청소년 유해약물∙유해화학물질)">
												<input type="text" value="반영구 화장 등 면허나 자격 없는 자의 불법 유사 의료 행위 홍보/모집글">
												<input type="text" value="유통기한이 지난 제품, 포장이 훼손되거나 개봉된 식품">
												<input type="text" value="도수 있는 안경∙선글라스 (온라인 판매 불법)">
												<input type="text" value="콘택트 렌즈, 써클 렌즈 (온라인 판매 불법)">
												<input type="text" value="반복/다량 판매하는 핸드메이드 제품">
												<input type="text" value="화장품 샘플 (온라인 판매 불법)">
												<input type="text" value="완제품이 아닌 직접 소분한 화장품">
												<input type="text" value="음란물 (청소년 유해 매체물)">
												<input type="text" value="촬영 여부를 상대방이 알기 어려운 카메라 혹은 그밖에 유사한 기능을 갖춘 기계장치(불법 카메라 등)">
												<input type="text" value="성생활용품">
												<input type="text" value="개인정보 (게임 계정, 추천인 계정 포함)">
												<input type="text" value="조건부 무료나눔">
												<input type="text" value="렌탈 제품">
												<input type="text" value="군용품∙군마트용품∙경찰용품∙도검∙화약류∙분사기∙전자충격기∙석궁∙활 (안전확인∙안전인증표시 없는 전기용품 및 단전지 또는 공산품)">
												<input type="text" value="나라미, 정부 지원 생필품, 지역상품권, 문화누리카드 등 법률에 의해 재판매 할 수 없는 물품">
												<input type="text" value="낚시로 포획한 수산물 거래 행위">
											</div>
										</div>
									</div>
									<div>
										<div class="flip"><input type="text" value="Q.미성년자와의 거래"></div>
										<div class="panel" style="display: none;">
											<div>
												<input type="text" value="민법상 미성년자가 중고거래를 하기 위해서는 법정 대리인의 동의를 받아야 해요.">
												<input type="text" value="보호자 동의 없이 거래한 경우 거래가 취소될 수 있어요.">
												<input type="text" value="다만, 미성년자가 거짓으로 동의했다고 믿게 한 경우에는 거래를 취소할 수 없어요.">
											</div>
=======
										<div id="flip4">판매 금지 물품</div>
										<div id="panel4" style="display: none;">
											<ul>
												<li class="title">*판매 금지 물품은 나눔, 교환, 삽니다 게시글 또한 허용되지 않습니다.</b></li>
												<li class="title">*당근마켓은 현행법령상 판매가 허용되지 않는 불법상품 및 유해 상품을 판매하는 것은 제한하고
													있어요.</li>
												<li class="title">*판매 자격을 갖췄더라도 개인 간 거래를 지향하는 당근마켓에서는 해당 물품을 판매할 수
													없어요.</li>
												<li class="title">*현행법을 위반할 경우 처벌 받을 수 있습니다. 이점 유의해 주시길 바랍니다.</b></li>
												<li class="title">*물폼목록
													<ul>
														<li>가품∙이미테이션 (상표권, 저작권 침해 물품, 특정 브랜드의 스타일을 모방한 물품)</li>
														<li>주류(무알콜 주류 포함), 담배, 전자담배, 모의총포 및 그 부속품 일체 (ex.
															라이터, 비비탄 총알 등 청소년 유해물건)</li>
														<li>경유, LPG, 휘발유 등의 유류 거래</li>
														<li>반려동물, 생명이 있는 동물·곤충 (무료분양, 열대어 포함)</li>
														<li>한약∙의약품 ∙ 의료기기∙마약류 (청소년 유해약물∙유해화학물질)</li>
														<li>반영구 화장 등 면허나 자격 없는 자의 불법 유사 의료 행위 홍보/모집글</li>
														<li>유통기한이 지난 제품, 포장이 훼손되거나 개봉된 식품</li>
														<li>도수 있는 안경∙선글라스 (온라인 판매 불법)</li>
														<li>콘택트 렌즈, 써클 렌즈 (온라인 판매 불법)</li>
														<li>반복/다량 판매하는 핸드메이드 제품</li>
														<li>화장품 샘플 (온라인 판매 불법)</li>
														<li>완제품이 아닌 직접 소분한 화장품</li>
														<li>음란물 (청소년 유해 매체물)</li>
														<li>촬영 여부를 상대방이 알기 어려운 카메라 혹은 그밖에 유사한 기능을 갖춘 기계장치(불법
															카메라 등)</li>
														<li>성생활용품</li>
														<li>개인정보 (게임 계정, 추천인 계정 포함)</li>
														<li>조건부 무료나눔</li>
														<li>렌탈 제품</li>
														<li>군용품∙군마트용품∙경찰용품∙도검∙화약류∙분사기∙전자충격기∙석궁∙활 (안전확인∙안전인증표시
															없는 전기용품 및 단전지 또는 공산품)</li>
														<li>나라미, 정부 지원 생필품, 지역상품권, 문화누리카드 등 법률에 의해 재판매 할 수 없는
															물품</li>
														<li>낚시로 포획한 수산물 거래 행위</li>
													</ul>
												</li>
												<li class="title">*미성년자와의 거래시 거래가 취소될 수 있어요.
													<ul>
														<li>민법상 미성년자가 중고거래를 하기 위해서는 법정 대리인의 동의를 받아야 해요.</li>
														<li>보호자 동의 없이 거래한 경우 거래가 취소될 수 있어요.</li>
														<li>다만, 미성년자가 거짓으로 동의했다고 믿게 한 경우에는 거래를 취소할 수 없어요.</li>
													</ul>
												</li>
											</ul>
>>>>>>> JunQ
										</div>
									</div>
								</div>
								<div id="tab-6" class="tab-content">
									<div>
<<<<<<< HEAD
										<div class="flip">Q.개인정보처리방침</div>
										<div class="panel" style="display: none;">
											<ul>
												<li>개인정보보호법, 정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법 등
													정보통신서비스제공자가 준수하여야 할 관련 법령상의 규정을 준수하며, 관련 법령에 의거한 개인정보 처리방침을
													정하여 이용자의 권익 보호에 최선을 다하고 있어요.</li>
											</ul>
										</div>
									</div>
									<div>
										<div class="flip">Q.개인정보 수집 및 이용 현황(일반회원)</div>
										<div class="panel" style="display: none;">
											<ul>
												<li><img src="images/personal_info.png"></li>
											</ul>
										</div>
									</div>
									<div>
										<div class="flip">Q.회사 내부 방침에 의한 사유</div>
										<div class="panel" style="display: none;">
											<ul>
												<li><img src="images/personal_info2.png"></li>
											</ul>
										</div>
									</div>
									<div>
										<div class="flip">Q.직거래 주의사항</div>
										<div class="panel" style="display: none;">
											<ul>
												<li><img src="images/personal_info3.png"></li>
											</ul>
										</div>
									</div>
									<div>
										<div class="flip">Q.만 14세 미만 아동의 개인정보 처리</div>
										<div class="panel" style="display: none;">
											<ul>
												<li>법정대리인의 동의가 필요한 만 14세 미만의 아동은 당근마켓을 이용하실 수 없어요. 만14세
													이상이 되면 다시 당근마켓을 찾아주세요</li>
											</ul>
										</div>
									</div>
									<div>
										<div class="flip">Q.개인정보 파기 절차 및 방법</div>
										<div class="panel" style="display: none;">
											<ul>
												<li>이용자의 개인정보는 수집 및 이용목적이 달성된 때에 지체 없이 파기 해요</li>
												<li>이용목적이 달성된 때’란 철회요청, 서비스계약 만료, 탈퇴 시를 의미해요</li>
											</ul>
										</div>
									</div>
									<div>
										<div class="flip">Q.장기 미이용 회원에 대한 조치</div>
										<div class="panel" style="display: none;">
											<ul>
												<li>장기 미이용회원은 당근마켓의 서비스를 1년간 이용하지 않은 이용자를 말해요</li>
												<li>이 회원의 개인정보를 별도로 분리 보관 또는 삭제하고 있으며, 분리 보관된 개인정보는 4년간
													보관 후 지체없이 파기하고 있어요.</li>
=======
										<div id="flip5">개인정보처리방침</div>
										<div id="panel5" style="display: none;">
											<ul>
												<li class="title">*개인정보보호법, 정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법 등
													정보통신서비스제공자가 준수하여야 할 관련 법령상의 규정을 준수하며, 관련 법령에 의거한 개인정보 처리방침을
													정하여 이용자의 권익 보호에 최선을 다하고 있어요</li>
												<li class="title">*개인정보 수집 및 이용 현황(일반회원)
													<ul>
														<li><img src="images/personal_info.png"></li>
													</ul>
												</li>
												<li class="title">*회사 내부 방침에 의한 사유
													<ul>
														<li><img src="images/personal_info2.png"></li>
													</ul>
												</li>
												<li class="title">*직거래 주의사항
													<ul>
														<li><img src="images/personal_info3.png"></li>
													</ul>
												</li>
												<li class="title">*만 14세 미만 아동의 개인정보 처리
													<ul>
														<li>법정대리인의 동의가 필요한 만 14세 미만의 아동은 당근마켓을 이용하실 수 없어요
															만14세 이상이 되면 다시 당근마켓을 찾아주세요</li>
													</ul>
												</li>
												<li class="title">*개인정보 파기 절차 및 방법
													<ul>
														<li>이용자의 개인정보는 수집 및 이용목적이 달성된 때에 지체 없이 파기 해요</li>
														<li>이용목적이 달성된 때’란 철회요청, 서비스계약 만료, 탈퇴 시를 의미해요</li>
													</ul>
												</li>
												<li class="title">*장기 미이용 회원에 대한 조치
													<ul>
														<li>장기 미이용회원은 당근마켓의 서비스를 1년간 이용하지 않은 이용자를 말해요</li>
														<li>이 회원의 개인정보를 별도로 분리 보관 또는 삭제하고 있으며, 분리 보관된 개인정보는
															4년간 보관 후 지체없이 파기하고 있어요.</li>
													</ul>
												</li>
>>>>>>> JunQ
											</ul>
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->
	<!-- ./wrapper -->
	<script src="/myweb/Admin_page/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="/myweb/Admin_page/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables  & Plugins -->
	<script
		src="/myweb/Admin_page/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="/myweb/Admin_page/plugins/jszip/jszip.min.js"></script>
	<script src="/myweb/Admin_page/plugins/pdfmake/pdfmake.min.js"></script>
	<script src="/myweb/Admin_page/plugins/pdfmake/vfs_fonts.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script
		src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/myweb/Admin_page/dist/js/adminlte.min.js"></script>
</body>
</html>	
