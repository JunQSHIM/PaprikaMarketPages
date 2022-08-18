<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function add(){
	window.location.href ='/myweb/Admin_page/admin_list/addQna.jsp';
}
function update(){
	 window.location.href ='/myweb/Admin_page/admin_list/editQna.jsp';
}
$(document).ready(function(){
	  $("#flip").click(function(){
	    $("#panel").slideToggle("slow");
	  });
	  $("#flip1").click(function(){
		    $("#panel1").slideToggle("slow");
	  });
	  $("#flip2").click(function(){
		    $("#panel2").slideToggle("slow");
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
						<h1>QnA</h1>
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
								<div style="float:right;">
									<button onclick="update()">수정</button>
									<button onclick="add()">추가</button>
								</div>
							</div>
							<div class="card-body">
								<div id="flip">중고거래 운영정책</div>
								<div id="panel" style="display:none;">
									<ul>
										<li>운영정책
											<ul>
												<li>서로 존중하고 배려해요.</li>
												<li>존댓말로 솔직하게 대화해요.</li>
												<li>늦은 시간에는 채팅을 자제해 주세요.</li>
												<li>택배 거래보다는 만나서 직거래하기로 해요.</li>
												<li>거래는 만 14세 이상 부터 하기로 해요.</li>
												<li>구매자, 판매자가 함께 노력하여 신뢰를 만들어요.</li>
											</ul>
										</li>
										<li>구매자 주의사항
											<ul>
												<li>판매글을 꼼꼼히 읽고 질문해요. </li>
												<li>미리 신중하게 고민한 뒤 판매자와 장소에서 만나요.</li>
											</ul>
										</li>
										<li>판매자 주의사항 
											<ul>
												<li>직접 촬영한 사진으로 판매글을 작성해요.</li>
												<li>실제 물품 사진이 아닌 경우 오해가 생길 수 있어요.</li>
												<li>물품에 대한 설명을 자세히 써요.(특히, 주요 하자에 대한 내용은 꼭 명시!)</li>
												<li>판매하기 전에 깨끗하게 세탁 또는 관리해요.</li>
											</ul>
										</li>
										<li>직거래 주의사항 
											<ul>
												<li>누구나찾기 쉽고 안전한 공공장소에서 만나요. </li>
												<li>서로의 집 앞까지 오더라도 집 밖에서 거래하기로 해요.</li>
												<li>구매자는 판매자를 배려하며 물건 상태를 조심히 확인해요.</li>
												<li>물품의 상태를 꼼꼼하게 확인해주세요.</li>
												<li>높은 가격의 물품은판매자, 구매자 모두 더 신중하게 거래해요.</li>
												<li>직접 만나 구매한 경우 사용감으로 인한 환불은 어려워요.</li>
												<li>거래 관련 모든 문제는 중고거래 게시판 거래 및 환불 정책을 따르고 있어요.</li>
											</ul>
										</li>
									</ul>
								</div>
								<div id="flip1">거래 도중에 분쟁이 발생한 경우</div>
								<div id="panel1" style="display:none;">
									<ul>
										<li>신고방법
											<ul>
												<li>[상대방과의 채팅방 오른쪽 위 점 3개 클릭] 또는 [상대방의 프로필 접속 후 오른쪽 위 점 3개 클릭]</li>
												<li>[거래/환불 분쟁 신고 클릭] 어떠한 문제가 발생하였는지 내용을 포함하여 신고해 주세요.</li>
												<li>처음 신고가 접수되었다면 신고 상대방에게 채팅방을 확인하여 문제를 해결해 달라는 안내 메세지를 발송하고 있어요. 신고한 다음 날까지 답변이 없거나 문제가 해결되지 않은 경우 다시 한번 사용자를 신고해 주세요.</li>
											</ul>
										</li>
										<li>정지기간
											<ul>
												<li>고지 되지 않은 경미한 하자로 인한 분쟁일 경우 30일</li>
												<li>중대한 하자로 인한 분쟁일 경우 문제가 해결되기 전까지 이용 정지</li>
											</ul>
										</li>
										<li>주요분쟁사항(판매자의 잘못) 
											<ul>
												<li>상이한 물품(A 거래 ➔ B가 온 경우 / 실제 제품이 아닌 다른 제품을 고지하여 거래)</li>
												<li>중대한 하자(수리가 어렵거나 불가한 하자 / 고지 되지 않은 전자 제품 성능 하자 : 하자 시점 확인 가능 / 필수 구성품 누락 : 키보드의 자판, 퍼즐의 조각, 문제지의 정답지 / 가품을 속여 판매)</li>
												<li>양도 시 필수정보 누락(정상 해지되지 않은 핸드폰으로 개통 불가, 핸드폰/노트북 비밀번호 잠김 / A/S 가능 고지 후 A/S에 필요한 정보 미제공)</li>
												<li>양도 전 취소 거부(물품 배송 전 구매자가 거래 취소, 환불 요청하였으나 거절 후 제품 발송)</li>
											</ul>
										</li>
										<li>주요분쟁사항(구매자의 잘못) 
											<ul>
												<li>반품 후 판매전 없던 하자 확인(하자로 반품해주었으나 판매 전 없던 하자가 있는 상황, 구매자 협의 의사 없거나 연락두절)</li>
												<li>협의 되지 않은 물품 수거(비대면 거래에서 판매자와 협의 되지 않은 물품 수거 후 반환 거부 또는 연락두절)</li>
												<li>구매자 취소 거부(선입금 받은 후 판매자 거래 취소, 구매자에게 환불 받을 계좌 요청하였으나 거부)</li>
												<li>단순변심 반품(구매자의 하자 주장으로 반품하였으나 제품이 정상으로 확인, 구매자 재거래 거부)</li>
												<li>나눔 수거 거부(약속장소에 배송하였으나 구매자의 단순 변심 수거 거부)</li>
											</ul>
										</li>
									</ul>
								</div>
								<div id="flip2">계정 / 인증</div>
								<div id="panel2" style="display:none;">
									<ul>
										<li>동네인증이 안 돼요!
											<ul>
												<li>동네인증을 하기 전에 현재 내 위치가 인증하려는 동네(접속하려는 동네)에 있는지 확인해 주세요.</li>
												<li>인증하려는 동네(접속하려는 동네)와 현재 내 위치가 다르다면 인증에 실패해요.</li>
												<li>해당 동네에 있을 때 인증해 주시길 바라요. :)</li>
											</ul>
										</li>
										<li>동네인증이 안 되는 경우 체크리스트
											<ul>
												<li>휴대폰에서 위치정보승인을 안 한 경우
													<ul>
														<li>안드로이드 (안드로이드 6.0 버전 이상) [휴대폰의 설정 > 개인정보 보호 및 안전 > 앱 권한 > 위치] 에서 당근마켓 앱을 찾아 위치정보를 허용해 주세요.</li>
														<li>iOS [휴대폰의 설정 > 당근마켓 > 위치] 에서 1)위치 접근 허용이 허용되어 있는지, 2)정확한 위치 설정이 켜져 있는지 확인해 주세요.</li>
													</ul>
												</li>
												<li>GPS 설정이 잘못된 경우 (안드로이드만 해당)
													<ul>
														<li>[휴대폰 설정 > 연결 > 위치 > 위치 인식 방식] 에 접속해 주세요. (갤럭시 S6 기준)</li>
														<li>위치 인식 방식이 [높은 정확도] 로 잘 선택되어 있는지 확인해 주세요. 만약 다르게 되어 있다면 [높은 정확도] 로 바꿔 주세요.</li>
														<li>휴대폰마다 위치 인식 방식에 접속하는 경로가 다를 수 있어요. 휴대폰 설정에서 위치 관련 메뉴를 확인해 보세요. (하단 이미지를 참고해 주세요.)</li>
													</ul>
												</li>
												<li>위치 정보를 켜놓아도 휴대폰이 현재 위치를 인식하지 못하는 경우)
													<ul>
														<li>창가나 야외에서 동네인증을 다시 시도해 주세요.</li>
														<li>여전히 안 되면 '네이버 지도'나 '다음 지도' 등 지도 앱을 실행한 뒤 [현재 위치 가져오기] 또는 [현재 위치 인식하기] 를 시도해 주세요.</li>
														<li>다시 한번 당근마켓 앱을 실행하여 동네인증을 시도해 주세요.</li>
													</ul>
												</li>
												<li>현재 설정된 동네에 내가 실제로 있지 않는 경우
													<ul>
														<li>내 동네가 제대로 설정되어 있는지 확인해 보세요.</li>
														<li>현재 위치로 동네를 변경하고 싶다면 [나의 당근 > 내 동네 설정] 에서 동네를 변경할 수도 있어요.</li>
													</ul>
												</li>
												<li>단기간에 너무 많은 동네에서 인증하거나 정상적이지 않은 방법으로 동네인증 할 경우 동네인증이 제한될 수 있어요.</li>
												<li>위의 다섯 가지 경우에 해당하지 않는데 동네인증이 안 된다면 [고객센터에 문의하기]를 통해 문의 남겨 주세요.</li>
											</ul>
										</li>
										<li>탈퇴하기
											<ul>
												<li>[마이페이지 > 탈퇴하기] 에서 탈퇴할 수 있어요.</li>
												<li>탈퇴하면 모든 게시글과 채팅 내용, 매너온도, 관심, 활동정보가 삭제되고 복구할 수 없으니 신중하게 탈퇴해 주세요.</li>
												<li>탈퇴 후 7일 간 재가입 할 수 없어요.</li>
											</ul>
										</li>
										<li>동네인증은 어떻게 하나요?
											<ul>
												<li>홈페이지 오른쪽 상단 [마이페이지] 클릭</li>
												<li>[동네 인증하기] 클릭</li>
												<li>지도의 오른쪽에 있는 [우리동네보기] 클릭하여 위치 가져오기</li>
												<li>현재 사용자의 위치를 클릭하기</li>
												<li>[주변동네보기] 클릭해서 추가로 동네 설정하기</li>
											</ul>
										</li>
									</ul>
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

